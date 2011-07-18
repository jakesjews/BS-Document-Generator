require 'rubygems'
require 'prawn'
require 'prawn/graph'

def printParagraph1(pdf)
	
  printSubHeading(pdf)

	pdf.text("We plan to use " + controller.getAdjective() + " " + controller.getNoun() + " to " + controller.getVerb() + " our systems. This will allow us to easily " + controller.getVerb() + " more " + controller.getNoun() + ". Within six months we expect that our " + controller.getAdjective() + " " + controller.getNoun() + " will bring " + rand(99).to_s + "% more value to our " + controller.getAdjective() + " " + controller.getNoun() + ".")

  pdf.text("\n")

end

def printParagraph2(pdf)

	printSubHeading(pdf)

	pdf.text("With the fusion of " + controller.getNoun() + " and " + controller.getNoun() + " we will be able to create " + controller.getNoun() + " " + rand(99).to_s + "% faster. Our " + controller.getAdjective() + " systems will implement both " + controller.getAdjective() + " " + controller.getNoun() + " and " + controller.getAdjective() + " " + controller.getNoun() + " more than ever before.")   

end

def printSubHeading(pdf)

	pdf.text("<u>" + controller.getVerb().capitalize + " " + controller.getNoun().capitalize + " </u>", :align => :center, :inline_format => true)
	pdf.text("\n")

end

def printHeading(pdf)

	pdf.font_size = 16
	
	pdf.text("<u>" + controller.getAdjective().capitalize + " " + controller.getNoun().capitalize + "</u>", :style => :bold, :align => :center, :inline_format => true)
  pdf.text("\n")

  pdf.font_size = 12

end

def printBulletPoints(pdf)

  printSubHeading(pdf)

  pdf.text("We will utilize :\n\n", :style => :bold)

	(1..10).each {  
  	pdf.text("- " + controller.getAdjective().capitalize + " " + controller.getNoun().capitalize + "\n")
  }

	pdf.text("\n")

end

def printChart(pdf)

	data =    [
		       		 ['1', 20],
						   ['2', 30],
						   ['3', 40]
		    	  ]

	options = {
		          :title => controller.getVerb().capitalize + " " + controller.getNoun().capitalize,
				      :label_x => controller.getNoun().capitalize,
				      :label_y => controller.getNoun().capitalize,
			    	  :at => [0,0]
			   	 }

  pdf.line_chart(data, options) 

end 

printHeading(pdf)
printParagraph1(pdf)
printBulletPoints(pdf)
printParagraph2(pdf)
printChart(pdf)
