input =  312051

def cts(c)
  "#{c[0]},#{c[1]}"
end

def calc_val_at(grid,coord)
  total = 0
  (-1..1).each do |dx|
    (-1..1).each do |dy|
      total += grid[cts([coord[0]+dx,coord[1]+dy])]
     end
  end
  total
end

def get_neighbor_hash(grid,ptr)
  r = {}
  r[:down] = true if grid[cts([ptr[0],ptr[1]-1])] > 0
  r[:up] = true if grid[cts([ptr[0],ptr[1]+1])] > 0
  r[:left] = true if grid[cts([ptr[0]-1,ptr[1]])] > 0
  r[:right] = true if grid[cts([ptr[0]+1,ptr[1]])] > 0

  r[:downleft] = true if grid[cts([ptr[0]-1,ptr[1]-1])] > 0
  r[:downright] = true if grid[cts([ptr[0]+1,ptr[1]-1])] > 0
  r[:upleft] = true if grid[cts([ptr[0]-1,ptr[1]+1])] > 0
  r[:upright] = true if grid[cts([ptr[0]+1,ptr[1]+1])] > 0
  r
end

def move_ptr(grid,ptr)
  nbr = get_neighbor_hash(grid,ptr)
  # Num to my left, nothing to my right. If nothing is up go up.
  if nbr[:left] && !nbr[:right] && !nbr[:up]
    ptr[1] += 1
  # Num to my right, nothing to my left. Go down.
  elsif nbr[:right] && !nbr[:left] && !nbr[:down]
    ptr[1] -= 1
   # Num to my top, nothing to my bottom. Go left.
  elsif nbr[:up] && !nbr[:down] && !nbr[:right]
    ptr[0] += 1
  # Num to my bottom, nothing to my top. Go right.
  elsif nbr[:down] && !nbr[:up] && !nbr[:left]
    ptr[0] -= 1
  else
    # If we fell through each of these cases we are on a corner.
    # I can tell what corner i'm at by looking at a diagonal.
    if nbr[:downleft]
      # Something to my bottom left (go left)
      ptr[0] -= 1
    elsif nbr[:upright]
      # you get the idea.
      ptr[0] += 1
    elsif nbr[:downright]
      ptr[1] -= 1
    elsif nbr[:upleft]
       ptr[1] += 1
    end
  end
end

# Cartesian (+y is up, +x is right)
grid = Hash.new(0)
grid[cts([0,0])] = 1

ptr = [1,0]


last_sum = 1
while last_sum < input
  last_sum = calc_val_at(grid,ptr)
  grid[cts(ptr)] = last_sum
  move_ptr(grid,ptr)
end
puts last_sum
