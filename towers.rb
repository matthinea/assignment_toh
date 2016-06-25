class TowerOfHanoi
#what we need:
	#methods: 
		#move(origin, destination), which takes a row to move from and a row to move to, then takes the top block off the row to move from
			#and moves it to the top of the row to move to
				#don't forget to check to make sure the disc isn't being moved to a row with a smaller disc sitting on top!
		#render, which prints out information about the current state of the game board
		#a method that checks whether the player has won or quit. the player has won when one of the other two rows contains all discs
			#in order of smallest to largest

	#variables:
		#an array for each row (1, 2, and 3)
		#integers? representing size of each disc (ranging from 1 to # of discs)

	#gameplay: 
		#print intro, instructions
		#print current state of board (render)
		#take user input
		#pass user input as arguments to (move) and run (move)
		#check whether the player has won or quit
		#if they've won, print a congratulations and exit
		#if they've quit, print a confirm y/n and exit
	def initialize(discs = 3)
		@discs = discs
	end

	#define variables
	

	@stack1 = Array(@discs.to_i..1)  #L -> R == Bottom -> Top
	@stack2 = []
	@stack3 = []

	#define methods
	def move(from, to)
		to << from.pop unless to.last < from.last || from.empty?
	end

	def turn
		if @stack2 = Array(@discs.to_i..1) || @stack3 = Array(@discs.to_i..1)
			puts "Congratulations, you won!" 
			exit  
		end
	end

	def render 
		lineWidth = 60
		#assign and update variables for each row
		@stack1[-1]
		#call different variables in each row
		puts str.ljust  lineWidth
		puts str.center lineWidth
		puts str.rjust  lineWidth
	end	

	def play 
		puts "Welcome to Tower of Hanoi!\n
		Instructions:\n
		Enter where you'd like to move from and to\n
		in the format '1,3'. Enter 'q' to quit."

		render

		usr_input = gets.chomp

		if usr_input == 'quit' 
			puts "Quitter!"
			exit
		end

		from = usr_input.split(',')[0]
		to = usr_input.split(',')[1]
		move(from, to)

		turn
	end


end



#write in "procedurally" first

