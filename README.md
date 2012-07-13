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

If we were to draw that, it would look like this:

![Example tiling](github.com/josephg/wangjs/raw/master/example.png)

