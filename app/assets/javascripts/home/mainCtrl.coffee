angular.module('flapperNews')

.controller 'MainCtrl', [
  '$scope'
  'posts'
  ($scope, posts) ->
    $scope.posts = posts.posts

    $scope.addPost = ->
      if $scope.title == ''
        return
      posts.create
        title: $scope.title
        link: $scope.link

      $scope.title = ''
      $scope.link = ''

    $scope.incrementUpvotes = (post) ->
      posts.upvote post
]