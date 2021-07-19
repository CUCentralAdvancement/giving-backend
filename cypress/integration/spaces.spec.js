describe('Spaces permission tests', function () {
  it('Creates and deletes a Content Editor membership', function () {
    // @todo Create login command.
    // cy.login('content_editor')

    // Login.
    cy.visit('/users/sign_in');
    cy.get('input#user_email').type('alex.finnarn@gmail.com');
    cy.get('input#user_password').type('admin123!');
    cy.get('input[value="Log In"]').click();

    // Navigate to the Spaces
    cy.get('#header-content-links a[href="/spaces"]').click();

    // Verify spaces exist in the listing table.
    // We will use the space description for Content Editor and Fund Manager spaces.
    cy.contains('For content editors');
    cy.contains('For fund managers');

    // Membership that gets created in this test should not be in the list.
    cy.contains('alexander.finnarn@cu.edu');
    cy.contains('alex.finnarn+2@gmail.com').should('not.exist');

    // Navigate to the Content Editor edit page.
    cy.get('[data-testid="edit-content-editor-space"]').click();
    cy.contains('Editing Space: Content Editor');

    // See that one user is in the members list but another isn't.
    cy.contains('alexander.finnarn@cu.edu');
    cy.contains('alex.finnarn+2@gmail.com').should('not.exist');

    // Add new membership to Content Editor space.
    cy.get('[data-testid="add-member-button"]').click();
    cy.contains('New Membership');

    cy.get('select[name="membership[level]"]').select('Captain');
    // https://docs.cypress.io/api/commands/type#-Selecting-an-option-from-datalist
    cy.get('input[name="membership[user]"]').type('alex.finnarn+2@gmail.com');
    cy.get('input[name="membership[space]"]').type('Content Editor');
    cy.get('input[name="commit"]').click();
    cy.contains('Membership was successfully created.');

    // See that two users are in the members list.
    cy.visit('/spaces/content-editors/edit');
    cy.contains('alexander.finnarn@cu.edu');
    cy.contains('alex.finnarn+2@gmail.com');

    // Delete the new membership. It is the second in the list.
    cy.get('a[data-method="delete"]').eq(1).click();

    // To confirm the dialog alert, you have to listen for this event.
    // https://stackoverflow.com/questions/59768090/cypress-confirmation-dialog
    cy.on('window:confirm', () => true);
    cy.contains('Membership was successfully destroyed.');

    // See that one user is in the members list but another isn't.
    cy.contains('alexander.finnarn@cu.edu');
    cy.contains('alex.finnarn+2@gmail.com').should('not.exist');
  })
})
