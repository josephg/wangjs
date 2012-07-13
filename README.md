# Wang tiles!

This is a simple implementation of the [wang tiling algorithm](http://en.wikipedia.org/wiki/Wang_tile) presented in *Tilings and Patterns* by Grunbaum and Shephard, and discussed in [*Aperiodic Texture Mapping* by Jos Stam](http://www.dgp.toronto.edu/people/stam/reality/Research/pdf/R046.pdf).

The algorithm generates an aperiodic tiling of the following 16 tiles:

![Tiles](//github.com/josephg/wangjs/raw/master/tiles.png)

# Usage

The `wang(width, height, [seed])` function returns a Uint8Array of *width* x *height* tile indexes. The returned array starts with the first row, then the next row, and so on. Each tile index is an integer from 0-15, corresponding to a tile in the diagram above.

```javascript
// If you're using node...
var wang = require('./wang').wang

// Generate 2 rows of 5 wang tiles
var width = 5;
var height = 3;
var arr = wang(width, height); // width, height

// Print out the tile indexes
for(var y = 0; y < height; y++) {
  for(var x = 0; x < width; x++) {
    console.log("At "+x+","+y + ": ", arr[x + y * width]);
  }
}
```

Here's the output:

```
$ node test.js
At 0,0:  11
At 1,0:  3
At 2,0:  1
At 3,0:  9
At 4,0:  3
At 0,1:  0
At 1,1:  14
At 2,1:  13
At 3,1:  0
At 4,1:  12
At 0,2:  9
At 1,2:  5
At 2,2:  2
At 3,2:  8
At 4,2:  1
```

Or, as a picture:

![Example tiling](//github.com/josephg/wangjs/raw/master/example.png)

