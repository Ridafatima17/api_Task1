using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using WebApplication3.Models;

namespace WebApplication3.DataLayer
{
    public class SQLDataHelper
    {
        string connectionString = "";
        public SQLDataHelper()
        {
            connectionString = WebConfigurationManager.ConnectionStrings["connec"].ConnectionString;
        }
        public List<Student> GetStudentsData()
        {
            List<Student> studentList = new List<Student>();

            using (SqlConnection con = new SqlConnection(connectionString))
            {

                string query1 = "select * from student";
                SqlCommand cmd = new SqlCommand(query1, con);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    Student student = new Student();
                    student.ID = reader["id"].ToString();
                    student.Name = reader["studentName"].ToString();
                    student.Age = reader["age"].ToString();
                    studentList.Add(student);
                }
                con.Close();
                return studentList;
            }
        }
    }
}