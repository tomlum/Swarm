
grav = 1
speedlimit = 5
friction = 1

function platforming()
  for i,v in ipairs(characters) do
    
    if v.x+v.width/2 + v.v > rightwall then
      v.v = 0
      v.x = rightwall-v.width/2
      
    elseif v.x-v.width/2 + v.v < 0 then
      v.v = 0
      v.x = v.width/2
    
    end
    
    if v.y+v.height - v.j >= floor then
      v.y = floor-v.height 
      v.j = 0
      v.g = true
    else
      v.g = false
      v.j = v.j - grav
    end
    
    
    
    
    
    
    v.y = v.y - v.j
    v.x = v.x + v.v
    
    
  end
  
  
  end