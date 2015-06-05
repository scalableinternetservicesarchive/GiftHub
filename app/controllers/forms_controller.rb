class FormsController < ApplicationController
	before_action :authenticate_user!, :except => [:show, :index]
	@currentExchange

  def index
  	@forms = Form.all
  end

  # def new
  #
  #   if(!user_signed_in?)
  #     redirect_to pages_path, :notice => "You need to sign in to participate!" and return false
  #   end
  #
		# @currentExchange = params[:name]
		# if exchange = Exchange.find_by_name(@currentExchange)
		# 	if exchange.registration_start > DateTime.now
		# 		redirect_to pages_path, :notice => "Sorry, the registration period for this exchange has not yet started. Please check back when registration is open."
		# 	end
		# end
  #
  # 	@form = Form.new
  # 	@currentExchange = params[:name]
  #   @currentExchangeID = params[:exchange_id]
  # 	# raise @currentExchange
  #
  #   event = Exchange.find(params[:exchange_id])
  #   oldSignUp = ExchangeProfile.where(user_id: current_user.id, exchange_id: event.id)
  #   if(!oldSignUp.empty?)
  #     redirect_to pages_path, :notice => "You have already signed up for this event!" and return false
  #   end
  #
  # end

  def new
    @exchange = Exchange.find(params[:id])
    @exchange_questions = @exchange.questions
    # @form = Object.new

    if ExchangeProfile.where(exchange_id: params[:id], user_id: current_user.id,).first == nil
      respond_to do |format|
        format.html
      end
    else
      redirect_to pages_path, :notice => "Sorry, it appears that you have already signed up for this exchange..."
    end
  end

  # def create
  #
  # 	@form = Form.new(:exchangeName => params[:currentExchange],
  #     :categoryID => 123, :userEmail => current_user.email,
  #     :notes => params[:form][:notes],
  #     :favorite => params[:form][:favorite])
  #
  #   event = Exchange.find_by(name: params[:currentExchange])
  #
  #   if (event != nil)
  #
  #       # PREVENT DUPLICATE SUBMISSIONS: CHECK OLD SIGN UP!
  #       oldSignUp = ExchangeProfile.where(user_id: current_user.id, exchange_id: event.id)
  #       if(!oldSignUp.empty?)
  #         redirect_to pages_path, :notice => "You have already signed up for this event!" and return false
  #       end
  #
  #       xchangeprofile = ExchangeProfile.new(user_id: current_user.id, exchange_id: event.id, gift_received:false)
  #       xchangeprofile.save
  #   end
  #
  #   if @form.save
  # 		redirect_to pages_path, :notice => "Thank you for signing up"
  # 	else
  # 		render ('new')
  # 	end
  # end

  def create
    # @responses = params[]
    redir_pages = true
    ids = Array.new
    params[:responses].each_key { |k|
      ids.push(k)
    }

    exch_prof = ExchangeProfile.new(user_id: current_user.id, exchange_id: params[:id], gift_received: false)

    if exch_prof.save!
      @questions = Question.find(ids)
      @questions.each do |q|
        response = Response.new(question_id: q.id, user_id: current_user.id)


        if response.save!
          resp_val = ResponseValue.new(response_id: response.id, value: params[:responses][q.id.to_s.to_sym][:title])

          if resp_val.save!
            redir_pages = redir_pages & true
          else
            redir_pages = false
            break
          end
        else
          redir_pages = false
          break
        end
      end
    else
      redir_pages = false
    end

    respond_to do |format|
      if redir_pages
        format.html { redirect_to pages_path, :notice => "Thank you for signing up!" }
      elsif
        format.html { render :action => "new" }
      end
    end
  end

  private
  def form_params
  	# params.require(:form).permit(:exchangeName,:categoryID,:userEmail,:notes, :favorite)
    params.require(:exchange).permit(:id)
  end


end
