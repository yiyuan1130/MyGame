local BaseActor = Class("BaseActor")
function BaseActor:OnCreate(id, data)
    self.componentDic = {}
    self.id = id
    self.data = data
end

function BaseActor:Update(deltaTime)

end

function BaseActor:AddComponent(com)
    local comInstance = com.New(self)
    self.componentDic[com.Name] = comInstance
end

function BaseActor:GetComponent(com)
    return self.componentDic[com.Name]
end

function BaseActor:Close()
    self.componentDic = nil
end