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
    public partial class BaoHiem : UserControl
    {
        public BaoHiem()
        {
            InitializeComponent();
        }
        CauLenh cl = new CauLenh();
        SqlDataReader dr;
        DataTable dt = new DataTable();
        string manv = null, loai = null;
        public static string quyenhan = null;
        private void PhanQuyen(string quyen)
        {
            if (quyen.Trim() == "User")
            {
                btThem.Enabled = false;
                btSua.Enabled = false;
                btXoa.Enabled = false;
                btLuu.Enabled = false;
                dataGridView1.Enabled = false;
            }
        }
        private void load()
        {
            dt.Clear();
            dt = cl.LayBaoHiem("0","abc");
            dataGridView1.DataSource = dt;
            cbLoai.Text = "Null";
            btXoa.Enabled = false;
            btSua.Enabled = false;
            btThem.Enabled = true;
            btLuu.Enabled = false;
            PhanQuyen(quyenhan);
        }

        private void BaoHiem_Load(object sender, EventArgs e)
        {
            load();
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            
            lbTB.Text = null;
            manv = dataGridView1.CurrentRow.Cells["MaNhanVien"].Value.ToString();
            loai = null;
            if (dataGridView1.CurrentRow.Cells["LoaiBaoHiem"].Value.ToString() != "")
            {
                loai = dataGridView1.CurrentRow.Cells["LoaiBaoHiem"].Value.ToString();
                dr = cl.LayBaoHiem1(manv, loai);
                while (dr.Read())
                {
                    txtTen.Text = dr.GetString(1);
                    cbLoai.Text = dr.GetString(2);
                    txtSo.Text = dr.GetString(3);
                    dtpNgayCap.Value = dr.GetDateTime(4);
                    dtpNgayHH.Value = dr.GetDateTime(5);
                    txtNoiCap.Text = dr.GetString(6);
                }
            }
            else
            {
                loai = null;
                txtTen.Text = dataGridView1.CurrentRow.Cells["TenNV"].Value.ToString();
                cbLoai.Text = "Null";
                txtSo.Text = null;
                txtNoiCap.Text = null;
            }
            if(loai == null)
            {
                btXoa.Enabled = false;
                btSua.Enabled = false;
                btThem.Enabled = true;
                btLuu.Enabled = false;
            }
            else
            {
                btXoa.Enabled = true;
                btSua.Enabled = true;
                btThem.Enabled = false;
                btLuu.Enabled = false;
            }
        }

        private void btThem_Click(object sender, EventArgs e)
        {
            btLuu.Enabled = true;
        }

        private void btLuu_Click(object sender, EventArgs e)
        {
            try
            {
                // Kiểm tra xem các trường đã được nhập đầy đủ chưa
                if (string.IsNullOrEmpty(cbLoai.Text) || string.IsNullOrEmpty(txtSo.Text) || string.IsNullOrEmpty(txtNoiCap.Text))
                {
                    MessageBox.Show("Vui lòng nhập đầy đủ thông tin (Loại, Số và Nơi cấp).", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return; // Ngăn người dùng tiếp tục thêm thông tin nếu thiếu dữ liệu
                }

                // Thực hiện thêm thông tin vào cơ sở dữ liệu
                dr = cl.ThemBaoHiem(manv, cbLoai.Text, txtSo.Text, dtpNgayCap.Value, dtpNgayHH.Value, txtNoiCap.Text);
                lbTB.Text = "Đã lưu!!";
                load();
                txtTen.Text = null;
                cbLoai.Text = null;
                txtSo.Text = null;
                dtpNgayCap.Value = DateTime.Now;
                dtpNgayHH.Value = DateTime.Now;
                txtNoiCap.Text = null;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi! \n" + ex);
            }
        }


        private void btSua_Click(object sender, EventArgs e)
        {
            lbTB.Text = null;
            try
            {
                if (MessageBox.Show("Bạn thật sự muốn Sửa!", "Thông Báo", MessageBoxButtons.OKCancel, MessageBoxIcon.Warning) == DialogResult.OK)
                {
                    dr = cl.SuaBaoHiem(manv, loai, cbLoai.Text, txtSo.Text, dtpNgayCap.Value, dtpNgayHH.Value, txtNoiCap.Text);
                    load();
                    txtTen.Text = null;
                    cbLoai.Text = null;
                    txtSo.Text = null;
                    dtpNgayCap.Value = DateTime.Now;
                    dtpNgayHH.Value = DateTime.Now;
                    txtNoiCap.Text = null;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi! \n" + ex);
            }
        }

        private void btXoa_Click(object sender, EventArgs e)
        {
            lbTB.Text = null;
            try
            {
                if (MessageBox.Show("Bạn thật sự muốn xóa!", "Thông Báo", MessageBoxButtons.OKCancel, MessageBoxIcon.Warning) == DialogResult.OK)
                {
                    dr = cl.XoaBaoHiem(manv, loai);
                    load();
                    txtTen.Text = null;
                    cbLoai.Text = null;
                    txtSo.Text = null;
                    dtpNgayCap.Value = DateTime.Now;
                    dtpNgayHH.Value = DateTime.Now;
                    txtNoiCap.Text = null;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi! \n" + ex);
            }
        }
    }
}
