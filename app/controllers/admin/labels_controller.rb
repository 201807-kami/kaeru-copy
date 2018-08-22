class Admin::LabelsController < ApplicationController
	layout 'admin'

	def index
		@labels = Label.all
	end

	def new
		@label = Label.new 
	end

	def create
		@label = Label.new(label_params)
		@label.save
		redirect_to admin_labels_path
	end

	def edit 
		@label = Label.find(params[:id])
	end

	def update
	    @label = Label.find(params[:id])
	    @label.update(label_params)
	    redirect_to admin_labels_path
    end

	def destroy
	    @label = Label.find(params[:id])
	    @label.destroy
	    flash[:success] = '削除が完了しました'
	    redirect_to admin_labels_path
	  end

	private

	def label_params
		params.require(:label).permit(:id, :name)
	end
end