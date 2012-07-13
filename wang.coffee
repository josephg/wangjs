


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
    [src, dest] = [dest, src]
    
    dx = dy = 0

    # Do an iteration of the wang tiling algorithm, copying src -> dest.

    # Source x and y
    for sy in [0...h]
      lastRow = dy is finalH - 1

      dx = 0
      for sx in [0...w]
        dBase = dx + finalW * dy
        lastCol = dx is finalW - 1
      
        cell = src[sx + finalW * sy]

        # Top left
        dest[dBase] = topLeft[cell]
  
        # Top right
        if cell not in [0,8,9,10,11] and !lastCol
          dest[dBase + 1] = topRight[cell]
          dx += 2
        else
          dx++

        # Bot left
        if cell not in [0,12,13,14,15] and !lastRow
          dest[dBase + finalW] = botLeft[cell]

        # Bot right
        if cell in [1,2,3,4,5,6,7] and !lastRow and !lastCol
          dest[dBase + finalW + 1] = botRight[cell]

        break if lastCol

      dy += if cell in [0,12,13,14,15] then 1 else 2
      break if lastRow

    w = dx
    h = dy


  dest
