using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using cExcel = Microsoft.Office.Interop.Excel;
using System.Data.SqlClient;
using System.Data.Sql;
using System.IO;


namespace QuanLyNhanSu.CT
{
    public partial class NhanVien : UserControl
    {
        SaveFileDialog saveFileDialog1 = new SaveFileDialog();
        CauLenh cl = new CauLenh();
        DataTable dt = new DataTable();
        SqlDataReader dr;
        string manv = null, macc = null, tenchucvu = null, tenphongban = null, mhd = null;
        DateTime ngay, n1, n2;
        public static string quyenhan = null;
        public NhanVien()
        {
            InitializeComponent();
        }
        private void PhanQuyen(string quyen)
        {
            if (quyen.Trim() == "User")
            {
                btnThem.Enabled = false;
                btnSua.Enabled = false;
                btnXoa.Enabled = false;
                btnLuu.Enabled = false;
                exportToExcel.Enabled = false;
                dataGridView1.Enabled = false;
            }
        }
        private void load()
        {
            dt.Clear();
            dt = cl.LayThongTinNV1("NV");
            dataGridView1.DataSource = dt;
            lbMaNV.Text = null;
            PhanQuyen(quyenhan);
        }
        private int catchuoi(string chuoicat) 
        {
            string kq = chuoicat.Replace("HD", "");
            return Convert.ToInt32(kq);
        }
        private string LayMaHD(string mahd)
        {
            dr = cl.Ma(mahd);
            string MaHD = null;
            while (dr.Read())
            {
                MaHD = dr.GetString(3);
            }
            return MaHD;
        }
        private string LayMaHDTuMaNV(string manv)
        {
            string MHD = null;
            dr = cl.layMaHopDongTuMaNV(manv);
            while (dr.Read())
            {
                MHD = dr.GetString(0);
            }
            return MHD;
        }
        private int catchuoi1(string chuoicat)
        {
            string kq = chuoicat.Replace("NV", "");
            return Convert.ToInt32(kq);
        }
        private string LayMaCv(string tencv)
        {
            string MaCV1 = null;
            dr = cl.layMaCVTuTenCV(txtChuc.Text);
            while (dr.Read())
            {
                MaCV1 = dr.GetString(0);
            }
            return MaCV1;
        }
        private string LayMaPB(string tencv)
        {
            string MaPB1 = null;
            dr = cl.layMaPBTuTenPB(txtPhong.Text);
            while (dr.Read())
            {
                MaPB1 = dr.GetString(0);
            }
            return MaPB1;
        }
        private string LayMaNV(string manv)
        {
            string MaNV = null;
            dr = cl.LayMaNhanVien(manv);
            while (dr.Read())
            {
                MaNV = dr.GetString(0);
            }
            return MaNV;
        }
        private DateTime layNgayVaoLam(string manv)
        {
            dr = cl.LayNgayVaoLam(manv);
                while(dr.Read())
                    ngay = dr.GetDateTime(0);
            return ngay;
        }
        private void NhanVien_Load(object sender, EventArgs e)
        {
            load();
        }
        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            btnLuu.Enabled = false;
            btnThem.Enabled = false;
            btnSua.Enabled = true;
            btnXoa.Enabled = true;
            manv = dataGridView1.CurrentRow.Cells["MaNhanVien"].Value.ToString();
            dr = cl.ThongTinNhanVien(manv);
            string gt = null;
            while(dr.Read())
            {
                lbMaNV.Text = dr.GetString(0);
                txtTen.Text = dr.GetString(1);
                gt= dr.GetString(2);
                dtpNgaySinh.Text = dr.GetDateTime(3).ToString();
                txtSoCM.Text = dr.GetString(4);
                txtDT.Text = dr.GetString(5);
                txtTD.Text = dr.GetString(6);
                txtDiaChi.Text = dr.GetString(7);
                txtEmail.Text = dr.GetString(8);
                txtHonNhan.Text = dr.GetString(9);
                txtChuc.Text = dr.GetString(10);
                txtPhong.Text = dr.GetString(11);
                
                txtLuong.Text = dr.GetInt32(12).ToString();
            }
            n1 = dateTimePicker1.Value;
            dateTimePicker1.Value = layNgayVaoLam(manv);
            macc = LayMaCv(tenchucvu);
            if (gt == "Nam")
                rdNam.Checked = true;
            else rdNu.Checked = true;
            mhd = LayMaHDTuMaNV(manv);
        }
       
