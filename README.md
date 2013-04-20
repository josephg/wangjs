# Wang tiles!

This is a simple implementation of the [wang tiling algorithm](http://en.wikipedia.org/wiki/Wang_tile) presented in *Tilings and Patterns* by Grunbaum and Shephard, and discussed in [*Aperiodic Texture Mapping* by Jos Stam](http://www.dgp.toronto.edu/people/stam/reality/Research/pdf/R046.pdf).

The algorithm generates an aperiodic tiling of the following 16 tiles:

![Tiles](https://github.com/josephg/wangjs/raw/master/tiles.png)

The tiles use 6 colors, shown here as red, yellow, cyan, purple, green and grey.

The tiles aren't uniformly distributed in the resulting image. This is their frequency distribution:

![Tile Frequency](https://github.com/josephg/wangjs/raw/master/tile freq.png)

And the colors aren't evenly distributed either. Here's their frequency distribution:

![Color Frequency](https://github.com/josephg/wangjs/raw/master/color freq.png)

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


## Tile color list

If you need it, here's a list of the colors on each tile. Each tile is described in left-top-right-bottom order.

```coffeescript
c = {r:0, y:1, b:2, g:3, p:4, w:5}
# A list of the colors of each tile, left, top, right, bottom.
colors = [
  [c.r, c.y, c.y, c.r] # 0
  [c.g, c.b, c.b, c.g] # 1
  [c.b, c.p, c.p, c.b] # 2
  [c.w, c.g, c.g, c.w] # 3

  [c.b, c.p, c.b, c.g] # 4
  [c.w, c.g, c.b, c.g] # 5
  [c.g, c.b, c.p, c.b] # 6
  [c.g, c.b, c.g, c.w] # 7

  [c.p, c.r, c.g, c.y] # 8
  [c.b, c.r, c.w, c.y] # 9
  [c.p, c.r, c.b, c.r] # 10
  [c.g, c.y, c.w, c.y] # 11

  [c.y, c.w, c.r, c.b] # 12
  [c.y, c.g, c.r, c.p] # 13
  [c.y, c.w, c.y, c.g] # 14
  [c.r, c.b, c.r, c.p] # 15
]
```



