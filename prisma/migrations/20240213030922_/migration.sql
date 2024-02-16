/*
  Warnings:

  - You are about to drop the column `type` on the `users` table. All the data in the column will be lost.

*/
-- DropIndex
DROP INDEX `users_type_key` ON `users`;

-- AlterTable
ALTER TABLE `users` DROP COLUMN `type`;
