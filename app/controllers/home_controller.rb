class HomeController < ApplicationController
require 'rubygems'
require 'prawn'
require 'prawn/graph'

  #All possible nouns for the document
  NOUNS = ['action-items','applications','architectures','bandwidth','channels','communities','content','convergence','deliverables','e-business','e-commerce','e-markets','e-services','e-tailers','experiences','functionalities','infomediaries','infrastructures','initiatives','interfaces','markets','methodologies','metrics','mindshare','models','networks','niches','paradigms','partnerships','platforms','portals','relationships','ROI','synergies','web-readiness','schemas','solutions','supply-chains','systems','technologies','users','decision-trees','interoperability','XML Interfaces','JSON Interfaces','RSS Feeds''blogs','wikis','mashups','folksonomies','frameworks','blogospheres']

  #All possible verbs for the document
  VERBS = ['aggregate','architect','benchmark','brand','cultivate','deliver','deploy','disintermediate','drive','e-enable','embrace','empower','enable','engage','engineer','enhance','envisioneer','evolve','expedite','exploit','extend','facilitate','generate','grow','harness','implement','incentivize','incubate','innovate','integrate','iterate','leverage','maximize','mesh','monetize','morph','optimize','orchestrate','recontextualize','reintermediate','reinvent','repurpose','revolutionize','scale','seize','strategize','streamline','syndicate','synergize','synthesize','target','transform','transition','unleash','utilize','visualize','whiteboard']

  #All possible adjectives for the document
  ADJECTIVES = ['24/365','24/7','B2B','B2C','back-end','best-of-breed','bleeding-edge','bricks-and-clicks','clicks-and-mortar','collaborative','compelling','cross-platform','cross-media','customized','cutting-edge','distributed','dot-com','dynamic','e-business','efficient','end-to-end','enterprise','extensible','frictionless','front-end','global','granular','holistic','impactful','innovative','integrated','interactive','intuitive','killer','leading-edge','magnetic','mission-critical','next-generation','one-to-one','open-source','out-of-the-box','plug-and-play','proactive','real-time','revolutionary','robust','scalable','seamless','sticky','strategic','synergistic','transparent','turn-key','ubiquitous','user-centric','value-added','vertical','viral','virtual','visionary','web-enabled','wireless','world-class','cloud','social']
	
  #Returns a random noun
  def getNoun()
    return NOUNS[rand(NOUNS.size)]
  end

  #Returns a random verb
  def getVerb()
	return VERBS[rand(VERBS.size)]
  end

  #Returns a random adjective 
  def getAdjective()
	return ADJECTIVES[rand(ADJECTIVES.size)]
  end

  #The main function called when the document is created
  def bs 
    prawnto :inline => true #If possible, make the pdf display in the browser
  end

end

#Create a nitems function to make the prawn-graph gem happy when using ruby > 1.8
class Array
  def nitems
    count {|i| !i.nil?}
  end   
end
