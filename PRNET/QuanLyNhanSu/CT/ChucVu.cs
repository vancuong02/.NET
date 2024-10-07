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
    public partial class ChucVu : UserControl
    {
        public ChucVu()
        {
            InitializeComponent();
        }
        CauLenh cl = new CauLenh();
        SqlDataReader dr;
        DataTable dt = new DataTable();

        private void load()
        {
            dt.Clear();
            dt = cl.LayChucVu("0");
            dataGridView1.DataSource = dt;
            btnLuu.Enabled = false;
            txtTenCV.Text = null;
            txtMaCV.Text = null;
            lbTB.Text = null;
        }
        private void ChucVu_Load(object sender, EventArgs e)
        {
            load();
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            btnLuu.Enabled = true;
            txtTenCV.Text = null;
            txtMaCV.Text = "CV";
        }

        private void btnLuu_Click(object sender, EventArgs e)
        {
            try
            {
                if (!string.IsNullOrEmpty(txtMaCV.Text) && !string.IsNullOrEmpty(txtTenCV.Text))
                {
                    // Kiểm tra xem mã chức vụ đã tồn tại trong cơ sở dữ liệu chưa
                    if (cl.KiemTraTonTaiChucVu(txtMaCV.Text))
                    {
                        MessageBox.Show("Mã chức vụ đã tồn tại, vui lòng nhập mã khác.", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }
                    else
                    {
                        // Nếu mã chức vụ chưa tồn tại, thực hiện thêm mới
                        dr = cl.ThemChucVu(txtMaCV.Text, txtTenCV.Text);
                        lbTB.Text = "Đã lưu!!";
                        load();
                    }
                }
                else
                {
                    MessageBox.Show("Vui lòng nhập đầy đủ thông tin.", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi khi thêm mới: " + ex.Message, "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }


        private void btnSua_Click(object sender, EventArgs e)
        {
            try
            {
                if (!string.IsNullOrEmpty(txtMaCV.Text))
                {
                    if (!string.IsNullOrEmpty(txtMaCV.Text))
                    {
                        dr = cl.CapNhatChucVu(txtMaCV.Text, txtTenCV.Text);
                        lbTB.Text = "Sửa thành công!!";
                        load();
                    }
                    else
                    {
                        MessageBox.Show("Lỗi");
                        txtTenCV.Focus();
                    }
                }
                else
                {
                    MessageBox.Show("Lỗi");
                    txtMaCV.Focus();
                }
            }
            catch (Exception)
            {
                MessageBox.Show("Vui lòng chuyển hết nhân viên đang giữ chức vụ hiện tại trước khi sửa");
            }
        
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            try
            {
                if (MessageBox.Show("Bạn thật sự muốn xóa chức vụ này?", "Thông Báo", MessageBoxButtons.OKCancel, MessageBoxIcon.Warning) == DialogResult.OK)
                {
                    dr = cl.XoaCapNhat(txtMaCV.Text);
                    lbTB.Text = "Đã xóa!!";
                    load();
                }
            }
            catch (Exception)
            {

                MessageBox.Show("Vui lòng chuyển hết nhân viên đang giữ chức vụ hiện tại trước khi xóa");
            }
           
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            txtMaCV.Text = dataGridView1.CurrentRow.Cells["MaCV"].Value.ToString();
            txtTenCV.Text = dataGridView1.CurrentRow.Cells["TenCV"].Value.ToString();
        }
    }
}
