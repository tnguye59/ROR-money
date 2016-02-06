class BorrowersController < ApplicationController
	
	def create
		borrower = Borrower.new(borrower_params)
		if borrower.save
			session[:borrower_id] = borrower.id
			flash[:success] = "Successfuly added borrower"
			redirect_to "/borrowers/#{borrower.id}"
		else 
			flash[:errors] = borrower.errors.full_messages
			redirect_to "/"
		end
	end
	def login
	end

	def show
		@borrower = Borrower.find(params[:id])
		@borrowers = @borrower.histories
	end

	private
	def borrower_params
		params.require(:borrower).permit(:first_name, :last_name, :email, :password, :purpose, :description, :money)
	end
end
