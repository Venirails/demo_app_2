class BooksController < ApplicationController 
  before_action :admin_logged_in_or_not
  #around_action :display_message
  #after_action :write_to_log, only: [:destroy]
  before_action :set_book, only: [:show, :edit, :update, :destroy]
@@name = "ruby"
  # GET /books
  # GET /books.json
  def index
    @books = Book.all
    @employee = Employee.find(1)

  end
  def display_message
	  puts "==============="
	  puts "I am around filter"
	  redirect_to :controller=>"admin",:action=>"login"
  end
  def write_to_log
	  logger.error "A record has been deleted.............................................."
  end


  # GET /books/1
  # GET /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
	format.xml { }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def admin_logged_in_or_not
	  if session[:admin].nil?
		  flash[:notice] = "You need to login as an admin to see this page"
		  redirect_to :controller=>"admin",:action=>"login"
	 end
	  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:name, :author, :price)
    end
end
