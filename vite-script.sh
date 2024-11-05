#!/bin/bash

# Step 1: Get project name from user input
read -p "Enter your project name: " project_name

# Step 2: Create a Vite React project with JavaScript using the provided project name
echo "Creating a Vite React project named $project_name..."
npm create vite@latest $project_name -- --template react
cd $project_name

# Step 3: Install dependencies
echo "Installing dependencies..."
npm install

# Step 4: Install Tailwind CSS
echo "Installing Tailwind CSS..."
npm install -D tailwindcss postcss autoprefixer

# Step 5: Initialize Tailwind CSS configuration
echo "Initializing Tailwind CSS configuration..."
npx tailwindcss init -p

# Step 6: Configure Tailwind CSS
echo "Configuring Tailwind CSS..."
# Add Tailwind CSS paths to tailwind.config.js
cat > tailwind.config.js <<EOL
/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./index.html", "./src/**/*.{js,jsx}"],
  theme: {
    extend: {},
  },
  plugins: [],
};
EOL

# Step 7: Add Tailwind CSS to your CSS file
echo "Adding Tailwind CSS to your CSS file..."
cat > ./src/index.css <<EOL
@tailwind base;
@tailwind components;
@tailwind utilities;
EOL

# Step 8: Run the server
npm run dev
