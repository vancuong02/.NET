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
    public partial class ctChamCong : UserControl
    {
        public ctChamCong()
        {
            InitializeComponent();
        }
        CauLenh cl = new CauLenh();
        DataTable dt = new DataTable();
        SqlDataReader dr;
        int ngay = DateTime.Now.Day, thang = DateTime.Now.Month, nam = DateTime.Now.Year, dem = 0;
        string manv = null, a = null, b = null;
        private void load()
        {
            label2.Text = null;
            lbMa.Text = null;
            lbTen.Text = null;
            btCapNhat.Enabled = false;
            dr = cl.LayChamCong("1",DateTime.Now);
            if (dr != null)
            {
                while (dr.Read())
                {
                    DateTime kq = dr.GetDateTime(0);
                    a = kq.ToString();
                }
            }
            b = thang + "/" + ngay + "/" + nam + " 0:00:00";
            
            if (a == b)
            {
                MessageBox.Show("Đã chấm công cho ngày hôm nay", "Thông Báo", MessageBoxButtons.OKCancel, MessageBoxIcon.Warning);
                dt.Clear();
                dataGridView1.Refresh();
                dt = cl.LayChamCong1("0",DateTime.Now);
                dataGridView1.DataSource = dt;
                dem = 1;
            }
            else
            {
                btCapNhat.Enabled = true;
                dt.Clear();
                dataGridView1.Refresh();
                dt = cl.LayTenNhanVien1("0");
                dataGridView1.DataSource = dt;
                dem = 0;
            }
            
        }
        private void ctChamCong_Load(object sender, EventArgs e)
        {
            load();
        }
        private void btCapNhat_Click(object sender, EventArgs e)
        {
            int d = 0;
            for (int i = 0; i < dataGridView1.RowCount; i++)
            {
                if (dataGridView1.Rows[i].Cells["TinhTrang"].Value == null)
                {
                    label2.ForeColor = Color.Red;
                    label2.Text = "Lỗi!! \n Vui lòng kiểm tra lại";
                    dataGridView1.Rows[i].Cells["TinhTrang"].Selected = true;
                    d = 0;
                }
                else d++;
            }
            if (d != 0)
            {
                for (int i = 0; i < dataGridView1.RowCount; i++)
                {
                    string tinhtrang = dataGridView1.Rows[i].Cells["TinhTrang"].Value.ToString();
                    manv = dataGridView1.Rows[i].Cells["Ma"].Value.ToString();
                    dr = cl.ThemChamCong(manv, DateTime.Now, tinhtrang);
                }
                load();
            }
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.ColumnIndex != 0 && dem == 1)
            {
                lbMa.Text = dataGridView1.CurrentRow.Cells["Ma"].Value.ToString();
                lbTen.Text = dataGridView1.CurrentRow.Cells["Ten"].Value.ToString();
            }
            else if(e.ColumnIndex != 0 && dem == 0)
            {
                lbMa.Text = dataGridView1.CurrentRow.Cells["Ma"].Value.ToString();
                lbTen.Text = dataGridView1.CurrentRow.Cells["Ten"].Value.ToString();
            }
        }

        private void btXoa_Click(object sender, EventArgs e)
        {
            try
            {
                if (MessageBox.Show("Bạn thật sự muốn xóa buổi chấm công ngày hôm nay?", "Thông Báo", MessageBoxButtons.OKCancel, MessageBoxIcon.Warning) == DialogResult.OK)
                {
                    dr = cl.XoaChamCongTheoNgay(dtpNgay.Value);
                    a = null;
                    b = null;
                    load();
                }
            }
            catch (Exception)
            {
                label2.Text = "Lỗi!!";
            }
           
        }

        private void cbCC_CheckedChanged(object sender, EventArgs e)
        {
            if(cbCC.Checked == true)
                for (int i = 0; i < dataGridView1.RowCount; i++)
                    dataGridView1.Rows[i].Cells["TinhTrang"].Value = "Đi Làm";
            else
                for (int i = 0; i < dataGridView1.RowCount; i++)
                    dataGridView1.Rows[i].Cells["TinhTrang"].Value = "";
        }

    }
}
