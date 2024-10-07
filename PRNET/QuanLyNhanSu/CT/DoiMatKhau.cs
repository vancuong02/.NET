using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;


namespace QuanLyNhanSu.CT
{
    public partial class DoiMatKhau : UserControl
    {
        public DoiMatKhau()
        {
            InitializeComponent();
        }
        CauLenh cl = new CauLenh();
        DataTable dt = new DataTable();
        SqlDataReader dr;
        public static string manv = null, taikhoan = null;
        private void lblClose_Click(object sender, EventArgs e)
        {
            this.Hide();
        }

        private void load()
        {
            lblTaiKhoan.Text = taikhoan;
            lbMKC.Text = null;
            lbMKM.Text = null;
            lbNL.Text = null;
            lbTb.Text = null;
        }
        private void btnLuu_Click(object sender, EventArgs e)
        {
            if(!string.IsNullOrEmpty(txtMKC.Text))
            {
                if (!string.IsNullOrEmpty(txtMKM.Text))
                {
                    if (!string.IsNullOrEmpty(txtNL.Text))
                    {
                        if (txtMKM.Text == txtNL.Text)
                        {
                            dt.Clear();
                            dt = cl.dangnhap(lblTaiKhoan.Text, txtMKC.Text);
                            if (dt.Rows[0]["err"].ToString() == "0")
                            {
                                if (MessageBox.Show("Khởi Động Lại Phần Mềm Để Hoàn Tất Cập Nhật Mật Khẩu?", "Thông Báo", MessageBoxButtons.OKCancel, MessageBoxIcon.Warning) == DialogResult.OK)
                                {
                                    dr = cl.DoiMatKhau(manv, lblTaiKhoan.Text, txtMKM.Text);
                                    lbMKC.Text = null;
                                    lbMKM.Text = null;
                                    lbNL.Text = null;
                                    Application.Restart();
                                }
                            }
                            else
                            {
                                lbMKC.Text = "Sai Mật Khẩu!!";
                                lbMKM.Text = null;
                                lbNL.Text = null;
                                lbTb.Text = null;
                                txtMKC.Focus();
                            }
                        }
                        else
                        {
                            lbNL.Text = "Mật Khẩu Nhập Lại Không Giống!!";
                            lbMKC.Text = null;
                            lbMKM.Text = null;
                            lbTb.Text = null;
                            txtNL.Focus();
                        }
                    }
                    else
                    {
                        lbNL.Text = "Lỗi!!";
                        lbMKC.Text = null;
                        lbMKM.Text = null;
                        lbTb.Text = null;
                        txtNL.Focus();
                    }
                }
                else
                {
                    lbMKM.Text = "Lỗi!!";
                    lbMKC.Text = null;
                    lbNL.Text = null;
                    lbTb.Text = null;
                    txtMKM.Focus();
                }
            }
            else
            {
                lbMKC.Text = "Lỗi!!";
                lbMKM.Text = null;
                lbNL.Text = null;
                lbTb.Text = null;
                txtMKC.Focus();
            }
        }

        private void DoiMatKhau_Load(object sender, EventArgs e)
        {
            load();
        }

        private void txtMKM_Leave(object sender, EventArgs e)
        {
            string t = txtMKM.Text;
            if (t.Length < 5)
            {
                lbMKM.Text = "Mật khẩu trên 5 ký tự!!";
                txtMKM.Focus();
            }
        }

        private void txtNL_Leave(object sender, EventArgs e)
        {
            string t = txtNL.Text;
            if (t.Length < 5)
            {
                lbNL.Text = "Mật khẩu trên 5 ký tự!!";
                txtNL.Focus();
            }
        }

      
    }
}
