const CONFIG = {
  categories: [
    { name: "Travail", commands: [
      { key: 'dt', name: 'Drive', url: 'https://drive.google.com/drive/u/1/my-drive', search: '/drive/u/1/search?q={}' },
      { key: 'mt', name: 'Mail', url: 'https://mail.google.com/mail/u/1/#inbox', search: '/mail/u/1/#search/{}' },
      { key: 'ct', name: 'Calendar', url: 'https://calendar.google.com/calendar/b/1/render#main_7', search: false },
      { key: 'h', name: 'Harvest', url: 'https://optik360.harvestapp.com/time', search: false },
      { key: 'fl', name: 'Flow', url: 'https://app.getflow.com/organizations/342509/teams/290135/my-tasks?sortBy=due&viewMode=row', search: '/organizations/342509/search/{}' },
    ] },
    { name: "École", commands: [
      { key: 'o', name: 'Omnivox', url: 'https://cegep-sept-iles.omnivox.ca', search: false },
      { key: 'dd', name: 'DJI SDK Doc', url: 'https://developer.dji.com/mobile-sdk/documentation/introduction/index.html', search: false },
      { key: 'dr', name: 'DJI SDK Ref', url: 'https://developer.dji.com/iframe/mobile-sdk-doc/android/reference/packages.html', search: false },
    ] },
    { name: "Personnel", commands: [
      { key: 'dp', name: 'Drive', url: 'https://drive.google.com/drive/u/0/my-drive', search: '/drive/u/0/search?q={}' },
      { key: 'mp', name: 'Mail', url: 'https://mail.google.com/mail/u/0/#inbox', search: '/mail/u/0/#search/{}' },
      { key: 'cp', name: 'Calendar', url: 'https://calendar.google.com/calendar/b/0/render#main_7', search: false },
      { key: 'r', name: 'Reddit', url: 'https://www.reddit.com', search: '/search?q={}' },
      { key: 'fb', name: 'Facebook', url: 'https://www.facebook.com/home.php', search: '/search/top/?q={}' },
    ] },
    { name: "Média", commands: [
      { key: 'n', name: 'Netflix', url: 'https://www.netflix.com/browse', search: '/search?q={}' },
      { key: 'y', name: 'YouTube', url: 'https://youtube.com/feed/subscriptions', search: '/results?search_query={}' },
      { key: 'bc', name: 'Bandcamp', url: 'https://bandcamp.com/', search: '/search?q={}' },
    ] },
    { name: "Hack", commands: [
      { key: 'g', name: 'GitHub', url: 'https://github.com', search: '/search?q={}' },
      { key: 'bb', name: 'Bitbucket', url: 'https://bitbucket.org/', search: false },
      { key: 'p', name: 'Pirate Bay', url: 'https://thepiratebay.org', search: '/search/{}' },
    ] },
  ],

  // if none of the keys are matched, this is used for searching.
  // defaultSearch: 'https://encrypted.google.com/search?q={}',
  defaultSearch: 'https://duckduckgo.com/?q={}',

  // the delimiter between the key and your search query.
  // e.g. to search GitHub for potatoes you'd type "g:potatoes".
  searchDelimiter: ':',

  // the delimiter between the key and a path.
  // e.g. type "r/r/unixporn" to go to "reddit.com/r/unixporn".
  pathDelimiter: '/',

  // set to true to instantly redirect when a key is matched.
  // put a space before any search queries to prevent unwanted redirects.
  instantRedirect: false,

  // suggest your most popular queries as you type.
  suggestions: true,

  // max amount of suggestions to display.
  suggestionsLimit: 4,

  // open queries in a new tab.
  newTab: false,

  // the delimiter between the hours and minutes in the clock.
  clockDelimiter: '&nbsp;',

  // used for determining when to redirect directly to a url.
  urlRegex: /^(?:(http|https)?:\/\/)?(?:[\w-]+\.)+([a-z]|[A-Z]|[0-9]){2,6}/i,

  // if "urlRegex" matches but this doesn't, "http://" will be
  // prepended to the beginning of the query before redirecting.
  protocolRegex: /^[a-zA-Z]+:\/\//i
};
