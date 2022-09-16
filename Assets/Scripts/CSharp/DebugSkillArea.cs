using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using XLua;

public static class DebugSkillArea
{
    public static void CreateArea(LuaTable table) {
        Vector3 position = table.Get<Vector3>("Position");
        string areaType = table.Get<string>("Type");
        float width = table.Get<float>("Width");
        float height = table.Get<float>("Height");
        float radius = table.Get<float>("Radius");
        float angle = table.Get<float>("Angle");
        float worldAngle = table.Get<float>("WorldAngle");

        Mesh mesh = new Mesh();
        if (areaType == "Rect")
        {
            mesh = CreateMeshRect(width, height);
        }
        else if (areaType == "Circle") 
        {
            mesh = CreateMeshCircle(radius);
        }
        GameObject areaObj = new GameObject("DebugArea_" + areaType);
        areaObj.AddComponent<MeshFilter>().mesh = mesh;
        areaObj.AddComponent<MeshRenderer>().material = new Material(Resources.Load<Material>("materials/debug/skill_area"));
        areaObj.transform.position = position;
        areaObj.transform.localScale = Vector3.one;
        areaObj.transform.rotation = Quaternion.Euler(0, worldAngle, 0);
        GameObject.Destroy(areaObj, 3f);
    }

    static Mesh CreateMeshRect(float width, float height) {
        Mesh mesh = new Mesh();
        mesh.vertices = new Vector3[] {
            Vector3.zero,
            new Vector3(width * -0.5f, 0, 0),
            new Vector3(width * -0.5f, 0, height),
            new Vector3(width * 0.5f, 0, height),
            new Vector3(width * 0.5f, 0, 0),
        };
        mesh.triangles = new int[] { 
            0, 1, 2,
            0, 2, 3,
            0, 3, 4
        };

        //mesh.colors = new Color[] { 
        //    Color.red, Color.red, Color.red, Color.red, Color.red,
        //};

        return mesh;
    }

    static Mesh CreateMeshCircle(float radius) {
        int circle_count = 36;
        Mesh mesh = new Mesh();
        Vector3[] vertices = new Vector3[circle_count + 1];
        vertices[0] = Vector3.zero;
        float pre_rad = Mathf.Deg2Rad * 360 / circle_count;
        for (int i = 0; i < circle_count; i++)
        {
            float deg = -i * pre_rad;
            float x = Mathf.Cos(deg) * radius;
            float z = Mathf.Sin(deg) * radius;
            vertices[i + 1] = new Vector3(x, 0, z);
        }
        mesh.vertices = vertices;

        int[] triangles = new int[circle_count * 3];
        for (int i = 0; i < triangles.Length; i += 3)
        {
            int first = 0;
            int second = i / 3 + 1;
            int third = second + 1;
            if (third > circle_count)
            {
                third = 1;
            }
            triangles[i] = first;
            triangles[i + 1] = second;
            triangles[i + 2] = third;
        }
        mesh.triangles = triangles;
        return mesh;
    }
}
