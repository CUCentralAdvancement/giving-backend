describe('Redirects tests', function () {
  it('should add and edit a redirect', function () {
    // Login as an admin user.
    cy.visit('/users/sign_in');
    cy.get('input#user_email').type('alex.finnarn@gmail.com');
    cy.get('input#user_password').type('admin123!');
    cy.get('input[value="Log In"]').click();

    cy.visit('/admin/redirects');
    cy.get('h1').contains('Redirects Listing');

    // Add redirect.
    cy.contains('+ New Redirect').click();
    cy.contains('New Redirect');
    cy.get('input[name="redirect[source]"]').type(`foobar-${Math.random()}`);
    cy.get('input[name="redirect[redirect]"]').type('https://www.google.com');
    cy.get('input[name="commit"]').click();
    cy.contains('Redirect was successfully created.');

    // Edit redirect.
    cy.get('[data-testid="edit-redirect"]').click();
    cy.get('input[name="redirect[redirect]"]').type('https://www.drupal.org');
    cy.get('input[name="commit"]').click();
    cy.contains('Redirect was successfully updated.');

    cy.get('input[data-testid="logout-button"]').click();
    cy.get('h1').contains('Hello, and welcome to the CMS!');
    cy.get('#notice').contains('Signed out successfully.');
  });

  // @todo Finish this test once released.
  xit('should send updates to crowdfunding app', function () {

  });
});
