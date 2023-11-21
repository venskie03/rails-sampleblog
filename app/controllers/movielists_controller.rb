class MovielistsController < ApplicationController
  before_action :set_movielist, only: %i[ show edit update destroy ]

  # GET /movielists or /movielists.json
  def index
    @movielists = Movielist.all
  end

  # GET /movielists/1 or /movielists/1.json
  def show
  end

  # GET /movielists/new
  def new
    @movielist = Movielist.new
  end

  # GET /movielists/1/edit
  def edit
  end

  # POST /movielists or /movielists.json
  def create
    @movielist = Movielist.new(movielist_params)

    respond_to do |format|
      if @movielist.save
        format.html { redirect_to movielist_url(@movielist), notice: "Movielist was successfully created." }
        format.json { render :show, status: :created, location: @movielist }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @movielist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movielists/1 or /movielists/1.json
  def update
    respond_to do |format|
      if @movielist.update(movielist_params)
        format.html { redirect_to movielist_url(@movielist), notice: "Movielist was successfully updated." }
        format.json { render :show, status: :ok, location: @movielist }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @movielist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movielists/1 or /movielists/1.json
  def destroy
    @movielist.destroy!

    respond_to do |format|
      format.html { redirect_to movielists_url, notice: "Movielist was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movielist
      @movielist = Movielist.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def movielist_params
      params.require(:movielist).permit(:title, :description)
    end
end
