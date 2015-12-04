{ ul } = React.DOM

Item = require './Item'

List = Component.create
  displayName: 'List'

  render: ->
    { items } = @props

    items = [] unless items?

    ul className: 'list',
      items.map (item, idx) ->
        Item
          key: idx
          item: item


module.exports = List
