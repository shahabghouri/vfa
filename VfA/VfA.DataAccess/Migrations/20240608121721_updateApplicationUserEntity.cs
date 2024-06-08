using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace VfA.DataAccess.Migrations
{
    /// <inheritdoc />
    public partial class updateApplicationUserEntity : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<bool>(
                name: "IsExporter",
                table: "AspNetUsers",
                type: "bit",
                nullable: true);

            migrationBuilder.AddColumn<bool>(
                name: "IsImporter",
                table: "AspNetUsers",
                type: "bit",
                nullable: true);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "IsExporter",
                table: "AspNetUsers");

            migrationBuilder.DropColumn(
                name: "IsImporter",
                table: "AspNetUsers");
        }
    }
}
