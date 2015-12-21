class TrackedSitesController < ApplicationController
  before_action :set_tracked_site, only: [:show, :edit, :update, :destroy]

  # GET /tracked_sites
  # GET /tracked_sites.json
  def index
    @tracked_sites = TrackedSite.all
  end

  # GET /tracked_sites/1
  # GET /tracked_sites/1.json
  def show
  end

  # GET /tracked_sites/new
  def new
    @tracked_site = TrackedSite.new
  end

  # GET /tracked_sites/1/edit
  def edit
  end

  # POST /tracked_sites
  # POST /tracked_sites.json
  def create
    @tracked_site = TrackedSite.new(tracked_site_params)

    respond_to do |format|
      if @tracked_site.save
        format.html { redirect_to @tracked_site, notice: 'Tracked site was successfully created.' }
        format.json { render :show, status: :created, location: @tracked_site }
      else
        format.html { render :new }
        format.json { render json: @tracked_site.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tracked_sites/1
  # PATCH/PUT /tracked_sites/1.json
  def update
    respond_to do |format|
      if @tracked_site.update(tracked_site_params)
        format.html { redirect_to @tracked_site, notice: 'Tracked site was successfully updated.' }
        format.json { render :show, status: :ok, location: @tracked_site }
      else
        format.html { render :edit }
        format.json { render json: @tracked_site.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tracked_sites/1
  # DELETE /tracked_sites/1.json
  def destroy
    @tracked_site.destroy
    respond_to do |format|
      format.html { redirect_to tracked_sites_url, notice: 'Tracked site was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tracked_site
      @tracked_site = TrackedSite.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tracked_site_params
      params.require(:tracked_site).permit(:name, :url)
    end
end
