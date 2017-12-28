class SamplesController < ApplicationController
  before_action :set_sample, only: [:show, :edit, :update, :destroy] 
  # before_action :format_tags, only: [:create, :update]
  before_action :require_user

  # GET /samples
  # GET /samples.json
  def index
    @samples = Sample.where(account_id: current_user.account_id) 
    @account_tags = Sample.account_tags(current_user.account_id)
  end

  # GET /samples/1
  # GET /samples/1.json
  def show
  end

  # GET /samples/new
  def new
    @sample = Sample.new
    @user = current_user
  end

  # GET /samples/1/edit
  def edit
  end

  # POST /samples
  # POST /samples.json
  def create
    @sample = Sample.new(sample_params)

    respond_to do |format|
      if @sample.save
        format.html { redirect_to @sample, notice: 'Sample was successfully created.' }
        format.json { render :show, status: :created, location: @sample }
      else
        format.html { render :new }
        format.json { render json: @sample.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /samples/1
  # PATCH/PUT /samples/1.json
  def update
    respond_to do |format|
      if @sample.update(sample_params)
        format.html { redirect_to @sample, notice: 'Sample was successfully updated.' }
        format.json { render :show, status: :ok, location: @sample }
      else
        format.html { render :edit }
        format.json { render json: @sample.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /samples/1
  # DELETE /samples/1.json
  def destroy
    @sample.destroy
    respond_to do |format|
      format.html { redirect_to samples_url, notice: 'Sample was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sample
      @sample = Sample.find(params[:id])
    end

    # def format_tags 
    #   sample_params[:tags].split(', ')
    # end

    # def set_user
    #   @user = current_user
    # end
    
    def require_user
      redirect_to root_url unless current_user
      @user = current_user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sample_params
      params.require(:sample).permit(:title, :body, :url, :account_id, :tags => [])
    end
end
