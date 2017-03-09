const $ = {
  el: s => document.querySelector(s),
  els: s => document.querySelectorAll(s),
};

class Clock {
  constructor() {
    this._clockEl = $.el('#js-clock');
    this._setTime = this._setTime.bind(this);
    this._start();
  }

  _pad(num) {
    return (`0${num.toString()}`).slice(-2);
  }

  _setTime() {
    const date = new Date();
    const hours = this._pad(date.getHours());
    const minutes = this._pad(date.getMinutes());
    this._clockEl.innerHTML = `${hours}${CONFIG.clockDelimiter}${minutes}`;
  }

  _start() {
    this._setTime();
    setInterval(this._setTime, 1000);
  }
}

class Help {
  constructor() {
    this._overlayEl = $.el('#js-overlay');
    this._listsEl = $.el('#js-lists');
    this._handleKeydown = this._handleKeydown.bind(this);
    this._buildAndAppendLists();
    this._registerEvents();
  }

  toggle(show) {
    const toggle = (typeof show !== 'undefined') ? show :
      this._overlayEl.getAttribute('data-toggled') !== 'true';

    this._overlayEl.setAttribute('data-toggled', toggle);
  }

  _buildAndAppendLists() {
    CONFIG.categories.forEach(category => {
      this._listsEl.insertAdjacentHTML(
        'beforeend',
        `<li class="category">
          <h2 class="category-name">${category.name}</h2>
          <ul>${this._buildListCommands(category)}</ul>
        </li>`
      );
    });
  }

  _buildListCommands(category) {
    return category.commands.map(({ url, key, name }) => (
      `<li class="command">
        <a href="${url}" target="${CONFIG.newTab ? '_blank' : '_self'}">
          <span class="command-key">${key}</span>
          <span class="command-name">${name}</span>
        </a>
      </li>`
    )).join('');
  }

  _handleKeydown(event) {
    const isEsc = event.which === 27;
    if (isEsc) this.toggle(false);
  }

  _registerEvents() {
    document.addEventListener('keydown', this._handleKeydown);
  }
}

class History {
  constructor() {
    this._dbName = 'history';
    this._history = this._getHistoryCache();
  }

  addItem(query) {
    if (!this._isValidQuery(query)) return false;
    this._updateHistory(query);
    this._sortHistory();
    this._setHistoryCache();
  }

  getSuggestionsPromise(query) {
    return new Promise(resolve => {
      const suggestions = this._history
        .filter(item => this._itemContainsQuery(query, item[0]))
        .slice(0, CONFIG.suggestionsLimit)
        .map(item => item[0]);

      resolve(suggestions);
    });
  }

  _getHistoryCache() {
    return JSON.parse(localStorage.getItem(this._dbName)) || [];
  }

  _isValidQuery(item) {
    return item.length > 1;
  }

  _itemContainsQuery(query, item) {
    const match = item.indexOf(query) !== -1;
    return query && match && query !== item;
  }

  _setHistoryCache() {
    localStorage.setItem(this._dbName, JSON.stringify(this._history));
  }

  _sortHistory() {
    this._history = this._history.sort(function(current, next) {
      return current[1] > next[1];
    }).reverse();
  }

  _updateHistory(query) {
    let exists = false;

    this._history = this._history.map(item => {
      if (item[0] === query) {
        item[1]++;
        exists = true;
      }

      return item
    });

    if (!exists) this._history.push([query, 1]);
  }
}

class Suggester {
  constructor(influencers) {
    this._inputEl = $.el('#js-search-input');
    this._suggestionsEl = $.el('#js-search-suggestions');
    this._suggestionEls = [];
    this._influencers = influencers;
    this._handleKeydown = this._handleKeydown.bind(this);
    document.addEventListener('keydown', this._handleKeydown);
  }

  suggest(input, clickCallback = () => {}) {
    this._clearSuggestions();
    if (!input) return;
    this._handleClick = clickCallback;

    this._influencers
      .map(influencer => influencer.getSuggestionsPromise(input))
      .forEach(promise => {
        promise.then(suggestions => {
          suggestions.forEach(item => this._appendSuggestion(item));
          this._suggestionEls = $.els('.js-search-suggestion');
          this._registerClickEvents();
        });
      });
  }

  _appendSuggestion(suggestion) {
    this._suggestionsEl.insertAdjacentHTML(
      'beforeend',
      `<li>
        <input
          class="js-search-suggestion search-suggestion"
          type="button"
          value="${suggestion}"
        >
      </li>`
    );

    document.body.setAttribute('search-suggestions', true);
  }

  _clearClickEvents() {
    this._suggestionEls.forEach(el => {
      const callback = this._handleClick.bind(null, el.value);
      el.removeEventListener('click', callback);
    });
  }

  _clearSuggestions() {
    this._clearClickEvents();
    this._suggestionsEl.innerHTML = '';
    document.body.setAttribute('search-suggestions', false);
  }

  _focusNext() {
    if (this._suggestionEls.length) {
      const active = document.activeElement;

      if (active.classList.contains('js-search-suggestion')) {
        this._suggestionEls.forEach((el, index) => {
          const nextSuggestion = this._suggestionEls[index + 1];
          if (el === active && nextSuggestion) nextSuggestion.focus();
        });
      } else {
        this._suggestionEls[0].focus();
      }
    }
  }

  _focusPrevious() {
    if (this._suggestionEls.length) {
      const active = document.activeElement;

      if (active.classList.contains('js-search-suggestion')) {
        this._suggestionEls.forEach((el, index) => {
          if (el === active) {
            const previousSuggestion = this._suggestionEls[index - 1];
            if (previousSuggestion) previousSuggestion.focus();
            else this._inputEl.focus();
          }
        });
      }
    }
  }

