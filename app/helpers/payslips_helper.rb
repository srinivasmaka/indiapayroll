module PayslipsHelper

	def description_for_payperiod(period_id)
		p= period_id[0..period_id.length-7]
		description=""
		month_names= Date::MONTHNAMES.dup
		#month_names.shift
		month_names.rotate!(3)
		description = month_names[p.to_i]

		if (p.to_i).between?(1,9)
			description = description + "  "  + (Date.current.year).to_s
		else
			description = description + "  "  + (Date.current.year.+1).to_s
		end

	end
end
