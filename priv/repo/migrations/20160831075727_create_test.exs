defmodule TestApi.Repo.Migrations.CreateTest do
  use Ecto.Migration

  def change do
    create table(:tests) do
      add :title, :string
      add :content, :string

      timestamps
    end

  end
end
