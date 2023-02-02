local BaseActor = Class("BaseActor")
function BaseActor:OnCreate(id, data)
    self.componentDic = {}
    self.id = id
    self.data = data
    self.actorType = null
end

function BaseActor:Update(deltaTime)
    for k, v in pairs(self.componentDic) do
        local com = v
        v:Update(deltaTime)
    end
end

function BaseActor:AddComponent(com)
    local comInstance = com.New(self)
    self.componentDic[com.Name] = comInstance
    return comInstance
end

function BaseActor:GetComponent(com)
    return self.componentDic[com.Name]
end

function BaseActor:RendererForCreate()
    local data = {
        id = self.id,
        name = "player",
        x = self:GetPosition()[0],
        y = self:GetPosition()[1],
        z = self:GetPosition()[2],
        angle = self:GetAngle(),
        scale = 1,
    }
    BattleCommondManager.AddBattleRendererCommond_ActorCreate(data)
end

function BaseActor:GetActorType()
    return self.actorType
end

function BaseActor:RendererForDelete()
end

function BaseActor:Close()
    self.componentDic = nil
end