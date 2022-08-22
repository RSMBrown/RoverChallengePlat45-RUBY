class Rover
    def initialize(posx, posy, direction)
        @posx = posx
        @posy = posy
        @direction = direction
    end
    
    def print_details()
        puts "#@posx #@posy #@direction"
    end
end

#Main program 

puts "Welcome to the Rover position changer. Please make sure that all work enetered is entered correctly."

#Sets the size of the area
print "Enter size of area: "
sizeofArea = gets.chomp.split(" ")
#set width and height of area 
width = sizeofArea[0].to_i
height = sizeofArea[1].to_i

print "How many Rovers would you like to change?: "
numRovers = gets.chomp.to_i

#Create empty array of rovers 
listRovers = []

#for loop iterating over the number of rovers entered 
for numofRovers in (0...numRovers) do 
    print "Insert current position of Rover #{numofRovers + 1}: "
    input1 = gets.chomp.split(" ")
    #set position x, y and direction of rover 
    posx = input1[0].to_i
    posy = input1[1].to_i
    direction = input1[2]
    
    print "Enter change of co-ordinates: "
    userMovementInput = gets.chomp
    listofMovement = userMovementInput.split("")
    
    #Loop through change of co ordinates to 'move' rover 
    for mov in listofMovement do
        
        if mov == "L"
            if direction == "N"
                direction = "W"
            elsif direction == "E"
                direction = "N"
            elsif direction == "S"
                direction = "E"
            elsif direction == "W"
                direction = "S"
            end
        end
        
        if mov == "R"
            if direction == "N"
                direction = "E"
            elsif direction == "E"
                direction = "S"
            elsif direction == "S"
                direction = "W"
            elsif direction == "W"
                direction = "N"
            end
        end
        
        if mov == "M" and direction == "N"
            #this is to make sure that the rover does not 'fall out' of defined area
            if posy + 1 <= width 
                posy = posy + 1
            end
        end 
        if mov =="M" and direction == "S"
            #this is to make sure that the rover does not 'fall out' of defined area
            if posy - 1 >= 0 
                posy = posy - 1
            end
        end
        
        if mov == "M" and direction == "E"
            #this is to make sure that the rover does not 'fall out' of defined area
            if posx + 1 <= height 
                posx = posx + 1
            end
        end
        if mov == "M" and direction == "W"
            #this is to make sure that the rover does not 'fall out' of defined area
            if posx - 1 >= 0 
                posx = posx - 1 
            end 
        end 
    end

    #this assigns the position x, y and direction to the class newRover 
    newRover = Rover.new(posx, posy, direction)
    #This adds the object newRover to the array
    listRovers << newRover
end

#This loops through the array and prints the result by calling the class newRover 
for rover in listRovers do
    rover.print_details()
end






