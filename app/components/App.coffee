{ div, h1, form, input, button } = React.DOM

List = require './List'

Firebase = require 'firebase'
ReactFireMixin = require 'reactfire'

App = Component.create
  displayName: 'App'

  mixins: [ReactFireMixin]

  firebaseUrl: 'https://scorching-torch-4538.firebaseio.com/'

  getInitialState: ->
    uid: null
    items: []
    text: ''

  handleAuth: (auth) ->
    if auth?
      # console.log 'Logged In', auth
      @setState
        uid: auth.uid
    else
      # console.log "Logged Out"
      @setState
        uid: null

  handleChange: (e) ->
    @setState
      text: e.target.value

  handleSubmit: (e) ->
    e.preventDefault()
    if @state.text?
      # console.log 'add', @state.text
      @firebaseRefs.items.push
        text: @state.text
      @setState
        text: ''

  removeItem: (key) ->
    console.log 'remove', key
    @firebaseRefs.items.child(key).remove()

  componentWillMount: ->
    ref = new Firebase("#{@firebaseUrl}items")
    @bindAsArray(ref, 'items')
    @baseRef = new Firebase(@firebaseUrl)
    @baseRef.onAuth @handleAuth

  login: ->
    # @baseRef.authWithOAuthPopup 'google', -> null
    @baseRef.authWithOAuthRedirect 'google', @handleAuth

  logout: ->
    @baseRef.unauth()


  render: ->
    div className: 'app',
      h1 className: 'header',
        'Todo List'
      if @state.uid?
        button
          className: 'logout'
          onClick: @logout
          'Logout'
      else
        button
          className: 'login'
          onClick: @login
          'Login'
      List
        items: @state.items
        removeItem: @removeItem
      form onSubmit: @handleSubmit,
        input
          className: 'add-item__input'
          onChange: @handleChange
          value: @state.text
        button className: 'add-item__button',
          'Add Item'


module.exports = App
