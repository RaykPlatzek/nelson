class ValuationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_valuation, only: [:show, :edit, :update, :destroy]

  # GET /valuations
  # GET /valuations.json
  def index
    @trading_accounts = current_user.trading_accounts
    if params[:search].present? && params[:search][:date_range].present?
      date_range = params[:search][:date_range].split(' - ')
      @from_date = Date.parse(date_range[0])
      @to_date = Date.parse(date_range[1])
    else
      @from_date = DateTime.now - 30.days
      @to_date = DateTime.now
    end
    @chart_data_pairs = ValuationChartData.new(@trading_accounts.first.pair, @from_date, @to_date)
  end

  # GET /valuations/1
  # GET /valuations/1.json
  def show
  end

  # GET /valuations/new
  def new
    @valuation = Valuation.new
  end

  # GET /valuations/1/edit
  def edit
  end

  # POST /valuations
  # POST /valuations.json
  def create
    @valuation = Valuation.new(valuation_params)

    respond_to do |format|
      if @valuation.save
        format.html { redirect_to @valuation, notice: 'Valuation was successfully created.' }
        format.json { render :show, status: :created, location: @valuation }
      else
        format.html { render :new }
        format.json { render json: @valuation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /valuations/1
  # PATCH/PUT /valuations/1.json
  def update
    respond_to do |format|
      if @valuation.update(valuation_params)
        format.html { redirect_to @valuation, notice: 'Valuation was successfully updated.' }
        format.json { render :show, status: :ok, location: @valuation }
      else
        format.html { render :edit }
        format.json { render json: @valuation.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_all
    UpdatePairValuationsJob.perform_now
    flash[:info] = "All updated :-)"
    redirect_back(fallback_location: root_path)
  end

  # DELETE /valuations/1
  # DELETE /valuations/1.json
  def destroy
    @valuation.destroy
    respond_to do |format|
      format.html { redirect_to valuations_url, notice: 'Valuation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_valuation
      @valuation = Valuation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def valuation_params
      params.fetch(:valuation, {})
    end
end
