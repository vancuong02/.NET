namespace QuanLyNhanSu.ThongKe
{
    partial class tkNVNghiCoPhep
    {
        /// <summary> 
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary> 
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Component Designer generated code

        /// <summary> 
        /// Required method for Designer support - do not modify 
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.txtNgay = new System.Windows.Forms.TextBox();
            this.cbNam = new System.Windows.Forms.ComboBox();
            this.cbThang = new System.Windows.Forms.ComboBox();
            this.rdT = new System.Windows.Forms.RadioButton();
            this.rdNTN = new System.Windows.Forms.RadioButton();
            this.dtgv = new System.Windows.Forms.DataGridView();
            this.MaNV = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.TenNV = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.ntn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.btXem = new System.Windows.Forms.Button();
            this.label3 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.dtgv)).BeginInit();
            this.SuspendLayout();
            // 
            // txtNgay
            // 
            this.txtNgay.Location = new System.Drawing.Point(301, 92);
            this.txtNgay.Name = "txtNgay";
            this.txtNgay.Size = new System.Drawing.Size(39, 20);
            this.txtNgay.TabIndex = 17;
            // 
            // cbNam
            // 
            this.cbNam.FormattingEnabled = true;
            this.cbNam.Items.AddRange(new object[] {
            "2024"});
            this.cbNam.Location = new System.Drawing.Point(432, 92);
            this.cbNam.Name = "cbNam";
            this.cbNam.Size = new System.Drawing.Size(75, 21);
            this.cbNam.TabIndex = 15;
            // 
            // cbThang
            // 
            this.cbThang.FormattingEnabled = true;
            this.cbThang.Items.AddRange(new object[] {
            "01",
            "02",
            "03",
            "04",
            "05",
            "06",
            "07",
            "08",
            "09",
            "10",
            "11",
            "12"});
            this.cbThang.Location = new System.Drawing.Point(367, 92);
            this.cbThang.Name = "cbThang";
            this.cbThang.Size = new System.Drawing.Size(38, 21);
            this.cbThang.TabIndex = 16;
            // 
            // rdT
            // 
            this.rdT.AutoSize = true;
            this.rdT.Location = new System.Drawing.Point(120, 110);
            this.rdT.Name = "rdT";
            this.rdT.Size = new System.Drawing.Size(150, 17);
            this.rdT.TabIndex = 13;
            this.rdT.TabStop = true;
            this.rdT.Text = "Xem theo tháng trong năm";
            this.rdT.UseVisualStyleBackColor = true;
            this.rdT.CheckedChanged += new System.EventHandler(this.rdT_CheckedChanged);
            // 
            // rdNTN
            // 
            this.rdNTN.AutoSize = true;
            this.rdNTN.Location = new System.Drawing.Point(120, 75);
            this.rdNTN.Name = "rdNTN";
            this.rdNTN.Size = new System.Drawing.Size(149, 17);
            this.rdNTN.TabIndex = 14;
            this.rdNTN.TabStop = true;
            this.rdNTN.Text = "Xem theo ngày tháng năm";
            this.rdNTN.UseVisualStyleBackColor = true;
            this.rdNTN.CheckedChanged += new System.EventHandler(this.rdNTN_CheckedChanged);
            // 
            // dtgv
            // 
            this.dtgv.AllowUserToAddRows = false;
            this.dtgv.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dtgv.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.MaNV,
            this.TenNV,
            this.ntn});
            this.dtgv.Location = new System.Drawing.Point(0, 208);
            this.dtgv.Name = "dtgv";
            this.dtgv.ReadOnly = true;
            this.dtgv.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dtgv.Size = new System.Drawing.Size(610, 252);
            this.dtgv.TabIndex = 12;
            // 
            // MaNV
            // 
            this.MaNV.DataPropertyName = "MaNhanVien";
            this.MaNV.HeaderText = "Mã Nhân Viên";
            this.MaNV.Name = "MaNV";
            this.MaNV.ReadOnly = true;
            // 
            // TenNV
            // 
            this.TenNV.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill;
            this.TenNV.DataPropertyName = "TenNV";
            this.TenNV.HeaderText = "Tên Nhân Viên";
            this.TenNV.Name = "TenNV";
            this.TenNV.ReadOnly = true;
            // 
            // ntn
            // 
            this.ntn.DataPropertyName = "Ngay";
            this.ntn.HeaderText = "Ngày";
            this.ntn.Name = "ntn";
            this.ntn.ReadOnly = true;
            // 
            // btXem
            // 
            this.btXem.Location = new System.Drawing.Point(160, 163);
            this.btXem.Name = "btXem";
            this.btXem.Size = new System.Drawing.Size(241, 27);
            this.btXem.TabIndex = 11;
            this.btXem.Text = "Xem";
            this.btXem.UseVisualStyleBackColor = true;
            this.btXem.Click += new System.EventHandler(this.btXem_Click);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.Location = new System.Drawing.Point(412, 97);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(12, 16);
            this.label3.TabIndex = 8;
            this.label3.Text = "/";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(346, 97);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(12, 16);
            this.label2.TabIndex = 9;
            this.label2.Text = "/";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 20.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(104, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(403, 31);
            this.label1.TabIndex = 10;
            this.label1.Text = "Xem Nhân Viên Nghỉ Có Phép";
            // 
            // tkNVNghiCoPhep
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.ControlLightLight;
            this.Controls.Add(this.txtNgay);
            this.Controls.Add(this.cbNam);
            this.Controls.Add(this.cbThang);
            this.Controls.Add(this.rdT);
            this.Controls.Add(this.rdNTN);
            this.Controls.Add(this.dtgv);
            this.Controls.Add(this.btXem);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Name = "tkNVNghiCoPhep";
            this.Size = new System.Drawing.Size(610, 460);
            this.Load += new System.EventHandler(this.tkNVNghiCoPhep_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dtgv)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox txtNgay;
        private System.Windows.Forms.ComboBox cbNam;
        private System.Windows.Forms.ComboBox cbThang;
        private System.Windows.Forms.RadioButton rdT;
        private System.Windows.Forms.RadioButton rdNTN;
        private System.Windows.Forms.DataGridView dtgv;
        private System.Windows.Forms.Button btXem;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.DataGridViewTextBoxColumn MaNV;
        private System.Windows.Forms.DataGridViewTextBoxColumn TenNV;
        private System.Windows.Forms.DataGridViewTextBoxColumn ntn;
    }
}
