const Migrations = artifacts.require('Migrations');

contract('Migrations', (accounts) => {
    it('should set user information', async () => {
        const instance = await Migrations.deployed();
        await instance.setUser('username', 'password', 'email', 'accountNumber', 'branchName', 'nationality', { from: accounts[0] });

        const user = await instance.users(accounts[0]);
        assert.equal(user.username, 'username', 'Username should match');
        assert.equal(user.password, 'password', 'Password should match');
        assert.equal(user.email, 'email', 'Email should match');
        assert.equal(user.accountNumber, 'accountNumber', 'Account number should match');
        assert.equal(user.branchName, 'branchName', 'Branch name should match');
        assert.equal(user.nationality, 'nationality', 'Nationality should match');
    });

    it('should get user information', async () => {
        const instance = await Migrations.deployed();
        const user = await instance.users(accounts[0]);

        assert.equal(user.username, 'username', 'Username should match');
        assert.equal(user.password, 'password', 'Password should match');
        assert.equal(user.email, 'email', 'Email should match');
        assert.equal(user.accountNumber, 'accountNumber', 'Account number should match');
        assert.equal(user.branchName, 'branchName', 'Branch name should match');
        assert.equal(user.nationality, 'nationality', 'Nationality should match');
    });
});
