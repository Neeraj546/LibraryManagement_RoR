class BooksController < ApplicationController
  before_action :set_book, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :admin_create, only: [:create, :edit, :update, :destroy]

  # GET /books or /books.json
  def index
    @books = Book.all
    @users = User.all
    @libs = Lib.all
  end

  # GET /books/1 or /books/1.json
  def show
    @users = User.all
  end

  # GET /books/new
  def new
    @book = Book.new
    @users = User.all
    @libs = Lib.all
  end

  # GET /books/1/edit
  def edit
    @users = User.all
    @libs = Lib.all
  end

  def updateLib
    @books = Book.all
    @users = User.all
    @libs = Lib.all
    bookid = params[:book]
    libid = params[:lib]
  end

  # POST /books or /books.json
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to libs_path, notice: "Book was successfully created." }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1 or /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to libs_path, notice: "Book was successfully updated." }
        UserMailer.notify_user(@book.author_id).deliver
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1 or /books/1.json
  def destroy
    @book.destroy

    respond_to do |format|
      format.html { redirect_to libs_path, notice: "Book was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def admin_create
    if !current_user.admin?
      @lib = nil
    else
      @lib = true
    end
    redirect_to libs_path, notice: "Not Athorized to Create or edit Books, login using admin id and try again." if @lib.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:title, :published_at, :language, :lib_id, :author_id)
    end
end
