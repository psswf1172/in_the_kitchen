class NotesController < ApplicationController

  def create
    @notable = find_notable
    @note = @notable.notes.build(note_params)
    @note.user_id = current_user.id
    if @note.save!
      redirect_to @notable
    else
      redirect_to recipe_path(@notable), notice: "oops! we didn't get that note!"
    end
  end

  def destroy
    @notable = find_notable
    @note = @notable.notes.find(params[:id])
    @note.destroy!
    redirect_to recipe_path(@notable)
  end

  private
  def find_notable
    params.each do | name, value | 
      if name =~/(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end

  def note_params
    params.require(:note).permit(:id, :body)
  end
end
