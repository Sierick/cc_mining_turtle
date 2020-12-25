function fuelManagement()
    if turtle.getFuelLevel() == 0 then
        for a = 1, 16 do
            turtle.select(a)
            turtle.refuel()
        end
    else
    end
end

function inventoryScanner()
    for b = 1, 16 do
        if turtle.getItemCount(b) ~= 0 then
            if turtle.getItemDetail(b)["name"] == "minecraft:dirt" then
                turtle.select(b)
                turtle.drop()
            elseif turtle.getItemDetail(b)["name"] == "minecraft:stone" then
                turtle.select(b)
                turtle.drop()
            elseif turtle.getItemDetail(b)["name"] == "minecraft:cobblestone" then
                turtle.select(b)
                turtle.drop()
            elseif turtle.getItemDetail(b)["name"] == "minecraft:flint" then
                turtle.select(b)
                turtle.drop()
            elseif turtle.getItemDetail(b)["name"] == "minecraft:gravel" then
                turtle.select(b)
                turtle.drop()
            else
            end
        end
    end
end

function inventoryFull()
    for c = 1, 16 do
        if turtle.getItemCount(c) == 0 then
            flag = false
            return
        else
            flag = true
        end
    end
end

function mining()
    inventoryScanner()
    distance = 0
    for d = 1, 325 do
        fuelManagement()
        turtle.dig()
        inventoryScanner()
        turtle.forward()
        distance=distance+1
        turtle.digDown()
        inventoryScanner()
        turtle.digUp()
        inventoryScanner()
        inventoryFull()
        if flag == true then
            print("Inventory full going home")
            return distance
        else
        end
    end
    print("Set distance traveled going home")
    return distance
end

function gohome(distance)
    turtle.turnRight()
    turtle.turnRight()
    for e = 1, distance do
        fuelManagement()
        turtle.dig()
        turtle.forward()
        turtle.digDown()
        turtle.digUp()
    end
end

mining()
gohome(distance)