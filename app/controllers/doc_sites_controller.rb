class DocSitesController < ApplicationController
  before_action :set_doc_site, only: [:show, :edit, :update, :destroy]

  # GET /doc_sites
  # GET /doc_sites.json
  def index
    @doc_sites = DocSite.all
  end

  # GET /doc_sites/1
  # GET /doc_sites/1.json
  def show
  end

  # GET /doc_sites/new
  def new
    @doc_site = DocSite.new
    @docs = Doc.all
    @tracked_sites = TrackedSite.all
    @doc = Doc.find(params[:doc_id]) unless params[:doc_id].nil?
  end

  # GET /doc_sites/1/edit
  def edit
    @doc_site = DocSite.find(params[:id])
    @docs = Doc.all
    @tracked_sites = TrackedSite.all
  end

  # POST /doc_sites
  # POST /doc_sites.json
  def create
    @doc_site = DocSite.new(doc_site_params)
    @doc = @doc_site.doc
    respond_to do |format|
      if @doc_site.save
        format.html { redirect_to @doc, notice: 'Doc/Site was successfully created.' }
        format.json { render :show, status: :created, location: @doc_site }
      else
        format.html { render :new }
        format.json { render json: @doc_site.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /doc_sites/1
  # PATCH/PUT /doc_sites/1.json
  def update
    respond_to do |format|
      if @doc_site.update(doc_site_params)
        format.html { redirect_to @doc_site, notice: 'Doc site was successfully updated.' }
        format.json { render :show, status: :ok, location: @doc_site }
      else
        format.html { render :edit }
        format.json { render json: @doc_site.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /doc_sites/1
  # DELETE /doc_sites/1.json
  def destroy
    @doc_site.destroy
    respond_to do |format|
      format.html { redirect_to doc_sites_url, notice: 'Doc site was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_doc_site
      @doc_site = DocSite.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def doc_site_params
      params.require(:doc_site).permit(:doc_id, :tracked_site_id, :url)
    end
end
