require "test_helper"

class AtividadeFisicasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @atividade_fisica = atividade_fisicas(:one)
  end

  test "should get index" do
    get atividade_fisicas_url
    assert_response :success
  end

  test "should get new" do
    get new_atividade_fisica_url
    assert_response :success
  end

  test "should create atividade_fisica" do
    assert_difference("AtividadeFisica.count") do
      post atividade_fisicas_url, params: { atividade_fisica: { descricao: @atividade_fisica.descricao, nome: @atividade_fisica.nome, valor_mensalidade: @atividade_fisica.valor_mensalidade } }
    end

    assert_redirected_to atividade_fisica_url(AtividadeFisica.last)
  end

  test "should show atividade_fisica" do
    get atividade_fisica_url(@atividade_fisica)
    assert_response :success
  end

  test "should get edit" do
    get edit_atividade_fisica_url(@atividade_fisica)
    assert_response :success
  end

  test "should update atividade_fisica" do
    patch atividade_fisica_url(@atividade_fisica), params: { atividade_fisica: { descricao: @atividade_fisica.descricao, nome: @atividade_fisica.nome, valor_mensalidade: @atividade_fisica.valor_mensalidade } }
    assert_redirected_to atividade_fisica_url(@atividade_fisica)
  end

  test "should destroy atividade_fisica" do
    assert_difference("AtividadeFisica.count", -1) do
      delete atividade_fisica_url(@atividade_fisica)
    end

    assert_redirected_to atividade_fisicas_url
  end
end
