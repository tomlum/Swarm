--v = horizontal velocity
--j = vertical velocity
--g = on the ground or not
table.insert(characters, {x = rightwall/2, y = 100, width = 30, height = 50, v = 0, j = 0, g=false, jtimer = 0, c={r = 0, g = 0, b = 0}, attacking = false, atimer = 0, dir = 1, hit = false})
player = characters[1]
range = 80
pReach = 80



function playerstatus(me)
  local results = {far = true, attacking = false, facing = false}
  if math.abs(me.x - player.x) < range then
    results.far = false
  end
  if player.attacking then
    attacking = true
  end

  results.facing = player.dir * (p.x - player.x) > 0

  return results

end

function pattack()
  
  if player.attacking and player.atimer == 0 then player.atimer = 40
end


  if player.atimer > 1 then
    player.atimer = player.atimer - 1 
  else
    player.attacking = false
    player.atimer = 0
  end

if player.atimer < 10 and player.atimer > 7 then 
  
  end

end



function pattackdraw()
  if player.atimer < 15 and player.atimer > 10  then
  love.graphics.setColor(0,255,0)
  for i = 2, #characters do
    p = characters[i]
  if pint({x = player.x, y= player.y+player.height/2},
    {x = player.x+player.dir*pReach, y= player.y+player.height/2},
    {x = p.x, y = p.y},
    {x = p.x, y = p.y+p.height}) then
  p.hit = true
punish(p,1)
else
  reward(p,1)
  end
  end
  love.graphics.rectangle("fill", player.x, player.y+player.height/2, player.dir*pReach,2)
    end
  
end

function playercontrols()

  if (love.keyboard.isDown("w") or autoj) and (player.jtimer > 0 or player.g) and not player.attacking then
    
    if player.g then 
      player.jtimer = 15
      player.j = 25
    else
      player.jtimer = player.jtimer -1
    end
  else
    player.jtimer = 0
  end


  if (love.keyboard.isDown("d") or autoright) and player.v < speedlimit and not player.attacking then

    player.v = player.v + 1
    player.dir = 1
  elseif (love.keyboard.isDown("a") or autoleft) and player.v > -speedlimit and not player.attacking then
    player.v = player.v - 1
    player.dir = -1
  elseif love.keyboard.isDown(" ") and not player.attacking then
  player.attacking = true

  elseif player.g then
    player.v = returnto(player.v,friction,0)
  end
  
  pattack()

end