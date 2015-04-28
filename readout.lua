bwidth = 700
bheight = 5
bbuffer = 5
wordsoffset = 7

score = 0


weights = {}
--initializes weights
for i = 1, 32 do
weights[i] = {a=.2, away=.2, towa=.2, j=.2, s=.2}
end

function drawreadout()
  
  love.graphics.setFont(defont2)
  love.graphics.setColor(25,100,25)
  love.graphics.print("Controls:",900,350)
  love.graphics.print("w:jump - a:left - d:right - spacebar:attack",900,375)
  love.graphics.print("p to pause/start",900,400)
  love.graphics.print("1-4:save to slots 1-4 || 5-8:load slots 1-4",900,425)
  
  
  love.graphics.setFont(defont)
  
  love.graphics.print("percent chance to guess: "..tostring(gp),100,350)
  
  for i,v in ipairs(weights) do
    
    love.graphics.setColor(10,10,10)
    if i == 1 then 
    love.graphics.print("player not attacking, player not facing, me not facing, near",bwidth,(bbuffer+bheight)*i - wordsoffset)
    elseif i == 2 then
    love.graphics.print("player not attacking, player facing, me not facing, near",bwidth,(bbuffer+bheight)*i - wordsoffset)
  elseif i == 3 then
  love.graphics.print("player not attacking, player not facing, me facing, near",bwidth,(bbuffer+bheight)*i - wordsoffset)
    elseif i == 4 then
    love.graphics.print("player not attacking, player facing, me facing, near",bwidth,(bbuffer+bheight)*i - wordsoffset)
    elseif i == 5 then 
    love.graphics.print("player attacking, player not facing, me not facing, near",bwidth,(bbuffer+bheight)*i - wordsoffset)
    elseif i == 6 then
    love.graphics.print("player attacking, player facing, me not facing, near",bwidth,(bbuffer+bheight)*i - wordsoffset)
  elseif i == 7 then
  love.graphics.print("player attacking, player not facing, me facing, near",bwidth,(bbuffer+bheight)*i - wordsoffset)
    elseif i == 8 then
    love.graphics.print("player attacking, player facing, me facing, near",bwidth,(bbuffer+bheight)*i - wordsoffset)
    elseif i == 1+8 then 
    love.graphics.print("player not attacking, player not facing, me not facing, far",bwidth,(bbuffer+bheight)*i - wordsoffset)
    elseif i == 2+8 then
    love.graphics.print("player not attacking, player facing, me not facing, far",bwidth,(bbuffer+bheight)*i - wordsoffset)
  elseif i == 3+8 then
  love.graphics.print("player not attacking, player not facing, me facing, far",bwidth,(bbuffer+bheight)*i - wordsoffset)
    elseif i == 4+8 then
    love.graphics.print("player not attacking, player facing, me facing, far",bwidth,(bbuffer+bheight)*i - wordsoffset)
    elseif i == 5+8 then 
    love.graphics.print("player attacking, player not facing, me not facing, far",bwidth,(bbuffer+bheight)*i - wordsoffset)
    elseif i == 6+8 then
    love.graphics.print("player attacking, player facing, me not facing, far",bwidth,(bbuffer+bheight)*i - wordsoffset)
  elseif i == 7+8 then
  love.graphics.print("player attacking, player not facing, me facing, far",bwidth,(bbuffer+bheight)*i - wordsoffset)
    elseif i == 8+8 then
    love.graphics.print("player attacking, player facing, me facing, far",bwidth,(bbuffer+bheight)*i - wordsoffset)
    
     elseif i == 1+16 then 
    love.graphics.print("player in the air, player not attacking, player not facing, me not facing, near",bwidth,(bbuffer+bheight)*i - wordsoffset)
    elseif i == 2+16 then
    love.graphics.print("player in the air, player not attacking, player facing, me not facing, near",bwidth,(bbuffer+bheight)*i - wordsoffset)
  elseif i == 3+16 then
  love.graphics.print("player in the air, player not attacking, player not facing, me facing, near",bwidth,(bbuffer+bheight)*i - wordsoffset)
    elseif i == 4+16 then
    love.graphics.print("player in the air, player not attacking, player facing, me facing, near",bwidth,(bbuffer+bheight)*i - wordsoffset)
    elseif i == 5+16 then 
    love.graphics.print("player in the air, player attacking, player not facing, me not facing, near",bwidth,(bbuffer+bheight)*i - wordsoffset)
    elseif i == 6+16 then
    love.graphics.print("player in the air, player attacking, player facing, me not facing, near",bwidth,(bbuffer+bheight)*i - wordsoffset)
  elseif i == 7+16 then
  love.graphics.print("player in the air, player attacking, player not facing, me facing, near",bwidth,(bbuffer+bheight)*i - wordsoffset)
    elseif i == 8+16 then
    love.graphics.print("player in the air, player attacking, player facing, me facing, near",bwidth,(bbuffer+bheight)*i - wordsoffset)
    elseif i == 1+8+16 then 
    love.graphics.print("player in the air, player not attacking, player not facing, me not facing, far",bwidth,(bbuffer+bheight)*i - wordsoffset)
    elseif i == 2+8+16 then
    love.graphics.print("player in the air, player not attacking, player facing, me not facing, far",bwidth,(bbuffer+bheight)*i - wordsoffset)
  elseif i == 3+8+16 then
  love.graphics.print("player in the air, player not attacking, player not facing, me facing, far",bwidth,(bbuffer+bheight)*i - wordsoffset)
    elseif i == 4+8+16 then
    love.graphics.print("player in the air, player not attacking, player facing, me facing, far",bwidth,(bbuffer+bheight)*i - wordsoffset)
    elseif i == 5+8+16 then 
    love.graphics.print("player in the air, player attacking, player not facing, me not facing, far",bwidth,(bbuffer+bheight)*i - wordsoffset)
    elseif i == 6+8+16 then
    love.graphics.print("player in the air, player attacking, player facing, me not facing, far",bwidth,(bbuffer+bheight)*i - wordsoffset)
  elseif i == 7+8+16 then
  love.graphics.print("player in the air, player attacking, player not facing, me facing, far",bwidth,(bbuffer+bheight)*i - wordsoffset)
    elseif i == 8+8+16 then
    love.graphics.print("player in the air, player attacking, player facing, me facing, far",bwidth,(bbuffer+bheight)*i - wordsoffset)
    
    
    
    
    end
    love.graphics.setColor(255,0,0)
    love.graphics.rectangle("fill", 0, (bbuffer+bheight)*i, (v.a)*bwidth, bheight)
    love.graphics.setColor(255,255,0)
    love.graphics.rectangle("fill", v.a*bwidth, (bbuffer+bheight)*i, v.away*bwidth, bheight)
    love.graphics.setColor(0,255,255)
    love.graphics.rectangle("fill", (v.a+v.away)*bwidth, (bbuffer+bheight)*i, v.towa*bwidth, bheight)
    love.graphics.setColor(0,0,255)
    love.graphics.rectangle("fill", (v.a+v.away+v.towa)*bwidth, (bbuffer+bheight)*i, v.j*bwidth, bheight)
    love.graphics.setColor(255,0,255)
    love.graphics.rectangle("fill", (v.a+v.away+v.towa+v.j)*bwidth, (bbuffer+bheight)*i, v.s*bwidth, bheight)
    
  end
  
end