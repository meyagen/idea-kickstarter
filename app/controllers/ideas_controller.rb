class IdeasController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    @idea = Idea.new
    @ideas = Idea.all.order(title: :asc)
  end

  def create
    @idea = Idea.new idea_params
    if @idea.save
      flash[:notice] = 'Idea successfully added. Check it out below!'
    else
      flash[:alert] = @idea.errors.full_messages
    end

    redirect_to idea_index_path
  end

  def destroy
    respond_to do |format|
      @idea = Idea.find(params[:id])
      if @idea.destroy
        msg = { success: "Successfully destroyed!" }
        status = :ok
      else
        msg = { errors: @idea.errors.full_messages }
        status = :bad_request
      end

      format.json { render json: msg, status: status }
    end
  end

  def kudos
    respond_to do |format|
      @idea = Idea.find(params[:id])
      @idea.kudos += 1
      if @idea.save
        msg = { success: "Successfully congratulated!" }
        status = :ok
      else
        msg = { errors: @idea.errors.full_messages }
        status = :bad_request
      end

      format.json { render json: msg, status: status }
    end
  end

  private
    def idea_params
      params.require(:idea).permit(:title,
                                   :author,
                                   :description)
    end
end
