'use strict';

// index.htmlがdistにコピーされるようにRequireする
require('./index.html')
require('./mod_bulma.scss')
require('./veda.js')

var Elm = require('../src/App.elm')
var mountNode = document.getElementById('main')

// .embed()はオプションの第二引数を取り、プログラム開始に必要なデータを与えられる。たとえばuserIDや何らかのトークンなど
var app = Elm.App.embed(mountNode)
