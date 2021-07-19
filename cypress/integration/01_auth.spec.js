describe('Basic Authentication Tests', function () {
  // it('Tests custom cy.login command', function () {
  //   cy.visit('/user');
  //   cy.login('administrator');
  //   cy.contains('Account Info').click();
  //   cy.get('.page-title').contains('administrator');
  //
  //   cy.login('content_admin');
  //   cy.visit('/user');
  //   cy.contains('Account Info').click();
  //   cy.get('.page-title').contains('content_admin');
  // });

  it('Gets redirected from user to login page if unauthenticated', function () {
    // Add wait for Webpacker to compile...
    /* eslint-disable-next-line */
    cy.wait(6000);

    cy.visit('/dashboard', { failOnStatusCode: false });
    cy.get('#alert').contains('You need to sign in or sign up before continuing.');
  });

  xit('Fails to login with name and password', function () {
    cy.visit('/');

    cy.get('input[value="Log In"]').click();
    cy.get('input#user_email').type('foo@bar.com');
    cy.get('input#user_password').type('foop');
    cy.get('input[value="Log In"]').click();
    cy.get('#alert').contains('Invalid Email or password.');
  });

  it('Fails to login without name', function () {
    cy.visit('/users/sign_in');
    cy.get('input#user_password').type('foop');
    cy.get('input[value="Log In"]').click();
    cy.get('#alert').contains('Invalid Email or password.');
  });

  it('Fails to login without password', function () {
    cy.visit('/users/sign_in');
    cy.get('input#user_email').type('foo@bar.com');
    cy.get('input[value="Log In"]').click();
    cy.get('#alert').contains('Invalid Email or password.');
  });

  it('Content Editor views content but can\'t view funds', function () {
    cy.visit('/users/sign_in');
    cy.get('input#user_email').type('alexander.finnarn@cu.edu');
    cy.get('input#user_password').type('admin123!');
    cy.get('input[value="Log In"]').click();

    cy.get('#notice').contains('Signed in successfully.');
    cy.visit('/dashboard');
    cy.get('[data-testid="user-email"]').contains('Email: alexander.finnarn@cu.edu');
    cy.get('[data-testid="user-role"]').contains('Role: Authenticated User');

    cy.get('a[href="/pages"]').click();
    cy.contains('Listing Pages, Dude!');

    cy.get('a[href="/funds"]').click();
    cy.url().should('equal', 'http://localhost:3000/pages');
    cy.get('#alert').contains('You are not authorized to perform this action.');

    cy.get('input[data-testid="logout-button"]').click();
    cy.get('h1').contains('Hello, and welcome to the CMS!');
    cy.get('#notice').contains('Signed out successfully.');
  });

  it('Fund Manager views funds but can\'t view pages', function () {
    cy.visit('/users/sign_in');
    cy.get('input[value="Log In"]').click();
    cy.get('input#user_email').type('alex.finnarn@gmail.com');
    cy.get('input#user_password').type('admin123!');
    cy.get('input[value="Log In"]').click();

    cy.get('#notice').contains('Signed in successfully.');
    cy.visit('/dashboard');
    cy.get('[data-testid="user-email"]').contains('Email: alex.finnarn@gmail.com');
    cy.get('[data-testid="user-role"]').contains('Role: Admin');

    cy.get('a[href="/funds"]').click();
    cy.contains('Listing Funds, Dude!');

    cy.get('a[href="/pages"]').click();
    cy.url().should('equal', 'http://localhost:3000/funds');
    cy.get('#alert').contains('You are not authorized to perform this action.');

    cy.get('input[data-testid="logout-button"]').click();
    cy.get('h1').contains('Hello, and welcome to the CMS!');
    cy.get('#notice').contains('Signed out successfully.');
  });

  it('Anonymous user cannot get to critical routes', function () {
    let routes = [
      '/faqs',
      '/funds',
      '/pages',
      '/spaces',
      '/dashboard',
    ];

    routes.forEach((route) => {
      cy.visit(route);
      cy.url().should('equal', 'http://localhost:3000/users/sign_in')
    });

    // Have these public for the API response for now.
    // routes = [
    //   '/paths/fund.json',
    //   '/paths/faq.json',
    //   '/paths/page.json',
    // ]
    //
    // routes.forEach((route) => {
    //   cy.request(route);
    //   cy.url().should('equal', `http://localhost:3000${route}`)
    // });

  });
});
