return {
  version = "1.1",
  luaversion = "5.1",
  orientation = "orthogonal",
  width = 8,
  height = 6,
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
      image = "../../../tileset/grass-tiles-2-small.png",
      imagewidth = 384,
      imageheight = 192,
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
      width = 8,
      height = 6,
      visible = true,
      opacity = 1,
      properties = {},
      encoding = "lua",
      data = {
        8, 22, 22, 22, 19, 21, 22, 22,
        22, 5, 25, 26, 6, 21, 21, 10,
        5, 3, 24, 2, 4, 25, 6, 7,
        17, 37, 42, 11, 24, 41, 18, 10,
        8, 10, 34, 31, 32, 33, 21, 10,
        10, 22, 22, 17, 18, 22, 22, 21
      }
    }
  }
}
