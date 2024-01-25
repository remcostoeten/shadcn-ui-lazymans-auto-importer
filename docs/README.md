-e # Component Import Script

This script automates the process of updating the import statements in your component import/export file (`ui-imports.tsx`) when adding new components to your React project.

## Getting Started

1. Clone this repository to your local machine:

    ```bash
    git clone https://github.com/your-username/your-repo.git
    ```

2. Navigate to the project directory:

    ```bash
    cd your-repo
    ```

3. Run the script to add a new component and update the import statements:

    ```bash
    ./scripts/add-component.sh NewComponent
    ```

    Replace `NewComponent` with the actual name of the component you want to add.

4. Verify the result:

    - Check the `components/ui/ui-imports.tsx` file to see if the new import statement for the added component is present.

## Customization

- If your component files are located in a different directory, modify the `componentsFolder` variable in `scripts/update-imports.js` accordingly.

- If you need to customize the `npx shadcn-ui@latest add` command, edit the `scripts/add-component.sh` script.

## Troubleshooting

- If the script encounters issues, make sure the necessary directories and files exist. Follow the prompts to create them if needed.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
