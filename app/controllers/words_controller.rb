class WordsController < ApplicationController
  # GET /words
  def index
    @words = Word.new
    respond_to do |format|
      format.pdf { render :layout => false }
    end
  end
end
