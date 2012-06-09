class ImagesController < ApplicationController
  def create
  	@image = Image.new(params[:image])

    respond_to do |format|
      if @image.save
        format.html { redirect_to @image.idea, notice: 'Idea was successfully created.' }
        format.json { render json: @image.idea, status: :created, location: @image.idea }
      else
        format.html { render action: "new" }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end

  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy

    respond_to do |format|
      format.html { redirect_to @image.idea }
      format.json { head :no_content }
    end

  end
end
