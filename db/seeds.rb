puts "Cadastrando Atividades Físicas padrão..."

AtividadeFisica.find_or_create_by!(nome: "Musculação", valor_mensalidade: 100.00)
AtividadeFisica.find_or_create_by!(nome: "Pilates", valor_mensalidade: 150.00)
AtividadeFisica.find_or_create_by!(nome: "Zumba", valor_mensalidade: 120.00)

puts "Atividades cadastradas com sucesso!"