export default [
  {
    files: ["src/**/*.{js,jsx,ts,tsx}"],
    languageOptions: {
      ecmaVersion: "latest",
      sourceType: "module",
      parserOptions: {
        ecmaFeatures: { jsx: true }
      }
    },
    plugins: {
      react: (await import("eslint-plugin-react")).default
    },
    settings: {
      react: { version: "detect" }
    },
    rules: {
      "react/jsx-uses-react": "off",
      "react/react-in-jsx-scope": "off",
      "react/prop-types": "warn",
      "no-unused-vars": "warn",
      "no-console": "warn"
    }
  }
]
