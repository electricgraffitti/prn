class LandingPagesController < ApplicationController
  
  layout 'landing_page'
  
  def moon_palace
    @resort = Resort.find_by_name('Moon Palace', :include => :suites)
  end

  def sun_palace
    @resort = Resort.find_by_name('Sun Palace', :include => :suites)
  end

end
