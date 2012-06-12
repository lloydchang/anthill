class IdeasController < ApplicationController
  before_filter :authenticate_user!
  before_filter :check_owner, :only=>[:update, :destroy]

  # GET /dashboard
  # GET /dashboard.json
  def dashboard
    @ideas = current_user.company.ideas

    respond_to do |format|
      format.html # dashboard.html.erb
      format.json { render json: @ideas }
    end
  end

  
  # GET /ideas
  # GET /ideas.json
  def index
    return redirect_to(dashboard_path)

    @ideas = Idea.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ideas }
    end
  end

  # GET /ideas/1
  # GET /ideas/1.json
  def show
    @idea = current_user.company.ideas.find(params[:id])
    @comment = Comment.new

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @idea }
    end
  end

  # GET /ideas/new
  # GET /ideas/new.json
  def new
    @idea = Idea.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @idea }
    end
  end

  # GET /ideas/1/edit
  def edit
    @idea = Idea.find(params[:id])
  end

  # POST /ideas
  # POST /ideas.json
  def create
    @idea = Idea.new(params[:idea])
    @idea.user_id = current_user.id
    @idea.company_id = current_user.company_id

    respond_to do |format|
      if @idea.save
        format.html { redirect_to @idea, notice: 'Idea was successfully created.' }
        format.json { render json: @idea, status: :created, location: @idea }
      else
        format.html { render action: "new" }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ideas/1
  # PUT /ideas/1.json
  def update
    respond_to do |format|
      if @idea.update_attributes(params[:idea])
        format.html { redirect_to @idea, notice: 'Idea was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  def join
    @idea = Idea.find(params[:id])
    @idea.users << current_user
    redirect_to(@idea)
  end

  def unjoin
    @idea = Idea.find(params[:id])
    @idea.users.delete(current_user)
    redirect_to(@idea)
  end

  # DELETE /ideas/1
  # DELETE /ideas/1.json
  def destroy
    @idea.destroy

    respond_to do |format|
      format.html { redirect_to ideas_url }
      format.json { head :no_content }
    end
  end

  def check_owner
    @idea = Idea.find(params[:id])
    redirect_to(ideas_path, :alert=>"You are not an owner of this idea") if @idea.user != current_user
  end
end
