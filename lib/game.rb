require_relative "frame.rb"
class Game
	def initialize()
		@currentFrame = 1
		@frames = []
		for i in 1..10
			@frames.push(Frame.new())
		end
	end

	def roll(pin)
		if (@currentFrame > 10)
			puts "END OF GAME"
			return
		elsif (@currentFrame == 10)
			@frames[9].isLastFrame()
		end
		condition = @frames[@currentFrame-1].hit(pin)

		for i in 1...@currentFrame
			@frames[i-1].addBonusScore(pin);
		end

		if ("STRIKE" == condition)
			if (@currentFrame == 10)
				@frames[@currentFrame-1].resetPin()
			else
				@currentFrame += 1
			end
		elsif ("SPARE" == condition)
			if (@currentFrame == 10)
				@frames[@currentFrame-1].resetPin()
			else
				@currentFrame += 1
			end
		elsif ("END" == condition)
			@currentFrame += 1
		elsif ("NORMAL" == condition)
		else
			puts "--"	
		end
		if(@currentFrame > 10)
			puts "END OF GAME"
			return
		end
		return condition

	end

	def score()
		totalScore = 0
		i = 1
		@frames.each do |frame|
			totalScore += frame.getScore()
			puts "Frame #{i} score: #{frame.getScore()}"
			i += 1
		end	
		puts "________________________"
		puts "Total Score: #{totalScore}"
		return totalScore
	end
end