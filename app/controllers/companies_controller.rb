class CompaniesController < ApplicationController
  before_action :set_company, only: %i[ show update destroy ]
  before_action :authenticate_user!, except: [:index, :show]
  # GET /companies
  def index
    @companies = Company.all.paginate(page: params[:page], per_page: 15)

    meta = {
    total_pages_available: @companies.total_pages,
    current_page: @companies.current_page,
    total_number_of_companies: @companies.total_entries
    }
    render json: {COMPANIES:@companies, METADATA:meta}
  end

    def to_param
    ticker
    end

  # GET /companies/1
  def show
    render json: @company
  end

  # POST /companies
  def create
    @company = Company.new(company_params)

    if @company.save
      render json: @company, status: :created, location: @company
    else
      render json: @company.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /companies/1
  def update
    if @company.update(company_params)
     render json: @company
    else
      render json: @company.errors, status: :unprocessable_entity
    end
  end

  # DELETE /companies/1
  def destroy
    @company.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find_by(ticker: params[:ticker])
    end

    # Only allow a list of trusted parameters through.
    def company_params
      params.require(:company).permit(:ticker, :name, :price, :market_cap, :IPO_year, :sector)
    end
end