  _handleKeydown(event) {
    const isCtrlN = event.which === 78 && event.ctrlKey;
    const isCtrlP = event.which === 80 && event.ctrlKey;
    if (isCtrlN || isCtrlP) event.preventDefault();
    if (isCtrlN) this._focusNext();
    if (isCtrlP) this._focusPrevious();
  }

  _registerClickEvents() {
    this._suggestionEls.forEach(el => {
      el.addEventListener('click', this._handleClick.bind(null, el.value));
    });
  }
}

class QueryParser {
  generateRedirect(query) {
    const encodedQuery = encodeURIComponent(query);
    let redirectUrl = CONFIG.defaultSearch.replace('{}', encodedQuery);

    if (query.match(CONFIG.urlRegex)) {
      const hasProtocol = query.match(CONFIG.protocolRegex);
      redirectUrl = hasProtocol ? query : 'http://' + query;
    } else {
      const splitSearch = query.split(CONFIG.searchDelimiter);
      const splitPath = query.split(CONFIG.pathDelimiter);

      this._loopThroughCommands(command => {
        const isSearch = splitSearch[0] === command.key;
        const isPath = splitPath[0] === command.key;

        if (isSearch || isPath) {
          if (splitSearch[1] && command.search) {
            redirectUrl = this._prepSearch(command, splitSearch);
          } else if (splitPath[1]) {
            redirectUrl = this._prepPath(command, splitPath);
          } else {
            redirectUrl = command.url;
          }

          return true;
        }
      });
    }

    return redirectUrl;
  }

  instantRedirect(keypressEvent, query, callback) {
    this._loopThroughCommands(command => {
      if (command.key === query) {
        keypressEvent.preventDefault();
        callback(command.url);
      }
    });
  }

  _loopThroughCommands(callback) {
    CONFIG.categories
      .map(category => category.commands)
      .forEach(commands => commands.forEach(command => {
        let done = callback(command);
        if (done) return;
      }));
  }

  _prepPath(command, query) {
    const baseUrl = this._stripUrlPath(command.url);
    const path = this._shiftAndTrim(query, CONFIG.pathDelimiter);
    return `${baseUrl}/${path}`;
  }

  _prepSearch(command, query) {
    if (!command.search) return command.url;
    const baseUrl = this._stripUrlPath(command.url);
    const search = this._shiftAndTrimAndEncode(query);
    const searchPath = command.search.replace('{}', search);
    return `${baseUrl}${searchPath}`;
  }

  _shiftAndTrim(arr, delimiter) {
    arr.shift();
    return arr.join(delimiter).trim();
  }

  _shiftAndTrimAndEncode(arr) {
    const clean = this._shiftAndTrim(arr, CONFIG.searchDelimiter);
    return encodeURIComponent(clean);
  }

  _stripUrlPath(url) {
    const parser = document.createElement('a');
    parser.href = url;
    return `${parser.protocol}//${parser.hostname}`;
  }
}

class Form {
  constructor(help, history, suggester, queryParser) {
    this._help = help;
    this._history = history;
    this._suggester = suggester;
    this._queryParser = queryParser;
    this._formEl = $.el('#js-search-form');
    this._inputEl = $.el('#js-search-input');
    this._inputElVal = '';
    this._handleKeypress = this._handleKeypress.bind(this);
    this._submitForm = this._submitForm.bind(this);
    this._handleKeyup = this._handleKeyup.bind(this);
    this._submitWithValue = this._submitWithValue.bind(this);
    this._registerEvents();
  }

  _clearInput() {
    this._inputEl.value = '';
  }

  _handleKeypress(event) {
    const newChar = String.fromCharCode(event.which);
    const isNotEmpty = newChar.length;
    const isEnterKey = event.which !== 13;

    if (isNotEmpty && isEnterKey) {
      this._help.toggle(false);
      this._inputEl.focus();
    }

    if (CONFIG.instantRedirect) {
      this._queryParser.instantRedirect(
        event,
        this._inputEl.value + newChar,
        this._submitWithValue
      );
    }
  }

  _handleKeyup(event) {
    if (this._inputElVal !== this._inputEl.value) {
      if (CONFIG.suggestions) {
        this._suggester.suggest(
          this._inputEl.value.trim(),
          this._submitWithValue
        );
      }

      this._inputElVal = this._inputEl.value;
    }
  }

  _redirect(redirect) {
    if (CONFIG.newTab) window.open(redirect, '_blank');
    else window.location.href = redirect;
  }

  _registerEvents() {
    document.addEventListener('keypress', this._handleKeypress);
    this._inputEl.addEventListener('keyup', this._handleKeyup);
    this._formEl.addEventListener('submit', this._submitForm, false);
  }

  _submitForm(event) {
    if (event) event.preventDefault();
    const query = this._inputEl.value.trim();

    if (!query || query === '?') {
      this._clearInput();
      this._help.toggle();
    } else {
      this._history.addItem(query);
      this._suggester.suggest('');
      this._inputEl.value = '';
      this._redirect(this._queryParser.generateRedirect(query));
    }
  }

  _submitWithValue(value) {
    this._inputEl.value = value;
    this._submitForm();
  }
}

const clock = new Clock();
const help = new Help();
const history = new History();
const suggester = new Suggester([history]);
const parser = new QueryParser();
const form = new Form(help, history, suggester, parser);
