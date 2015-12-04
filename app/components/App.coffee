{ div, h1, form, input, button } = React.DOM

List = require './List'

Firebase = require 'firebase'
firebaseUrl = 'https://scorching-torch-4538.firebaseio.com/'

App = Component.create
  displayName: 'App'

  mixins: [ReactFireMixin]

  getInitialState: ->
    items: []
    text: ''

  handleChange: (e) ->
    @setState
      text: e.target.value

  handleSubmit: (e) ->
    e.preventDefault()
    if @state.text?
      console.log 'add', @state.text
      @firebaseRefs.items.push
        text: @state.text
      @setState
        text: ''

  removeItem: (key) ->
    console.log 'remove', key
    @firebaseRefs.items.child(key).remove()

  componentWillMount: ->
    ref = new Firebase("#{firebaseUrl}items")
    @bindAsArray(ref, 'items')

  render: ->
    div className: 'app',
      h1 {},
        'Todo List'
      List items: @state.items
      form onSubmit: @handleSubmit,
        input
          onChange: @handleChange
          value: @state.text
        button {},
          'Add Item'

module.exports = App
