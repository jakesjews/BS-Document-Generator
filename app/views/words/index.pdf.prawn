require 'prawn/graph'

def print_sub_heading(pdf)
	pdf.text("<u>#{@words.get_sub_heading}</u>\n\n", :align => :center, :inline_format => true)
end

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
