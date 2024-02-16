// prisma/seed.js (หรือชื่อไฟล์ที่คุณต้องการ)
import bcrypt from 'bcryptjs';
import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

const run = async () => {
  try {
    // ลบข้อมูลที่มีอยู่ในฐานข้อมูล
    await prisma.history.deleteMany();
    await prisma.datetimenotification.deleteMany();
    await prisma.user.deleteMany();

    // เข้ารหัสรหัสผ่าน
    const hashedPassword = bcrypt.hashSync('1234', 8);

    // ข้อมูลผู้ใช้
    const userData = [
      { username: 'andy', password: hashedPassword, email: 'andy@ggg.mail', birthdate: new Date(), profileImage: 'andy.jpg' },
      { username: 'bobby', password: hashedPassword, email: 'bobby@ggg.mail', birthdate: new Date(), profileImage: 'bobby.jpg' },
      { username: 'candy', password: hashedPassword, email: 'candy@ggg.mail', birthdate: new Date(), profileImage: 'candy.jpg' },
    ];

    // ข้อมูลการแจ้งเตือน
    const datetimeNotificationData = [
      { userID: 1, NotificationMessage: 'Meeting at 3 PM', datetime: new Date() },
      { userID: 2, NotificationMessage: 'Reminder: Pay bills', datetime: new Date() },
      { userID: 3, NotificationMessage: 'Event tomorrow', datetime: new Date() },
    ];

    // ข้อมูลประวัติ
    const historyData = [
      { timestamp: new Date(), action: 'login', description: 'User logged in', datetimeNotificationID: 1, userID: 1 },
      { timestamp: new Date(), action: 'signup', description: 'User signed up', datetimeNotificationID: 2, userID: 2 },
      { timestamp: new Date(), action: 'logout', description: 'User logged out', datetimeNotificationID: 3, userID: 3 },
    ];

    // เพิ่มข้อมูลลงในฐานข้อมูล
    await prisma.user.createMany({
      data: userData,
    });

    await prisma.datetimenotification.createMany({
      data: datetimeNotificationData,
    });

    await prisma.history.createMany({
      data: historyData,
    });

    console.log('Data seeding successful.');
  } catch (error) {
    console.error('Error seeding data:', error);
  } finally {
    // ปิดการเชื่อมต่อ
    await prisma.$disconnect();
  }
};

// เรียกใช้งานฟังก์ชัน run
run();


