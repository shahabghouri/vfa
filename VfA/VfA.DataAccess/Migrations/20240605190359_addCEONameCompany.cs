using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace VfA.DataAccess.Migrations
{
    /// <inheritdoc />
    public partial class addCEONameCompany : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "CEOName",
                table: "Companies",
                type: "nvarchar(max)",
                nullable: true);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "CEOName",
                table: "Companies");
        }
    }
}
