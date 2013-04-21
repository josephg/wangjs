wang.min.js: wang.js
	uglifyjs wang.js -mc > wang.min.js

wang.js: wang.coffee
	coffee -c wang.coffee
