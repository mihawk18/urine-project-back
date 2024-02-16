/*
  Warnings:

  - You are about to drop the column `user_id` on the `history` table. All the data in the column will be lost.
  - You are about to drop the `datetime_notifications` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `users` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `userID` to the `History` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `datetime_notifications` DROP FOREIGN KEY `datetime_notifications_user_id_fkey`;

-- DropForeignKey
ALTER TABLE `history` DROP FOREIGN KEY `history_datetimeNotificationID_fkey`;

-- DropForeignKey
ALTER TABLE `history` DROP FOREIGN KEY `history_user_id_fkey`;

-- AlterTable
ALTER TABLE `history` DROP COLUMN `user_id`,
    ADD COLUMN `userID` INTEGER NOT NULL;

-- DropTable
DROP TABLE `datetime_notifications`;

-- DropTable
DROP TABLE `users`;

-- CreateTable
CREATE TABLE `User` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `username` VARCHAR(191) NOT NULL,
    `password` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NULL,
    `birthdate` DATETIME(3) NOT NULL,
    `profileImage` VARCHAR(191) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `DateTimeNotification` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `userID` INTEGER NOT NULL,
    `NotificationMessage` VARCHAR(100) NOT NULL,
    `datetime` DATE NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `History` ADD CONSTRAINT `History_userID_fkey` FOREIGN KEY (`userID`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `History` ADD CONSTRAINT `History_datetimeNotificationID_fkey` FOREIGN KEY (`datetimeNotificationID`) REFERENCES `DateTimeNotification`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `DateTimeNotification` ADD CONSTRAINT `DateTimeNotification_userID_fkey` FOREIGN KEY (`userID`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
