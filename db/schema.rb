# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2026_06_17_011524) do
  create_table "alunos", force: :cascade do |t|
    t.string "cpf"
    t.datetime "created_at", null: false
    t.string "nome"
    t.string "telefone"
    t.datetime "updated_at", null: false
  end

  create_table "atividade_fisicas", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "descricao"
    t.string "nome"
    t.datetime "updated_at", null: false
    t.decimal "valor_mensalidade"
  end

  create_table "matriculas", force: :cascade do |t|
    t.integer "aluno_id", null: false
    t.integer "atividade_fisica_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aluno_id"], name: "index_matriculas_on_aluno_id"
    t.index ["atividade_fisica_id"], name: "index_matriculas_on_atividade_fisica_id"
  end

  create_table "pagamentos", force: :cascade do |t|
    t.integer "aluno_id", null: false
    t.integer "atividade_fisica_id", null: false
    t.datetime "created_at", null: false
    t.date "data_pagamento"
    t.datetime "updated_at", null: false
    t.decimal "valor_pago"
    t.index ["aluno_id"], name: "index_pagamentos_on_aluno_id"
    t.index ["atividade_fisica_id"], name: "index_pagamentos_on_atividade_fisica_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.string "reset_password_token"
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "matriculas", "alunos"
  add_foreign_key "matriculas", "atividade_fisicas"
  add_foreign_key "pagamentos", "alunos"
  add_foreign_key "pagamentos", "atividade_fisicas"
end
