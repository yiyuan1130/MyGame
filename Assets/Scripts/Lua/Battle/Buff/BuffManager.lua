local BuffManager = ClassStatic("BuffManager")
local this = BuffManager
function BuffManager.Init()
    this.buffDic = {}
    this.delList = {}
end

function BuffManager.CreateBuff(data)
    local id = InstanceIdManager.GetIdByType(InstanceIdManager.IDType.Buff)
    local buff = Buff.New(id, data)
    this.buffDic[id] = buff
end

function BuffManager.RemoveBuff(id)
    local buff = this.buffDic[id]
    if buff then
        table.insert(this.delList, id)
        buff:Close()
    end
end

function BuffManager.Update(deltaTime)
    if #this.delList > 0 then
        for i = #this.delList, 1, -1 do
            local id = this.delList[i]
            this.buffDic[id] = nil
            table.remove(this.delList, i)
        end
    end

    for id, buff in pairs(this.buffDic) do
        buff:Update(deltaTime)
    end
end

function BuffManager.Close()
    this.buffDic = nil
    this.delList = nil
end