        private void btnSua_Click(object sender, EventArgs e)
        {
            try
            {
                string MaCV1 = null, MaPB1 = null, gt = null;

                MaCV1 = LayMaCv(txtChuc.Text);
                MaPB1 = LayMaPB(txtPhong.Text);
                if (rdNam.Checked == true)
                    gt = "Nam";
                else
                    gt = "Nữ";
                
                dr = cl.SuaThongTinNhanVien(lbMaNV.Text, MaPB1, Convert.ToInt32(txtLuong.Text), txtTen.Text, gt, Convert.ToDateTime(dtpNgaySinh.Text),
                    txtSoCM.Text, txtDT.Text, txtTD.Text, txtDiaChi.Text, txtEmail.Text, txtHonNhan.Text);
                dr = cl.CapNhatMaCvTrongHopDong(mhd, MaCV1);
                n2 = dateTimePicker1.Value;
                if(n1 != n2)
                    dr = cl.CapNhatNgayVaoLam(n2, lbMaNV.Text);
                int ngay = DateTime.Now.Day, thang = DateTime.Now.Month, nam = DateTime.Now.Year;
                DateTime n = Convert.ToDateTime(thang + "/" + ngay + "/" + nam);
                if (tenchucvu != txtChuc.Text && tenphongban == txtPhong.Text)
                {
                    dr = cl.SuactChucVu(lbMaNV.Text, macc, n);
                    dr = cl.ThemctChucVu(lbMaNV.Text, MaCV1, DateTime.Now, "Thay đổi chức vụ");
                }
                else if (tenchucvu == txtChuc.Text && tenphongban != txtPhong.Text)
                {
                    dr = cl.SuactChucVu(lbMaNV.Text, macc, n);
                    dr = cl.ThemctChucVu(lbMaNV.Text, MaCV1, DateTime.Now, "Chuyển phòng ban");
                }
                else if (tenchucvu != txtChuc.Text && tenphongban != txtPhong.Text)
                {
                    dr = cl.SuactChucVu(lbMaNV.Text, macc, n);
                    dr = cl.ThemctChucVu(lbMaNV.Text, MaCV1, DateTime.Now, "Chuyển chức vụ, Thay đổi chức vụ");
                }

                load();
                // Xóa các giá trị trong các ô input
                txtTen.Text = null;
                txtChuc.Text = null;
                txtDiaChi.Text = null;
                txtDT.Text = null;
                txtEmail.Text = null;
                txtHonNhan.Text = null;
                txtLuong.Text = null;
                txtPhong.Text = null;
                txtSoCM.Text = null;
                txtTD.Text = null;
                dtpNgaySinh.Value = DateTime.Now;
                dateTimePicker1.Value = DateTime.Now;
                btnLuu.Enabled = false;
                btnThem.Enabled = true;
                btnSua.Enabled = false;
                btnXoa.Enabled = false;

                // Hiển thị thông báo
                MessageBox.Show("Sửa thành công!");
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi!!\n"+ ex);
            }
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            if(MessageBox.Show("Bạn Thật Sự Muốn Xóa Nhân Viên Này?", "Thông Báo", MessageBoxButtons.OKCancel, MessageBoxIcon.Warning)
                == DialogResult.OK)
            {
                string hd = LayMaHD(lbMaNV.Text);
                dr = cl.XoaThuongPhatTheoNV(manv);
                //dr = cl.XoaPhuCapTheoNV(manv);
                dr = cl.XoaBaoHiemTheoNV(manv);
                dr = cl.XoaChamCong(manv);
                dr = cl.XoaTK(manv);
                dr = cl.XoactChucVu(manv);
                dr = cl.XoaNhanVien(lbMaNV.Text);
                dr = cl.XoaHopDong(hd);
                load();

                // Xóa các giá trị trong các ô input
                txtTen.Text = null;
                txtChuc.Text = null;
                txtDiaChi.Text = null;
                txtDT.Text = null;
                txtEmail.Text = null;
                txtHonNhan.Text = null;
                txtLuong.Text = null;
                txtPhong.Text = null;
                txtSoCM.Text = null;
                txtTD.Text = null;
                dtpNgaySinh.Value = DateTime.Now;
                dateTimePicker1.Value = DateTime.Now;
                
                btnLuu.Enabled = false;
                btnThem.Enabled = true;
                btnSua.Enabled = false;
                btnXoa.Enabled = false;
            }
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            btnLuu.Enabled = true;
            btnThem.Enabled = false;
            btnSua.Enabled = false;
            btnXoa.Enabled = false;
        }

