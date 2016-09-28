angular.module('flapperNews')

.factory 'posts', [
  '$http'
  ($http) ->
    o = posts: []

    o.getAll = ->
      $http.get('/posts.json').success (data) ->
        angular.copy data, o.posts

    o.get = (id) ->
      $http.get('/posts/' + id + '.json').then (res) ->
        res.data

    o.create = (post) ->
      $http.post('/posts.json', post).success (data) ->
        o.posts.push data

    o.upvote = (post) ->
      $http.put('/posts/' + post.id + '/upvote.json').success (data) ->
        post.upvotes += 1

    o.addComment = (id, comment) ->
      $http.post '/posts/' + id + '/comments.json', comment

    o.upvoteComment = (post, comment) ->
      $http.put('/posts/' + post.id + '/comments/' + comment.id + '/upvote.json').success (data) ->
        comment.upvotes += 1

    o
]
