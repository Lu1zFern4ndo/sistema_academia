class PagamentosController < ApplicationController
  before_action :set_pagamento, only: %i[ show edit update destroy ]

  # GET /pagamentos or /pagamentos.json
  def index
    @pagamentos = Pagamento.all
  end

  # GET /pagamentos/1 or /pagamentos/1.json
  def show
  end

  # GET /pagamentos/new
  def new
    @pagamento = Pagamento.new
  end

  # GET /pagamentos/1/edit
  def edit
  end

  # POST /pagamentos or /pagamentos.json
  def create
    @pagamento = Pagamento.new(pagamento_params)

    respond_to do |format|
      if @pagamento.save
        format.html { redirect_to @pagamento, notice: "Pagamento was successfully created." }
        format.json { render :show, status: :created, location: @pagamento }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @pagamento.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /pagamentos/1 or /pagamentos/1.json
  def update
    respond_to do |format|
      if @pagamento.update(pagamento_params)
        format.html { redirect_to @pagamento, notice: "Pagamento was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @pagamento }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @pagamento.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /pagamentos/1 or /pagamentos/1.json
  def destroy
    @pagamento.destroy!

    respond_to do |format|
      format.html { redirect_to pagamentos_path, notice: "Pagamento was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pagamento
      @pagamento = Pagamento.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def pagamento_params
      params.expect(pagamento: [ :data_pagamento, :valor_pago, :aluno_id, :atividade_fisica_id ])
    end
end
