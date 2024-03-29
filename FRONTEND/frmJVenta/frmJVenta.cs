﻿    using LP2TECNOQUIMFRONT.frmPrincipal;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace LP2TECNOQUIMFRONT.frmJVenta
{
    public partial class frmJVenta : Form
    {
        Service.trabajador trabajador = new Service.trabajador();
        Service.ServicioClient DBController = new Service.ServicioClient();
        Service.proyeccionVenta proyeccionVenta = new Service.proyeccionVenta();

        int close = 0;
        public frmJVenta(int cont=0, Service.trabajador trabajadors = null)
        {
            this.trabajador = trabajadors;
            if (cont != 0)
            {
                InitializeComponent();
            }
            else
            {
                Thread t = new Thread(new ThreadStart(SplashStart));

                t.Start();

                Thread.Sleep(1250);

                InitializeComponent();

                MessageBox.Show("Bienvenido/a " + trabajador.nombres + " " + trabajador.apellidos);

                t.Abort();
            }
        }
        public void SplashStart()
        {
            Application.Run(new frmSplash());
        }

        private void btnInicio_Click(object sender, EventArgs e)
        {

        }

        private void btnPerfil_Click(object sender, EventArgs e)
        {
            this.Visible = false;
            frmPerfil formPerfil = new frmPerfil(this.trabajador);
            formPerfil.Visible = true;
            close = 1;
            this.Close();
        }

        private void btnNotificaciones_Click(object sender, EventArgs e)
        {
            this.Visible = false;
            frmNotificaciones formNot = new frmNotificaciones(this.trabajador);
            formNot.Visible = true;
            close = 1;
            this.Close();
        }

        private void frmJVenta_FormClosed(object sender, FormClosedEventArgs e)
        {
            if (close == 0) { Environment.Exit(0); }
        }

        private void btnPMS_Click(object sender, EventArgs e)
        {
            Service.proyeccionVenta[] pvs = DBController.listarProyeccionVenta("");
            if (pvs == null)
            {
                MessageBox.Show("No hay planes pendientes.", "Mensaje Confirmacion", MessageBoxButtons.OK);
            }
            else
            {
                proyeccionVenta = pvs[pvs.Length - 1];
                frmGestionarProyeccionVenta formRegistro = new frmGestionarProyeccionVenta(proyeccionVenta,true);
                formRegistro.Visible = true;
            }
        }

        private void btnHistorial_Click(object sender, EventArgs e)
        {
            frmBuscarProyeccionVenta frmBuscarPV = new frmBuscarProyeccionVenta();
            frmBuscarPV.Visible = true;
        }
    }
}
