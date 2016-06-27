require 'pry'

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
		@stack1 = Array(1..@discs).reverse  #stack1[0] -> stack1[discs-1] == Bottom -> Top
		@stack2 = []
		@stack3 = []
	end

	#define variables
	

	

	#define methods
	def move(from, to)
		#if user enters 1, from from stack1, if 2, move from stack 2, etc


		
		if from == '1' 
			move_val = @stack1.pop.to_i
		elsif from == '2'
			move_val = @stack2.pop.to_i
		elsif from == '3' 
			move_val = @stack3.pop.to_i
		end
		
		
		if to == '1' 
			if @stack1.empty? || @stack1[-1] > move_val 
				@stack1 << move_val 
			else
				puts "You cannot place a disk on top of a smaller disc."
			end
		elsif to == '2' 
			if @stack2.empty? || @stack2[-1] > move_val 
				@stack2 << move_val 
			else
				puts "You cannot place a disk on top of a smaller disc."
			end
		elsif to == '3' 
			if @stack3.empty? || @stack3[-1] > move_val 
				@stack3 << move_val 
			else
				puts "You cannot place a disk on top of a smaller disc."
			end
		end

	end

	def turn
		if @stack2 == Array(1..@discs.to_i).reverse || @stack3 == Array(1..@discs.to_i).reverse
			puts "Congratulations, you won!" 
			return 
		end
	end

	def render 
		lineWidth = 40
		#assign and update variables for each row
			#create an array from -1 to -@stack1.length
			#iterate through each value of the array, passing each value as an index to @stack1
			#add the item at that index to an array
			#pring (via positive indexes) to strings 


			#scratch the above - add items to the string prints using positive indexes starting at the last index of the largest stack (which will be @discs)
			#for each stack (because stacks that are empty at that location will just print 'nil')
		#call different variables in each row
		reversed_stack1 = @stack1.reverse
		reversed_stack2 = @stack2.reverse
		reversed_stack3 = @stack3.reverse
		indices = (Array(1..(@discs)))
		indices.map! {|x| x * -1}
		indices = indices.reverse #[-3, -2, -1]
		indices.each do |index|  #starting at very bottommost possible index, so we need to reverse our stacks here too
			if reversed_stack1[index].nil?
				col_1 = ' ' * @discs 
			else
				col_1 = 'o' * reversed_stack1[index]
			end
			if reversed_stack2[index].nil?
				col_2 = ' ' * @discs 
			else
				col_2 = 'o' * reversed_stack2[index]
			end
			if reversed_stack3[index].nil?
				col_3 = ' ' * @discs 
			else
				col_3 = 'o' * reversed_stack3[index]
			end

			puts col_1.ljust(lineWidth/3) + col_2.center(lineWidth/3) + col_3.rjust(lineWidth/3)
		end
		puts "1".ljust(lineWidth/3) + "2".center(lineWidth/3) + "3".rjust(lineWidth/3)	
	end	

	def play 
		puts "Welcome to Tower of Hanoi!\n
		Instructions:\n
		Enter where you'd like to move from and to\n
		in the format '1,3'. Enter 'q' to quit."

		render

		#get user input and quit or pass it to move call
		usr_input = gets.chomp

		if usr_input == 'q' 
			puts "Quitter!!"
			exit
		end

		from = usr_input.split(',')[0]
		to = usr_input.split(',')[1]
		move(from, to)


		turn
	end


end


t = TowerOfHanoi.new(6)

t.play

#write in "procedurally" first

