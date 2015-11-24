// ORM class for table 'f_Invoice'
// WARNING: This class is AUTO-GENERATED. Modify at your own risk.
//
// Debug information:
// Generated date: Tue Nov 24 10:57:45 PST 2015
// For connector: org.apache.sqoop.manager.MySQLManager
import org.apache.hadoop.io.BytesWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.io.Writable;
import org.apache.hadoop.mapred.lib.db.DBWritable;
import com.cloudera.sqoop.lib.JdbcWritableBridge;
import com.cloudera.sqoop.lib.DelimiterSet;
import com.cloudera.sqoop.lib.FieldFormatter;
import com.cloudera.sqoop.lib.RecordParser;
import com.cloudera.sqoop.lib.BooleanParser;
import com.cloudera.sqoop.lib.BlobRef;
import com.cloudera.sqoop.lib.ClobRef;
import com.cloudera.sqoop.lib.LargeObjectLoader;
import com.cloudera.sqoop.lib.SqoopRecord;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.io.DataInput;
import java.io.DataOutput;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

public class f_Invoice extends SqoopRecord  implements DBWritable, Writable {
  private final int PROTOCOL_VERSION = 3;
  public int getClassFormatVersion() { return PROTOCOL_VERSION; }
  protected ResultSet __cur_result_set;
  private Integer Item_id;
  public Integer get_Item_id() {
    return Item_id;
  }
  public void set_Item_id(Integer Item_id) {
    this.Item_id = Item_id;
  }
  public f_Invoice with_Item_id(Integer Item_id) {
    this.Item_id = Item_id;
    return this;
  }
  private Integer Vendor_id;
  public Integer get_Vendor_id() {
    return Vendor_id;
  }
  public void set_Vendor_id(Integer Vendor_id) {
    this.Vendor_id = Vendor_id;
  }
  public f_Invoice with_Vendor_id(Integer Vendor_id) {
    this.Vendor_id = Vendor_id;
    return this;
  }
  private Integer Date_id;
  public Integer get_Date_id() {
    return Date_id;
  }
  public void set_Date_id(Integer Date_id) {
    this.Date_id = Date_id;
  }
  public f_Invoice with_Date_id(Integer Date_id) {
    this.Date_id = Date_id;
    return this;
  }
  private Double inv_fact1;
  public Double get_inv_fact1() {
    return inv_fact1;
  }
  public void set_inv_fact1(Double inv_fact1) {
    this.inv_fact1 = inv_fact1;
  }
  public f_Invoice with_inv_fact1(Double inv_fact1) {
    this.inv_fact1 = inv_fact1;
    return this;
  }
  private Double inv_fact2;
  public Double get_inv_fact2() {
    return inv_fact2;
  }
  public void set_inv_fact2(Double inv_fact2) {
    this.inv_fact2 = inv_fact2;
  }
  public f_Invoice with_inv_fact2(Double inv_fact2) {
    this.inv_fact2 = inv_fact2;
    return this;
  }
  private Double inv_fact3;
  public Double get_inv_fact3() {
    return inv_fact3;
  }
  public void set_inv_fact3(Double inv_fact3) {
    this.inv_fact3 = inv_fact3;
  }
  public f_Invoice with_inv_fact3(Double inv_fact3) {
    this.inv_fact3 = inv_fact3;
    return this;
  }
  private Double inv_fact4;
  public Double get_inv_fact4() {
    return inv_fact4;
  }
  public void set_inv_fact4(Double inv_fact4) {
    this.inv_fact4 = inv_fact4;
  }
  public f_Invoice with_inv_fact4(Double inv_fact4) {
    this.inv_fact4 = inv_fact4;
    return this;
  }
  private String BSE_XX5;
  public String get_BSE_XX5() {
    return BSE_XX5;
  }
  public void set_BSE_XX5(String BSE_XX5) {
    this.BSE_XX5 = BSE_XX5;
  }
  public f_Invoice with_BSE_XX5(String BSE_XX5) {
    this.BSE_XX5 = BSE_XX5;
    return this;
  }
  private String BSE_XX6;
  public String get_BSE_XX6() {
    return BSE_XX6;
  }
  public void set_BSE_XX6(String BSE_XX6) {
    this.BSE_XX6 = BSE_XX6;
  }
  public f_Invoice with_BSE_XX6(String BSE_XX6) {
    this.BSE_XX6 = BSE_XX6;
    return this;
  }
  private String BSE_XX7;
  public String get_BSE_XX7() {
    return BSE_XX7;
  }
  public void set_BSE_XX7(String BSE_XX7) {
    this.BSE_XX7 = BSE_XX7;
  }
  public f_Invoice with_BSE_XX7(String BSE_XX7) {
    this.BSE_XX7 = BSE_XX7;
    return this;
  }
  private String BSE_XX8;
  public String get_BSE_XX8() {
    return BSE_XX8;
  }
  public void set_BSE_XX8(String BSE_XX8) {
    this.BSE_XX8 = BSE_XX8;
  }
  public f_Invoice with_BSE_XX8(String BSE_XX8) {
    this.BSE_XX8 = BSE_XX8;
    return this;
  }
  private String BSE_XX9;
  public String get_BSE_XX9() {
    return BSE_XX9;
  }
  public void set_BSE_XX9(String BSE_XX9) {
    this.BSE_XX9 = BSE_XX9;
  }
  public f_Invoice with_BSE_XX9(String BSE_XX9) {
    this.BSE_XX9 = BSE_XX9;
    return this;
  }
  private String BSE_XX10;
  public String get_BSE_XX10() {
    return BSE_XX10;
  }
  public void set_BSE_XX10(String BSE_XX10) {
    this.BSE_XX10 = BSE_XX10;
  }
  public f_Invoice with_BSE_XX10(String BSE_XX10) {
    this.BSE_XX10 = BSE_XX10;
    return this;
  }
  private String BSE_XX11;
  public String get_BSE_XX11() {
    return BSE_XX11;
  }
  public void set_BSE_XX11(String BSE_XX11) {
    this.BSE_XX11 = BSE_XX11;
  }
  public f_Invoice with_BSE_XX11(String BSE_XX11) {
    this.BSE_XX11 = BSE_XX11;
    return this;
  }
  private String BSE_XX12;
  public String get_BSE_XX12() {
    return BSE_XX12;
  }
  public void set_BSE_XX12(String BSE_XX12) {
    this.BSE_XX12 = BSE_XX12;
  }
  public f_Invoice with_BSE_XX12(String BSE_XX12) {
    this.BSE_XX12 = BSE_XX12;
    return this;
  }
  private String BSE_XX13;
  public String get_BSE_XX13() {
    return BSE_XX13;
  }
  public void set_BSE_XX13(String BSE_XX13) {
    this.BSE_XX13 = BSE_XX13;
  }
  public f_Invoice with_BSE_XX13(String BSE_XX13) {
    this.BSE_XX13 = BSE_XX13;
    return this;
  }
  private String BSE_XX14;
  public String get_BSE_XX14() {
    return BSE_XX14;
  }
  public void set_BSE_XX14(String BSE_XX14) {
    this.BSE_XX14 = BSE_XX14;
  }
  public f_Invoice with_BSE_XX14(String BSE_XX14) {
    this.BSE_XX14 = BSE_XX14;
    return this;
  }
  private String BSE_XX15;
  public String get_BSE_XX15() {
    return BSE_XX15;
  }
  public void set_BSE_XX15(String BSE_XX15) {
    this.BSE_XX15 = BSE_XX15;
  }
  public f_Invoice with_BSE_XX15(String BSE_XX15) {
    this.BSE_XX15 = BSE_XX15;
    return this;
  }
  private String BSE_XX16;
  public String get_BSE_XX16() {
    return BSE_XX16;
  }
  public void set_BSE_XX16(String BSE_XX16) {
    this.BSE_XX16 = BSE_XX16;
  }
  public f_Invoice with_BSE_XX16(String BSE_XX16) {
    this.BSE_XX16 = BSE_XX16;
    return this;
  }
  private String BSE_XX17;
  public String get_BSE_XX17() {
    return BSE_XX17;
  }
  public void set_BSE_XX17(String BSE_XX17) {
    this.BSE_XX17 = BSE_XX17;
  }
  public f_Invoice with_BSE_XX17(String BSE_XX17) {
    this.BSE_XX17 = BSE_XX17;
    return this;
  }
  private String BSE_XX18;
  public String get_BSE_XX18() {
    return BSE_XX18;
  }
  public void set_BSE_XX18(String BSE_XX18) {
    this.BSE_XX18 = BSE_XX18;
  }
  public f_Invoice with_BSE_XX18(String BSE_XX18) {
    this.BSE_XX18 = BSE_XX18;
    return this;
  }
  private String BSE_XX19;
  public String get_BSE_XX19() {
    return BSE_XX19;
  }
  public void set_BSE_XX19(String BSE_XX19) {
    this.BSE_XX19 = BSE_XX19;
  }
  public f_Invoice with_BSE_XX19(String BSE_XX19) {
    this.BSE_XX19 = BSE_XX19;
    return this;
  }
  private String BSE_XX20;
  public String get_BSE_XX20() {
    return BSE_XX20;
  }
  public void set_BSE_XX20(String BSE_XX20) {
    this.BSE_XX20 = BSE_XX20;
  }
  public f_Invoice with_BSE_XX20(String BSE_XX20) {
    this.BSE_XX20 = BSE_XX20;
    return this;
  }
  private String BSE_XX21;
  public String get_BSE_XX21() {
    return BSE_XX21;
  }
  public void set_BSE_XX21(String BSE_XX21) {
    this.BSE_XX21 = BSE_XX21;
  }
  public f_Invoice with_BSE_XX21(String BSE_XX21) {
    this.BSE_XX21 = BSE_XX21;
    return this;
  }
  private String BSE_XX22;
  public String get_BSE_XX22() {
    return BSE_XX22;
  }
  public void set_BSE_XX22(String BSE_XX22) {
    this.BSE_XX22 = BSE_XX22;
  }
  public f_Invoice with_BSE_XX22(String BSE_XX22) {
    this.BSE_XX22 = BSE_XX22;
    return this;
  }
  private String BSE_XX23;
  public String get_BSE_XX23() {
    return BSE_XX23;
  }
  public void set_BSE_XX23(String BSE_XX23) {
    this.BSE_XX23 = BSE_XX23;
  }
  public f_Invoice with_BSE_XX23(String BSE_XX23) {
    this.BSE_XX23 = BSE_XX23;
    return this;
  }
  private String BSE_XX24;
  public String get_BSE_XX24() {
    return BSE_XX24;
  }
  public void set_BSE_XX24(String BSE_XX24) {
    this.BSE_XX24 = BSE_XX24;
  }
  public f_Invoice with_BSE_XX24(String BSE_XX24) {
    this.BSE_XX24 = BSE_XX24;
    return this;
  }
  private String BSE_XX25;
  public String get_BSE_XX25() {
    return BSE_XX25;
  }
  public void set_BSE_XX25(String BSE_XX25) {
    this.BSE_XX25 = BSE_XX25;
  }
  public f_Invoice with_BSE_XX25(String BSE_XX25) {
    this.BSE_XX25 = BSE_XX25;
    return this;
  }
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (!(o instanceof f_Invoice)) {
      return false;
    }
    f_Invoice that = (f_Invoice) o;
    boolean equal = true;
    equal = equal && (this.Item_id == null ? that.Item_id == null : this.Item_id.equals(that.Item_id));
    equal = equal && (this.Vendor_id == null ? that.Vendor_id == null : this.Vendor_id.equals(that.Vendor_id));
    equal = equal && (this.Date_id == null ? that.Date_id == null : this.Date_id.equals(that.Date_id));
    equal = equal && (this.inv_fact1 == null ? that.inv_fact1 == null : this.inv_fact1.equals(that.inv_fact1));
    equal = equal && (this.inv_fact2 == null ? that.inv_fact2 == null : this.inv_fact2.equals(that.inv_fact2));
    equal = equal && (this.inv_fact3 == null ? that.inv_fact3 == null : this.inv_fact3.equals(that.inv_fact3));
    equal = equal && (this.inv_fact4 == null ? that.inv_fact4 == null : this.inv_fact4.equals(that.inv_fact4));
    equal = equal && (this.BSE_XX5 == null ? that.BSE_XX5 == null : this.BSE_XX5.equals(that.BSE_XX5));
    equal = equal && (this.BSE_XX6 == null ? that.BSE_XX6 == null : this.BSE_XX6.equals(that.BSE_XX6));
    equal = equal && (this.BSE_XX7 == null ? that.BSE_XX7 == null : this.BSE_XX7.equals(that.BSE_XX7));
    equal = equal && (this.BSE_XX8 == null ? that.BSE_XX8 == null : this.BSE_XX8.equals(that.BSE_XX8));
    equal = equal && (this.BSE_XX9 == null ? that.BSE_XX9 == null : this.BSE_XX9.equals(that.BSE_XX9));
    equal = equal && (this.BSE_XX10 == null ? that.BSE_XX10 == null : this.BSE_XX10.equals(that.BSE_XX10));
    equal = equal && (this.BSE_XX11 == null ? that.BSE_XX11 == null : this.BSE_XX11.equals(that.BSE_XX11));
    equal = equal && (this.BSE_XX12 == null ? that.BSE_XX12 == null : this.BSE_XX12.equals(that.BSE_XX12));
    equal = equal && (this.BSE_XX13 == null ? that.BSE_XX13 == null : this.BSE_XX13.equals(that.BSE_XX13));
    equal = equal && (this.BSE_XX14 == null ? that.BSE_XX14 == null : this.BSE_XX14.equals(that.BSE_XX14));
    equal = equal && (this.BSE_XX15 == null ? that.BSE_XX15 == null : this.BSE_XX15.equals(that.BSE_XX15));
    equal = equal && (this.BSE_XX16 == null ? that.BSE_XX16 == null : this.BSE_XX16.equals(that.BSE_XX16));
    equal = equal && (this.BSE_XX17 == null ? that.BSE_XX17 == null : this.BSE_XX17.equals(that.BSE_XX17));
    equal = equal && (this.BSE_XX18 == null ? that.BSE_XX18 == null : this.BSE_XX18.equals(that.BSE_XX18));
    equal = equal && (this.BSE_XX19 == null ? that.BSE_XX19 == null : this.BSE_XX19.equals(that.BSE_XX19));
    equal = equal && (this.BSE_XX20 == null ? that.BSE_XX20 == null : this.BSE_XX20.equals(that.BSE_XX20));
    equal = equal && (this.BSE_XX21 == null ? that.BSE_XX21 == null : this.BSE_XX21.equals(that.BSE_XX21));
    equal = equal && (this.BSE_XX22 == null ? that.BSE_XX22 == null : this.BSE_XX22.equals(that.BSE_XX22));
    equal = equal && (this.BSE_XX23 == null ? that.BSE_XX23 == null : this.BSE_XX23.equals(that.BSE_XX23));
    equal = equal && (this.BSE_XX24 == null ? that.BSE_XX24 == null : this.BSE_XX24.equals(that.BSE_XX24));
    equal = equal && (this.BSE_XX25 == null ? that.BSE_XX25 == null : this.BSE_XX25.equals(that.BSE_XX25));
    return equal;
  }
  public boolean equals0(Object o) {
    if (this == o) {
      return true;
    }
    if (!(o instanceof f_Invoice)) {
      return false;
    }
    f_Invoice that = (f_Invoice) o;
    boolean equal = true;
    equal = equal && (this.Item_id == null ? that.Item_id == null : this.Item_id.equals(that.Item_id));
    equal = equal && (this.Vendor_id == null ? that.Vendor_id == null : this.Vendor_id.equals(that.Vendor_id));
    equal = equal && (this.Date_id == null ? that.Date_id == null : this.Date_id.equals(that.Date_id));
    equal = equal && (this.inv_fact1 == null ? that.inv_fact1 == null : this.inv_fact1.equals(that.inv_fact1));
    equal = equal && (this.inv_fact2 == null ? that.inv_fact2 == null : this.inv_fact2.equals(that.inv_fact2));
    equal = equal && (this.inv_fact3 == null ? that.inv_fact3 == null : this.inv_fact3.equals(that.inv_fact3));
    equal = equal && (this.inv_fact4 == null ? that.inv_fact4 == null : this.inv_fact4.equals(that.inv_fact4));
    equal = equal && (this.BSE_XX5 == null ? that.BSE_XX5 == null : this.BSE_XX5.equals(that.BSE_XX5));
    equal = equal && (this.BSE_XX6 == null ? that.BSE_XX6 == null : this.BSE_XX6.equals(that.BSE_XX6));
    equal = equal && (this.BSE_XX7 == null ? that.BSE_XX7 == null : this.BSE_XX7.equals(that.BSE_XX7));
    equal = equal && (this.BSE_XX8 == null ? that.BSE_XX8 == null : this.BSE_XX8.equals(that.BSE_XX8));
    equal = equal && (this.BSE_XX9 == null ? that.BSE_XX9 == null : this.BSE_XX9.equals(that.BSE_XX9));
    equal = equal && (this.BSE_XX10 == null ? that.BSE_XX10 == null : this.BSE_XX10.equals(that.BSE_XX10));
    equal = equal && (this.BSE_XX11 == null ? that.BSE_XX11 == null : this.BSE_XX11.equals(that.BSE_XX11));
    equal = equal && (this.BSE_XX12 == null ? that.BSE_XX12 == null : this.BSE_XX12.equals(that.BSE_XX12));
    equal = equal && (this.BSE_XX13 == null ? that.BSE_XX13 == null : this.BSE_XX13.equals(that.BSE_XX13));
    equal = equal && (this.BSE_XX14 == null ? that.BSE_XX14 == null : this.BSE_XX14.equals(that.BSE_XX14));
    equal = equal && (this.BSE_XX15 == null ? that.BSE_XX15 == null : this.BSE_XX15.equals(that.BSE_XX15));
    equal = equal && (this.BSE_XX16 == null ? that.BSE_XX16 == null : this.BSE_XX16.equals(that.BSE_XX16));
    equal = equal && (this.BSE_XX17 == null ? that.BSE_XX17 == null : this.BSE_XX17.equals(that.BSE_XX17));
    equal = equal && (this.BSE_XX18 == null ? that.BSE_XX18 == null : this.BSE_XX18.equals(that.BSE_XX18));
    equal = equal && (this.BSE_XX19 == null ? that.BSE_XX19 == null : this.BSE_XX19.equals(that.BSE_XX19));
    equal = equal && (this.BSE_XX20 == null ? that.BSE_XX20 == null : this.BSE_XX20.equals(that.BSE_XX20));
    equal = equal && (this.BSE_XX21 == null ? that.BSE_XX21 == null : this.BSE_XX21.equals(that.BSE_XX21));
    equal = equal && (this.BSE_XX22 == null ? that.BSE_XX22 == null : this.BSE_XX22.equals(that.BSE_XX22));
    equal = equal && (this.BSE_XX23 == null ? that.BSE_XX23 == null : this.BSE_XX23.equals(that.BSE_XX23));
    equal = equal && (this.BSE_XX24 == null ? that.BSE_XX24 == null : this.BSE_XX24.equals(that.BSE_XX24));
    equal = equal && (this.BSE_XX25 == null ? that.BSE_XX25 == null : this.BSE_XX25.equals(that.BSE_XX25));
    return equal;
  }
  public void readFields(ResultSet __dbResults) throws SQLException {
    this.__cur_result_set = __dbResults;
    this.Item_id = JdbcWritableBridge.readInteger(1, __dbResults);
    this.Vendor_id = JdbcWritableBridge.readInteger(2, __dbResults);
    this.Date_id = JdbcWritableBridge.readInteger(3, __dbResults);
    this.inv_fact1 = JdbcWritableBridge.readDouble(4, __dbResults);
    this.inv_fact2 = JdbcWritableBridge.readDouble(5, __dbResults);
    this.inv_fact3 = JdbcWritableBridge.readDouble(6, __dbResults);
    this.inv_fact4 = JdbcWritableBridge.readDouble(7, __dbResults);
    this.BSE_XX5 = JdbcWritableBridge.readString(8, __dbResults);
    this.BSE_XX6 = JdbcWritableBridge.readString(9, __dbResults);
    this.BSE_XX7 = JdbcWritableBridge.readString(10, __dbResults);
    this.BSE_XX8 = JdbcWritableBridge.readString(11, __dbResults);
    this.BSE_XX9 = JdbcWritableBridge.readString(12, __dbResults);
    this.BSE_XX10 = JdbcWritableBridge.readString(13, __dbResults);
    this.BSE_XX11 = JdbcWritableBridge.readString(14, __dbResults);
    this.BSE_XX12 = JdbcWritableBridge.readString(15, __dbResults);
    this.BSE_XX13 = JdbcWritableBridge.readString(16, __dbResults);
    this.BSE_XX14 = JdbcWritableBridge.readString(17, __dbResults);
    this.BSE_XX15 = JdbcWritableBridge.readString(18, __dbResults);
    this.BSE_XX16 = JdbcWritableBridge.readString(19, __dbResults);
    this.BSE_XX17 = JdbcWritableBridge.readString(20, __dbResults);
    this.BSE_XX18 = JdbcWritableBridge.readString(21, __dbResults);
    this.BSE_XX19 = JdbcWritableBridge.readString(22, __dbResults);
    this.BSE_XX20 = JdbcWritableBridge.readString(23, __dbResults);
    this.BSE_XX21 = JdbcWritableBridge.readString(24, __dbResults);
    this.BSE_XX22 = JdbcWritableBridge.readString(25, __dbResults);
    this.BSE_XX23 = JdbcWritableBridge.readString(26, __dbResults);
    this.BSE_XX24 = JdbcWritableBridge.readString(27, __dbResults);
    this.BSE_XX25 = JdbcWritableBridge.readString(28, __dbResults);
  }
  public void readFields0(ResultSet __dbResults) throws SQLException {
    this.Item_id = JdbcWritableBridge.readInteger(1, __dbResults);
    this.Vendor_id = JdbcWritableBridge.readInteger(2, __dbResults);
    this.Date_id = JdbcWritableBridge.readInteger(3, __dbResults);
    this.inv_fact1 = JdbcWritableBridge.readDouble(4, __dbResults);
    this.inv_fact2 = JdbcWritableBridge.readDouble(5, __dbResults);
    this.inv_fact3 = JdbcWritableBridge.readDouble(6, __dbResults);
    this.inv_fact4 = JdbcWritableBridge.readDouble(7, __dbResults);
    this.BSE_XX5 = JdbcWritableBridge.readString(8, __dbResults);
    this.BSE_XX6 = JdbcWritableBridge.readString(9, __dbResults);
    this.BSE_XX7 = JdbcWritableBridge.readString(10, __dbResults);
    this.BSE_XX8 = JdbcWritableBridge.readString(11, __dbResults);
    this.BSE_XX9 = JdbcWritableBridge.readString(12, __dbResults);
    this.BSE_XX10 = JdbcWritableBridge.readString(13, __dbResults);
    this.BSE_XX11 = JdbcWritableBridge.readString(14, __dbResults);
    this.BSE_XX12 = JdbcWritableBridge.readString(15, __dbResults);
    this.BSE_XX13 = JdbcWritableBridge.readString(16, __dbResults);
    this.BSE_XX14 = JdbcWritableBridge.readString(17, __dbResults);
    this.BSE_XX15 = JdbcWritableBridge.readString(18, __dbResults);
    this.BSE_XX16 = JdbcWritableBridge.readString(19, __dbResults);
    this.BSE_XX17 = JdbcWritableBridge.readString(20, __dbResults);
    this.BSE_XX18 = JdbcWritableBridge.readString(21, __dbResults);
    this.BSE_XX19 = JdbcWritableBridge.readString(22, __dbResults);
    this.BSE_XX20 = JdbcWritableBridge.readString(23, __dbResults);
    this.BSE_XX21 = JdbcWritableBridge.readString(24, __dbResults);
    this.BSE_XX22 = JdbcWritableBridge.readString(25, __dbResults);
    this.BSE_XX23 = JdbcWritableBridge.readString(26, __dbResults);
    this.BSE_XX24 = JdbcWritableBridge.readString(27, __dbResults);
    this.BSE_XX25 = JdbcWritableBridge.readString(28, __dbResults);
  }
  public void loadLargeObjects(LargeObjectLoader __loader)
      throws SQLException, IOException, InterruptedException {
  }
  public void loadLargeObjects0(LargeObjectLoader __loader)
      throws SQLException, IOException, InterruptedException {
  }
  public void write(PreparedStatement __dbStmt) throws SQLException {
    write(__dbStmt, 0);
  }

  public int write(PreparedStatement __dbStmt, int __off) throws SQLException {
    JdbcWritableBridge.writeInteger(Item_id, 1 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeInteger(Vendor_id, 2 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeInteger(Date_id, 3 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeDouble(inv_fact1, 4 + __off, 8, __dbStmt);
    JdbcWritableBridge.writeDouble(inv_fact2, 5 + __off, 8, __dbStmt);
    JdbcWritableBridge.writeDouble(inv_fact3, 6 + __off, 8, __dbStmt);
    JdbcWritableBridge.writeDouble(inv_fact4, 7 + __off, 8, __dbStmt);
    JdbcWritableBridge.writeString(BSE_XX5, 8 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(BSE_XX6, 9 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(BSE_XX7, 10 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(BSE_XX8, 11 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(BSE_XX9, 12 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(BSE_XX10, 13 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(BSE_XX11, 14 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(BSE_XX12, 15 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(BSE_XX13, 16 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(BSE_XX14, 17 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(BSE_XX15, 18 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(BSE_XX16, 19 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(BSE_XX17, 20 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(BSE_XX18, 21 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(BSE_XX19, 22 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(BSE_XX20, 23 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(BSE_XX21, 24 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(BSE_XX22, 25 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(BSE_XX23, 26 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(BSE_XX24, 27 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(BSE_XX25, 28 + __off, 12, __dbStmt);
    return 28;
  }
  public void write0(PreparedStatement __dbStmt, int __off) throws SQLException {
    JdbcWritableBridge.writeInteger(Item_id, 1 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeInteger(Vendor_id, 2 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeInteger(Date_id, 3 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeDouble(inv_fact1, 4 + __off, 8, __dbStmt);
    JdbcWritableBridge.writeDouble(inv_fact2, 5 + __off, 8, __dbStmt);
    JdbcWritableBridge.writeDouble(inv_fact3, 6 + __off, 8, __dbStmt);
    JdbcWritableBridge.writeDouble(inv_fact4, 7 + __off, 8, __dbStmt);
    JdbcWritableBridge.writeString(BSE_XX5, 8 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(BSE_XX6, 9 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(BSE_XX7, 10 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(BSE_XX8, 11 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(BSE_XX9, 12 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(BSE_XX10, 13 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(BSE_XX11, 14 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(BSE_XX12, 15 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(BSE_XX13, 16 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(BSE_XX14, 17 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(BSE_XX15, 18 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(BSE_XX16, 19 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(BSE_XX17, 20 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(BSE_XX18, 21 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(BSE_XX19, 22 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(BSE_XX20, 23 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(BSE_XX21, 24 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(BSE_XX22, 25 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(BSE_XX23, 26 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(BSE_XX24, 27 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(BSE_XX25, 28 + __off, 12, __dbStmt);
  }
  public void readFields(DataInput __dataIn) throws IOException {
this.readFields0(__dataIn);  }
  public void readFields0(DataInput __dataIn) throws IOException {
    if (__dataIn.readBoolean()) { 
        this.Item_id = null;
    } else {
    this.Item_id = Integer.valueOf(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.Vendor_id = null;
    } else {
    this.Vendor_id = Integer.valueOf(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.Date_id = null;
    } else {
    this.Date_id = Integer.valueOf(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.inv_fact1 = null;
    } else {
    this.inv_fact1 = Double.valueOf(__dataIn.readDouble());
    }
    if (__dataIn.readBoolean()) { 
        this.inv_fact2 = null;
    } else {
    this.inv_fact2 = Double.valueOf(__dataIn.readDouble());
    }
    if (__dataIn.readBoolean()) { 
        this.inv_fact3 = null;
    } else {
    this.inv_fact3 = Double.valueOf(__dataIn.readDouble());
    }
    if (__dataIn.readBoolean()) { 
        this.inv_fact4 = null;
    } else {
    this.inv_fact4 = Double.valueOf(__dataIn.readDouble());
    }
    if (__dataIn.readBoolean()) { 
        this.BSE_XX5 = null;
    } else {
    this.BSE_XX5 = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.BSE_XX6 = null;
    } else {
    this.BSE_XX6 = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.BSE_XX7 = null;
    } else {
    this.BSE_XX7 = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.BSE_XX8 = null;
    } else {
    this.BSE_XX8 = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.BSE_XX9 = null;
    } else {
    this.BSE_XX9 = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.BSE_XX10 = null;
    } else {
    this.BSE_XX10 = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.BSE_XX11 = null;
    } else {
    this.BSE_XX11 = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.BSE_XX12 = null;
    } else {
    this.BSE_XX12 = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.BSE_XX13 = null;
    } else {
    this.BSE_XX13 = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.BSE_XX14 = null;
    } else {
    this.BSE_XX14 = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.BSE_XX15 = null;
    } else {
    this.BSE_XX15 = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.BSE_XX16 = null;
    } else {
    this.BSE_XX16 = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.BSE_XX17 = null;
    } else {
    this.BSE_XX17 = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.BSE_XX18 = null;
    } else {
    this.BSE_XX18 = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.BSE_XX19 = null;
    } else {
    this.BSE_XX19 = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.BSE_XX20 = null;
    } else {
    this.BSE_XX20 = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.BSE_XX21 = null;
    } else {
    this.BSE_XX21 = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.BSE_XX22 = null;
    } else {
    this.BSE_XX22 = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.BSE_XX23 = null;
    } else {
    this.BSE_XX23 = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.BSE_XX24 = null;
    } else {
    this.BSE_XX24 = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.BSE_XX25 = null;
    } else {
    this.BSE_XX25 = Text.readString(__dataIn);
    }
  }
  public void write(DataOutput __dataOut) throws IOException {
    if (null == this.Item_id) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.Item_id);
    }
    if (null == this.Vendor_id) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.Vendor_id);
    }
    if (null == this.Date_id) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.Date_id);
    }
    if (null == this.inv_fact1) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeDouble(this.inv_fact1);
    }
    if (null == this.inv_fact2) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeDouble(this.inv_fact2);
    }
    if (null == this.inv_fact3) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeDouble(this.inv_fact3);
    }
    if (null == this.inv_fact4) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeDouble(this.inv_fact4);
    }
    if (null == this.BSE_XX5) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, BSE_XX5);
    }
    if (null == this.BSE_XX6) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, BSE_XX6);
    }
    if (null == this.BSE_XX7) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, BSE_XX7);
    }
    if (null == this.BSE_XX8) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, BSE_XX8);
    }
    if (null == this.BSE_XX9) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, BSE_XX9);
    }
    if (null == this.BSE_XX10) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, BSE_XX10);
    }
    if (null == this.BSE_XX11) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, BSE_XX11);
    }
    if (null == this.BSE_XX12) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, BSE_XX12);
    }
    if (null == this.BSE_XX13) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, BSE_XX13);
    }
    if (null == this.BSE_XX14) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, BSE_XX14);
    }
    if (null == this.BSE_XX15) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, BSE_XX15);
    }
    if (null == this.BSE_XX16) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, BSE_XX16);
    }
    if (null == this.BSE_XX17) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, BSE_XX17);
    }
    if (null == this.BSE_XX18) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, BSE_XX18);
    }
    if (null == this.BSE_XX19) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, BSE_XX19);
    }
    if (null == this.BSE_XX20) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, BSE_XX20);
    }
    if (null == this.BSE_XX21) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, BSE_XX21);
    }
    if (null == this.BSE_XX22) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, BSE_XX22);
    }
    if (null == this.BSE_XX23) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, BSE_XX23);
    }
    if (null == this.BSE_XX24) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, BSE_XX24);
    }
    if (null == this.BSE_XX25) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, BSE_XX25);
    }
  }
  public void write0(DataOutput __dataOut) throws IOException {
    if (null == this.Item_id) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.Item_id);
    }
    if (null == this.Vendor_id) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.Vendor_id);
    }
    if (null == this.Date_id) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.Date_id);
    }
    if (null == this.inv_fact1) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeDouble(this.inv_fact1);
    }
    if (null == this.inv_fact2) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeDouble(this.inv_fact2);
    }
    if (null == this.inv_fact3) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeDouble(this.inv_fact3);
    }
    if (null == this.inv_fact4) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeDouble(this.inv_fact4);
    }
    if (null == this.BSE_XX5) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, BSE_XX5);
    }
    if (null == this.BSE_XX6) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, BSE_XX6);
    }
    if (null == this.BSE_XX7) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, BSE_XX7);
    }
    if (null == this.BSE_XX8) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, BSE_XX8);
    }
    if (null == this.BSE_XX9) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, BSE_XX9);
    }
    if (null == this.BSE_XX10) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, BSE_XX10);
    }
    if (null == this.BSE_XX11) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, BSE_XX11);
    }
    if (null == this.BSE_XX12) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, BSE_XX12);
    }
    if (null == this.BSE_XX13) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, BSE_XX13);
    }
    if (null == this.BSE_XX14) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, BSE_XX14);
    }
    if (null == this.BSE_XX15) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, BSE_XX15);
    }
    if (null == this.BSE_XX16) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, BSE_XX16);
    }
    if (null == this.BSE_XX17) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, BSE_XX17);
    }
    if (null == this.BSE_XX18) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, BSE_XX18);
    }
    if (null == this.BSE_XX19) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, BSE_XX19);
    }
    if (null == this.BSE_XX20) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, BSE_XX20);
    }
    if (null == this.BSE_XX21) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, BSE_XX21);
    }
    if (null == this.BSE_XX22) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, BSE_XX22);
    }
    if (null == this.BSE_XX23) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, BSE_XX23);
    }
    if (null == this.BSE_XX24) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, BSE_XX24);
    }
    if (null == this.BSE_XX25) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, BSE_XX25);
    }
  }
  private static final DelimiterSet __outputDelimiters = new DelimiterSet((char) 44, (char) 10, (char) 0, (char) 0, false);
  public String toString() {
    return toString(__outputDelimiters, true);
  }
  public String toString(DelimiterSet delimiters) {
    return toString(delimiters, true);
  }
  public String toString(boolean useRecordDelim) {
    return toString(__outputDelimiters, useRecordDelim);
  }
  public String toString(DelimiterSet delimiters, boolean useRecordDelim) {
    StringBuilder __sb = new StringBuilder();
    char fieldDelim = delimiters.getFieldsTerminatedBy();
    __sb.append(FieldFormatter.escapeAndEnclose(Item_id==null?"null":"" + Item_id, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(Vendor_id==null?"null":"" + Vendor_id, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(Date_id==null?"null":"" + Date_id, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(inv_fact1==null?"null":"" + inv_fact1, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(inv_fact2==null?"null":"" + inv_fact2, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(inv_fact3==null?"null":"" + inv_fact3, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(inv_fact4==null?"null":"" + inv_fact4, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(BSE_XX5==null?"null":BSE_XX5, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(BSE_XX6==null?"null":BSE_XX6, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(BSE_XX7==null?"null":BSE_XX7, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(BSE_XX8==null?"null":BSE_XX8, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(BSE_XX9==null?"null":BSE_XX9, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(BSE_XX10==null?"null":BSE_XX10, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(BSE_XX11==null?"null":BSE_XX11, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(BSE_XX12==null?"null":BSE_XX12, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(BSE_XX13==null?"null":BSE_XX13, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(BSE_XX14==null?"null":BSE_XX14, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(BSE_XX15==null?"null":BSE_XX15, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(BSE_XX16==null?"null":BSE_XX16, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(BSE_XX17==null?"null":BSE_XX17, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(BSE_XX18==null?"null":BSE_XX18, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(BSE_XX19==null?"null":BSE_XX19, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(BSE_XX20==null?"null":BSE_XX20, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(BSE_XX21==null?"null":BSE_XX21, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(BSE_XX22==null?"null":BSE_XX22, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(BSE_XX23==null?"null":BSE_XX23, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(BSE_XX24==null?"null":BSE_XX24, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(BSE_XX25==null?"null":BSE_XX25, delimiters));
    if (useRecordDelim) {
      __sb.append(delimiters.getLinesTerminatedBy());
    }
    return __sb.toString();
  }
  public void toString0(DelimiterSet delimiters, StringBuilder __sb, char fieldDelim) {
    __sb.append(FieldFormatter.escapeAndEnclose(Item_id==null?"null":"" + Item_id, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(Vendor_id==null?"null":"" + Vendor_id, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(Date_id==null?"null":"" + Date_id, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(inv_fact1==null?"null":"" + inv_fact1, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(inv_fact2==null?"null":"" + inv_fact2, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(inv_fact3==null?"null":"" + inv_fact3, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(inv_fact4==null?"null":"" + inv_fact4, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(BSE_XX5==null?"null":BSE_XX5, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(BSE_XX6==null?"null":BSE_XX6, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(BSE_XX7==null?"null":BSE_XX7, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(BSE_XX8==null?"null":BSE_XX8, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(BSE_XX9==null?"null":BSE_XX9, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(BSE_XX10==null?"null":BSE_XX10, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(BSE_XX11==null?"null":BSE_XX11, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(BSE_XX12==null?"null":BSE_XX12, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(BSE_XX13==null?"null":BSE_XX13, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(BSE_XX14==null?"null":BSE_XX14, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(BSE_XX15==null?"null":BSE_XX15, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(BSE_XX16==null?"null":BSE_XX16, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(BSE_XX17==null?"null":BSE_XX17, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(BSE_XX18==null?"null":BSE_XX18, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(BSE_XX19==null?"null":BSE_XX19, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(BSE_XX20==null?"null":BSE_XX20, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(BSE_XX21==null?"null":BSE_XX21, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(BSE_XX22==null?"null":BSE_XX22, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(BSE_XX23==null?"null":BSE_XX23, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(BSE_XX24==null?"null":BSE_XX24, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(BSE_XX25==null?"null":BSE_XX25, delimiters));
  }
  private static final DelimiterSet __inputDelimiters = new DelimiterSet((char) 44, (char) 10, (char) 0, (char) 0, false);
  private RecordParser __parser;
  public void parse(Text __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(CharSequence __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(byte [] __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(char [] __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(ByteBuffer __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(CharBuffer __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  private void __loadFromFields(List<String> fields) {
    Iterator<String> __it = fields.listIterator();
    String __cur_str = null;
    try {
    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.Item_id = null; } else {
      this.Item_id = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.Vendor_id = null; } else {
      this.Vendor_id = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.Date_id = null; } else {
      this.Date_id = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.inv_fact1 = null; } else {
      this.inv_fact1 = Double.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.inv_fact2 = null; } else {
      this.inv_fact2 = Double.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.inv_fact3 = null; } else {
      this.inv_fact3 = Double.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.inv_fact4 = null; } else {
      this.inv_fact4 = Double.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.BSE_XX5 = null; } else {
      this.BSE_XX5 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.BSE_XX6 = null; } else {
      this.BSE_XX6 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.BSE_XX7 = null; } else {
      this.BSE_XX7 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.BSE_XX8 = null; } else {
      this.BSE_XX8 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.BSE_XX9 = null; } else {
      this.BSE_XX9 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.BSE_XX10 = null; } else {
      this.BSE_XX10 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.BSE_XX11 = null; } else {
      this.BSE_XX11 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.BSE_XX12 = null; } else {
      this.BSE_XX12 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.BSE_XX13 = null; } else {
      this.BSE_XX13 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.BSE_XX14 = null; } else {
      this.BSE_XX14 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.BSE_XX15 = null; } else {
      this.BSE_XX15 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.BSE_XX16 = null; } else {
      this.BSE_XX16 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.BSE_XX17 = null; } else {
      this.BSE_XX17 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.BSE_XX18 = null; } else {
      this.BSE_XX18 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.BSE_XX19 = null; } else {
      this.BSE_XX19 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.BSE_XX20 = null; } else {
      this.BSE_XX20 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.BSE_XX21 = null; } else {
      this.BSE_XX21 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.BSE_XX22 = null; } else {
      this.BSE_XX22 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.BSE_XX23 = null; } else {
      this.BSE_XX23 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.BSE_XX24 = null; } else {
      this.BSE_XX24 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.BSE_XX25 = null; } else {
      this.BSE_XX25 = __cur_str;
    }

    } catch (RuntimeException e) {    throw new RuntimeException("Can't parse input data: '" + __cur_str + "'", e);    }  }

  private void __loadFromFields0(Iterator<String> __it) {
    String __cur_str = null;
    try {
    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.Item_id = null; } else {
      this.Item_id = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.Vendor_id = null; } else {
      this.Vendor_id = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.Date_id = null; } else {
      this.Date_id = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.inv_fact1 = null; } else {
      this.inv_fact1 = Double.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.inv_fact2 = null; } else {
      this.inv_fact2 = Double.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.inv_fact3 = null; } else {
      this.inv_fact3 = Double.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.inv_fact4 = null; } else {
      this.inv_fact4 = Double.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.BSE_XX5 = null; } else {
      this.BSE_XX5 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.BSE_XX6 = null; } else {
      this.BSE_XX6 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.BSE_XX7 = null; } else {
      this.BSE_XX7 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.BSE_XX8 = null; } else {
      this.BSE_XX8 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.BSE_XX9 = null; } else {
      this.BSE_XX9 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.BSE_XX10 = null; } else {
      this.BSE_XX10 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.BSE_XX11 = null; } else {
      this.BSE_XX11 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.BSE_XX12 = null; } else {
      this.BSE_XX12 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.BSE_XX13 = null; } else {
      this.BSE_XX13 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.BSE_XX14 = null; } else {
      this.BSE_XX14 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.BSE_XX15 = null; } else {
      this.BSE_XX15 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.BSE_XX16 = null; } else {
      this.BSE_XX16 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.BSE_XX17 = null; } else {
      this.BSE_XX17 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.BSE_XX18 = null; } else {
      this.BSE_XX18 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.BSE_XX19 = null; } else {
      this.BSE_XX19 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.BSE_XX20 = null; } else {
      this.BSE_XX20 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.BSE_XX21 = null; } else {
      this.BSE_XX21 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.BSE_XX22 = null; } else {
      this.BSE_XX22 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.BSE_XX23 = null; } else {
      this.BSE_XX23 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.BSE_XX24 = null; } else {
      this.BSE_XX24 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.BSE_XX25 = null; } else {
      this.BSE_XX25 = __cur_str;
    }

    } catch (RuntimeException e) {    throw new RuntimeException("Can't parse input data: '" + __cur_str + "'", e);    }  }

  public Object clone() throws CloneNotSupportedException {
    f_Invoice o = (f_Invoice) super.clone();
    return o;
  }

  public void clone0(f_Invoice o) throws CloneNotSupportedException {
  }

  public Map<String, Object> getFieldMap() {
    Map<String, Object> __sqoop$field_map = new TreeMap<String, Object>();
    __sqoop$field_map.put("Item_id", this.Item_id);
    __sqoop$field_map.put("Vendor_id", this.Vendor_id);
    __sqoop$field_map.put("Date_id", this.Date_id);
    __sqoop$field_map.put("inv_fact1", this.inv_fact1);
    __sqoop$field_map.put("inv_fact2", this.inv_fact2);
    __sqoop$field_map.put("inv_fact3", this.inv_fact3);
    __sqoop$field_map.put("inv_fact4", this.inv_fact4);
    __sqoop$field_map.put("BSE_XX5", this.BSE_XX5);
    __sqoop$field_map.put("BSE_XX6", this.BSE_XX6);
    __sqoop$field_map.put("BSE_XX7", this.BSE_XX7);
    __sqoop$field_map.put("BSE_XX8", this.BSE_XX8);
    __sqoop$field_map.put("BSE_XX9", this.BSE_XX9);
    __sqoop$field_map.put("BSE_XX10", this.BSE_XX10);
    __sqoop$field_map.put("BSE_XX11", this.BSE_XX11);
    __sqoop$field_map.put("BSE_XX12", this.BSE_XX12);
    __sqoop$field_map.put("BSE_XX13", this.BSE_XX13);
    __sqoop$field_map.put("BSE_XX14", this.BSE_XX14);
    __sqoop$field_map.put("BSE_XX15", this.BSE_XX15);
    __sqoop$field_map.put("BSE_XX16", this.BSE_XX16);
    __sqoop$field_map.put("BSE_XX17", this.BSE_XX17);
    __sqoop$field_map.put("BSE_XX18", this.BSE_XX18);
    __sqoop$field_map.put("BSE_XX19", this.BSE_XX19);
    __sqoop$field_map.put("BSE_XX20", this.BSE_XX20);
    __sqoop$field_map.put("BSE_XX21", this.BSE_XX21);
    __sqoop$field_map.put("BSE_XX22", this.BSE_XX22);
    __sqoop$field_map.put("BSE_XX23", this.BSE_XX23);
    __sqoop$field_map.put("BSE_XX24", this.BSE_XX24);
    __sqoop$field_map.put("BSE_XX25", this.BSE_XX25);
    return __sqoop$field_map;
  }

  public void getFieldMap0(Map<String, Object> __sqoop$field_map) {
    __sqoop$field_map.put("Item_id", this.Item_id);
    __sqoop$field_map.put("Vendor_id", this.Vendor_id);
    __sqoop$field_map.put("Date_id", this.Date_id);
    __sqoop$field_map.put("inv_fact1", this.inv_fact1);
    __sqoop$field_map.put("inv_fact2", this.inv_fact2);
    __sqoop$field_map.put("inv_fact3", this.inv_fact3);
    __sqoop$field_map.put("inv_fact4", this.inv_fact4);
    __sqoop$field_map.put("BSE_XX5", this.BSE_XX5);
    __sqoop$field_map.put("BSE_XX6", this.BSE_XX6);
    __sqoop$field_map.put("BSE_XX7", this.BSE_XX7);
    __sqoop$field_map.put("BSE_XX8", this.BSE_XX8);
    __sqoop$field_map.put("BSE_XX9", this.BSE_XX9);
    __sqoop$field_map.put("BSE_XX10", this.BSE_XX10);
    __sqoop$field_map.put("BSE_XX11", this.BSE_XX11);
    __sqoop$field_map.put("BSE_XX12", this.BSE_XX12);
    __sqoop$field_map.put("BSE_XX13", this.BSE_XX13);
    __sqoop$field_map.put("BSE_XX14", this.BSE_XX14);
    __sqoop$field_map.put("BSE_XX15", this.BSE_XX15);
    __sqoop$field_map.put("BSE_XX16", this.BSE_XX16);
    __sqoop$field_map.put("BSE_XX17", this.BSE_XX17);
    __sqoop$field_map.put("BSE_XX18", this.BSE_XX18);
    __sqoop$field_map.put("BSE_XX19", this.BSE_XX19);
    __sqoop$field_map.put("BSE_XX20", this.BSE_XX20);
    __sqoop$field_map.put("BSE_XX21", this.BSE_XX21);
    __sqoop$field_map.put("BSE_XX22", this.BSE_XX22);
    __sqoop$field_map.put("BSE_XX23", this.BSE_XX23);
    __sqoop$field_map.put("BSE_XX24", this.BSE_XX24);
    __sqoop$field_map.put("BSE_XX25", this.BSE_XX25);
  }

  public void setField(String __fieldName, Object __fieldVal) {
    if ("Item_id".equals(__fieldName)) {
      this.Item_id = (Integer) __fieldVal;
    }
    else    if ("Vendor_id".equals(__fieldName)) {
      this.Vendor_id = (Integer) __fieldVal;
    }
    else    if ("Date_id".equals(__fieldName)) {
      this.Date_id = (Integer) __fieldVal;
    }
    else    if ("inv_fact1".equals(__fieldName)) {
      this.inv_fact1 = (Double) __fieldVal;
    }
    else    if ("inv_fact2".equals(__fieldName)) {
      this.inv_fact2 = (Double) __fieldVal;
    }
    else    if ("inv_fact3".equals(__fieldName)) {
      this.inv_fact3 = (Double) __fieldVal;
    }
    else    if ("inv_fact4".equals(__fieldName)) {
      this.inv_fact4 = (Double) __fieldVal;
    }
    else    if ("BSE_XX5".equals(__fieldName)) {
      this.BSE_XX5 = (String) __fieldVal;
    }
    else    if ("BSE_XX6".equals(__fieldName)) {
      this.BSE_XX6 = (String) __fieldVal;
    }
    else    if ("BSE_XX7".equals(__fieldName)) {
      this.BSE_XX7 = (String) __fieldVal;
    }
    else    if ("BSE_XX8".equals(__fieldName)) {
      this.BSE_XX8 = (String) __fieldVal;
    }
    else    if ("BSE_XX9".equals(__fieldName)) {
      this.BSE_XX9 = (String) __fieldVal;
    }
    else    if ("BSE_XX10".equals(__fieldName)) {
      this.BSE_XX10 = (String) __fieldVal;
    }
    else    if ("BSE_XX11".equals(__fieldName)) {
      this.BSE_XX11 = (String) __fieldVal;
    }
    else    if ("BSE_XX12".equals(__fieldName)) {
      this.BSE_XX12 = (String) __fieldVal;
    }
    else    if ("BSE_XX13".equals(__fieldName)) {
      this.BSE_XX13 = (String) __fieldVal;
    }
    else    if ("BSE_XX14".equals(__fieldName)) {
      this.BSE_XX14 = (String) __fieldVal;
    }
    else    if ("BSE_XX15".equals(__fieldName)) {
      this.BSE_XX15 = (String) __fieldVal;
    }
    else    if ("BSE_XX16".equals(__fieldName)) {
      this.BSE_XX16 = (String) __fieldVal;
    }
    else    if ("BSE_XX17".equals(__fieldName)) {
      this.BSE_XX17 = (String) __fieldVal;
    }
    else    if ("BSE_XX18".equals(__fieldName)) {
      this.BSE_XX18 = (String) __fieldVal;
    }
    else    if ("BSE_XX19".equals(__fieldName)) {
      this.BSE_XX19 = (String) __fieldVal;
    }
    else    if ("BSE_XX20".equals(__fieldName)) {
      this.BSE_XX20 = (String) __fieldVal;
    }
    else    if ("BSE_XX21".equals(__fieldName)) {
      this.BSE_XX21 = (String) __fieldVal;
    }
    else    if ("BSE_XX22".equals(__fieldName)) {
      this.BSE_XX22 = (String) __fieldVal;
    }
    else    if ("BSE_XX23".equals(__fieldName)) {
      this.BSE_XX23 = (String) __fieldVal;
    }
    else    if ("BSE_XX24".equals(__fieldName)) {
      this.BSE_XX24 = (String) __fieldVal;
    }
    else    if ("BSE_XX25".equals(__fieldName)) {
      this.BSE_XX25 = (String) __fieldVal;
    }
    else {
      throw new RuntimeException("No such field: " + __fieldName);
    }
  }
  public boolean setField0(String __fieldName, Object __fieldVal) {
    if ("Item_id".equals(__fieldName)) {
      this.Item_id = (Integer) __fieldVal;
      return true;
    }
    else    if ("Vendor_id".equals(__fieldName)) {
      this.Vendor_id = (Integer) __fieldVal;
      return true;
    }
    else    if ("Date_id".equals(__fieldName)) {
      this.Date_id = (Integer) __fieldVal;
      return true;
    }
    else    if ("inv_fact1".equals(__fieldName)) {
      this.inv_fact1 = (Double) __fieldVal;
      return true;
    }
    else    if ("inv_fact2".equals(__fieldName)) {
      this.inv_fact2 = (Double) __fieldVal;
      return true;
    }
    else    if ("inv_fact3".equals(__fieldName)) {
      this.inv_fact3 = (Double) __fieldVal;
      return true;
    }
    else    if ("inv_fact4".equals(__fieldName)) {
      this.inv_fact4 = (Double) __fieldVal;
      return true;
    }
    else    if ("BSE_XX5".equals(__fieldName)) {
      this.BSE_XX5 = (String) __fieldVal;
      return true;
    }
    else    if ("BSE_XX6".equals(__fieldName)) {
      this.BSE_XX6 = (String) __fieldVal;
      return true;
    }
    else    if ("BSE_XX7".equals(__fieldName)) {
      this.BSE_XX7 = (String) __fieldVal;
      return true;
    }
    else    if ("BSE_XX8".equals(__fieldName)) {
      this.BSE_XX8 = (String) __fieldVal;
      return true;
    }
    else    if ("BSE_XX9".equals(__fieldName)) {
      this.BSE_XX9 = (String) __fieldVal;
      return true;
    }
    else    if ("BSE_XX10".equals(__fieldName)) {
      this.BSE_XX10 = (String) __fieldVal;
      return true;
    }
    else    if ("BSE_XX11".equals(__fieldName)) {
      this.BSE_XX11 = (String) __fieldVal;
      return true;
    }
    else    if ("BSE_XX12".equals(__fieldName)) {
      this.BSE_XX12 = (String) __fieldVal;
      return true;
    }
    else    if ("BSE_XX13".equals(__fieldName)) {
      this.BSE_XX13 = (String) __fieldVal;
      return true;
    }
    else    if ("BSE_XX14".equals(__fieldName)) {
      this.BSE_XX14 = (String) __fieldVal;
      return true;
    }
    else    if ("BSE_XX15".equals(__fieldName)) {
      this.BSE_XX15 = (String) __fieldVal;
      return true;
    }
    else    if ("BSE_XX16".equals(__fieldName)) {
      this.BSE_XX16 = (String) __fieldVal;
      return true;
    }
    else    if ("BSE_XX17".equals(__fieldName)) {
      this.BSE_XX17 = (String) __fieldVal;
      return true;
    }
    else    if ("BSE_XX18".equals(__fieldName)) {
      this.BSE_XX18 = (String) __fieldVal;
      return true;
    }
    else    if ("BSE_XX19".equals(__fieldName)) {
      this.BSE_XX19 = (String) __fieldVal;
      return true;
    }
    else    if ("BSE_XX20".equals(__fieldName)) {
      this.BSE_XX20 = (String) __fieldVal;
      return true;
    }
    else    if ("BSE_XX21".equals(__fieldName)) {
      this.BSE_XX21 = (String) __fieldVal;
      return true;
    }
    else    if ("BSE_XX22".equals(__fieldName)) {
      this.BSE_XX22 = (String) __fieldVal;
      return true;
    }
    else    if ("BSE_XX23".equals(__fieldName)) {
      this.BSE_XX23 = (String) __fieldVal;
      return true;
    }
    else    if ("BSE_XX24".equals(__fieldName)) {
      this.BSE_XX24 = (String) __fieldVal;
      return true;
    }
    else    if ("BSE_XX25".equals(__fieldName)) {
      this.BSE_XX25 = (String) __fieldVal;
      return true;
    }
    else {
      return false;    }
  }
}
