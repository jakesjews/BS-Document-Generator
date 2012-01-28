require 'prawn/graph'

class WordsController < ApplicationController
  # GET /words
  def index
    @words = Word.new
    respond_to do |format|
      format.pdf do  
        pdf = Prawn::Document.new
        
        create_pdf(pdf) 
        send_data pdf.render, type: "application/pdf", disposition: "inline"
      end  
    end
  end

  def create_pdf(pdf)
 
    pdf.font_size = 16
    pdf.text("<u>#{@words.get_heading}</u>\n\n", :style => :bold, :align => :center, :inline_format => true)
    pdf.font_size = 12

    print_sub_heading(pdf)
    pdf.text("#{@words.get_paragraph_1}\n\n")

    print_sub_heading(pdf)
    pdf.text("We will utilize :\n\n", :style => :bold)
    
    (1..10).each {  
  	    pdf.text("#{@words.get_bullet_point}\n")
    }
    pdf.text("\n")

    print_sub_heading(pdf)
    pdf.text("#{@words.get_paragraph_2}\n")

    pdf.line_chart(@words.get_chart_data, @words.get_chart_options)
 
  end

  def print_sub_heading(pdf)
	pdf.text("<u>#{@words.get_sub_heading}</u>\n\n", :align => :center, :inline_format => true)
  end

end
