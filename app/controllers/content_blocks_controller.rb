class ContentBlocksController < ApplicationController
  before_filter :authenticate_admin
  
  # GET /content_blocks
  # GET /content_blocks.xml
  def index
    @content_blocks = ContentBlock.paginate(:all, :per_page=>20, :page=>params[:page])
    @page_title = "Content Blocks"
    @admin_section = true
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @content_blocks }
    end
  end

  # GET /content_blocks/1
  # GET /content_blocks/1.xml
  def show
    @content_block = ContentBlock.find(params[:id])

    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @content_block }
    end
  end

  # GET /content_blocks/new
  # GET /content_blocks/new.xml
  def new
    @content_block = ContentBlock.new
    @page_title = "New Content Block"
    @admin_section = true
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @content_block }
    end
  end

  # GET /content_blocks/1/edit
  def edit
    @page_title = "Edit Content Block"
    @admin_section = true
    
    @content_block = ContentBlock.where(:id=>params[:id]).first()
  end

  # POST /content_blocks
  # POST /content_blocks.xml
  def create
    @content_block = ContentBlock.new(params[:content_block])
    @page_title = "New Content Block"
    @admin_section = true
    respond_to do |format|
      if @content_block.save
        format.html { redirect_to(content_blocks_url, :notice => 'Content block was successfully created.') }
        format.xml  { render :xml => @content_block, :status => :created, :location => @content_block }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @content_block.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /content_blocks/1
  # PUT /content_blocks/1.xml
  def update
    @content_block =  ContentBlock.where(:id=>params[:id]).first()
    @page_title = "Edit Content Block"
    @admin_section = true
    respond_to do |format|
      if @content_block.update_attributes(params[:content_block])
        format.html { redirect_to(content_blocks_url, :notice => 'Content block was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @content_block.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /content_blocks/1
  # DELETE /content_blocks/1.xml
  def destroy
    @content_block = ContentBlock.find(params[:id])
    @content_block.destroy

    respond_to do |format|
      format.html { redirect_to(content_blocks_url) }
      format.xml  { head :ok }
    end
  end
end
