class ExchangesController < ApplicationController
	def index
		@open_exchanges = Exchange.all #.select { |e| e.registration_end > DateTime.now }
		@past_exchanges = Exchange.all #.select { |e| e.registration_end < DateTime.now }
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @open_exchanges }
    end	
  end

	def show
	    @exchange = Exchange.find(params[:id])

	    respond_to do |format|
	      format.html # show.html.erb
	      format.xml  { render :xml => @exchange }
	    end
  end

  def new
    @exchange = Exchange.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @exchange }
    end
  end

  # GET /products/1/edit
  def edit
    @exchange = Exchange.find(params[:id])
  end

  # POST /products
  # POST /products.xml
  def create
    @exchange = Exchange.new(exchange_params)

    respond_to do |format|
      if @exchange.save
        format.html { redirect_to(@exchange, :notice => 'Exchange was successfully created.') }
        format.xml  { render :xml => @exchange, :status => :created, :location => @exchange }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @exchange.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.xml
  def update
    @exchange = Exchange.find(params[:id])

    respond_to do |format|
      if @exchange.update_attributes(exchange_params)
        format.html { redirect_to(@exchange, :notice => 'Exchange was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @exchange
          .errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.xml
  def destroy
    @exchange = Exchange.find(params[:id])
    @exchange.destroy

    respond_to do |format|
      format.html { redirect_to(exchanges_url) }
      format.xml  { head :ok }
    end
  end

	private
	def exchange_params
		params.require(:exchange).permit(:name, :thumburl, :description, :registration_start, :registration_end)
	end

end
