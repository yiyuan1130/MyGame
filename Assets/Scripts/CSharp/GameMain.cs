using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using XLua;
using System;
using System.IO;

public class GameMain : MonoBehaviour
{
    LuaEnv env;

    [CSharpCallLua]
    public interface LuaMain{
        void Init();
        void Update(float deltaTime);
    }
    LuaMain luaMain;

    private void Awake()
    {
        env = new LuaEnv();
        env.AddLoader(MyLoader);
        env.DoString("require ('main')");
        luaMain = env.Global.Get<LuaMain>("Main");
        luaMain.Init();
    }

    byte[] MyLoader(ref string filePath) {
        string path = Application.dataPath + "/Scripts/Lua/" + filePath + ".lua";
        return File.ReadAllBytes(path);
    }

    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        luaMain.Update(Time.deltaTime);
    }
}