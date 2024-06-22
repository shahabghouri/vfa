using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace VfA.DataAccess.Migrations
{
    /// <inheritdoc />
    public partial class typos : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_AspNetUsers_SubsciptionPlans_SubscribedPlanId",
                table: "AspNetUsers");

            migrationBuilder.DropTable(
                name: "SubsciptionPlans");

            migrationBuilder.CreateTable(
                name: "SubscriptionPlans",
                columns: table => new
                {
                    Id = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Name = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Description = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    PlanType = table.Column<int>(type: "int", nullable: false),
                    MonthlyAmount = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    _3MonthAmount = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    _6MonthAmount = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    _12MonthAmount = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    NumberOfProducts = table.Column<int>(type: "int", nullable: false),
                    NumberOfServices = table.Column<int>(type: "int", nullable: false),
                    NumberOfRequests = table.Column<int>(type: "int", nullable: false),
                    NumberOfImagesForProducts = table.Column<int>(type: "int", nullable: false),
                    NumberOfImagesForServices = table.Column<int>(type: "int", nullable: false),
                    NumberOfImagesForRequests = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_SubscriptionPlans", x => x.Id);
                });

            migrationBuilder.AddForeignKey(
                name: "FK_AspNetUsers_SubscriptionPlans_SubscribedPlanId",
                table: "AspNetUsers",
                column: "SubscribedPlanId",
                principalTable: "SubscriptionPlans",
                principalColumn: "Id");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_AspNetUsers_SubscriptionPlans_SubscribedPlanId",
                table: "AspNetUsers");

            migrationBuilder.DropTable(
                name: "SubscriptionPlans");

            migrationBuilder.CreateTable(
                name: "SubsciptionPlans",
                columns: table => new
                {
                    Id = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Description = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    MonthlyAmount = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    Name = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    NumberOfImagesForProducts = table.Column<int>(type: "int", nullable: false),
                    NumberOfImagesForRequests = table.Column<int>(type: "int", nullable: false),
                    NumberOfImagesForServices = table.Column<int>(type: "int", nullable: false),
                    NumberOfProducts = table.Column<int>(type: "int", nullable: false),
                    NumberOfRequests = table.Column<int>(type: "int", nullable: false),
                    NumberOfServices = table.Column<int>(type: "int", nullable: false),
                    PlanType = table.Column<int>(type: "int", nullable: false),
                    _12MonthAmount = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    _3MonthAmount = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    _6MonthAmount = table.Column<decimal>(type: "decimal(18,2)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_SubsciptionPlans", x => x.Id);
                });

            migrationBuilder.AddForeignKey(
                name: "FK_AspNetUsers_SubsciptionPlans_SubscribedPlanId",
                table: "AspNetUsers",
                column: "SubscribedPlanId",
                principalTable: "SubsciptionPlans",
                principalColumn: "Id");
        }
    }
}
