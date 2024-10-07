using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.Sql;
using System.Data.SqlClient;

namespace QuanLyNhanSu.CT
{
    public partial class TaoTaiKhoan : UserControl
    {
        public TaoTaiKhoan()
        {
            InitializeComponent();
        }
        CauLenh cl = new CauLenh();
        DataTable dt = new DataTable();
        SqlDataReader dr1;
        string manv = null;
        int dem = 0;
        private void load()
        {
            dem = 0;
            dt.Clear();
            dt = cl.NvCTaiKhoan("0");
            dataGridView1.DataSource = dt;
            btnLuu.Enabled = false;
            timer1.Start();
            txtTK.Clear();
            txtMK.Clear(); 
            cbQuyen.Text = null;
            lbMaNV.Text = null;
            
        }
        private void TaoTaiKhoan_Load(object sender, EventArgs e)
        {
            load();
        }
        private void btnLuu_Click(object sender, EventArgs e)
        {
            timer1.Start();
            try
            {
                if (!string.IsNullOrEmpty(txtTK.Text))
                {
                    if (!string.IsNullOrEmpty(txtMK.Text))
                    {
                        if (!string.IsNullOrEmpty(cbQuyen.Text))
                        {
                            dr1 = cl.ThemTaiKhoan(manv, txtTK.Text, txtMK.Text, cbQuyen.Text);
                            while (dr1.Read())
                            {
                                if (dr1.GetString(0) == "0")
                                {
                                    MessageBox.Show("Thêm Thành Công");
                                    load();

                                }
                                else
                                {
                                    MessageBox.Show("Tài Khoản Đã Tồn Tại!! Vui Lòng Chọn Tài Khoản Khác");
                                    txtTK.Clear();
                                    txtTK.Focus();
                                }
                            }

                        }
                        else
                        {
                            MessageBox.Show("Chọn Quyền Hạn");
                            cbQuyen.Focus();
                            timer1.Stop();
                        }
                    }
                    else
                    {
                        MessageBox.Show("Nhập Mật Khẩu");
                        txtMK.Focus();
                        timer1.Stop();
                    }
                }
                else
                {
                    MessageBox.Show("Nhập Tài Khoản");
                    txtTK.Focus();
                    timer1.Stop();

                }
            }
            catch (Exception)
            {
                
            }
            
        }

        private void dataGridView1_CellClick_1(object sender, DataGridViewCellEventArgs e)
        {
            timer1.Stop();
            manv = dataGridView1.CurrentRow.Cells["MaNhanVien"].Value.ToString();
            lbMaNV.Text = manv;
            btnLuu.Enabled = true;
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            dem++;
            if (dem == 2)
            {
                timer1.Stop();
                load();
            }
        }

        private void txtTK_Leave(object sender, EventArgs e)
        {
            string t = txtTK.Text;
            if(t.Length < 5)
            {
                MessageBox.Show("Vui lòng nhập tài khoản trên 5 ký tự!!");
                txtTK.Focus();
            }
        }

        private void txtMK_Leave(object sender, EventArgs e)
        {
            string t = txtMK.Text;
            if (t.Length < 5)
            {
                MessageBox.Show("Vui lòng nhập mật khẩu trên 5 ký tự!!");
                txtMK.Focus();
            }
        }
    }
}
