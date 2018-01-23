class StylesheetsController < ApplicationController
	before_action :authenticate_admin!

	def index
		@sheets = Stylesheet.all.order(:order)
	end

	def show
		@css = Stylesheet.where(admin_id: current_admin.id)
	end

	def new
		@css = Stylesheet.new
	end

	def create
		@css = Stylesheet.new(stylesheet_params) 
		if @css.order.blank?
			last = Stylesheet.order(:order).last
			@css.order = last.order.to_i + 1
		end
	  if @css.save
      flash[:success] = "CSS saved successfully!"
      redirect_to stylesheets_path
	  else 
      flash[:success] = @css.errors.full_messages
    	redirect_to stylesheets_path 
	  end	
	end

	def edit
		@css = Stylesheet.find(params[:id])
	end

	def update
		@css = Stylesheet.find(params[:id])
	  if @css.update_attributes(stylesheet_params)
      flash[:success] = "CSS saved successfully!"
      redirect_to stylesheets_path
	  else 
      flash[:success] = @css.errors.full_messages
    	redirect_to edit_stylesheets_path 
	  end	
	end

	def toggle
		@css = Stylesheet.find(params[:id])
		if @css.active == 1
			if @css.update_attributes(active: 0)
     	 flash[:success] = "CSS saved successfully!"
	  	else 
	      flash[:success] = @css.errors.full_messages
		  end	
		else
			if @css.update_attributes(active: 1)
     	 flash[:success] = "CSS saved successfully!"
	  	else 
	      flash[:success] = @css.errors.full_messages
		  end	
		end
    redirect_to :back 
	end

  private

    def stylesheet_params
      params.require(:stylesheet).permit(:name, :body, :order, :admin_id)
    end
end

