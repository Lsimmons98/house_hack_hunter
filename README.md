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
   git clone https://github.com/yourusername/house-hack-hunter.git
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
- The deal will calculate key metrics such as cash flow, cash-on-cash return, and net operating income (NOI).

## Features

- **House Listings**: Input and manage properties that you're interested in for house hacking.
- **Units**: Associate multiple rental units with each house and track rent information.
- **Financial Calculations**: Automatically calculate key metrics like cash-on-cash return, cash flow, NOI, and monthly payment.
- **Validation Handling**: Ensures data integrity by validating user input for houses and units.
- **User-Specific Data**: Deals are scoped to the logged-in user, allowing each user to manage their own properties.

## Validations

### House Validations

- `address`, `list_price`, `annual_property_taxes`, and `year_built` must be present.

### Unit Validations

- Each unit must have `bedrooms`, `bathrooms`, and `monthly_rent`.

### Deal Validations

- Financial calculations are validated based on user inputs and house details.

## Scopes

### `Deal`

- **`good_deals_for_user(user_id)`**: Fetches deals for a specific user where the `max_purchase_price` is within 10% of the house's listing price.

```ruby
scope :good_deals_for_user, ->(user_id) {
  joins(:house).where('deals.max_purchase_price BETWEEN houses.list_price * 0.9 AND houses.list_price * 1.1').where(user_id: user_id)
}
```
