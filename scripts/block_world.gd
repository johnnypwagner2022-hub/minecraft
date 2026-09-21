extends Node3D
class_name BlockWorld

const CHUNK_SIZE := 16
const WORLD_HEIGHT := 64
const AIR := 0
const GRASS := 1
const DIRT := 2
const STONE := 3
const SAND := 4
const WOOD := 5
const LEAVES := 6
const WATER := 7
const COAL := 8
const IRON := 9

var seed_value := 1337
var chunks: Dictionary = {}

func _ready() -> void:
    generate_starting_area()

func chunk_key(cx: int, cz: int) -> Vector2i:
    return Vector2i(cx, cz)

func world_to_chunk(x: int, z: int) -> Vector2i:
    return Vector2i(floori(float(x) / CHUNK_SIZE), floori(float(z) / CHUNK_SIZE))

func get_block(x: int, y: int, z: int) -> int:
    if y < 0 or y >= WORLD_HEIGHT:
        return AIR
    var c := world_to_chunk(x, z)
    if not chunks.has(c):
        generate_chunk(c.x, c.y)
    var data: PackedByteArray = chunks[c]
    var lx := posmod(x, CHUNK_SIZE)
    var lz := posmod(z, CHUNK_SIZE)
    return data[lx + lz * CHUNK_SIZE + y * CHUNK_SIZE * CHUNK_SIZE]

func set_block(x: int, y: int, z: int, id: int) -> void:
    if y < 0 or y >= WORLD_HEIGHT:
        return
    var c := world_to_chunk(x, z)
    if not chunks.has(c):
        generate_chunk(c.x, c.y)
    var data: PackedByteArray = chunks[c]
    var lx := posmod(x, CHUNK_SIZE)
    var lz := posmod(z, CHUNK_SIZE)
    data[lx + lz * CHUNK_SIZE + y * CHUNK_SIZE * CHUNK_SIZE] = id
    chunks[c] = data

func terrain_height(x: int, z: int) -> int:
    var n := sin(float(x) * 0.12) * 4.0 + cos(float(z) * 0.10) * 3.0 + sin(float(x + z) * 0.035) * 7.0
    return clampi(10 + roundi(n), 3, 28)

func generate_chunk(cx: int, cz: int) -> void:
    var data := PackedByteArray()
    data.resize(CHUNK_SIZE * CHUNK_SIZE * WORLD_HEIGHT)
    for x in CHUNK_SIZE:
        for z in CHUNK_SIZE:
            var wx := cx * CHUNK_SIZE + x
            var wz := cz * CHUNK_SIZE + z
            var h := terrain_height(wx, wz)
            for y in WORLD_HEIGHT:
                var id := AIR
                if y <= h:
                    id = GRASS if y == h else (DIRT if y > h - 3 else STONE)
                data[x + z * CHUNK_SIZE + y * CHUNK_SIZE * CHUNK_SIZE] = id
    chunks[chunk_key(cx, cz)] = data

func generate_starting_area() -> void:
    for cx in range(-2, 3):
        for cz in range(-2, 3):
            generate_chunk(cx, cz)
