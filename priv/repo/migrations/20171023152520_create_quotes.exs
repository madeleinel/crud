defmodule Crud.Repo.Migrations.CreateQuotes do
  use Ecto.Migration

  def up do
    create table("quotes") do
      add :quote, :string, size: 140
      add :author, :string, size: 40

      timestamps()
    end
  end

  def down do
    drop table("quotes")
  end
end
