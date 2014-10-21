class Frame
	def initialize()
		@remainingPin = 10
		@takenPin = 0
		@accumulatedScore = 0
		@bonusSlot = 0
		@condition = "NORMAL"
		@throwCount = 0
		@lastFrame = false
		@throwAllowed = 2
		@strikeTemp = 2;
	end

	def hit(pin)
		if (@throwCount < 2)
			if(pin <= @remainingPin)
				@takenPin += pin
				@remainingPin -= pin
				puts "You hit #{pin} pin(s). Total Frame Hit: #{@takenPin} pin(s)."
				@accumulatedScore += pin


				if(pin == 10)
					casee = "STRIKE"
				elsif(@takenPin == 10)
					casee = "SPARE"
				else
				end

				if (casee == "STRIKE")
					@throwCount += @strikeTemp
					setBonus(2)
					@condition = "STRIKE"
					if(@lastFrame)
						@throwAllowed = 3
					end	
				else
					@throwCount += 1
					if (@takenPin == 10)
						setBonus(1)
						@condition = "SPARE"
						if(@lastFrame)
							@throwAllowed = 3
						end
					elsif (@throwCount == @throwAllowed)
						@condition = "END"
					else
						@condition = "NORMAL"
					end
				end
			else
				puts "ERROR (Not enough pins left)"
			end
		else
			puts "OVERTHROWN"
			@condition = "END"
		end
		return @condition	
	end


	def isLastFrame()
		@isLastFrame = true
		@strikeTemp = 1
	end
	def resetPin()
		@remainingPin = 10   
	    @takenPin = 0
	end
	def getScore()
		return @accumulatedScore
	end
	def setBonus(slot)
		if (@isLastFrame) 
			@bonusSlot = 0
		else 
			@bonusSlot = slot
		end
	end
	def addBonusScore(pin)
		if(@bonusSlot > 0) 
			@bonusSlot -= 1;
			@accumulatedScore += pin
		end
		return @accumulatedScore
	end

end