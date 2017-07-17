'use strict';

// index.htmlがdistにコピーされるようにRequireする
require('./index.html');
require('../assets/css/main.css')

var Elm = require('../src/App.elm');
var mountNode = document.getElementById('main');

// .embed()はオプションの第二引数を取り、プログラム開始に必要なデータを与えられる。たとえばuserIDや何らかのトークンなど
var app = Elm.App.embed(mountNode);
