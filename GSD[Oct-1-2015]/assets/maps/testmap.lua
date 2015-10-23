return {
  version = "1.1",
  luaversion = "5.1",
  orientation = "orthogonal",
  width = 20,
  height = 20,
  tilewidth = 32,
  tileheight = 32,
  properties = {},
  tilesets = {
    {
      name = "Grass",
      firstgid = 1,
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      image = "../tileset/grass-tiles-2-small.png",
      imagewidth = 384,
      imageheight = 192,
      transparentcolor = "#ff00ff",
      tileoffset = {
        x = 0,
        y = 0
      },
      properties = {},
      tiles = {}
    },
    {
      name = "pcon",
      firstgid = 73,
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      image = "../../pcon.png",
      imagewidth = 832,
      imageheight = 768,
      transparentcolor = "#ff00ff",
      tileoffset = {
        x = 0,
        y = 0
      },
      properties = {},
      tiles = {}
    }
  },
  layers = {
    {
      type = "tilelayer",
      name = "Tile Layer 1",
      x = 0,
      y = 0,
      width = 20,
      height = 20,
      visible = true,
      opacity = 1,
      properties = {},
      encoding = "lua",
      data = {
        73, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
        73, 73, 73, 73, 73, 73, 73, 73, 73, 99, 73, 73, 73, 73, 73, 99, 99, 99, 99, 99,
        73, 99, 74, 84, 84, 84, 84, 84, 84, 84, 84, 84, 84, 84, 84, 84, 84, 84, 85, 73,
        73, 73, 100, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 111, 99,
        73, 99, 177, 335, 155, 156, 157, 158, 156, 157, 158, 160, 335, 335, 335, 335, 335, 335, 137, 99,
        73, 73, 177, 335, 181, 182, 74, 75, 76, 77, 78, 126, 335, 335, 335, 335, 335, 335, 137, 73,
        99, 99, 177, 335, 102, 102, 102, 102, 102, 102, 102, 152, 335, 335, 335, 335, 335, 335, 137, 99,
        73, 73, 177, 335, 335, 335, 335, 335, 335, 335, 335, 335, 335, 335, 335, 335, 335, 335, 137, 73,
        73, 73, 177, 335, 335, 335, 335, 335, 335, 335, 335, 335, 335, 335, 335, 335, 335, 335, 137, 73,
        99, 99, 177, 335, 335, 335, 335, 335, 335, 335, 335, 335, 335, 335, 335, 335, 335, 335, 137, 99,
        73, 73, 177, 335, 335, 335, 335, 335, 335, 335, 335, 335, 335, 335, 335, 335, 335, 335, 137, 73,
        76, 76, 126, 335, 335, 335, 335, 335, 335, 335, 335, 335, 335, 335, 335, 335, 335, 335, 137, 73,
        101, 101, 152, 335, 335, 335, 335, 335, 335, 335, 335, 335, 335, 335, 335, 335, 335, 335, 137, 99,
        335, 335, 335, 335, 335, 335, 335, 335, 335, 335, 335, 335, 335, 335, 335, 335, 335, 335, 137, 99,
        160, 335, 335, 335, 335, 335, 335, 335, 335, 335, 335, 335, 335, 235, 156, 160, 335, 155, 237, 73,
        229, 335, 335, 335, 335, 335, 335, 335, 335, 335, 335, 335, 335, 181, 182, 126, 335, 189, 73, 73,
        229, 335, 335, 335, 335, 335, 335, 335, 335, 335, 335, 335, 335, 207, 102, 152, 335, 189, 99, 99,
        229, 335, 335, 335, 335, 335, 335, 335, 335, 335, 335, 335, 335, 155, 158, 158, 158, 237, 73, 73,
        229, 335, 335, 335, 335, 335, 335, 335, 335, 335, 335, 335, 335, 261, 73, 73, 73, 73, 73, 73,
        340, 236, 236, 236, 236, 236, 236, 236, 236, 236, 236, 236, 236, 237, 99, 99, 99, 99, 99, 99
      }
    },
    {
      type = "objectgroup",
      name = "Wall",
      visible = true,
      opacity = 1,
      properties = {
        ["wall"] = "true"
      },
      objects = {
        {
          name = "",
          type = "",
          shape = "rectangle",
          x = 416,
          y = 448,
          width = 96,
          height = 64,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "rectangle",
          x = 416,
          y = 544,
          width = 128,
          height = 64,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "rectangle",
          x = 544,
          y = 448,
          width = 96,
          height = 160,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "rectangle",
          x = 576,
          y = 96,
          width = 64,
          height = 352,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 0,
          width = 640,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 96,
          width = 96,
          height = 288,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 448,
          width = 32,
          height = 192,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "rectangle",
          x = 32,
          y = 608,
          width = 608,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "rectangle",
          x = 128,
          y = 128,
          width = 256,
          height = 64,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      name = "Enemies",
      visible = true,
      opacity = 1,
      properties = {},
      objects = {}
    },
    {
      type = "objectgroup",
      name = "pSwitch",
      visible = true,
      opacity = 1,
      properties = {},
      objects = {
        {
          name = "testmap_pSwitch1",
          type = "",
          shape = "rectangle",
          x = 128,
          y = 416,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["broadcast"] = "testmap_door"
          }
        },
        {
          name = "",
          type = "",
          shape = "rectangle",
          x = 96,
          y = 320,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "rectangle",
          x = 128,
          y = 352,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "rectangle",
          x = 96,
          y = 384,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "rectangle",
          x = 64,
          y = 416,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "rectangle",
          x = 32,
          y = 384,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      name = "Door",
      visible = true,
      opacity = 1,
      properties = {},
      objects = {
        {
          name = "testmap_door",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 384,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["isOpen"] = "true"
          }
        },
        {
          name = "testmap_door",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 416,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["isOpen"] = "true"
          }
        }
      }
    }
  }
}
