require 'active_model'

class ConsolidatedPayments

	
	attr_accessor :jan, :feb, :mar, :apr, :may, :jun, :jul, :aug, :sep, :oct, :nov, :dec, :ps1, :ps2, :ps3, :ps4, :total

	def initialize 
		@apr = 0
		@may = 0
		@jun = 0
		@jul = 0
		@aug = 0
		@sep = 0
		@oct = 0
		@nov = 0
		@dec = 0
		@jan = 0
		@feb = 0
		@mar = 0
		@ps1 = 0
		@ps2 = 0
		@ps3 = 0
		@ps4 = 0
		@total = 0
	end

end