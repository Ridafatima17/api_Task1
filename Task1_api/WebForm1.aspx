<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="TASK1_API.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
       
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous" />

    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.22/css/jquery.dataTables.min.css" />
    <script type="text/javascript" src="//cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

    <link href="StyleSheet1.css" rel="stylesheet"/>
    <style>
        div.container {
            width: 95%;
            margin: 0 auto;
        }
    </style>
    
    <script >
        $(document).ready(function () {
            DataCheck();
            function DataCheck() {
                $.ajax({
                    url: 'http://localhost/DemoApi/api/Values',
                    type: 'get',
                    contentType: 'application/json',
                    async: false,
                    success: function (data1) {
                        $('#MyTable').dataTable({
                            data: data1,
                            columns: [
                                { 'data': 'ID' },
                                { 'data': 'Name' },
                                { 'data': 'Age' },

                            ],
                        });
                    },
                });

            }
        })
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <main role="main">

          <section class="jumbotron text-center">
            <div class="container">
              <h1>Student Search</h1>
              <p class="lead text-muted">Select the student from the below dropdown menu.</p>


               <br />
                    <div class="container">
                    <table id="MyTable" class="table">
                        <thead class="thead-dark">
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Age</th>
                            </tr>
                        </thead>
                    </table>
                </div>
            </div>
          </section>
        </main>
    </form>
</body>
</html>

