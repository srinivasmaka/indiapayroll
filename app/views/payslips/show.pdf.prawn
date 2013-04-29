pdf.text "Parabola Software Development Pvt Ltd.", :size=>16, :style=>:bold, :align=>:center

pdf.move_down(10)

pdf. text "Plot no:100,sector-1 \n M.V.P.Double Road,M.V.P.Colony \n Visakhapatnam – 530017 \n", :size=>12, :align=>:center

pdf.move_down(10)

pdf.stroke{horizontal_rule}

pdf.move_down(20)

pdf.text "Payslip for #{description_for_payperiod(params["id"])} ",  :size=>14, :style=>:bold, :align=>:center

pdf.move_down(10)

pdf.text "#{@paymentHis.full_name}" 

table_header = make_table( [ [" Employee Details", "Payment and Leave Details" ]
						    ], :cell_style => {:width => 250},
						    	:row_colors => ["e2e2e2"])


table1 = make_table([ ["Employee Id", "#{@employee.emp_id}"],
 						  ["Date of Joining", "#{@employee.date_of_joining}"],
 						  ["Designation", "#{@employee.designation}"],
						  ["PanCard No.", "#{@employee.pan_number}"]
						], :cell_style => {:width => 125})


table2 = make_table([ ["Bank Account No.", "#{@employee.bank_acc_no}"],
					  ["Days Paid", ""],
					  [ "Leaves", "  "]				   
				      ], :cell_style => {:width => 125})


table([ [ {:content =>table_header, :colspan=>2}],
		[table1, table2]])
		  
move_down 20

pdf.text "#{description_for_payperiod(params["id"])} "


payment_table_header = make_table( [ [" Earnings", "Amount(INR)", "Deductions", "Amount(INR)" ] ],
			 :cell_style => {:width => 125},
			 :row_colors => ["e2e2e2"])

payment_table1 = make_table( [ [ "BasicPay ", "#{@paymentHis.basic}"], 
							   ["Medical Allowance", "#{@paymentHis.medical_allowance}"],
							   ["HRA", "#{@paymentHis.hra}"],
							   ["Conveyance", "#{@paymentHis.conveyance}"],
							   ["Special Allowance", "#{@paymentHis.special_allowance}"],							   
							   ["Total Earnings", "#{@total_earnings}"],
							   ["Previous Balance", ""]
							 ], :cell_style => {:width => 125})

payment_table2 = make_table( [ [ "TDS ", "#{@paymentHis.tds}"], 
							   ["Professional Tax", "#{@paymentHis.professional_tax}"],
							   ["Misc ", ""],
							   ["	", "   "],
							   ["  ", "  "],		
							   ["  ", "  "],					   
							   ["Net Amout", "#{@paymentHis.net_monthly}"]
							 ], :cell_style => {:width => 125})

table([ [ {:content =>payment_table_header, :colspan=>2}],
		[payment_table1,payment_table2]	
		 ])
	
data = [["This row should have one color"], 
       ["And this row should have another"]]


