defmodule Thieth.Repo.Migrations.CreateSymptomsTable do
  use Ecto.Migration

  def change do
    create table(:symptoms) do
      add :symptom, :string
      add :medical_condition, :string
    end
  end
end
