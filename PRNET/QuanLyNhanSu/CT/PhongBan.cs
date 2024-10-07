using System;
using System.Data;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace QuanLyNhanSu.CT
{
    public partial class PhongBan : UserControl
    {
        public PhongBan()
        {
            InitializeComponent();
        }

        CauLenh cl = new CauLenh();
        SqlDataReader dr;
        DataTable dt = new DataTable();
        string maphong = null, tenphong = null, sonv = null;

        private void load()
        {
            dt.Clear();
            dt = cl.HienPhongBan("0");
            dataGridView1.DataSource = dt;
            btnLuu.Enabled = false;
            btnSua.Enabled = true;
            btnXoa.Enabled = true;
            label5.Text = null;
            label6.Text = null;
            lbSoNV.Text = null;
        }

        private void PhongBan_Load(object sender, EventArgs e)
        {
            load();
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            maphong = dataGridView1.CurrentRow.Cells["MaPB"].Value.ToString();
            tenphong = dataGridView1.CurrentRow.Cells["TenPB"].Value.ToString();
            sonv = dataGridView1.CurrentRow.Cells["SoNV"].Value.ToString();
            txtMaPB.Text = maphong;
            txtTen.Text = tenphong;
            lbSoNV.Text = sonv;
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            // Hiển thị hộp thoại xác nhận từ người dùng trước khi xóa
            DialogResult result = MessageBox.Show("Bạn có chắc chắn muốn xóa phòng ban này?", "Xác Nhận Xóa", MessageBoxButtons.YesNo, MessageBoxIcon.Question);

            // Nếu người dùng xác nhận muốn xóa
            if (result == DialogResult.Yes)
            {
                try
                {
                    dr = cl.XoaPhongBan(maphong);
                    if (!dr.HasRows)
                    {
                        label7.Text = "Xóa Thành Công";
                        txtMaPB.Text = null;
                        txtTen.Text = null;
                    }
                    else
                    {
                        while (dr.Read())
                        {
                            MessageBox.Show("Vui lòng xóa hết nhân viên trong phòng, và nhân viên trong hợp đồng trước khi xóa phòng");
                        }
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Đã xảy ra lỗi khi xóa phòng ban: " + ex.Message, "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                finally
                {
                    dr.Close();
                    load();
                }
            }
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            if(!string.IsNullOrEmpty(txtMaPB.Text))
            {
                if (!string.IsNullOrEmpty(txtTen.Text))
                {
                    dr = cl.CapNhatPhongBan(maphong, txtTen.Text);
                    label7.Text = "Sửa Thành Công";
                    load();
                    txtMaPB.Text = null;
                    txtTen.Text = null;
                }
                else
                {
                    label6.Text = "Lỗi!!";
                    label5.Text = null;
                }
            }
            else
            {
                label5.Text = "Lỗi!!";
                label6.Text = null;
            }
            
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            label5.Text = null;
            label6.Text = null;
            label7.Text = null;
            btnLuu.Enabled = true;
            btnSua.Enabled = false;
            btnXoa.Enabled = false;
        }

        private void btnLuu_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txtMaPB.Text) && !string.IsNullOrEmpty(txtTen.Text))
            {
                // Kiểm tra xem mã phòng ban đã tồn tại chưa
                if (cl.KiemTraTonTaiPhongBan(txtMaPB.Text))
                {
                    // Mã phòng ban đã tồn tại
                    MessageBox.Show("Mã phòng ban đã tồn tại. Vui lòng nhập mã khác.", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }

                // Thêm mới phòng ban
                try
                {
                    dr = cl.ThemPhongBan(txtMaPB.Text, txtTen.Text);
                    label7.Text = "Thêm Thành Công";
                    load();
                    txtMaPB.Text = null;
                    txtTen.Text = null;
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Đã xảy ra lỗi khi thêm mới phòng ban: " + ex.Message, "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
            else
            {
                // Hiển thị thông báo lỗi nếu mã phòng ban hoặc tên phòng ban không được nhậpx
                label5.Text = "Lỗi!!";
                label6.Text = null;
            }
        }
    }
}
