{ li } = React.DOM

Item = Component.create
  displayName: 'Item'

  render: ->
    { item } = @props

    li className: 'item',
      item.text


module.exports = Item
