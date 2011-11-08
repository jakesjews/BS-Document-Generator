require 'prawn/graph'

def printSubHeading(pdf)
	pdf.text("<u>#{@words.getSubHeading}</u>\n\n", :align => :center, :inline_format => true)
end

pdf.font_size = 16
pdf.text("<u>#{@words.getHeading}</u>\n\n", :style => :bold, :align => :center, :inline_format => true)
pdf.font_size = 12

printSubHeading(pdf)
pdf.text("#{@words.getParagraph1}\n\n")

printSubHeading(pdf)
pdf.text("We will utilize :\n\n", :style => :bold)
(1..10).each {  
  	pdf.text("#{@words.getBulletPoint}\n")
}
pdf.text("\n")

printSubHeading(pdf)
pdf.text("#{@words.getParagraph2}\n")

pdf.line_chart(@words.getChartData, @words.getChartOptions)
