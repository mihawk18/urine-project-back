/*
  Warnings:

  - Added the required column `historyID` to the `datetimenotification` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `datetimenotification` ADD COLUMN `historyID` INTEGER NOT NULL;
