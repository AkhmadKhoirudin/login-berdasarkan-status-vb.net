 Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Try
            If TextBox1.Text = "" Or TextBox2.Text = "" Then
                MsgBox("harap isi dulu")
            Else
                koneklog()
                cmd = New OdbcCommand("Select * from tb_pegawai where username='" & TextBox1.Text & "' and password='" & TextBox2.Text & "' ", conn)
                dr = cmd.ExecuteReader
                dr.Read()
                If dr.HasRows Then
                    If dr("status").ToString = "admin" Then
                        Form1.btAdmin()
                        Form1.bukapanel(home)
                        Me.Close()
                       
                    ElseIf dr("status").ToString = "pegawai" Then
                        Me.Close()
                        Form1.bukapanel(home)
                       
                    ElseIf dr("status").ToString = "administrator" Then
                        Me.Close()
                        Form1.bukapanel(home)
                        bio()
                    ElseIf dr("status").ToString = "progremer" Then
                        Me.Close()
                        Form1.bukapanel(home)
                        Form1.btprogremer()
                        

                    ElseIf dr("status").ToString = "user" Then
                        Me.Close()
                        Form1.btuser()
                        Form1.bukapanel(home)
                 

                    End If
                Else
                    MsgBox("maaf nama anda tidak terdaftar")
                End If

            End If
        Catch ex As Exception

        End Try

    End Sub
