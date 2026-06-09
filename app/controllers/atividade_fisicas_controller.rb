class AtividadeFisicasController < ApplicationController
  before_action :set_atividade_fisica, only: %i[ show edit update destroy ]

  # GET /atividade_fisicas or /atividade_fisicas.json
  def index
    @atividade_fisicas = AtividadeFisica.all
  end

  # GET /atividade_fisicas/1 or /atividade_fisicas/1.json
  def show
  end

  # GET /atividade_fisicas/new
  def new
    @atividade_fisica = AtividadeFisica.new
  end

  # GET /atividade_fisicas/1/edit
  def edit
  end

  # POST /atividade_fisicas or /atividade_fisicas.json
  def create
    @atividade_fisica = AtividadeFisica.new(atividade_fisica_params)

    respond_to do |format|
      if @atividade_fisica.save
        format.html { redirect_to @atividade_fisica, notice: "Atividade fisica was successfully created." }
        format.json { render :show, status: :created, location: @atividade_fisica }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @atividade_fisica.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /atividade_fisicas/1 or /atividade_fisicas/1.json
  def update
    respond_to do |format|
      if @atividade_fisica.update(atividade_fisica_params)
        format.html { redirect_to @atividade_fisica, notice: "Atividade fisica was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @atividade_fisica }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @atividade_fisica.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /atividade_fisicas/1 or /atividade_fisicas/1.json
  def destroy
    @atividade_fisica.destroy!

    respond_to do |format|
      format.html { redirect_to atividade_fisicas_path, notice: "Atividade fisica was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_atividade_fisica
      @atividade_fisica = AtividadeFisica.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def atividade_fisica_params
      params.expect(atividade_fisica: [ :nome, :descricao, :valor_mensalidade ])
    end
end
