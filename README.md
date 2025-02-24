# springBoot-project
Planification_exams_Academic_app 
# 📚 Exam Management Application 🎓

This is a **Spring Boot MVC** application designed for managing exams in an educational institution. It allows administrators, professors, and students to manage exams, schedules, and users efficiently.

---

## 🚀 Features

✔️ **User Roles & Authentication**
   - Administrator
   - Professor
   - Student

✔️ **Exam Management**
   - Create, update, and delete exams
   - Assign professors and students to exams
   - Manage exam schedules

✔️ **Spring Security**
   - User authentication & authorization
   - Role-based access control
   - Password encryption using BCrypt

✔️ **Database (PostgreSQL)**
   - Structured schema for users, exams, schedules
   - Data integrity with Hibernate ORM

✔️ **Modern UI**
   - Built with JSP, Bootstrap, and AJAX
   - Responsive UI for different devices

---

## 🛠 Technologies Used

| Technology       | Description |
|-----------------|-------------|
| **Spring Boot** | Backend framework |
| **Spring Security** | Authentication & Authorization |
| **Spring Data JPA** | ORM for PostgreSQL |
| **PostgreSQL** | Database management |
| **JSP & Bootstrap** | Frontend UI |
| **Maven** | Dependency management |
| **JWT** | Secure authentication |
| **Hibernate** | ORM for database handling |

---

## 🏗️ System Architecture

The application follows a **3-tier architecture**:

- **Frontend**: JSP, Bootstrap, AJAX
- **Backend**: Spring Boot (MVC, Services, DAO)
- **Database**: PostgreSQL (Spring Data JPA)

📂 **Project Structure:**
Educational_Jee_App/ │── src/ │ ├── main/java/com/fstTanger/ │ │ ├── core/ │ │ │ ├── bo/ # Entities │ │ │ ├── dao/ # Database access │ │ │ ├── services/ # Business logic │ │ │ ├── web/ # Controllers │ │ │ ├── config/ # Spring Security & JWT │ │── main/resources/ │ │ ├── application.properties │ │── main/webapp/WEB-INF/jsp # Frontend JSP files

---

## 📊 Database Schema (PostgreSQL)

                List of relations
 Schema |        Name         | Type  |  Owner
--------+---------------------+-------+----------
 public | cadreadministrateur | table | postgres
 public | compte              | table | postgres
 public | departement         | table | postgres
 public | elementpedagogique  | table | postgres
 public | enseignant          | table | postgres
 public | etudiant            | table | postgres
 public | examen              | table | postgres
 public | filiere             | table | postgres
 public | groupe              | table | postgres
 public | niveau              | table | postgres
 public | personne            | table | postgres
 public | role                | table | postgres
 public | salle               | table | postgres
 public | surveillance        | table | postgres
 public | typeelement         | table | postgres
(15 rows)

🔐 Spring Security Configuration
🔸 BCrypt Password Encoding:
@Bean
public PasswordEncoder passwordEncoder() {
    return new BCryptPasswordEncoder();
}
🔸 JWT Authentication Filter:

public class JwtAuthenticationFilter extends OncePerRequestFilter {
    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, 
                                    FilterChain filterChain) throws ServletException, IOException {
        String token = extractToken(request);
        if (token != null && jwtUtil.validateToken(token)) {
            UserDetails userDetails = userDetailsService.loadUserByUsername(jwtUtil.getUsernameFromToken(token));
            UsernamePasswordAuthenticationToken auth = new UsernamePasswordAuthenticationToken(
                userDetails, null, userDetails.getAuthorities());
            SecurityContextHolder.getContext().setAuthentication(auth);
        }
        filterChain.doFilter(request, response);
    }
}
🔸 Role-Based Access Control:
http.authorizeRequests()
    .antMatchers("/api/admin/**").hasRole("ADMIN")
    .antMatchers("/api/professor/**").hasRole("PROFESSOR")
    .antMatchers("/api/student/**").hasRole("STUDENT")
    .anyRequest().authenticated();

  ⚙️ How to Run the Project
1️⃣ Clone the repository
bash
Copy
Edit
git clone https://github.com/sdoumi13/springBoot-project.git
cd springBoot-project
2️⃣ Set up the Database
Modify application.properties with your PostgreSQL credentials:

properties
Copy
Edit
spring.datasource.url=jdbc:postgresql://localhost:5432/exam_db
spring.datasource.username=your_db_user
spring.datasource.password=your_db_password
spring.jpa.hibernate.ddl-auto=update
3️⃣ Run the Spring Boot Application
mvn spring-boot:run
java -jar target/Planning_exam.jar
4️⃣ Open the App in the Browser
http://localhost:8081
🖥️ Screenshots & UI Views
🔹 Login Page

🔹 Admin Dashboard

🔹 Exam Management


