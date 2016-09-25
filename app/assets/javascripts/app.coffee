angular.module('flapperNews', [
  'ui.router'
  'templates'
  'Devise'
])

.config [
  '$stateProvider'
  '$urlRouterProvider'
  ($StateProvider, $UrlRouterProvider) ->
    $StateProvider
      .state('home',
        url: '/home'
        templateUrl: 'home/_home.html'
        controller: 'MainCtrl'
        resolve: postPromise: [
            'posts'
            (posts) ->
              posts.getAll()
        ]
      )

      .state('posts',
        url: '/posts{id}'
        templateUrl: 'posts/_posts.html'
        controller: 'PostsCtrl'
        resolve: post: [
            '$stateParams'
            'posts'
            ($stateParams, posts) ->
              posts.get $stateParams.id
        ]
      )

      .state('login',
        url: '/login'
        templateUrl: 'auth/_login.html'
        controller: 'AuthCtrl'
        onEnter: [
          '$state'
          'Auth'
          ($state, Auth) ->
            Auth.currentUser().then ->
              $state.go 'home'
        ]
      )

      .state('register',
        url: '/register'
        templateUrl: 'auth/_register.html'
        controller: 'AuthCtrl'
        onEnter: [
          '$state'
          'Auth'
          ($state, Auth) ->
            Auth.currentUser().then ->
              $state.go 'home'
        ]
      )

    $UrlRouterProvider.otherwise 'home'
]
