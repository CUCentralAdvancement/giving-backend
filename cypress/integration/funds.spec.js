describe('Fund CRUD tests', function () {
  xit('Fails to save if slug is reserved', function () {
    cy.login('content_editor')

    cy.visit('/funds/bridge-forward-scholarship-endowment/edit')
    cy.get('#fund_slug').clear().type('write-fund')
    cy.get('input[value="Save"]').click();

    // The error should show up now since "write-fund" is a reserved slug.
    cy.contains('Slug cannot include reserved keys: "write-fund"' +
      ' "cu-anschutz-alumni-license-plate-fund" "cu-scholarship-license-plate-fund"' +
      ' "cu-denver-alumni-license-plate-program"')
  })
})
