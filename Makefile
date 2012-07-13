wang.min.js: wang.js
	uglifyjs -nc wang.js > wang.min.js

wang.js: wang.coffee
	coffee -c wang.coffee
