class SiteController < ApplicationController
  
  def index 
    @news = ContentBlock.where(:friendly_url=>"news").first
    @testimonial = ContentBlock.where(:friendly_url=>"testimonial").first
  end
  
  def static_page
    content_block = ContentBlock.where(:friendly_url=>params[:friendly_url]).first
    if content_block
        @page_title = content_block.name
        render :text=>content_block.body, :layout=>"application"
    else
        render :text=>"content not found", :layout=>"application"
    end
  end
  
  def on_site_training
    @page_title="On-Site Training"
    @on_site_training = OnSiteTraining.new
    if request.post?
      @on_site_training = OnSiteTraining.new(params[:on_site_training])
      if @on_site_training.valid?
        @on_site_training.save
        Postoffice.on_site_training(@on_site_training).deliver
      else
        flash.now[:notice] = "Please enter all required fields."
      end
    end
  end
  
end
