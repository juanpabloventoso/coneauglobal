using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

namespace sgwMulticapa.Datos.Oracle
{

    public class Funciones
    {
        // Genera una consulta SQL que compara un valor STRING omitiendo acentos, mayúsculas y símbolos
        public static string GenerarComparacionLike(string ACampo, string AValor)
        {
            return " CONVERT(TRIM(LOWER(" + ACampo + ")), 'US7ASCII', 'WE8ISO8859P1') LIKE " +
                "CONVERT('%" + AValor.Trim().ToLower() + "%', 'US7ASCII', 'WE8ISO8859P1') ";
        }

        // Genera una consulta SQL mediante el comando PIVOT para ubicar los años históricos como columnas
        // Espera una columna "ANIO" con el año del registro, del tipo NUMBER
        public static string GenerarConsultaPivotHistorica(string ASelect, string ACantidad, int AAnioActual, int AHistoria)
        {
            string FAnios = "";
            for (int i = 0; i < AHistoria; i++)
            {
                int FAnio = AAnioActual - i;
                FAnios += FAnio.ToString();
                if (i < (AHistoria - 1))
                    FAnios += ", ";
            }
            return "SELECT * FROM (" + ASelect + ") PIVOT (SUM(" + ACantidad + ") AS " + ACantidad +
                " FOR ANIO IN (" + FAnios + "))";
        } 
    }

    public class OracleDBHandler : sgwMulticapa.Datos.Base.DBHandler
    {
        System.Data.OleDb.OleDbConnection _Connection;

        public OracleDBHandler()
        {
        }

        public override void Conectar(string AConnectionString)
        {
            _Connection = new System.Data.OleDb.OleDbConnection();
            _Connection.ConnectionString = System.Configuration.
                ConfigurationManager.ConnectionStrings[AConnectionString].ToString();
            _Connection.Open();
        }

        public override DataSet ConsultarSQL(string ASQL)
        {
            System.Data.OleDb.OleDbDataAdapter _SQLRecv = new System.Data.OleDb.OleDbDataAdapter(ASQL, _Connection);
            System.Data.DataSet _DataSet = new System.Data.DataSet();
            _SQLRecv.Fill(_DataSet);
            return _DataSet;
        }


        public override void EjecutarSQL(string ASQL)
        {
            System.Data.OleDb.OleDbCommand _SQLSend = new System.Data.OleDb.OleDbCommand();
            _SQLSend.Connection = _Connection;
            _SQLSend.CommandText = ASQL;
            _SQLSend.ExecuteNonQuery();
        }

        public override int EjecutarSQLClave(string ASQL)
        {
            System.Data.OleDb.OleDbCommand _SQLSend = new System.Data.OleDb.OleDbCommand();
            _SQLSend.Connection = _Connection;
            _SQLSend.CommandText = ASQL;
            _SQLSend.Parameters.Add(":RESULT", System.Data.OleDb.OleDbType.Integer);
            _SQLSend.Parameters[":RESULT"].Direction = ParameterDirection.Output;
            _SQLSend.ExecuteNonQuery();
            return Convert.ToInt32(_SQLSend.Parameters[":RESULT"].Value);
        }

        public override void Desconectar()
        {
            _Connection.Close();
            _Connection = null;
        }

    }

}