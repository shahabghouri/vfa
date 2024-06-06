using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace VfA.DataAccess.Migrations
{
    /// <inheritdoc />
    public partial class updatePropertyInStateProvince : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<long>(
                name: "CountryId",
                table: "StateProvince",
                type: "bigint",
                nullable: false,
                defaultValue: 0L);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "CountryId",
                table: "StateProvince");
        }
    }
}
