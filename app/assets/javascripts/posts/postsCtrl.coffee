angular.module('flapperNews').controller 'PostsCtrl', [
  '$scope'
  'posts'
  'post'
  ($scope, posts, post) ->
    $scope.post = post

    $scope.addComment = ->
      if $scope.body == ''
        return

      posts.addComment(post.id,
        body: $scope.body
        author: 'user').success (comment) ->
          $scope.post.comments.push comment

      $scope.body = ''

    $scope.incrementUpvotes = (comment) ->
      posts.upvoteComment post, comment
]

