class SessionsController < ApplicationController
	def create_lender
		lender = Lender.find_by(email: params[:email])
		if lender && lender.authenticate(params[:password])
			session[:lender_id] = lender.id
			redirect_to "/lenders/#{lender.id}"
		else
			flash[:errors] = ["Invalid Email/Password Combination"]
			redirect_to '/lenders/login'
		end
	end
	
	def create_borrower
		borrower = Borrower.find_by(email: params[:email])
		if borrower && borrower.authenticate(params[:password])
			session[:borrower_id] = borrower.id
			redirect_to "/borrowers/#{borrower.id}"
		else
			flash[:errors] = ["Invalid Email/Password Combination"]
			redirect_to '/borrowers/login'
		end
	end

	def destroy
		session.clear
  		session[:success] = true
  		redirect_to '/'
  	end
end
