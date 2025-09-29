# Pharma Payment Application

## Overview
The Pharma Payment Application is a Java-based application designed to facilitate payment processing in the pharmaceutical industry. This application aims to streamline transactions between healthcare providers and pharmaceutical companies, ensuring efficient and secure payment handling.

## Features
- **Secure Payment Processing**: Implements secure methods for handling transactions.
- **User Authentication**: Ensures that only authorized users can access sensitive payment information.
- **Transaction History**: Tracks and displays past transactions for user reference.
- **Integration Capabilities**: Easily integrates with existing healthcare systems and databases.

## Technology Stack
- **Java**: The primary programming language used for the application.
- **Spring Boot**: For building the RESTful web services.
- **Hibernate**: For database interactions and ORM.
- **MySQL**: Database management system for storing transaction data.

## Getting Started

### Prerequisites
- Java JDK 11 or higher
- Maven
- MySQL Server

### Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/Eshwar-git/pharma-payment-application.git
   ```
2. Navigate to the project directory:
   ```bash
   cd pharma-payment-application
   ```
3. Configure the database connection in `application.properties`.
4. Build the project:
   ```bash
   mvn clean install
   ```
5. Run the application:
   ```bash
   mvn spring-boot:run
   ```

## Usage
Once the application is running, you can access it via `http://localhost:8080`. Use the provided endpoints for payment processing and management.

## Contributing
Contributions are welcome! Please fork the repository and submit a pull request for any enhancements or bug fixes.

## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Acknowledgements
- [Spring Boot](https://spring.io/projects/spring-boot)
- [Hibernate](https://hibernate.org/)
- [MySQL](https://www.mysql.com/)
