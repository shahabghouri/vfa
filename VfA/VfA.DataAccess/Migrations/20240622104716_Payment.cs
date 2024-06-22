using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace VfA.DataAccess.Migrations
{
    /// <inheritdoc />
    public partial class Payment : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<long>(
                name: "SubscribedPlanId",
                table: "AspNetUsers",
                type: "bigint",
                nullable: true);

            migrationBuilder.CreateTable(
                name: "PaymentHistory",
                columns: table => new
                {
                    Id = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Description = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    PaymentIdentifier = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    PaidAmount = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    PaymentDate = table.Column<DateTime>(type: "datetime2", nullable: false),
                    SubscriptionPlanId = table.Column<long>(type: "bigint", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PaymentHistory", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "SubsciptionPlans",
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
                    table.PrimaryKey("PK_SubsciptionPlans", x => x.Id);
                });

            migrationBuilder.CreateIndex(
                name: "IX_AspNetUsers_SubscribedPlanId",
                table: "AspNetUsers",
                column: "SubscribedPlanId");

            migrationBuilder.AddForeignKey(
                name: "FK_AspNetUsers_SubsciptionPlans_SubscribedPlanId",
                table: "AspNetUsers",
                column: "SubscribedPlanId",
                principalTable: "SubsciptionPlans",
                principalColumn: "Id");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_AspNetUsers_SubsciptionPlans_SubscribedPlanId",
                table: "AspNetUsers");

            migrationBuilder.DropTable(
                name: "PaymentHistory");

            migrationBuilder.DropTable(
                name: "SubsciptionPlans");

            migrationBuilder.DropIndex(
                name: "IX_AspNetUsers_SubscribedPlanId",
                table: "AspNetUsers");

            migrationBuilder.DropColumn(
                name: "SubscribedPlanId",
                table: "AspNetUsers");
        }
    }
}
