puts "Enter loan amount: "
loan_amount = gets.chomp.to_f
puts "Enter APR: "
apr = gets.chomp.to_f
converted_apr = apr * 0.01
monthly_interest = converted_apr / 12
puts "Enter loan duration in months: "
loan_duration = gets.chomp.to_f
monthly_payment = loan_amount * (monthly_interest / (1 - (1 + monthly_interest)**(-loan_duration)))
puts "Your monthly payment is #{monthly_payment}"