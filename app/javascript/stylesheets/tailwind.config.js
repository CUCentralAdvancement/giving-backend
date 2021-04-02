module.exports = {
  purge: [
    './app/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js'
  ],
  theme: {
    extend: {
      colors: {
        gold: '#CFB87C',
      },
    },
  },
  variants: {},
  plugins: [
    require('@tailwindcss/forms')
  ],
}
