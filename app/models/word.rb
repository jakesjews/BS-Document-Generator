class Word < ActiveRecord::Base

  @@all_words ||= Word.all

  #Returns a random noun
  def get_noun
    @@all_words.select{ |word| word.word_type == 'noun' }.sample.word_text
  end

  #Returns a random verb
  def get_verb
    @@all_words.select{ |word| word.word_type == 'verb' }.sample.word_text
  end

  #Returns a random adjective 
  def get_adj
    @@all_words.select{ |word| word.word_type == 'adjective' }.sample.word_text
  end

  def get_paragraph_1
    "We plan to use #{get_adj} #{get_noun} to #{get_verb} our systems. " +
    "This will allow us to easily #{get_verb} more #{get_noun}. " +
    "Within six months we expect that our #{get_adj} #{get_noun} will bring " +
    "#{rand(99).to_s}% more value to our #{get_adj} #{get_noun}."
  end

  def get_paragraph_2
  	"With the fusion of #{get_noun} and #{get_noun} we will be able to create " +
     "#{get_noun} #{rand(99).to_s}% faster. Our #{get_adj} systems " +
	   "will implement both #{get_adj} #{get_noun} and #{get_adj} #{get_noun} more than ever before."
  end

  def get_sub_heading
	  ("%s %s") % [ get_verb.capitalize, get_noun.capitalize ]
  end

  def get_heading
  	("%s %s") % [ get_adj.capitalize, get_noun.capitalize ]
  end

  def get_bullet_point
  	("- %s %s") % [ get_adj.capitalize, get_noun.capitalize ]
  end

  def get_chart_data
  	[
		  ['1', rand(50)],
		  ['2', rand(50)],
		  ['3', rand(50)]
	  ]
  end

  def get_chart_options
  	{
	    :title   => ("%s %s") % [ get_verb.capitalize, get_noun.capitalize ],
	    :label_x => get_noun.capitalize,
	    :label_y => get_noun.capitalize,
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

