using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace VfA.DataAccess.Migrations
{
    /// <inheritdoc />
    public partial class addingWilayas : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Companies_StateProvince_StateProvinceId",
                table: "Companies");

            migrationBuilder.DropPrimaryKey(
                name: "PK_StateProvince",
                table: "StateProvince");

            migrationBuilder.RenameTable(
                name: "StateProvince",
                newName: "StateProvinces");

            migrationBuilder.AddColumn<int>(
                name: "StateProvinceId",
                table: "AspNetUsers",
                type: "int",
                nullable: true);

            migrationBuilder.AddPrimaryKey(
                name: "PK_StateProvinces",
                table: "StateProvinces",
                column: "Id");

            migrationBuilder.CreateTable(
                name: "Wilayas",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Name = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Wilayas", x => x.Id);
                });

            migrationBuilder.AddForeignKey(
                name: "FK_Companies_StateProvinces_StateProvinceId",
                table: "Companies",
                column: "StateProvinceId",
                principalTable: "StateProvinces",
                principalColumn: "Id");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Companies_StateProvinces_StateProvinceId",
                table: "Companies");

            migrationBuilder.DropTable(
                name: "Wilayas");

            migrationBuilder.DropPrimaryKey(
                name: "PK_StateProvinces",
                table: "StateProvinces");

            migrationBuilder.DropColumn(
                name: "StateProvinceId",
                table: "AspNetUsers");

            migrationBuilder.RenameTable(
                name: "StateProvinces",
                newName: "StateProvince");

            migrationBuilder.AddPrimaryKey(
                name: "PK_StateProvince",
                table: "StateProvince",
                column: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_Companies_StateProvince_StateProvinceId",
                table: "Companies",
                column: "StateProvinceId",
                principalTable: "StateProvince",
                principalColumn: "Id");
        }
    }
}
