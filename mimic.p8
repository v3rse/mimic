pico-8 cartridge // http://www.pico-8.com
version 18
__lua__

-- globals 
player_spr = 3
actors = {}

function make_actor(x, y, spr_n)
    a={}
    a.x = x
    a.y = y
    a.dx = 0
    a.dy = 0
    a.spr = spr_n

    -- animation
    a.frame = 0
    a.t = 0
    a.frames = 1

    add(actors, a)
    return a
end

function valid_position(x, y, a)
    -- todo: add collision check
    return true
end

function move_actor(a)
    if valid_position(a.x + a.dx, a.y + a.dy) then
        a.x += a.dx
        a.y += a.dy
    end

    a.dx = 0
    a.dy = 0
    a.t += 1
end

function draw_actor(a)
    spr(a.spr + a.frame, a.x*8, a.y*8)
end

function player_input()
    if (btnp(0)) pl.dx = -1
    if (btnp(1)) pl.dx = 1
    if (btnp(2)) pl.dy = -1
    if (btnp(3)) pl.dy = 1
end

function find_player(spr_n)
    for i=0,16 do
		for j=0,16 do
			if mget(i,j) == spr_n then
                -- todo: erase player from map if possible
                -- or find another solution for agent positions
                -- maybe a second layer of the map or define in code?
				return i, j
			end
		end
	end
end

function _init()
	local x, y = find_player(player_spr)
    pl = make_actor(x, y, player_spr)
end

function _update()
    player_input()
    foreach(actors, move_actor)
end

function _draw()
    cls()
    map(0,0,0,0,16,16)
    foreach(actors, draw_actor)
end

__gfx__
0000000000000000cccccccc00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000008080000cccccccc0fffff000000a0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0070070088888000cccccccc0f0f0f00000aa9000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0007700088888000c777cccc0fffff0000aaa9900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0007700008880000cc777ccc00eee000000999000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0070070000800000cccccccc00eee000000090000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000ccc7776c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000777ccccc00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
dddddddd000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
dddddddd000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
dddddddd000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
dddddddd000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
dddddddd000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
dddddddd000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
dddddddd000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
dddddddd000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
1010101010101010101010101010101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1000020202000004000000020202001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1000020202000000000000020202001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1000020202020202020202020202001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1000020202020202020202020202001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1000000000000300000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1000000000000000000000110000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1010101010101010101010101010101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
