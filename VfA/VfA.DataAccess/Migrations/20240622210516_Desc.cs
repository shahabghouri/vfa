﻿using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace VfA.DataAccess.Migrations
{
    /// <inheritdoc />
    public partial class Desc : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "Description",
                table: "PaymentOrders",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Description",
                table: "PaymentOrders");
        }
    }
}
