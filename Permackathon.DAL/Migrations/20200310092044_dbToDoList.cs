using Microsoft.EntityFrameworkCore.Migrations;

namespace Permackathon.DAL.Migrations
{
    public partial class dbToDoList : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Categories_ToDos_ToDoId",
                table: "Categories");

            migrationBuilder.DropForeignKey(
                name: "FK_Locations_Sites_SiteId",
                table: "Locations");

            migrationBuilder.DropForeignKey(
                name: "FK_Priorities_ToDos_ToDoId",
                table: "Priorities");

            migrationBuilder.DropForeignKey(
                name: "FK_States_ToDos_ToDoId",
                table: "States");

            migrationBuilder.DropIndex(
                name: "IX_States_ToDoId",
                table: "States");

            migrationBuilder.DropIndex(
                name: "IX_Priorities_ToDoId",
                table: "Priorities");

            migrationBuilder.DropIndex(
                name: "IX_Locations_SiteId",
                table: "Locations");

            migrationBuilder.DropIndex(
                name: "IX_Categories_ToDoId",
                table: "Categories");

            migrationBuilder.DropColumn(
                name: "ToDoId",
                table: "States");

            migrationBuilder.DropColumn(
                name: "ToDoId",
                table: "Priorities");

            migrationBuilder.DropColumn(
                name: "SiteId",
                table: "Locations");

            migrationBuilder.DropColumn(
                name: "ToDoId",
                table: "Categories");

            migrationBuilder.AddColumn<int>(
                name: "CategorieId",
                table: "ToDos",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "PrioritiyId",
                table: "ToDos",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "StateId",
                table: "ToDos",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "LocationId",
                table: "Sites",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_ToDos_CategorieId",
                table: "ToDos",
                column: "CategorieId");

            migrationBuilder.CreateIndex(
                name: "IX_ToDos_PrioritiyId",
                table: "ToDos",
                column: "PrioritiyId");

            migrationBuilder.CreateIndex(
                name: "IX_ToDos_StateId",
                table: "ToDos",
                column: "StateId");

            migrationBuilder.CreateIndex(
                name: "IX_Sites_LocationId",
                table: "Sites",
                column: "LocationId");

            migrationBuilder.AddForeignKey(
                name: "FK_Sites_Locations_LocationId",
                table: "Sites",
                column: "LocationId",
                principalTable: "Locations",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_ToDos_Categories_CategorieId",
                table: "ToDos",
                column: "CategorieId",
                principalTable: "Categories",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_ToDos_Priorities_PrioritiyId",
                table: "ToDos",
                column: "PrioritiyId",
                principalTable: "Priorities",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_ToDos_States_StateId",
                table: "ToDos",
                column: "StateId",
                principalTable: "States",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Sites_Locations_LocationId",
                table: "Sites");

            migrationBuilder.DropForeignKey(
                name: "FK_ToDos_Categories_CategorieId",
                table: "ToDos");

            migrationBuilder.DropForeignKey(
                name: "FK_ToDos_Priorities_PrioritiyId",
                table: "ToDos");

            migrationBuilder.DropForeignKey(
                name: "FK_ToDos_States_StateId",
                table: "ToDos");

            migrationBuilder.DropIndex(
                name: "IX_ToDos_CategorieId",
                table: "ToDos");

            migrationBuilder.DropIndex(
                name: "IX_ToDos_PrioritiyId",
                table: "ToDos");

            migrationBuilder.DropIndex(
                name: "IX_ToDos_StateId",
                table: "ToDos");

            migrationBuilder.DropIndex(
                name: "IX_Sites_LocationId",
                table: "Sites");

            migrationBuilder.DropColumn(
                name: "CategorieId",
                table: "ToDos");

            migrationBuilder.DropColumn(
                name: "PrioritiyId",
                table: "ToDos");

            migrationBuilder.DropColumn(
                name: "StateId",
                table: "ToDos");

            migrationBuilder.DropColumn(
                name: "LocationId",
                table: "Sites");

            migrationBuilder.AddColumn<int>(
                name: "ToDoId",
                table: "States",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "ToDoId",
                table: "Priorities",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "SiteId",
                table: "Locations",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "ToDoId",
                table: "Categories",
                type: "int",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_States_ToDoId",
                table: "States",
                column: "ToDoId");

            migrationBuilder.CreateIndex(
                name: "IX_Priorities_ToDoId",
                table: "Priorities",
                column: "ToDoId");

            migrationBuilder.CreateIndex(
                name: "IX_Locations_SiteId",
                table: "Locations",
                column: "SiteId");

            migrationBuilder.CreateIndex(
                name: "IX_Categories_ToDoId",
                table: "Categories",
                column: "ToDoId");

            migrationBuilder.AddForeignKey(
                name: "FK_Categories_ToDos_ToDoId",
                table: "Categories",
                column: "ToDoId",
                principalTable: "ToDos",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_Locations_Sites_SiteId",
                table: "Locations",
                column: "SiteId",
                principalTable: "Sites",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_Priorities_ToDos_ToDoId",
                table: "Priorities",
                column: "ToDoId",
                principalTable: "ToDos",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_States_ToDos_ToDoId",
                table: "States",
                column: "ToDoId",
                principalTable: "ToDos",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }
    }
}
