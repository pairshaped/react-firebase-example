var Webpack = require('webpack');
var path = require('path');
var HtmlwebpackPlugin = require('html-webpack-plugin');

const PATHS = {
  app: path.join(__dirname, 'app'),
  build: path.join(__dirname, 'build')
};

module.exports = {
  target: "web",

  devtool: "source-map",

  entry: PATHS.app,
  output: {
    path: PATHS.build,
    filename: 'bundle.js'
  },

  resolve: {
    modulesDirectories: ['node_modules'],
    extensions: ['', '.js', '.coffee']
  },

  module: {
    loaders: [
      { test: /\.coffee/, loader: "coffee-loader" }
    ]
  },

  devServer: {
    historyApiFallback: true,
    hot: true,
    inline: true,
    progress: true,

    // display only errors to reduce the amount of output
    stats: 'errors-only',
  },

  plugins: [
    new HtmlwebpackPlugin({
      title: 'Todo List'
    }),
    new Webpack.HotModuleReplacementPlugin(),
    new Webpack.ProvidePlugin({
      'React': 'react',
      'ReactDOM': 'react-dom',
      //'Firebase': 'firebase',
      'ReactFireMixin': 'reactfire',
      'Component': path.resolve('.', 'app', 'lib', 'Component.coffee')
    })
  ]
};
