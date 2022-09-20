function Class(name, base)
    if _ENV[name] then
        print(string.format("class %s already exsit", name))
        return
    end
    local class = {}
    class.cls_name = name
    if base then
        setmetatable(class, {__index = base})
    end
    class.New = function(...)
        local instance = {}
        setmetatable(instance, {__index = class})
        if instance.OnCreate then
            instance:OnCreate(...)
        end
        return instance
    end
    _ENV[name] = class
    return class, base
end

function ClassStatic(name, base)
    if _ENV[name] then
        print(string.format("class %s already exsit", name))
        return
    end
    local class = {}
    class.cls_name = name
    if base then
        setmetatable(class, {__index = base})
    end
    _ENV[name] = class
    return class, base
end

function Const(name)
    local c = {}
    _ENV[name] = c
    return c
end