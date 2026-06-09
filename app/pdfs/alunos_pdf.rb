class AlunosPdf < Prawn::Document
  def initialize(alunos)
    
    super(page_size: "A4", page_layout: :portrait, margin: 40)
    @alunos = alunos
    
    logotipo_e_titulo
    linha_divisoria
    tabela_de_alunos
  end

  def logotipo_e_titulo
    
    text "Academia Fit", size: 28, style: :bold, color: "333333"
    text "Relatório Geral de Alunos Cadastrados", size: 14, style: :italic, color: "666666"
    move_down 10
  end

  def linha_divisoria
    stroke_color "CCCCCC"
    stroke_horizontal_line 0, bounds.width
    move_down 20
  end

  def tabela_de_alunos
    
    dados_da_tabela = [["ID", "Nome do Aluno", "CPF", "Telefone"]]
    
    @alunos.each do |aluno|
      dados_da_tabela << [aluno.id, aluno.nome, aluno.cpf, aluno.telefone]
    end

  
    table(dados_da_tabela, header: true, width: bounds.width) do
      
      row(0).font_style = :bold
      row(0).background_color = "212529" 
      row(0).text_color = "FFFFFF"       
      
      
      self.row_colors = ["FFFFFF", "F8F9FA"]
      
      
      self.cell_style = { padding: 8, border_width: 0.5, border_color: "E0E0E0" }
    end
  end
end