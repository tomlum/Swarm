--reward for attacking and hitting
--reward for player attacking and not getting hit
--does punish increase the other ones along with decreasing?  

aiReach = 80

tiringrate = .0001
certaintyrate = .00004
--tiringrate = .001
--guessing percent
gp = .5
punishfactor1 = .0005
punishfactor2 = .0001
rewardfactor1 = .0005
rewardfactor2 = .0003


function punish(p,r)
  if not pause then
    weights[p.wn][p.action] = weights[p.wn][p.action]-punishfactor1*r
    weights[p.oldwnaction.wn][p.oldwnaction.action] = weights[p.oldwnaction.wn][p.oldwnaction.action]-punishfactor2*r
  normalize(p.oldwnaction.wn)
  normalize(p.wn)
  end
  
end

function reward(p,r)
  if not pause then
    weights[p.wn][p.action] = weights[p.wn][p.action]+rewardfactor1*r
    weights[p.oldwnaction.wn][p.oldwnaction.action] = weights[p.oldwnaction.wn][p.oldwnaction.action]+rewardfactor2*r
    normalize(p.oldwnaction.wn)
  normalize(p.wn)
  end
end

function aispawn()
  for i = 1, 11 do 
  table.insert(characters, {x = math.random(30,rightwall-30), y = 100, width = 30, height = 50, v = 0, j = 0, g=false, jtimer = 0, c={r = math.random(100,255), g = math.random(100,255), b = math.random(100,255)}, attacking = false, action = "s", atimer = 0, oldwnaction = {action = "s", wn = 1}, wn=1, oldwn = 1, acttimer = 0, choice = 0, ranchance = 0, dir = 1, hit = false})
  end
end

aispeedlimit = 7



--last x number of seconds/actions are punished 
--a = currentplayerstatus
bob = 0


function aiattackdraw()
  for i=2, #characters do
    p = characters[i]
  if p.atimer < 30 and p.atimer > 15  then
  love.graphics.setColor(255,25,25)
  love.graphics.rectangle("fill", p.x, p.y+p.height/2, p.dir*aiReach,2)
  
  if pint({x = p.x, y= p.y+p.height/2},
    {x = p.x+p.dir*aiReach, y= p.y+p.height/2},
    {x = player.x, y = player.y},
    {x = player.x, y = player.y+player.height}) then
  player.hit = true
reward(p,1)
  else
punish(p,.05)
  
  end
end
end
  
  
end


function normalize(wn)
  total = 0

  for i,v in pairs(weights[wn]) do
    total = total + v
    bob = total
    if v <= 0 then
      weights[wn][i] = 0
    end
  end


  for i,v in pairs(weights[wn]) do
    weights[wn][i] = weights[wn][i]/total
  end





end

function reweight(wn, a, aw, to, j, s)
  local change = 0
  if not pause then
  weights[wn].a = weights[wn].a + a
  weights[wn].away = weights[wn].away + aw
  weights[wn].towa = weights[wn].towa + to
  weights[wn].j = weights[wn].j + j
  weights[wn].s = weights[wn].s + s


  normalize(wn)
  end
end


function aiattack(p)
  
  if p.attacking and p.atimer == 0 then p.atimer = 30
end


  if p.atimer > 1 then
    p.atimer = p.atimer - 1 
  else
    p.attacking = false
    p.atimer = 0
  end

if p.atimer < 10 and p.atimer > 7 then 
  
  end
end

function act(p)


  if p.ranchance > gp then
    
    if (p.choice < .2) then
    p.action = "a"
    p.attacking = true
    

  elseif not p.attacking and (p.choice < .4)  then
    p.action = "away"
    if p.v < aispeedlimit and player.x < p.x then
      p.v = p.v + 5
      p.dir = 1
    elseif p.v > -aispeedlimit and player.x > p.x then
      p.v = p.v - 5
      p.dir = -1

    end

  elseif not p.attacking and (p.choice < .6)  then 
    p.action = "towa"
    if p.v < aispeedlimit and player.x > p.x then
      p.v = p.v + 5
      p.dir = 1
    elseif p.v > -aispeedlimit and player.x < p.x then
      p.v = p.v - 5
      p.dir = -1

    end


  elseif not p.attacking and (p.choice < .8) then
    p.action = "j"
    if p.g then
      p.j = 25
    end


  elseif not p.attacking then
    p.action = "s"

  end
    
    else
    

  if p.choice < weights[p.wn].a then
    p.action = "a"
    p.attacking = true

  elseif not p.attacking and p.choice < weights[p.wn].a + weights[p.wn].away then
    p.action = "away"
    if p.v < aispeedlimit and player.x < p.x then
      p.v = p.v + 5
      p.dir = 1
    elseif p.v > -aispeedlimit and player.x > p.x then
      p.v = p.v - 5
      p.dir = -1

    end

  elseif not p.attacking and p.choice < weights[p.wn].a + weights[p.wn].away + weights[p.wn].towa then 
    p.action = "towa"
    if p.v < aispeedlimit and player.x > p.x then
      p.v = p.v + 5
      p.dir = 1
    elseif p.v > -aispeedlimit and player.x < p.x then
      p.v = p.v - 5
      p.dir = -1
    end


  elseif not p.attacking and p.choice < weights[p.wn].a + weights[p.wn].away + weights[p.wn].towa + weights[p.wn].j then
    p.action = "j"
    if p.g then
      p.j = 15
    end


  elseif not p.attacking then
    p.action = "s"

end

end
  --[[
  if p.j ~= 0 then p.action = "j" end
  if (p.v < 0 and player.x < p.x) or (p.v > 0 and player.x > p.x)  then p.action = "towa" end
  if (p.v < 0 and player.x > p.x) or (p.v > 0 and player.x < p.x)  then p.action = "away" end
  if p.atimer > 0 then p.action = "a" end
  ]]--





  if p.g then p.v = returnto(p.v,friction,0) end
end


function getwn(p)
  local rpstatus = playerstatus(p)
  local wn = 1
  
  if not player.g then 
    wn = wn + 16
  end
  
  if rpstatus.far then
    wn = wn + 8
  end
  
  if p.dir * (p.x - player.x) < 0 then
    wn = wn + 2
  end
  
  if player.attacking then
    wn = wn + 4
  end
    
    
    if rpstatus.facing then
    wn = wn + 1
  end
    
  return wn
    
  end
  

function aiupdate()
  gp = gp + certaintyrate


  for i = #characters, 2, -1 do

    p = characters[i] 
    p.wn = getwn(p)

    if p.acttimer <= 0 or p.oldwn ~= p.wn 
    then 
      p.oldwnaction = {action = p.action, wn = p.oldwn}
      p.acttimer = math.random(20,50)
      p.choice = math.random()
      p.ranchance = math.random()
    else
      p.acttimer = p.acttimer - 1
    end
      act(p)
      
      aiattack(p)
    
    
    p.oldwn = p.wn

  --tiring factor
  reweight(p.wn, -tiringrate, -tiringrate, -tiringrate, -tiringrate, 0)
  end

end
