class BooksController < ApplicationController
  before_action :set_book, only: %i[ show edit update destroy ]
  before_action :admin_logged_in?
  after_action :update_log, only: :destroy
  
  def admin_logged_in?
    if session[:admin].nil?
      flash[:notice] = "You should login as an admin to continue..."
      redirect_to :controller=>"admin",:action=>"login"
    end
  end

  def update_log 
    logger.info "======================Book is deleted======================"
  end

  # GET /books or /books.json
  def index
    @books = Book.paginate(:page => params[:page])
    
    respond_to do |format|
      format.html
      format.json { render json: @books }
      format.xml { render xml: @books.as_json }
    end

  end

  # GET /books/1 or /books/1.json
  def show                                    # We are getting @book from 'set_book' method
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit                                    # We are getting @book from 'set_book' method
  end   

  # POST /books or /books.json
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        logger.info "##  " + @book.to_s + "  ##"
        format.html { redirect_to @book, notice: "Book was successfully created." }
        format.json { render :show, status: :created, location: @book }
        format.xml { redirect_to @book, notice: "Book was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
        format.xml { redirect_to @book, notice: "Book was successfully created." }
      end
    end
  end

  # PATCH/PUT /books/1 or /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: "Book was successfully updated." }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1 or /books/1.json
  def destroy
    @book.destroy                             # We are getting @book from 'set_book' method 
    respond_to do |format|
      format.html { redirect_to books_url, notice: "Book was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:fullname, :author, :price, :publisher)
    end
end
