using System;
using System.Data;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace QuanLyNhanSu.CT
{
    public partial class ThuongPhat : UserControl
    {
        public ThuongPhat()
        {
            InitializeComponent();
        }
        CauLenh cl = new CauLenh();
        DataTable dt = new DataTable();
        SqlDataReader dr;
        string manv = null, tenpb = null;
        string tennv = null, loai = null;
        int thang = DateTime.Now.Month, nam = DateTime.Now.Year;
        DateTime nd, nc;
        private void load()
        {
            nd = new DateTime(nam, thang, 1);
            nc = nd.AddMonths(1).AddDays(-1);
            txtLyDo.Enabled = false;
            txtT.Enabled = false;
            btnXoa.Enabled = false;
            btnThem.Enabled = false;
            rdThuong.Enabled = false;
            rdPhat.Enabled = false;
            cbThang.Text = thang.ToString(); ;
            cbNam.Text = nam.ToString();
            dt.Clear();
            dt = cl.LayNhanVienTuMaPB("0",nd,nc);
            dataGridView1.DataSource = dt;
        }
        private void ThuongPhat_Load(object sender, EventArgs e)
        {
            load();
        }


        private void dataGridView1_Click(object sender, DataGridViewCellEventArgs e)
        {
            txtLyDo.Enabled = true;
            txtT.Enabled = true;
            btnXoa.Enabled = true;
            btnThem.Enabled = true;
            rdThuong.Enabled = true;
            rdPhat.Enabled = true;
            tennv = dataGridView1.CurrentRow.Cells["TenNhanVien"].Value.ToString();
            txtTen.Text = tennv;
            if (dataGridView1.CurrentRow.Cells["Loai"].Value.ToString() == "Thưởng")
            {
                rdThuong.Checked = true;
                loai = "Thưởng";
            }
            else
            {
                rdPhat.Checked = true;
                loai = "Phạt";
            }
            txtLyDo.Text = dataGridView1.CurrentRow.Cells["LyDo"].Value.ToString();
            txtT.Text = dataGridView1.CurrentRow.Cells["VND"].Value.ToString();
        }

        private string layMaNhanVien(string tennv)
        {
            dr = cl.layMaNVTuTenNV(tennv);
            while (dr.Read())
                manv = dr.GetString(0);
            return manv;
        }
        private string layTenPhongBan(string ma)
        {
            dr = cl.layTenPBTuMaNV(ma);
            while (dr.Read())
                tenpb = dr.GetString(0);
            return tenpb;
        }
        
        private void btnThem_Click(object sender, EventArgs e)
        {
            txtLyDo.Enabled = true;
            txtT.Enabled = true;
            btnXoa.Enabled = false;
            rdThuong.Enabled = true;
            rdPhat.Enabled = true;

            if (rdPhat.Checked)
                loai = "Phạt";
            else
                loai = "Thưởng";

            if (!string.IsNullOrEmpty(txtLyDo.Text))
            {
                int tien;
                if (int.TryParse(txtT.Text, out tien))
                {
                    dr = cl.ThemThuongPhat(layMaNhanVien(tennv), loai, tien, txtLyDo.Text, DateTime.Now);
                    load();
                    txtLyDo.Text = null;
                    txtT.Text = null;
                }
                else
                {
                    MessageBox.Show("Số tiền không hợp lệ.", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    txtT.Text = null;
                }
            }
            else
            {
                MessageBox.Show("Vui lòng nhập lý do.", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            if (rdPhat.Checked == true)
                loai = "Phạt";
            else loai = "Thưởng";
            if (MessageBox.Show("Bạn Thật Sự Muốn Xóa!!", "Thông Báo", MessageBoxButtons.OKCancel, MessageBoxIcon.Warning) == DialogResult.OK)
            {
                dr = cl.XoaThuongPhat(layMaNhanVien(tennv), loai, Convert.ToInt32(txtT.Text), txtLyDo.Text);
                load();
                txtLyDo.Text = null;
                txtT.Text = null;
            }
        }

        private void btXem_Click(object sender, EventArgs e)
        {
            int thang, nam;
            if (int.TryParse(cbThang.Text, out thang) && int.TryParse(cbNam.Text, out nam))
            {
                if (thang >= 1 && thang <= 12 && nam >= DateTime.MinValue.Year && nam <= DateTime.MaxValue.Year)
                {
                    // Lấy số ngày cuối cùng của tháng
                    int soNgayTrongThang = DateTime.DaysInMonth(nam, thang);

                    // Tạo ngày đầu tiên và ngày cuối cùng của tháng
                    DateTime nd = new DateTime(nam, thang, 1);
                    DateTime nc = new DateTime(nam, thang, soNgayTrongThang);

                    dt.Clear();
                    dt = cl.LayNhanVienTuMaPB("0", nd, nc);
                    dataGridView1.DataSource = dt;
                }
                else
                {
                    MessageBox.Show("Tháng hoặc năm không hợp lệ.");
                }
            }
            else
            {
                MessageBox.Show("Vui lòng nhập tháng và năm là số nguyên.");
            }
        }

    }
}
