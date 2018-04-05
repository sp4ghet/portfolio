var path = require("path")
var ExtractTextPlugin = require('extract-text-webpack-plugin')

module.exports = {
  entry: {
    app: [
      './webpack/index.js'
    ]
  },
  output: {
    path: path.resolve(__dirname + '/dist'),
    filename: '[name].js',
  },
  module: {
    loaders: [
      {
        test: /\.css$/,
        loaders: ExtractTextPlugin.extract("css-loader")
      },
      {
        test: /\.(scss|sass)$/,
        loaders: ExtractTextPlugin.extract("css-loader!sass-loader")
      },
      {
        test:    /\.html$/,
        exclude: /node_modules/,
        loader:  'file-loader',
        query:{
          name: '[name].[ext]'
        }
      },
      {
        test:    /\.elm$/,
        exclude: [/elm-stuff/, /node_modules/],
        loader:  'elm-webpack-loader',
        query:{
          verbose: true,
          warn: true
        }
      },
      // {
      //   test:    /\.frag$/,
      //   exclude: /node_modules/,
      //   loader:  'file-loader',
      //   query:{
      //     name: '[name].[ext]',
      //     outputPath: 'assets/shaders/'
      //   }
      // },
      {
        test: /\.(jpe?g|png|gif)$/i,   //to support eg. background-image property
        loader:"file-loader",
        query:{
          name:'[name].[ext]',
          outputPath:'images/'
          //the images will be emmited to dist/images/ folder
          //the images will be put in the DOM <style> tag as eg. background: url(dist/images/image.png);
        }
      },
      {
        test: /\.woff$/,
        loader: 'url-loader',
        query: {
          limit: 10000,
          mimetype: 'application/font-woff',
          outputPath: 'assets/fonts/',
          name: '[name].[ext]'
        }
      },
      {
        test: /\.[ot]tf$/,
        loader: 'url-loader',
        query:{
          limit: 65000,
          mimetype: 'application/octet-stream',
          outputPath: 'assets/fonts/',
          name: '[name].[ext]'
        }
      },
      {
        test: /\.(ttf|eot|svg)$/,
        loader: 'file-loader',
        query:{
          outputPath: 'assets/fonts/',
          name: '[name].[ext]'
        }
      },
    ],

    noParse: /\.elm$/,
  },
  plugins: [
    new ExtractTextPlugin("[name].css")
  ],
  devServer: {
    inline: true,
    stats: { colors: true },
  },
};
