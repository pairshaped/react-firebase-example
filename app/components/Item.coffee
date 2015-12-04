{ li, span, button } = React.DOM

Item = Component.create
  displayName: 'Item'

  render: ->
    { item, removeItem } = @props

    li className: 'item',
      span className: 'item__text',
        item.text
      button
        className: 'item__remove'
        onClick: removeItem.bind(null, item['.key'])
        'X'


module.exports = Item
