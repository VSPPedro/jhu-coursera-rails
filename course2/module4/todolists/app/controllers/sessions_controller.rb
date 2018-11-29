class SessionsController < ApplicationController
  # GET /sessions/new
  def new
  end

  # POST /sessions
  # POST /sessions.json
  def create
  end

  # DELETE /sessions/1
  # DELETE /sessions/1.json
  def destroy
    respond_to do |format|
      format.html { redirect_to todo_lists_url, notice: 'Todo list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
end
