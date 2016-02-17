class ToDosController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    @todo = ToDo.new
    @todos = ToDo.all
  end

  def create
    @todo = ToDo.create todo_params
    redirect_to todo_index_path
  end

  def destroy
    respond_to do |format|
      @todo = ToDo.find(params[:id])
      if @todo.destroy
        msg = { success: "Successfully destroyed!" }
        status = :ok
      else
        msg = { errors: @todo.errors.full_messages }
        status = :bad_request
      end

      formt.json { render json: msg, status: status }
    end
  end

  private
    def todo_params
      params.require(:to_do).permit(:description)
    end
end
