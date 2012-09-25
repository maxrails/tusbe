class BookLinksController < ApplicationController
  # GET /book_links
  # GET /book_links.json
  def index
    @book_links = BookLink.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @book_links }
    end
  end

  # GET /book_links/1
  # GET /book_links/1.json
  def show
    @book_link = BookLink.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @book_link }
    end
  end

  # GET /book_links/new
  # GET /book_links/new.json
  def new
    @book_link = BookLink.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @book_link }
    end
  end

  # GET /book_links/1/edit
  def edit
    @book_link = BookLink.find(params[:id])
  end

  # POST /book_links
  # POST /book_links.json
  def create
    @book_link = BookLink.new(params[:book_link])

    respond_to do |format|
      if @book_link.save
        format.html { redirect_to @book_link, notice: 'Book link was successfully created.' }
        format.json { render json: @book_link, status: :created, location: @book_link }
      else
        format.html { render action: "new" }
        format.json { render json: @book_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /book_links/1
  # PUT /book_links/1.json
  def update
    @book_link = BookLink.find(params[:id])

    respond_to do |format|
      if @book_link.update_attributes(params[:book_link])
        format.html { redirect_to @book_link, notice: 'Book link was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @book_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /book_links/1
  # DELETE /book_links/1.json
  def destroy
    @book_link = BookLink.find(params[:id])
    @book_link.destroy

    respond_to do |format|
      format.html { redirect_to book_links_url }
      format.json { head :no_content }
    end
  end
end
