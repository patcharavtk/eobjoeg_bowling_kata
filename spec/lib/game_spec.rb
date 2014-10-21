require "game"
require "spec_helper"

describe Game do


	########################## MAIN TEST ###########################
	describe "FULL TEST GAME" do
		it "IN-CLASS CASE WITH TOTAL SCORE = 177" do
			puts "\n***** IN-CLASS CASE WITH TOTAL SCORE = 177 *****"

			game = Game.new()
			puts ""
			puts"--- Game Starting ---"
			puts ""

			print "1st Frame:  "
			game.roll(10)

			print "\n2nd Frame:  "
			game.roll(8)
			print "\t    "
			game.roll(1)

			print "\n3rd Frame:  "
			game.roll(2)
			print "\t    "
			game.roll(8)

			print "\n4th Frame:  "
			game.roll(5)
			print "\t    "
			game.roll(4)

			print "\n5th Frame:  "
			game.roll(10)

			print "\n6th Frame:  "
			game.roll(10)

			print "\n7th Frame:  "
			game.roll(10)

			print "\n8th Frame:  "
			game.roll(5)
			print "\t    "
			game.roll(5)

			print "\n9th Frame:  "
			game.roll(10)

			print "\n10th Frame: "
			game.roll(10)

			puts "\n****** SCOREBOARD ******"
			total_score = game.score()
			puts "************************"

			expect(total_score).to eq(177)
			puts"\n\n"
		end
	end
	######################### END OF TEST ###########################



	####################### OTHER TEST CASES ########################

	describe "OTHER TEST CASES" do
		it "OTHER TEST CASES" do
			puts "WHEN THE GAME IS OVERTHROWN"
			game = Game.new()
			for i in 1..22
				game.roll(2)
			end

			puts "\n\nEXCEEDING PIN"
			game = Game.new()
			game.roll(12)
		end
	end

	################################################################



end