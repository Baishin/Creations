return {
  version = "1.1",
  luaversion = "5.1",
  tiledversion = "0.17.0",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 32,
  height = 23,
  tilewidth = 32,
  tileheight = 32,
  nextobjectid = 1,
  properties = {},
  tilesets = {
    {
      name = "tilesheet",
      firstgid = 1,
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      image = "../Sources/images/tilesheet.png",
      imagewidth = 288,
      imageheight = 608,
      tileoffset = {
        x = 0,
        y = 0
      },
      properties = {},
      terrains = {},
      tilecount = 171,
      tiles = {}
    }
  },
  layers = {
    {
      type = "tilelayer",
      name = "Calque de Tile 1",
      x = 0,
      y = 0,
      width = 32,
      height = 23,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        10, 10, 10, 10, 10, 10, 10, 10, 10, 61, 10, 13, 10, 10, 10, 10, 10, 10, 13, 14, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15,
        10, 10, 10, 10, 10, 11, 11, 11, 10, 10, 10, 13, 10, 10, 10, 10, 10, 10, 10, 14, 15, 15, 129, 15, 15, 15, 15, 15, 15, 68, 15, 15,
        10, 10, 61, 10, 11, 19, 19, 19, 11, 10, 10, 13, 10, 10, 169, 10, 10, 10, 10, 13, 14, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15,
        10, 10, 10, 11, 19, 19, 19, 19, 19, 11, 10, 13, 10, 10, 10, 10, 10, 10, 10, 10, 13, 14, 15, 15, 15, 68, 15, 15, 15, 15, 15, 15,
        10, 10, 10, 11, 19, 19, 19, 19, 19, 11, 10, 13, 10, 10, 10, 10, 10, 10, 61, 10, 10, 14, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15,
        10, 10, 61, 10, 11, 19, 19, 19, 11, 10, 10, 13, 10, 10, 10, 10, 10, 10, 10, 10, 10, 14, 15, 15, 129, 15, 15, 15, 68, 15, 129, 15,
        10, 10, 10, 10, 10, 11, 11, 11, 10, 10, 61, 13, 10, 10, 10, 10, 10, 10, 10, 10, 10, 14, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15,
        10, 10, 10, 10, 10, 13, 13, 13, 13, 13, 13, 13, 10, 10, 10, 10, 10, 169, 10, 10, 10, 13, 14, 15, 15, 15, 15, 15, 15, 15, 15, 15,
        10, 10, 10, 10, 10, 10, 10, 10, 13, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 61, 10, 13, 14, 14, 14, 14, 14, 14, 14, 15, 129,
        10, 10, 10, 10, 10, 10, 10, 10, 13, 55, 10, 58, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 13, 14, 14,
        10, 10, 10, 10, 10, 10, 10, 10, 13, 10, 10, 10, 55, 10, 58, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
        10, 10, 10, 10, 10, 10, 10, 10, 13, 10, 58, 10, 10, 10, 10, 10, 10, 169, 10, 10, 10, 10, 10, 10, 61, 10, 10, 10, 10, 10, 1, 1,
        10, 10, 10, 10, 10, 10, 10, 10, 13, 10, 10, 10, 58, 10, 10, 10, 10, 10, 10, 10, 10, 61, 10, 10, 10, 10, 10, 10, 10, 1, 37, 37,
        13, 13, 13, 13, 13, 13, 13, 13, 13, 10, 55, 10, 10, 10, 55, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 1, 1, 37, 37, 37,
        10, 10, 10, 10, 13, 10, 10, 10, 10, 10, 10, 10, 55, 10, 10, 10, 10, 169, 10, 10, 10, 10, 10, 10, 10, 10, 1, 37, 37, 37, 37, 37,
        10, 10, 10, 10, 13, 10, 10, 10, 10, 142, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 1, 37, 37, 37, 37, 37, 37,
        10, 10, 10, 10, 13, 10, 10, 10, 10, 10, 10, 10, 10, 142, 10, 10, 10, 10, 10, 10, 10, 169, 10, 10, 1, 37, 37, 37, 37, 37, 37, 37,
        14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 1, 37, 37, 37, 37, 37, 37, 37,
        14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 1, 37, 37, 37, 37, 37, 37, 37,
        19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 1, 37, 37, 37, 37, 37, 37, 37,
        20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 1, 37, 37, 37, 37, 37, 37,
        21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 1, 37, 37, 37, 37,
        21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 1, 37, 37, 37
      }
    }
  }
}
