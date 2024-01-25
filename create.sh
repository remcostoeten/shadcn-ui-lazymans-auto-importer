# Create the scripts directory and add the script files
mkdir scripts
echo -e "#!/bin/bash\n\n# Run the npx shadcn-ui@latest add command with the provided component name\nnpx shadcn-ui@latest add \$1\n\n# Run the script to update the ui-imports.tsx file\nnode update-imports.js" >scripts/add-component.sh
echo -e "const fs = require('fs');\nconst path = require('path');\n\nconst componentsFolder = './components/ui/';\nconst importsFile = 'ui-imports.tsx';\n\n// Get a list of all component files in the folder\nconst componentFiles = fs.readdirSync(componentsFolder)\n  .filter(file => file.endsWith('.tsx') && file !== importsFile);\n\nif (componentFiles.length === 0) {\n  console.error('Error: No component files found. Make sure the ui-imports.tsx file exists.');\n  process.exit(1);\n}\n\n// Generate import statements for each component\nconst importStatements = componentFiles.map(file => {\n  const componentName = path.basename(file, '.tsx');\n  return \`import { \${componentName} } from './\${componentName}';\`;\n});\n\n// Create the export statement\nconst exportStatement = \`export {\\n  \${componentFiles.map(file => path.basename(file, '.tsx')).join(',\\n  ')}\\n};\`;\n\n// Combine import statements and export statement\nconst content = \`\${importStatements.join('\\n')}\n\n\${exportStatement}\\n\`;\n\n// Write the content to the ui-imports.tsx file\nfs.writeFileSync(path.join(componentsFolder, importsFile), content);\n\nconsole.log('Imports updated successfully.');" >scripts/update-imports.js
chmod +x scripts/add-component.sh

# Create the components directory and add the ui-imports.tsx file
mkdir -p components/ui
echo -e "export {\n  // Add your component exports here\n};" >components/ui/ui-imports.tsx

# Create the docs directory and add the README.md file
mkdir docs
echo -e "# Component Import Script\n\nThis script automates the process of updating the import statements in your component import/export file (\`ui-imports.tsx\`) when adding new components to your React project.\n\n## Getting Started\n\n1. Clone this repository to your local machine:\n\n    \`\`\`bash\n    git clone https://github.com/your-username/your-repo.git\n    \`\`\`\n\n2. Navigate to the project directory:\n\n    \`\`\`bash\n    cd your-repo\n    \`\`\`\n\n3. Run the script to add a new component and update the import statements:\n\n    \`\`\`bash\n    ./scripts/add-component.sh NewComponent\n    \`\`\`\n\n    Replace \`NewComponent\` with the actual name of the component you want to add.\n\n4. Verify the result:\n\n    - Check the \`components/ui/ui-imports.tsx\` file to see if the new import statement for the added component is present.\n\n## Customization\n\n- If your component files are located in a different directory, modify the \`componentsFolder\` variable in \`scripts/update-imports.js\` accordingly.\n\n- If you need to customize the \`npx shadcn-ui@latest add\` command, edit the \`scripts/add-component.sh\` script.\n\n## Troubleshooting\n\n- If the script encounters issues, make sure the necessary directories and files exist. Follow the prompts to create them if needed.\n\n## License\n\nThis project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details." >docs/README.md

# Create the LICENSE file (you can replace this with your preferred license)
echo -e "MIT License\n\nCopyright (c) 2024 Your Name\n\nPermission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the \"Software\"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:\n\nThe above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.\n\nTHE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE." >LICENSE