class Word < ActiveRecord::Base

  #Returns a random noun
  def self.getNoun
	  Word.getRandomWord('noun')
  end

  #Returns a random verb
  def self.getVerb
	  Word.getRandomWord('verb')
  end

  #Returns a random adjective 
  def self.getAdj
	  Word.getRandomWord('adjective')
  end

  def self.getRandomWord(type)
    offset = rand(Word.where( :word_type => type ).count)
    Word.offset( offset ).where( :word_type => type ).first.word
  end 

  def getParagraph1
    "We plan to use #{Word.getAdj} #{Word.getNoun} to #{Word.getVerb} our systems. " + 
    "This will allow us to easily #{Word.getVerb} more #{Word.getNoun}. " +  
    "Within six months we expect that our #{Word.getAdj} #{Word.getNoun} will bring " +
    "#{rand(99).to_s}% more value to our #{Word.getAdj} #{Word.getNoun}. 
  end

  def getParagraph2
  	"With the fusion of #{Word.getNoun} and #{Word.getNoun} we will be able to create " +
     "#{Word.getNoun} #{rand(99).to_s}% faster. Our #{Word.getAdj} systems " +
	   "will implement both #{Word.getAdj} #{Word.getNoun} and #{Word.getAdj} #{Word.getNoun} more than ever before"
  end

  def getSubHeading
	  ("%s %s") % [ Word.getVerb.capitalize, Word.getNoun.capitalize ]
  end

  def getHeading
  	("%s %s") % [ Word.getAdj.capitalize, Word.getNoun.capitalize ]
  end

  def getBulletPoint
  	("- %s %s") % [ Word.getAdj.capitalize, Word.getNoun.capitalize ]
  end

  def getChartData
  	[
		  ['1', 20],
		  ['2', 30],
		  ['3', 40]
	  ]
  end

  def getChartOptions
  	{
	    :title   => ("%s %s") % [ Word.getVerb.capitalize, Word.getNoun.capitalize ],
	    :label_x => Word.getNoun.capitalize,
	    :label_y => Word.getNoun.capitalize,
	    :at      => [ 0,0 ]
	}
  end
end
  #Create a nitems function to make the prawn-graph gem happy when using ruby > 1.8
  class Array
	def nitems
	  count {|i| !i.nil?}
    end   
  end