        private void btnLuu_Click(object sender, EventArgs e)
        {
            try
            {
                string mahd = null, hdm = null, cv = null, pb = null, manv = null, manvm = null, MaPB1 = null, gt = null;
                int hd = 0, nv = 0;

                // Lấy thông tin mã hợp đồng mới
                dr = cl.LayMaHopDong("0");
                while (dr.Read())
                {
                    mahd = dr.GetString(0);
                }
                hd = catchuoi(mahd);
                if (hd < 9)
                    hdm = "HD0" + Convert.ToInt32(hd + 1);
                else
                    hdm = "HD" + Convert.ToInt32(hd + 1);

                // Lấy thông tin chức vụ và mã phòng ban
                cv = LayMaCv(txtChuc.Text);
                pb = LayMaPB(txtPhong.Text);

                // Thêm hợp đồng mới
                dr = cl.ThemHopDong(hdm, Convert.ToDateTime(dateTimePicker1.Text), Convert.ToInt32(txtLuong.Text), cv, pb);

                // Tạo mã nhân viên mới
                manv = LayMaNV("0");
                nv = catchuoi1(manv);
                if (nv < 9)
                    manvm = "NV0" + (nv + 1);
                else
                    manvm = "NV" + (nv + 1);

                // Lấy mã phòng ban
                MaPB1 = LayMaPB(txtPhong.Text);

                // Xác định giới tính
                gt = rdNam.Checked ? "Nam" : "Nữ";

                // Thêm thông tin nhân viên
                dr = cl.ThemNhanVien(manvm, txtTen.Text, MaPB1, Convert.ToInt32(txtLuong.Text), hdm, gt, Convert.ToDateTime(dtpNgaySinh.Text),
                        txtSoCM.Text, txtDT.Text, txtTD.Text, txtDiaChi.Text, txtEmail.Text, txtHonNhan.Text);

                // Thêm chi tiết chức vụ
                dr = cl.ThemctChucVu(manvm, cv, dateTimePicker1.Value, "Tuyển Nhân Viên");

                // Hiển thị thông báo
                MessageBox.Show("Thêm nhân viên thành công!");

                // Xóa các giá trị trong các ô input
                txtTen.Text = null;
                txtChuc.Text = null;
                txtDiaChi.Text = null;
                txtDT.Text = null;
                txtEmail.Text = null;
                txtHonNhan.Text = null;
                txtLuong.Text = null;
                txtPhong.Text = null;
                txtSoCM.Text = null;
                txtTD.Text = null;
                dtpNgaySinh.Value = DateTime.Now;
                dateTimePicker1.Value = DateTime.Now;

                btnLuu.Enabled = false;
                btnThem.Enabled = true;
                btnSua.Enabled = false;
                btnXoa.Enabled = false;

                // Load lại dữ liệu
                load();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi!! \n" + ex);
            }
        }

        private void exportToExcel_Click(object sender, EventArgs e)
        {
            if (saveFileDialog1.ShowDialog() == DialogResult.OK)
            {
                export(dataGridView1, saveFileDialog1.FileName);
            }
        }

        private void export(DataGridView dataGridView2, String fileName)
        {

            Microsoft.Office.Interop.Excel.Application excel;
            Microsoft.Office.Interop.Excel.Workbook workbook;
            Microsoft.Office.Interop.Excel.Worksheet worksheet;
            try
            {
                excel = new Microsoft.Office.Interop.Excel.Application();
                excel.Visible = false;
                excel.DisplayAlerts = false;

                workbook = excel.Workbooks.Add(Type.Missing);
                worksheet = (Microsoft.Office.Interop.Excel.Worksheet)workbook.Sheets["Sheet1"];

                worksheet.Name = "Báo Cáo Danh Sách Nhân Viên";

                for (int i = 0; i < dataGridView2.ColumnCount; i++)
                {
                    worksheet.Cells[1, i + 1] = dataGridView2.Columns[i].HeaderText;
                }

                for (int i = 0; i < dataGridView2.RowCount; i++)
                {
                    for (int j = 0; j < dataGridView2.ColumnCount; j++)
                    {
                        worksheet.Cells[i + 2, j + 1] = dataGridView2.Rows[i].Cells[j].Value.ToString();
                    }
                }
                workbook.SaveAs(fileName);
                workbook.Close();
                excel.Quit();
                MessageBox.Show("Xuất dữ liệu ra Excel thành công!");
            }
            catch
            {
                MessageBox.Show("Xuất excel thất bại!!");
            }
            finally
            {
                workbook = null;
                worksheet = null;
            }
            
        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {
            
        }

        private void txtLuong_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!Char.IsDigit(e.KeyChar) && !Char.IsControl(e.KeyChar))
            {
                e.Handled = true;
            }
        }

        private void txtDT_Leave(object sender, EventArgs e)
        {

            string t = txtDT.Text;
            if (t.Length < 9)
            {
                MessageBox.Show("Số điện thoại không hợp lệ");
                txtDT.Focus();
            }
        }

        private void txtSoCM_Leave(object sender, EventArgs e)
        {
            string t = txtSoCM.Text;
            if (t.Length < 8)
            {
                MessageBox.Show("Số Chứng minh không hợp lệ");
                txtSoCM.Focus();
            }
        }

        private void txtLuong_Leave(object sender, EventArgs e)
        {
            int t = Convert.ToInt32(txtLuong.Text);
            if(t < 0 || t > 10)
            {
                MessageBox.Show("Hệ số lương không hợp lệ không hợp lệ");
                txtLuong.Focus();
            }
        }

        private void txtEmail_Leave(object sender, EventArgs e)
        {
            string t = txtEmail.Text;
            if(t.Contains("@") != true || t.Length < 5)
            {
                MessageBox.Show("Địa chỉ mail không hợp lệ không hợp lệ");
                txtEmail.Focus();
            }
        }
    }
}
