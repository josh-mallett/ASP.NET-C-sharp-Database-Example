using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
public class NorthwindConnection
{
    private SqlConnection thisConnection = null;
    private SqlCommand thisCommand = null;

    public NorthwindConnection()
    {
    }

    public bool MakeConnectionToDatabase()
    {
        try
        {
            // make connection
            string connectString = "Data Source=DESKTOP-CUFVNJD\\SQLEXPRESS;Initial Catalog=Northwind;Integrated Security=True";
       
            SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder(connectString);
            builder["Database"] = "Northwind";
            thisConnection = new SqlConnection(builder.ConnectionString);
            thisConnection.Open();
            // create sql command object
            thisCommand = thisConnection.CreateCommand();
        }
        catch (Exception except)
        {
            Console.WriteLine(except);
            return true;
        }
        return true;
    }

    public List<string> QueryTheDatabase(string q)
    {
        List<string> list = new List<string>();

        try
        {
            // create and execute a Query, i.e. sql statement that does return
            // data
            thisCommand.CommandText = q;
            SqlDataReader thisReader = thisCommand.ExecuteReader();
            // string out returned data
            while (thisReader.Read())
            {
                string line = "";
                for (int i = 0; i < thisReader.FieldCount - 1; i++)
                {
                    line += thisReader[i] + ",   ";
                    line += thisReader[thisReader.FieldCount - 1] + "  ";
                    list.Add(line);
                }
                    
            }
            if (thisReader != null) thisReader.Close();
        }
        catch (SqlException except)
        {
            list.Add(except.Message);
        }
        return list;
    }

    public bool CloseTheConnectionToTheDatabase()
    {
        try
        {
            // close the open connection
            thisConnection.Close();
        }
        catch (Exception except)
        {
            return false;
        }
        return true;
    }
}