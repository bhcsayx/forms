class FormController < ApplicationController

	def success

	end

  def submit
		@email=params[:email]
		if params[:maxtic]
			@max=params[:maxtic].to_i
		else
			@max=1
		end
		if request.post?
			params[:form]["number"] = params[:form]["number"].to_i
			#params[:form]["other"] = params[:form]["text"]
			if params[:coming] == 'yes' 
				if params[:form]["number"] == 0
					params[:form]["number"] = 1
				end
				params[:form]["resp"] = true
			elsif params[:coming] == 'no'
				if params[:form]["number"] > 0
					params[:form]["number"] = 0
				end
				params[:form]["resp"] = false
			end

			@resp = Response.new(response_params)
			@resp.save
  		#render plain: params[:form].inspect
			render :template => "form/success"
		end
  end

	private
  def response_params
    params.require(:form).permit(:email, :resp, :number, :other)
  end

end
