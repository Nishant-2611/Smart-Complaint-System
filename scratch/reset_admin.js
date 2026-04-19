const mysql = require('mysql2/promise');
const bcrypt = require('bcryptjs');
require('dotenv').config({ path: '../backend/.env' });

async function resetAdmin() {
  const connection = await mysql.createConnection({
    host: process.env.DB_HOST || 'localhost',
    user: process.env.DB_USER || 'root',
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME || 'smart_complaint'
  });

  try {
    const hashedPassword = await bcrypt.hash('admin123', 10);
    const [result] = await connection.execute(
      'UPDATE users SET password = ? WHERE email = ?',
      [hashedPassword, 'admin@example.com']
    );

    if (result.affectedRows > 0) {
      console.log('Admin password reset successfully to: admin123');
    } else {
      console.log('Admin user not found. Creating one...');
      await connection.execute(
        'INSERT INTO users (name, email, password, role) VALUES (?, ?, ?, ?)',
        ['Admin', 'admin@example.com', hashedPassword, 'admin']
      );
      console.log('Admin user created successfully with password: admin123');
    }
  } catch (error) {
    console.error('Error resetting admin:', error.message);
  } finally {
    await connection.end();
  }
}

resetAdmin();
