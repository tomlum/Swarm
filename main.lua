--Whenever possible do restful actions
--If attacked, don't do whatever you were doing before to a more decreasing range
--If hit, boost the previous state/action combos
--keep track of those combos

--Hypotheses
--if you don't attack, then they will not develop running mechanisms, might just attack or stay still
--if you do attack they will jump or attack back

function love.load()
  floor = 700
  autoj = false
  autoright = false
  autoleft = false
  pause = true
  phold = false
  
  
  rightwall = 1280
  
  love.window.setMode(rightwall, 800, {resizable=true, vsync=true})

  love.graphics.setBackgroundColor(200,200,200)
  defont = love.graphics.newFont(15)
  defont2 = love.graphics.newFont(18)
  scorefont = love.graphics.newFont(150)

  
  characters = {}
  require "Tserial"
  require "utilities"
  require "player"
  require "ai"
  require "platforming"
  require "readout"
  
  

  aispawn()

end




function love.update()
  
  
  if pause then
    if love.keyboard.isDown("p") and not phold then
      pause = false
    end
  else
    
    if love.keyboard.isDown("p") and not phold then
      pause = true
    end
    
    
  if love.keyboard.isDown("j") or autoj then
    autoj = true
    if math.random() > .5 then
      autoright = true
      autoleft = false
    else
      autoright = false
      autoleft = true
      
    end
  end
  
  
playercontrols()
aiupdate()
platforming()
damage()
end
save()

if love.keyboard.isDown("p") then phold = true
else
  phold = false
  end

end

function love.draw()
  

  
  love.graphics.setFont(scorefont)
  love.graphics.setColor(255,255,255)
  love.graphics.print(score, 500, 350)
  love.graphics.setFont(defont)
  
  for i=#characters, 1, -1 do
    p = characters[i]
    love.graphics.setColor(p.c.r,p.c.g,p.c.b)
    love.graphics.rectangle("fill", p.x-p.width/2, p.y, p.width, p.height)
    if i == 1 then
  love.graphics.setColor(100,255,150)
      else
  love.graphics.setColor(255,25,25)
  end
  love.graphics.rectangle("fill",p.x+p.dir*10,p.y+10,4*p.dir,4)
  
    aiattackdraw()
  end
    love.graphics.setColor(0,77,0)
  love.graphics.rectangle("fill", 0, floor, rightwall, 300)
  pattackdraw()
  drawreadout()
  

end