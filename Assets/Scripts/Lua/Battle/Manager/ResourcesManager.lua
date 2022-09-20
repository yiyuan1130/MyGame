local ResourcesManager = ClassStatic("ResourcesManager")
local this = ResourcesManager
ResourcesManager.ResourcePath = {
    Actor = "prefabs/actors/",
    Effect = "effects/"
}
function ResourcesManager.Init()
    this.poolParentDict = {}
    this.pool = {}
    this.CreateParent()
end

function ResourcesManager.CreateParent()
    local pool = GameObject("pool")
    pool.transform.position = Vector3.zero
    for type, path in pairs(ResourcesManager.ResourcePath) do
        local parent = GameObject(type)
        parent.transform:SetParent(pool.transform)
        parent.transform.position = Vector3.zero
        parent.transform.localScale = Vector3.one
        parent.transform.rotation = Quaternion.identity
        this.poolParentDict[type] = parent.transform
    end
end

function ResourcesManager.Load(name, type)
    local path = ResourcesManager.ResourcePath[type] .. name
    if not this.pool[type] then
        this.pool[type] = {}
    end
    if not this.pool[type][name] then
        this.pool[type][name] = {}
    end
    local gameObject
    if #this.pool[type][name] > 0 then
        gameObject = this.pool[type][name][1]
        table.remove(this.pool[type][name], 1)
    else
        local obj = Resources.Load(path)
        gameObject = GameObject.Instantiate(obj)
        gameObject.name = name
    end
    gameObject:SetActive(true)
    return gameObject
end

function ResourcesManager.Catch(gameObject, type)
    local name = gameObject.name
    if not this.pool[type] then
        this.pool[type] = {}
    end
    if not this.pool[type][name] then
        this.pool[type][name] = {}
    end
    gameObject.transform:SetParent(this.poolParentDict[type])
    gameObject.transform.position = Vector3(9999,9999,9999)
    gameObject.transform.localScale = Vector3.one
    gameObject.transform.rotation = Quaternion.identity
    gameObject:SetActive(false)
    table.insert(this.pool[type][name], gameObject)
end