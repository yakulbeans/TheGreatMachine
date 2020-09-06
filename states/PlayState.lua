PlayState = Class{__includes = BaseState}

ideaList = {}

function PlayState:init()

end

function PlayState:update(dt)
	machine:update(dt)
	ideaSpawnTimer = ideaSpawnTimer + dt
	if ideaSpawnTimer > 3 then
		table.insert(ideaList, Ideas())
		ideaSpawnTimer = 0
	end

	for k, ideas in pairs(ideaList) do
		ideas:update(dt)
		if machine.x + 105 < ideas.x + 15 and machine.x + 105 > ideas.x - 15 then
			if ideas.y > VIRTUAL_HEIGHT - 210 and ideas.y < VIRTUAL_HEIGHT - 180 then
				table.remove(ideaList, k)
			end
		end

		if ideas.y > VIRTUAL_HEIGHT + 10 then
			table.remove(ideaList, k)
		end
	end
end

function PlayState:render()
	--love.graphics.printf('hello play state', 0, 10, VIRTUAL_WIDTH, 'center')
	for k, ideas in pairs(ideaList) do
		ideas:render()
	end
	machine:render()
end