local ActorBase = Class("ActorBase")
function ActorBase:OnCreate(id, data)
    self.id = id
    self.data = data
end

function ActorBase:Update(deltaTime)
end

function ActorBase:Run()
    print(self.data.name .. " RUN")
end

function ActorBase:Close()
end