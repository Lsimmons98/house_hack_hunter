# House Hack Hunter

**House Hack Hunter** is a real estate investment tool designed to help users track potential house hacking deals. Users can input house information and create deals with associated financials such as cash flow, cash-on-cash return, and other key metrics.

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
- [Features](#features)
- [Validations](#validations)
- [Scopes](#scopes)

## Installation

1. Clone the repository:

   ```bash
   git clone git@github.com:Lsimmons98/house_hack_hunter.git
   cd house-hack-hunter
   ```

2. Install the required gems:

   ```bash
   bundle install
   ```

3. Set up the database:

   ```bash
   rails db:create
   rails db:migrate
   rails db:seed
   ```

4. Start the Rails server:

   ```bash
   rails server
   ```

5. Visit the app in your browser at `http://localhost:3000`.

## Usage

Once you've set up the app and started the server, you can begin using the following features:

### Creating a House

- Add a new house on the "Houses Index" page.
- Enter details such as the house's address, listing price, annual property taxes, and year built.
- Optionally, add unit information for each unit in the house, including the number of bedrooms, bathrooms, and monthly rent.

### Creating a Deal

- After creating a house, you can create a deal associated with that house.
- The deal will calculate key metrics such as cash flow, cash-on-cash return, net operating income (NOI), and a suggested maximum purchase price.

## Features

- **House Listings**: Input and manage properties that you're interested in for house hacking.
- **Units**: Associate multiple rental units with each house and track rent information.
- **Financial Calculations**: Automatically calculate key metrics like cash-on-cash return, cash flow, NOI, and monthly payment.
- **Validation Handling**: Ensures data integrity by validating user input for houses and units.
- **User-Specific Data**: Deals are scoped to the logged-in user, allowing each user to manage their own properties.
