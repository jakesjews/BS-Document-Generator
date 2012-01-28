# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

nouns = ['action-items','applications','architectures','bandwidth','channels',
        'communities','content','convergence','deliverables','e-business',
        'e-commerce','e-markets','e-services','e-tailers','experiences',
        'functionalities','infomediaries','infrastructures','initiatives',
        'interfaces','markets','methodologies','metrics','mindshare','models',
        'networks','niches','paradigms','partnerships','platforms','portals',
        'relationships','ROI','synergies','web-readiness','schemas','solutions',
        'supply-chains','systems','technologies','users','decision-trees',
        'interoperability','XML Interfaces','JSON Interfaces','RSS Feeds''blogs',
        'wikis','mashups','folksonomies','frameworks','blogospheres']

verbs = ['aggregate','architect','benchmark','brand','cultivate','deliver',
         'deploy','disintermediate','drive','e-enable','embrace','empower',
         'enable','engage','engineer','enhance','envisioneer','evolve',
         'expedite','exploit','extend','facilitate','generate','grow',
         'harness','implement','incentivize','incubate','innovate',
         'integrate','iterate','leverage','maximize','mesh','monetize',
         'morph','optimize','orchestrate','recontextualize',
         'reintermediate','reinvent','repurpose','revolutionize','scale',
         'seize','strategize','streamline','syndicate','synergize',
         'synthesize','target','transform','transition','unleash',
         'utilize','visualize','whiteboard']

adjectives = ['24/365','24/7','B2B','B2C','back-end','best-of-breed',
              'bleeding-edge','bricks-and-clicks','clicks-and-mortar',
              'collaborative','compelling','cross-platform','cross-media',
              'customized','cutting-edge','distributed','dot-com',
              'dynamic','e-business','efficient','end-to-end','enterprise',
              'extensible','frictionless','front-end','global','granular',
              'holistic','impactful','innovative','integrated','interactive',
              'intuitive','killer','leading-edge','magnetic',
              'mission-critical','next-generation','one-to-one',
              'open-source','out-of-the-box','plug-and-play','proactive',
              'real-time','revolutionary','robust','scalable','seamless',
              'sticky','strategic','synergistic','transparent','turn-key',
              'ubiquitous','user-centric','value-added','vertical','viral',
              'virtual','visionary','web-enabled','wireless','world-class',
              'cloud','social', 'meta' ]

nouns.each do |noun|
  Word.find_or_create_by_word_type_and_word_text( 'noun', noun )
end

verbs.each do |verb|
  Word.find_or_create_by_word_type_and_word_text( 'verb', verb )
end

adjectives.each do |adj|
  Word.find_or_create_by_word_type_and_word_text( 'adjective', adj )
end
