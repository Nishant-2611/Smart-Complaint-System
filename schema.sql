-- Database initialization for Smart Complaint Management System

CREATE DATABASE IF NOT EXISTS smart_complaints;
USE smart_complaints;

-- Users table (students and admins)
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role ENUM('student', 'admin') DEFAULT 'student',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Complaints table
CREATE TABLE IF NOT EXISTS complaints (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    category ENUM('Hostel', 'Academic', 'College', 'Other') NOT NULL,
    priority ENUM('Low', 'Medium', 'High') DEFAULT 'Medium',
    status ENUM('Pending', 'In Progress', 'Resolved') DEFAULT 'Pending',
    user_id INT NOT NULL,
    image VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Comments table (admin remarks)
CREATE TABLE IF NOT EXISTS comments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    complaint_id INT NOT NULL,
    admin_remark TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (complaint_id) REFERENCES complaints(id) ON DELETE CASCADE
);

-- Insert a default admin for testing (password is 'admin123')
-- Note: In production, do not store plain text or predictable passwords.
-- $2a$10$C82H4/G0yWfN6oYy4B6WzeF5X8J3F9sO6M0U.2T1l.1D7Yj/n4w1y is 'admin123' bcrypt hashed.
INSERT IGNORE INTO users (id, name, email, password, role) 
VALUES (1, 'Admin', 'admin@example.com', '$2a$10$C82H4/G0yWfN6oYy4B6WzeF5X8J3F9sO6M0U.2T1l.1D7Yj/n4w1y', 'admin');
