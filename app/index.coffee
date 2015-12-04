ReactDOM = require 'react-dom'
App = require './components/App'

if document?
  console.log document
  ReactDOM.render(
    App {}
    document.getElementById('root')
  )
