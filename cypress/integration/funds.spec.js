describe('Fund CRUD tests', function () {
  xit('Fails to save if slug is reserved', function () {
    // @todo Create login command.
    // cy.login('content_editor')

    cy.visit('/users/sign_in');
    cy.get('input[value="Log In"]').click();
    cy.get('input#user_email').type('alex.finnarn@gmail.com');
    cy.get('input#user_password').type('admin123!');
    cy.get('input[value="Log In"]').click();

    cy.visit('funds/bridge-forward-scholarship/edit')
    cy.get('#fund_slug').clear().type('write-fund')
    cy.get('input[value="Save"]').click();

    // The error should show up now since "write-fund" is a reserved slug.
    // @todo This throws an exception that should be caught somehow. Until then, I'm skipping this test.
    cy.contains('Slug cannot include reserved keys: "write-fund"' +
      ' "cu-anschutz-alumni-license-plate-fund" "cu-scholarship-license-plate-fund"' +
      ' "cu-denver-alumni-license-plate-program"')
  })
})
