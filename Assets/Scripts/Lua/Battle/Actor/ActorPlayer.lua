local ActorPlayer, base = Class("ActorPlayer", ActorBase)
function ActorPlayer:OnCreate(id, data)
    base.OnCreate(self, id, data)
    self.position = Vector3(0, 0, 0)
    self.render = GameObject("Player" .. self.id)
    self.speed = 1

    EventManager.AddListener(EventId.GetInputMove, self, self.OnGetInpuMove)
end

function ActorPlayer:OnGetInpuMove(vector2)
    -- print("ActorPlayer:OnGetInpuMove ==> ", vector2.x, vector2.y)
    local moveDir = Vector3(vector2.x, 0, vector2.y).normalized
    self.position = self.position + moveDir * self.speed * Time.deltaTime
end

function ActorPlayer:Update(deltaTime)
    base.Update(self, deltaTime)
    self.render.transform.position = self.position
    print(self.position.x, self.position.z)
end

function ActorPlayer:Close()
    base.Close(self)
end