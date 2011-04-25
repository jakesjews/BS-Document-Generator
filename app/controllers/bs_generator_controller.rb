class BsGeneratorController < ApplicationController
require 'rubygems'
require 'prawn'
require 'prawn/graph'


NOUNS = ['action-items','applications','architectures','bandwidth','channels','communities','content','convergence','deliverables','e-business','e-commerce','e-markets','e-services',
		'e-tailers','experiences','functionalities','infomediaries','infrastructures','initiatives','interfaces','markets','methodologies','metrics','mindshare','models','networks',
		'niches','paradigms','partnerships','platforms','portals','relationships','ROI','synergies','web-readiness','schemas','solutions','supply-chains','systems','technologies','users']

VERBS = ['aggregate','architect','benchmark','brand','cultivate','deliver','deploy','disintermediate','drive','e-enable','embrace','empower','enable','engage','engineer','enhance','envisioneer',
	'evolve','expedite','exploit','extend','facilitate','generate','grow','harness','implement','incentivize','incubate','innovate','integrate','iterate','leverage','maximize','mesh',
	 'monetize','morph','optimize','orchestrate','recontextualize','reintermediate','reinvent','repurpose','revolutionize','scale','seize','strategize','streamline','syndicate',
	'synergize','synthesize','target','transform','transition','unleash','utilize','visualize','whiteboard']

ADJECTIVES = ['24/365',24/7,'B2B','B2C','back-end','best-of-breed','bleeding-edge','bricks-and-clicks','clicks-and-mortar','collaborative','compelling','cross-platform','cross-media',
		'customized','cutting-edge','distributed','dot-com','dynamic','e-business','efficient','end-to-end','enterprise','extensible','frictionless','front-end','global','granular','holistic',
		'impactful','innovative','integrated','interactive','intuitive','killer','leading-edge','magnetic','mission-critical','next-generation','one-to-one','open-source','out-of-the-box',
		'plug-and-play','proactive','real-time','revolutionary','robust','scalable','seamless','sexy','sticky','strategic','synergistic','transparent','turn-key','ubiquitous','user-centric',
		'value-added','vertical','viral','virtual','visionary','web-enabled','wireless','world-class']
	

def getNoun()
	return NOUNS[rand(NOUNS.size)]
end

def getVerb()
	return VERBS[rand(VERBS.size)]
end

def getAdjective()
	return ADJECTIVES[rand(ADJECTIVES.size)]
end

def printParagraph1(pdf)
	
  printSubHeading(pdf)

	pdf.text("We will use " + getNoun() + " to " + getVerb() + " our systems. This will allow us to easily " + getVerb() + " our " + getNoun() + ". Within six months we expect that our " + getAdjective() + " " + getNoun() + " will bring " + rand(99).to_s + "% more value to our " + getAdjective() + " " + getNoun())

  pdf.text("\n")

end

def printParagraph2(pdf)

	printSubHeading(pdf)

	pdf.text("With the fusion of " + getNoun() + " and " + getNoun() + " we will be able to create " + getNoun() + " " + rand(99).to_s + "% faster. Our " + getAdjective() + " systems will implement both " + getAdjective() + " " + getNoun() + " and " + getAdjective() + " " + getNoun() + " more than ever before.")   

end

def printSubHeading(pdf)

	pdf.text("<u>" + getVerb().capitalize + " " + getNoun().capitalize + " </u>", :align => :center, :inline_format => true)
	pdf.text("\n")

end

def printHeading(pdf)

	pdf.font_size = 16
	
	pdf.text("<u>" + getAdjective().capitalize + " " + getNoun().capitalize + "</u>", :style => :bold, :align => :center, :inline_format => true)
  pdf.text("\n")

  pdf.font_size = 12

end

def printBulletPoints(pdf)

  printSubHeading(pdf)

  pdf.text("We will utilize :\n\n", :style => :bold)

	(1..10).each {  
  	pdf.text("- " + getAdjective().capitalize + " " + getNoun().capitalize + "\n")
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
		          :title => getVerb().capitalize + " " + getNoun().capitalize,
				      :label_x => getNoun().capitalize,
				      :label_y => getNoun().capitalize,
			    	  :at => [0,0]
			   	 }

  pdf.line_chart(data, options) 

end

def get_pdf
# Mime::Type.register "application/pdf", :pdf

  output = Prawn::Document.generate("bs.pdf") do |pdf| 

    printHeading(pdf)
    printParagraph1(pdf)
    printBulletPoints(pdf)
    printParagraph2(pdf)
    printChart(pdf)
    
  end

   respond_to do |format|
      format.pdf do
        send_data output, :type => "application/pdf",
                          :filename => "bs.pdf",
                          :disposition => "inline",
                          :layout => false
     end
  end 
end
end
