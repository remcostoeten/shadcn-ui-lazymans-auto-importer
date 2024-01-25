-e const fs = require('fs');
const path = require('path');

const componentsFolder = './components/ui/';
const importsFile = 'ui-imports.tsx';

const componentFiles = fs.readdirSync(componentsFolder)
  .filter(file => file.endsWith('.tsx') && file !== importsFile);

if (componentFiles.length === 0) {
  console.error('Error: No component files found. Make sure the ui-imports.tsx file exists.');
  process.exit(1);
}

// Generate import statements for each component
const importStatements = componentFiles.map(file => {
  const componentName = path.basename(file, '.tsx');
  return `import { ${componentName} } from './${componentName}';`;
});

// Create the export statement
const exportStatement = `export {
  ${componentFiles.map(file => path.basename(file, '.tsx')).join(',
  ')}
};`;

// Combine import statements and export statement
const content = `${importStatements.join('
')}

${exportStatement}
`;

// Write the content to the ui-imports.tsx file
fs.writeFileSync(path.join(componentsFolder, importsFile), content);

console.log('Imports updated successfully.');
