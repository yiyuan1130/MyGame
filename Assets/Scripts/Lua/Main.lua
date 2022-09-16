GameObject = CS.UnityEngine.GameObject
Transform = CS.UnityEngine.Transform
Vector2 = CS.UnityEngine.Vector2
Vector3 = CS.UnityEngine.Vector3
Quaternion = CS.UnityEngine.Quaternion
Input = CS.UnityEngine.Input
KeyCode = CS.UnityEngine.KeyCode
Time = CS.UnityEngine.Time
Resources = CS.UnityEngine.Resources
Mathf = CS.UnityEngine.Mathf

--------------------------
require "Util/init"
require "Battle/init"
require "Const/init"


Main = {
    updateList = nil,
}
local this = Main
function Main:Init()
    this.updateList = {}
    ResourcesManager.Init()
    InstanceIdManager.Init()
    EventManager.Init()
    ActorManager.Init()
    BattleSceneManager.Init()

    this.AddUpdates()
end
function Main:Update(deltaTime)
    for clsName, cls in pairs(this.updateList) do
        if cls then
            cls.Update(deltaTime)
        end
    end
end
function Main.AddUpdate(cls)
    if not this.updateList[cls.cls_name] then
        this.updateList[cls.cls_name] = cls
    end
end
function Main.RemoveUpdate(cls)
    this.updateList[cls.cls_name] = nil
end
function Main.AddUpdates()
    this.AddUpdate(ActorManager)
    this.AddUpdate(BattleScene)
    this.AddUpdate(BattleSceneManager)
end