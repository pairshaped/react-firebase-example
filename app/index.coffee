App = require './components/App'

if document?
  console.log document
  ReactDOM.render(
    App {}
    document.body
  )
