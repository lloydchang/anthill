class CommentsController < ApplicationController
  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.json
  def new
    @comment = current_user.comments.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/1/edit
  def edit
    @comment = current_user.comments.find(params[:id])
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = current_user.comments.new(params[:comment])
    @comment.comment = Sanitize.clean(@comment.comment)

    if @comment.idea.company_id != current_user.company_id
      @comment.errors.add(:idea_id, "Idea you are trying to comment to doesn't belong to your company.")
    end

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment.idea, notice: 'Comment was successfully created.' }
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html { render action: "new" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /comments/1
  # PUT /comments/1.json
  def update
    @comment = current_user.comments.find(params[:id])
    @comment.comment = Sanitize.clean(@comment.comment)
    
    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to @comment.idea, notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = current_user.comments.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to @comment.idea }
      format.json { head :no_content }
    end
  end
end
