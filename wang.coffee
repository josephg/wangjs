# Wang tile implementation based on this paper:
# http://www.dgp.toronto.edu/people/stam/reality/Research/pdf/R046.pdf

# The tile map starts with a single tile. Each iteration each tile is expanded into 1, 2 or 4
# other tiles based on the table in the paper. Expansion happens until the map fills the destination
# array completely.

# For a list of the tiles (with side colors), take a look at tiles.png in this directory.

# Expansion rules:
topLeft = [2,9,11,8,11,8,9,9,1,6,7,2,10,8,10,9]
botLeft = [-1,0,0,0,0,0,0,0,13,15,12,15,-1,-1,-1,-1]
topRight = [-1,3,3,1,3,7,3,5,-1,-1,-1,-1,4,1,2,5]
botRight = [-1,12,14,13,12,12,14,13,-1,-1,-1,-1,-1,-1,-1,-1]

@wang = (finalW, finalH, seed = 0) ->
  # I assume this'll be faster than using normal JS lists, but that would be worth benchmarking.
  src = new Uint8Array finalW * finalH
  dest = new Uint8Array finalW * finalH

  dest[0] = Math.abs(Math.floor(seed)) % 16
  w = h = 1

  while w < finalW or h < finalH
    
    # Swap src and dest
    temp = dest
    dest = src
    src = temp
    
    dx = dy = 0

    # Do an iteration of the wang tiling algorithm, copying src -> dest.

    # Loop through source x and y, copying the expanded cells into dest.

    # Coffeescript's for loops are complicated and slow, so I'm hand rolling some JS.
    # If I care this much about minor tweaks, I should probably bite the bullet and rewrite
    # the whole algorithm in javascript. But I'm lazy.
    #
    # Its extra ugly because I can't indent the loops. Aaah well.
    `for(var sy = 0; sy < h; sy++) {`
    #for sy in [0...h]
    lastRow = dy is finalH - 1

    dx = 0
    #for sx in [0...w]

    `for(var sx = 0; sx < w; sx++) {`
    dBase = dx + finalW * dy
    lastCol = dx is finalW - 1
  
    cell = src[sx + finalW * sy]

    # Top left
    dest[dBase] = topLeft[cell]

    # Top right
    if topRight[cell] != -1 and !lastCol
      dest[dBase + 1] = topRight[cell]
      dx += 2
    else
      dx++

    # Bot left
    if botLeft[cell] != -1 and !lastRow
      dest[dBase + finalW] = botLeft[cell]

    # Bot right
    if botRight[cell] != -1 and !lastRow and !lastCol
      dest[dBase + finalW + 1] = botRight[cell]

    break if lastCol
    `}`

    dy += if botLeft[cell] == -1 then 1 else 2
    break if lastRow
    `}`

    w = dx
    h = dy

  dest
