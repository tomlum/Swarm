math.randomseed(os.clock())

function save()
  if love.keyboard.isDown("1") then 
    love.filesystem.write("savedweights.lua", Tserial.pack(weights))

  elseif love.keyboard.isDown("5") then 
    weights = Tserial.unpack(love.filesystem.read("savedweights.lua"), true)
  end
  
  if love.keyboard.isDown("2") then 
    love.filesystem.write("savedweights2.lua", Tserial.pack(weights))

  elseif love.keyboard.isDown("6") then 
    weights = Tserial.unpack(love.filesystem.read("savedweights2.lua"), true)
  end

  if love.keyboard.isDown("3") then 
    love.filesystem.write("savedweights3.lua", Tserial.pack(weights))

  elseif love.keyboard.isDown("7") then 
    weights = Tserial.unpack(love.filesystem.read("savedweights3.lua"), true)
  end


if love.keyboard.isDown("4") then 
    love.filesystem.write("savedweights4.lua", Tserial.pack(weights))

  elseif love.keyboard.isDown("8") then 
    weights = Tserial.unpack(love.filesystem.read("savedweights4.lua"), true)
  end



end


function damage()

  for i,v in pairs(characters) do
    if v.hit then 
      if i == 1 then
        score = score - 1
      else
        score = score + 1
      end
    end
    characters[i].hit = false

  end

  function returnto(val,i,base)
    if val > base then 
      if val - i < base then
        return base
      else
        return val - i
      end
    elseif val < base then 
      if val + i > base then
        return base
      else
        return val + i
      end
    else return base
    end
  end

end


--Modified from code from love2d.org
function findIntersect(l1p1x,l1p1y, l1p2x,l1p2y, l2p1x,l2p1y, l2p2x,l2p2y, seg1, seg2)
  local a1,b1,a2,b2 = l1p2y-l1p1y, l1p1x-l1p2x, l2p2y-l2p1y, l2p1x-l2p2x
  local c1,c2 = a1*l1p1x+b1*l1p1y, a2*l2p1x+b2*l2p1y
  local det,x,y = a1*b2 - a2*b1
  if det==0 then return false end
  x,y = (b2*c1-b1*c2)/det, (a1*c2-a2*c1)/det
  if seg1 or seg2 then
    local min,max = math.min, math.max
    if seg1 and not (min(l1p1x,l1p2x) <= x and x <= max(l1p1x,l1p2x) and min(l1p1y,l1p2y) <= y and y <= max(l1p1y,l1p2y)) or
    seg2 and not (min(l2p1x,l2p2x) <= x and x <= max(l2p1x,l2p2x) and min(l2p1y,l2p2y) <= y and y <= max(l2p1y,l2p2y)) then
      return false
    end
  end
  return true
end

function findxIntersect(l1p1x,l1p1y, l1p2x,l1p2y, l2p1x,l2p1y, l2p2x,l2p2y)

  if findIntersect(l1p1x,l1p1y, l1p2x,l1p2y, l2p1x,l2p1y, l2p2x,l2p2y, true, true) or findIntersect(l1p2x,l1p2y,l1p1x,l1p1y,l2p1x,l2p1y, l2p2x,l2p2y, true, true) then
    return true
  else return false
  end

end

function pint(p11,p12,p21,p22)
  return findIntersect(p11.x+.2,p11.y+.2,p12.x,p12.y,p21.x+.2,p21.y+.2,p22.x,p22.y,true,true)
end
