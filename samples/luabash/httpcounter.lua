local turbo = require("turbo")



local command = "intfunc"
cbt = {}
routeconfig = {}
function bcb(result) 
  req = cbt['cb']    
  req:write( result )
  req:flush()
end

bash.register("bcb")




local routeconfig = {}
function startwebapp(port)
   print("trying to start webapp at: " .. tonumber(port))
   turbo.web.Application(routeconfig):listen(tonumber(port))
   return 0
end

function registerHdlr(cmd)
  local endpoint = bash.getVariable("httproute")
  command = cmd
  local ShellHandler = class("ShellHandler", turbo.web.RequestHandler)
  function ShellHandler:get()
    cbt['cb']=self
    bash.call(command)
  end

  table.insert(routeconfig, { endpoint , ShellHandler })

end


function startev() 
  turbo.ioloop.instance():start()
end




-- register shortcuts to functions above
bash.register("startwebapp")
bash.register("registerHdlr")
bash.register("startev")
