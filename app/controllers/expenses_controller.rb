class ExpensesController < ApplicationController
  before_action :set_expense, only: %i[ show edit update destroy ]
  load_and_authorize_resource

  # GET /expenses
  def index
    @expenses = ExpenseSerializer.many(Expense.includes(:category).accessible_by(current_ability))
    render inertia: "expenses/index", props: {
      expenses: @expenses
    }
  end

  # GET /expenses/1
  def show
  end

  # GET /expenses/new
  def new
    @expense = Expense.new
  end

  # GET /expenses/1/edit
  def edit
  end

  # POST /expenses
  def create
    @expense = Expense.new(expense_params)

    if @expense.save
      redirect_to @expense, notice: "Expense was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /expenses/1
  def update
    if @expense.update(expense_params)
      redirect_to @expense, notice: "Expense was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /expenses/1
  def destroy
    @expense.destroy
    redirect_to expenses_url, notice: "Expense was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expense
      @expense = Expense.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def expense_params
      params.require(:expense).permit(:name, :amount, :category_id)
    end
end
