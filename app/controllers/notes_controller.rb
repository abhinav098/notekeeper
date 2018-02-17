class NotesController < ApplicationController
	before_action :authenticate_user!
	before_action :find_note, only: [:show,:edit,:update,:destroy]

	def index
		@notes = Note.all
	end
	
	def new
		@note = Note.new
	end
	
	def create
		@note = current_user.notes.build(note_params)
		if @note.save
			redirect_to @note
			flash[:notice] = "Note created Successfully"
		else
			redirect_to :new
		end
	end
	
	def update
		if @note.update(note_params)
			redirect_to @note
			flash[:notice] = "Note updated Successfully"
		else
			redirect_to :edit
		end	
	end
	def destroy
		@note.destroy
		redirect_to notes_path
	end

	private
	def find_note
		@note = Note.find(params[:id])
	end
	def note_params
		params.require(:note).permit(:title, :body, :all_tags)
	end
end
