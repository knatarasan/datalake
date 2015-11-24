// ORM class for table 'd_Item'
// WARNING: This class is AUTO-GENERATED. Modify at your own risk.
//
// Debug information:
// Generated date: Tue Nov 24 10:50:06 PST 2015
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

public class d_Item extends SqoopRecord  implements DBWritable, Writable {
  private final int PROTOCOL_VERSION = 3;
  public int getClassFormatVersion() { return PROTOCOL_VERSION; }
  protected ResultSet __cur_result_set;
  private Integer item_id;
  public Integer get_item_id() {
    return item_id;
  }
  public void set_item_id(Integer item_id) {
    this.item_id = item_id;
  }
  public d_Item with_item_id(Integer item_id) {
    this.item_id = item_id;
    return this;
  }
  private String material_number;
  public String get_material_number() {
    return material_number;
  }
  public void set_material_number(String material_number) {
    this.material_number = material_number;
  }
  public d_Item with_material_number(String material_number) {
    this.material_number = material_number;
    return this;
  }
  private String material_type;
  public String get_material_type() {
    return material_type;
  }
  public void set_material_type(String material_type) {
    this.material_type = material_type;
  }
  public d_Item with_material_type(String material_type) {
    this.material_type = material_type;
    return this;
  }
  private String industry_sector;
  public String get_industry_sector() {
    return industry_sector;
  }
  public void set_industry_sector(String industry_sector) {
    this.industry_sector = industry_sector;
  }
  public d_Item with_industry_sector(String industry_sector) {
    this.industry_sector = industry_sector;
    return this;
  }
  private String material_group;
  public String get_material_group() {
    return material_group;
  }
  public void set_material_group(String material_group) {
    this.material_group = material_group;
  }
  public d_Item with_material_group(String material_group) {
    this.material_group = material_group;
    return this;
  }
  private String base_unit_of_measure;
  public String get_base_unit_of_measure() {
    return base_unit_of_measure;
  }
  public void set_base_unit_of_measure(String base_unit_of_measure) {
    this.base_unit_of_measure = base_unit_of_measure;
  }
  public d_Item with_base_unit_of_measure(String base_unit_of_measure) {
    this.base_unit_of_measure = base_unit_of_measure;
    return this;
  }
  private String order_unit;
  public String get_order_unit() {
    return order_unit;
  }
  public void set_order_unit(String order_unit) {
    this.order_unit = order_unit;
  }
  public d_Item with_order_unit(String order_unit) {
    this.order_unit = order_unit;
    return this;
  }
  private String material_xx1;
  public String get_material_xx1() {
    return material_xx1;
  }
  public void set_material_xx1(String material_xx1) {
    this.material_xx1 = material_xx1;
  }
  public d_Item with_material_xx1(String material_xx1) {
    this.material_xx1 = material_xx1;
    return this;
  }
  private String material_xx2;
  public String get_material_xx2() {
    return material_xx2;
  }
  public void set_material_xx2(String material_xx2) {
    this.material_xx2 = material_xx2;
  }
  public d_Item with_material_xx2(String material_xx2) {
    this.material_xx2 = material_xx2;
    return this;
  }
  private String material_xx3;
  public String get_material_xx3() {
    return material_xx3;
  }
  public void set_material_xx3(String material_xx3) {
    this.material_xx3 = material_xx3;
  }
  public d_Item with_material_xx3(String material_xx3) {
    this.material_xx3 = material_xx3;
    return this;
  }
  private String material_xx4;
  public String get_material_xx4() {
    return material_xx4;
  }
  public void set_material_xx4(String material_xx4) {
    this.material_xx4 = material_xx4;
  }
  public d_Item with_material_xx4(String material_xx4) {
    this.material_xx4 = material_xx4;
    return this;
  }
  private String material_xx5;
  public String get_material_xx5() {
    return material_xx5;
  }
  public void set_material_xx5(String material_xx5) {
    this.material_xx5 = material_xx5;
  }
  public d_Item with_material_xx5(String material_xx5) {
    this.material_xx5 = material_xx5;
    return this;
  }
  private String material_xx6;
  public String get_material_xx6() {
    return material_xx6;
  }
  public void set_material_xx6(String material_xx6) {
    this.material_xx6 = material_xx6;
  }
  public d_Item with_material_xx6(String material_xx6) {
    this.material_xx6 = material_xx6;
    return this;
  }
  private String material_xx7;
  public String get_material_xx7() {
    return material_xx7;
  }
  public void set_material_xx7(String material_xx7) {
    this.material_xx7 = material_xx7;
  }
  public d_Item with_material_xx7(String material_xx7) {
    this.material_xx7 = material_xx7;
    return this;
  }
  private String material_xx8;
  public String get_material_xx8() {
    return material_xx8;
  }
  public void set_material_xx8(String material_xx8) {
    this.material_xx8 = material_xx8;
  }
  public d_Item with_material_xx8(String material_xx8) {
    this.material_xx8 = material_xx8;
    return this;
  }
  private String material_xx9;
  public String get_material_xx9() {
    return material_xx9;
  }
  public void set_material_xx9(String material_xx9) {
    this.material_xx9 = material_xx9;
  }
  public d_Item with_material_xx9(String material_xx9) {
    this.material_xx9 = material_xx9;
    return this;
  }
  private String material_xx10;
  public String get_material_xx10() {
    return material_xx10;
  }
  public void set_material_xx10(String material_xx10) {
    this.material_xx10 = material_xx10;
  }
  public d_Item with_material_xx10(String material_xx10) {
    this.material_xx10 = material_xx10;
    return this;
  }
  private String material_xx11;
  public String get_material_xx11() {
    return material_xx11;
  }
  public void set_material_xx11(String material_xx11) {
    this.material_xx11 = material_xx11;
  }
  public d_Item with_material_xx11(String material_xx11) {
    this.material_xx11 = material_xx11;
    return this;
  }
  private String material_xx12;
  public String get_material_xx12() {
    return material_xx12;
  }
  public void set_material_xx12(String material_xx12) {
    this.material_xx12 = material_xx12;
  }
  public d_Item with_material_xx12(String material_xx12) {
    this.material_xx12 = material_xx12;
    return this;
  }
  private String material_xx13;
  public String get_material_xx13() {
    return material_xx13;
  }
  public void set_material_xx13(String material_xx13) {
    this.material_xx13 = material_xx13;
  }
  public d_Item with_material_xx13(String material_xx13) {
    this.material_xx13 = material_xx13;
    return this;
  }
  private String material_xx14;
  public String get_material_xx14() {
    return material_xx14;
  }
  public void set_material_xx14(String material_xx14) {
    this.material_xx14 = material_xx14;
  }
  public d_Item with_material_xx14(String material_xx14) {
    this.material_xx14 = material_xx14;
    return this;
  }
  private String material_xx15;
  public String get_material_xx15() {
    return material_xx15;
  }
  public void set_material_xx15(String material_xx15) {
    this.material_xx15 = material_xx15;
  }
  public d_Item with_material_xx15(String material_xx15) {
    this.material_xx15 = material_xx15;
    return this;
  }
  private String material_xx16;
  public String get_material_xx16() {
    return material_xx16;
  }
  public void set_material_xx16(String material_xx16) {
    this.material_xx16 = material_xx16;
  }
  public d_Item with_material_xx16(String material_xx16) {
    this.material_xx16 = material_xx16;
    return this;
  }
  private String material_xx17;
  public String get_material_xx17() {
    return material_xx17;
  }
  public void set_material_xx17(String material_xx17) {
    this.material_xx17 = material_xx17;
  }
  public d_Item with_material_xx17(String material_xx17) {
    this.material_xx17 = material_xx17;
    return this;
  }
  private String material_xx18;
  public String get_material_xx18() {
    return material_xx18;
  }
  public void set_material_xx18(String material_xx18) {
    this.material_xx18 = material_xx18;
  }
  public d_Item with_material_xx18(String material_xx18) {
    this.material_xx18 = material_xx18;
    return this;
  }
  private String material_xx19;
  public String get_material_xx19() {
    return material_xx19;
  }
  public void set_material_xx19(String material_xx19) {
    this.material_xx19 = material_xx19;
  }
  public d_Item with_material_xx19(String material_xx19) {
    this.material_xx19 = material_xx19;
    return this;
  }
  private String material_xx20;
  public String get_material_xx20() {
    return material_xx20;
  }
  public void set_material_xx20(String material_xx20) {
    this.material_xx20 = material_xx20;
  }
  public d_Item with_material_xx20(String material_xx20) {
    this.material_xx20 = material_xx20;
    return this;
  }
  private String material_xx21;
  public String get_material_xx21() {
    return material_xx21;
  }
  public void set_material_xx21(String material_xx21) {
    this.material_xx21 = material_xx21;
  }
  public d_Item with_material_xx21(String material_xx21) {
    this.material_xx21 = material_xx21;
    return this;
  }
  private java.sql.Date eff_from_date;
  public java.sql.Date get_eff_from_date() {
    return eff_from_date;
  }
  public void set_eff_from_date(java.sql.Date eff_from_date) {
    this.eff_from_date = eff_from_date;
  }
  public d_Item with_eff_from_date(java.sql.Date eff_from_date) {
    this.eff_from_date = eff_from_date;
    return this;
  }
  private java.sql.Date eff_to_date;
  public java.sql.Date get_eff_to_date() {
    return eff_to_date;
  }
  public void set_eff_to_date(java.sql.Date eff_to_date) {
    this.eff_to_date = eff_to_date;
  }
  public d_Item with_eff_to_date(java.sql.Date eff_to_date) {
    this.eff_to_date = eff_to_date;
    return this;
  }
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (!(o instanceof d_Item)) {
      return false;
    }
    d_Item that = (d_Item) o;
    boolean equal = true;
    equal = equal && (this.item_id == null ? that.item_id == null : this.item_id.equals(that.item_id));
    equal = equal && (this.material_number == null ? that.material_number == null : this.material_number.equals(that.material_number));
    equal = equal && (this.material_type == null ? that.material_type == null : this.material_type.equals(that.material_type));
    equal = equal && (this.industry_sector == null ? that.industry_sector == null : this.industry_sector.equals(that.industry_sector));
    equal = equal && (this.material_group == null ? that.material_group == null : this.material_group.equals(that.material_group));
    equal = equal && (this.base_unit_of_measure == null ? that.base_unit_of_measure == null : this.base_unit_of_measure.equals(that.base_unit_of_measure));
    equal = equal && (this.order_unit == null ? that.order_unit == null : this.order_unit.equals(that.order_unit));
    equal = equal && (this.material_xx1 == null ? that.material_xx1 == null : this.material_xx1.equals(that.material_xx1));
    equal = equal && (this.material_xx2 == null ? that.material_xx2 == null : this.material_xx2.equals(that.material_xx2));
    equal = equal && (this.material_xx3 == null ? that.material_xx3 == null : this.material_xx3.equals(that.material_xx3));
    equal = equal && (this.material_xx4 == null ? that.material_xx4 == null : this.material_xx4.equals(that.material_xx4));
    equal = equal && (this.material_xx5 == null ? that.material_xx5 == null : this.material_xx5.equals(that.material_xx5));
    equal = equal && (this.material_xx6 == null ? that.material_xx6 == null : this.material_xx6.equals(that.material_xx6));
    equal = equal && (this.material_xx7 == null ? that.material_xx7 == null : this.material_xx7.equals(that.material_xx7));
    equal = equal && (this.material_xx8 == null ? that.material_xx8 == null : this.material_xx8.equals(that.material_xx8));
    equal = equal && (this.material_xx9 == null ? that.material_xx9 == null : this.material_xx9.equals(that.material_xx9));
    equal = equal && (this.material_xx10 == null ? that.material_xx10 == null : this.material_xx10.equals(that.material_xx10));
    equal = equal && (this.material_xx11 == null ? that.material_xx11 == null : this.material_xx11.equals(that.material_xx11));
    equal = equal && (this.material_xx12 == null ? that.material_xx12 == null : this.material_xx12.equals(that.material_xx12));
    equal = equal && (this.material_xx13 == null ? that.material_xx13 == null : this.material_xx13.equals(that.material_xx13));
    equal = equal && (this.material_xx14 == null ? that.material_xx14 == null : this.material_xx14.equals(that.material_xx14));
    equal = equal && (this.material_xx15 == null ? that.material_xx15 == null : this.material_xx15.equals(that.material_xx15));
    equal = equal && (this.material_xx16 == null ? that.material_xx16 == null : this.material_xx16.equals(that.material_xx16));
    equal = equal && (this.material_xx17 == null ? that.material_xx17 == null : this.material_xx17.equals(that.material_xx17));
    equal = equal && (this.material_xx18 == null ? that.material_xx18 == null : this.material_xx18.equals(that.material_xx18));
    equal = equal && (this.material_xx19 == null ? that.material_xx19 == null : this.material_xx19.equals(that.material_xx19));
    equal = equal && (this.material_xx20 == null ? that.material_xx20 == null : this.material_xx20.equals(that.material_xx20));
    equal = equal && (this.material_xx21 == null ? that.material_xx21 == null : this.material_xx21.equals(that.material_xx21));
    equal = equal && (this.eff_from_date == null ? that.eff_from_date == null : this.eff_from_date.equals(that.eff_from_date));
    equal = equal && (this.eff_to_date == null ? that.eff_to_date == null : this.eff_to_date.equals(that.eff_to_date));
    return equal;
  }
  public boolean equals0(Object o) {
    if (this == o) {
      return true;
    }
    if (!(o instanceof d_Item)) {
      return false;
    }
    d_Item that = (d_Item) o;
    boolean equal = true;
    equal = equal && (this.item_id == null ? that.item_id == null : this.item_id.equals(that.item_id));
    equal = equal && (this.material_number == null ? that.material_number == null : this.material_number.equals(that.material_number));
    equal = equal && (this.material_type == null ? that.material_type == null : this.material_type.equals(that.material_type));
    equal = equal && (this.industry_sector == null ? that.industry_sector == null : this.industry_sector.equals(that.industry_sector));
    equal = equal && (this.material_group == null ? that.material_group == null : this.material_group.equals(that.material_group));
    equal = equal && (this.base_unit_of_measure == null ? that.base_unit_of_measure == null : this.base_unit_of_measure.equals(that.base_unit_of_measure));
    equal = equal && (this.order_unit == null ? that.order_unit == null : this.order_unit.equals(that.order_unit));
    equal = equal && (this.material_xx1 == null ? that.material_xx1 == null : this.material_xx1.equals(that.material_xx1));
    equal = equal && (this.material_xx2 == null ? that.material_xx2 == null : this.material_xx2.equals(that.material_xx2));
    equal = equal && (this.material_xx3 == null ? that.material_xx3 == null : this.material_xx3.equals(that.material_xx3));
    equal = equal && (this.material_xx4 == null ? that.material_xx4 == null : this.material_xx4.equals(that.material_xx4));
    equal = equal && (this.material_xx5 == null ? that.material_xx5 == null : this.material_xx5.equals(that.material_xx5));
    equal = equal && (this.material_xx6 == null ? that.material_xx6 == null : this.material_xx6.equals(that.material_xx6));
    equal = equal && (this.material_xx7 == null ? that.material_xx7 == null : this.material_xx7.equals(that.material_xx7));
    equal = equal && (this.material_xx8 == null ? that.material_xx8 == null : this.material_xx8.equals(that.material_xx8));
    equal = equal && (this.material_xx9 == null ? that.material_xx9 == null : this.material_xx9.equals(that.material_xx9));
    equal = equal && (this.material_xx10 == null ? that.material_xx10 == null : this.material_xx10.equals(that.material_xx10));
    equal = equal && (this.material_xx11 == null ? that.material_xx11 == null : this.material_xx11.equals(that.material_xx11));
    equal = equal && (this.material_xx12 == null ? that.material_xx12 == null : this.material_xx12.equals(that.material_xx12));
    equal = equal && (this.material_xx13 == null ? that.material_xx13 == null : this.material_xx13.equals(that.material_xx13));
    equal = equal && (this.material_xx14 == null ? that.material_xx14 == null : this.material_xx14.equals(that.material_xx14));
    equal = equal && (this.material_xx15 == null ? that.material_xx15 == null : this.material_xx15.equals(that.material_xx15));
    equal = equal && (this.material_xx16 == null ? that.material_xx16 == null : this.material_xx16.equals(that.material_xx16));
    equal = equal && (this.material_xx17 == null ? that.material_xx17 == null : this.material_xx17.equals(that.material_xx17));
    equal = equal && (this.material_xx18 == null ? that.material_xx18 == null : this.material_xx18.equals(that.material_xx18));
    equal = equal && (this.material_xx19 == null ? that.material_xx19 == null : this.material_xx19.equals(that.material_xx19));
    equal = equal && (this.material_xx20 == null ? that.material_xx20 == null : this.material_xx20.equals(that.material_xx20));
    equal = equal && (this.material_xx21 == null ? that.material_xx21 == null : this.material_xx21.equals(that.material_xx21));
    equal = equal && (this.eff_from_date == null ? that.eff_from_date == null : this.eff_from_date.equals(that.eff_from_date));
    equal = equal && (this.eff_to_date == null ? that.eff_to_date == null : this.eff_to_date.equals(that.eff_to_date));
    return equal;
  }
  public void readFields(ResultSet __dbResults) throws SQLException {
    this.__cur_result_set = __dbResults;
    this.item_id = JdbcWritableBridge.readInteger(1, __dbResults);
    this.material_number = JdbcWritableBridge.readString(2, __dbResults);
    this.material_type = JdbcWritableBridge.readString(3, __dbResults);
    this.industry_sector = JdbcWritableBridge.readString(4, __dbResults);
    this.material_group = JdbcWritableBridge.readString(5, __dbResults);
    this.base_unit_of_measure = JdbcWritableBridge.readString(6, __dbResults);
    this.order_unit = JdbcWritableBridge.readString(7, __dbResults);
    this.material_xx1 = JdbcWritableBridge.readString(8, __dbResults);
    this.material_xx2 = JdbcWritableBridge.readString(9, __dbResults);
    this.material_xx3 = JdbcWritableBridge.readString(10, __dbResults);
    this.material_xx4 = JdbcWritableBridge.readString(11, __dbResults);
    this.material_xx5 = JdbcWritableBridge.readString(12, __dbResults);
    this.material_xx6 = JdbcWritableBridge.readString(13, __dbResults);
    this.material_xx7 = JdbcWritableBridge.readString(14, __dbResults);
    this.material_xx8 = JdbcWritableBridge.readString(15, __dbResults);
    this.material_xx9 = JdbcWritableBridge.readString(16, __dbResults);
    this.material_xx10 = JdbcWritableBridge.readString(17, __dbResults);
    this.material_xx11 = JdbcWritableBridge.readString(18, __dbResults);
    this.material_xx12 = JdbcWritableBridge.readString(19, __dbResults);
    this.material_xx13 = JdbcWritableBridge.readString(20, __dbResults);
    this.material_xx14 = JdbcWritableBridge.readString(21, __dbResults);
    this.material_xx15 = JdbcWritableBridge.readString(22, __dbResults);
    this.material_xx16 = JdbcWritableBridge.readString(23, __dbResults);
    this.material_xx17 = JdbcWritableBridge.readString(24, __dbResults);
    this.material_xx18 = JdbcWritableBridge.readString(25, __dbResults);
    this.material_xx19 = JdbcWritableBridge.readString(26, __dbResults);
    this.material_xx20 = JdbcWritableBridge.readString(27, __dbResults);
    this.material_xx21 = JdbcWritableBridge.readString(28, __dbResults);
    this.eff_from_date = JdbcWritableBridge.readDate(29, __dbResults);
    this.eff_to_date = JdbcWritableBridge.readDate(30, __dbResults);
  }
  public void readFields0(ResultSet __dbResults) throws SQLException {
    this.item_id = JdbcWritableBridge.readInteger(1, __dbResults);
    this.material_number = JdbcWritableBridge.readString(2, __dbResults);
    this.material_type = JdbcWritableBridge.readString(3, __dbResults);
    this.industry_sector = JdbcWritableBridge.readString(4, __dbResults);
    this.material_group = JdbcWritableBridge.readString(5, __dbResults);
    this.base_unit_of_measure = JdbcWritableBridge.readString(6, __dbResults);
    this.order_unit = JdbcWritableBridge.readString(7, __dbResults);
    this.material_xx1 = JdbcWritableBridge.readString(8, __dbResults);
    this.material_xx2 = JdbcWritableBridge.readString(9, __dbResults);
    this.material_xx3 = JdbcWritableBridge.readString(10, __dbResults);
    this.material_xx4 = JdbcWritableBridge.readString(11, __dbResults);
    this.material_xx5 = JdbcWritableBridge.readString(12, __dbResults);
    this.material_xx6 = JdbcWritableBridge.readString(13, __dbResults);
    this.material_xx7 = JdbcWritableBridge.readString(14, __dbResults);
    this.material_xx8 = JdbcWritableBridge.readString(15, __dbResults);
    this.material_xx9 = JdbcWritableBridge.readString(16, __dbResults);
    this.material_xx10 = JdbcWritableBridge.readString(17, __dbResults);
    this.material_xx11 = JdbcWritableBridge.readString(18, __dbResults);
    this.material_xx12 = JdbcWritableBridge.readString(19, __dbResults);
    this.material_xx13 = JdbcWritableBridge.readString(20, __dbResults);
    this.material_xx14 = JdbcWritableBridge.readString(21, __dbResults);
    this.material_xx15 = JdbcWritableBridge.readString(22, __dbResults);
    this.material_xx16 = JdbcWritableBridge.readString(23, __dbResults);
    this.material_xx17 = JdbcWritableBridge.readString(24, __dbResults);
    this.material_xx18 = JdbcWritableBridge.readString(25, __dbResults);
    this.material_xx19 = JdbcWritableBridge.readString(26, __dbResults);
    this.material_xx20 = JdbcWritableBridge.readString(27, __dbResults);
    this.material_xx21 = JdbcWritableBridge.readString(28, __dbResults);
    this.eff_from_date = JdbcWritableBridge.readDate(29, __dbResults);
    this.eff_to_date = JdbcWritableBridge.readDate(30, __dbResults);
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
    JdbcWritableBridge.writeInteger(item_id, 1 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeString(material_number, 2 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(material_type, 3 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(industry_sector, 4 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(material_group, 5 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(base_unit_of_measure, 6 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(order_unit, 7 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(material_xx1, 8 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(material_xx2, 9 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(material_xx3, 10 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(material_xx4, 11 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(material_xx5, 12 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(material_xx6, 13 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(material_xx7, 14 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(material_xx8, 15 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(material_xx9, 16 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(material_xx10, 17 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(material_xx11, 18 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(material_xx12, 19 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(material_xx13, 20 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(material_xx14, 21 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(material_xx15, 22 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(material_xx16, 23 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(material_xx17, 24 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(material_xx18, 25 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(material_xx19, 26 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(material_xx20, 27 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(material_xx21, 28 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeDate(eff_from_date, 29 + __off, 91, __dbStmt);
    JdbcWritableBridge.writeDate(eff_to_date, 30 + __off, 91, __dbStmt);
    return 30;
  }
  public void write0(PreparedStatement __dbStmt, int __off) throws SQLException {
    JdbcWritableBridge.writeInteger(item_id, 1 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeString(material_number, 2 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(material_type, 3 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(industry_sector, 4 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(material_group, 5 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(base_unit_of_measure, 6 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(order_unit, 7 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(material_xx1, 8 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(material_xx2, 9 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(material_xx3, 10 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(material_xx4, 11 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(material_xx5, 12 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(material_xx6, 13 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(material_xx7, 14 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(material_xx8, 15 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(material_xx9, 16 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(material_xx10, 17 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(material_xx11, 18 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(material_xx12, 19 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(material_xx13, 20 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(material_xx14, 21 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(material_xx15, 22 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(material_xx16, 23 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(material_xx17, 24 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(material_xx18, 25 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(material_xx19, 26 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(material_xx20, 27 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(material_xx21, 28 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeDate(eff_from_date, 29 + __off, 91, __dbStmt);
    JdbcWritableBridge.writeDate(eff_to_date, 30 + __off, 91, __dbStmt);
  }
  public void readFields(DataInput __dataIn) throws IOException {
this.readFields0(__dataIn);  }
  public void readFields0(DataInput __dataIn) throws IOException {
    if (__dataIn.readBoolean()) { 
        this.item_id = null;
    } else {
    this.item_id = Integer.valueOf(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.material_number = null;
    } else {
    this.material_number = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.material_type = null;
    } else {
    this.material_type = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.industry_sector = null;
    } else {
    this.industry_sector = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.material_group = null;
    } else {
    this.material_group = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.base_unit_of_measure = null;
    } else {
    this.base_unit_of_measure = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.order_unit = null;
    } else {
    this.order_unit = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.material_xx1 = null;
    } else {
    this.material_xx1 = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.material_xx2 = null;
    } else {
    this.material_xx2 = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.material_xx3 = null;
    } else {
    this.material_xx3 = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.material_xx4 = null;
    } else {
    this.material_xx4 = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.material_xx5 = null;
    } else {
    this.material_xx5 = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.material_xx6 = null;
    } else {
    this.material_xx6 = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.material_xx7 = null;
    } else {
    this.material_xx7 = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.material_xx8 = null;
    } else {
    this.material_xx8 = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.material_xx9 = null;
    } else {
    this.material_xx9 = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.material_xx10 = null;
    } else {
    this.material_xx10 = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.material_xx11 = null;
    } else {
    this.material_xx11 = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.material_xx12 = null;
    } else {
    this.material_xx12 = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.material_xx13 = null;
    } else {
    this.material_xx13 = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.material_xx14 = null;
    } else {
    this.material_xx14 = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.material_xx15 = null;
    } else {
    this.material_xx15 = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.material_xx16 = null;
    } else {
    this.material_xx16 = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.material_xx17 = null;
    } else {
    this.material_xx17 = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.material_xx18 = null;
    } else {
    this.material_xx18 = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.material_xx19 = null;
    } else {
    this.material_xx19 = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.material_xx20 = null;
    } else {
    this.material_xx20 = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.material_xx21 = null;
    } else {
    this.material_xx21 = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.eff_from_date = null;
    } else {
    this.eff_from_date = new Date(__dataIn.readLong());
    }
    if (__dataIn.readBoolean()) { 
        this.eff_to_date = null;
    } else {
    this.eff_to_date = new Date(__dataIn.readLong());
    }
  }
  public void write(DataOutput __dataOut) throws IOException {
    if (null == this.item_id) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.item_id);
    }
    if (null == this.material_number) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, material_number);
    }
    if (null == this.material_type) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, material_type);
    }
    if (null == this.industry_sector) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, industry_sector);
    }
    if (null == this.material_group) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, material_group);
    }
    if (null == this.base_unit_of_measure) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, base_unit_of_measure);
    }
    if (null == this.order_unit) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, order_unit);
    }
    if (null == this.material_xx1) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, material_xx1);
    }
    if (null == this.material_xx2) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, material_xx2);
    }
    if (null == this.material_xx3) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, material_xx3);
    }
    if (null == this.material_xx4) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, material_xx4);
    }
    if (null == this.material_xx5) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, material_xx5);
    }
    if (null == this.material_xx6) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, material_xx6);
    }
    if (null == this.material_xx7) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, material_xx7);
    }
    if (null == this.material_xx8) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, material_xx8);
    }
    if (null == this.material_xx9) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, material_xx9);
    }
    if (null == this.material_xx10) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, material_xx10);
    }
    if (null == this.material_xx11) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, material_xx11);
    }
    if (null == this.material_xx12) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, material_xx12);
    }
    if (null == this.material_xx13) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, material_xx13);
    }
    if (null == this.material_xx14) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, material_xx14);
    }
    if (null == this.material_xx15) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, material_xx15);
    }
    if (null == this.material_xx16) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, material_xx16);
    }
    if (null == this.material_xx17) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, material_xx17);
    }
    if (null == this.material_xx18) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, material_xx18);
    }
    if (null == this.material_xx19) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, material_xx19);
    }
    if (null == this.material_xx20) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, material_xx20);
    }
    if (null == this.material_xx21) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, material_xx21);
    }
    if (null == this.eff_from_date) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.eff_from_date.getTime());
    }
    if (null == this.eff_to_date) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.eff_to_date.getTime());
    }
  }
  public void write0(DataOutput __dataOut) throws IOException {
    if (null == this.item_id) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.item_id);
    }
    if (null == this.material_number) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, material_number);
    }
    if (null == this.material_type) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, material_type);
    }
    if (null == this.industry_sector) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, industry_sector);
    }
    if (null == this.material_group) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, material_group);
    }
    if (null == this.base_unit_of_measure) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, base_unit_of_measure);
    }
    if (null == this.order_unit) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, order_unit);
    }
    if (null == this.material_xx1) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, material_xx1);
    }
    if (null == this.material_xx2) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, material_xx2);
    }
    if (null == this.material_xx3) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, material_xx3);
    }
    if (null == this.material_xx4) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, material_xx4);
    }
    if (null == this.material_xx5) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, material_xx5);
    }
    if (null == this.material_xx6) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, material_xx6);
    }
    if (null == this.material_xx7) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, material_xx7);
    }
    if (null == this.material_xx8) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, material_xx8);
    }
    if (null == this.material_xx9) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, material_xx9);
    }
    if (null == this.material_xx10) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, material_xx10);
    }
    if (null == this.material_xx11) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, material_xx11);
    }
    if (null == this.material_xx12) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, material_xx12);
    }
    if (null == this.material_xx13) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, material_xx13);
    }
    if (null == this.material_xx14) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, material_xx14);
    }
    if (null == this.material_xx15) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, material_xx15);
    }
    if (null == this.material_xx16) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, material_xx16);
    }
    if (null == this.material_xx17) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, material_xx17);
    }
    if (null == this.material_xx18) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, material_xx18);
    }
    if (null == this.material_xx19) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, material_xx19);
    }
    if (null == this.material_xx20) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, material_xx20);
    }
    if (null == this.material_xx21) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, material_xx21);
    }
    if (null == this.eff_from_date) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.eff_from_date.getTime());
    }
    if (null == this.eff_to_date) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.eff_to_date.getTime());
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
    __sb.append(FieldFormatter.escapeAndEnclose(item_id==null?"null":"" + item_id, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(material_number==null?"null":material_number, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(material_type==null?"null":material_type, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(industry_sector==null?"null":industry_sector, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(material_group==null?"null":material_group, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(base_unit_of_measure==null?"null":base_unit_of_measure, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(order_unit==null?"null":order_unit, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(material_xx1==null?"null":material_xx1, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(material_xx2==null?"null":material_xx2, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(material_xx3==null?"null":material_xx3, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(material_xx4==null?"null":material_xx4, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(material_xx5==null?"null":material_xx5, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(material_xx6==null?"null":material_xx6, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(material_xx7==null?"null":material_xx7, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(material_xx8==null?"null":material_xx8, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(material_xx9==null?"null":material_xx9, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(material_xx10==null?"null":material_xx10, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(material_xx11==null?"null":material_xx11, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(material_xx12==null?"null":material_xx12, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(material_xx13==null?"null":material_xx13, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(material_xx14==null?"null":material_xx14, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(material_xx15==null?"null":material_xx15, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(material_xx16==null?"null":material_xx16, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(material_xx17==null?"null":material_xx17, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(material_xx18==null?"null":material_xx18, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(material_xx19==null?"null":material_xx19, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(material_xx20==null?"null":material_xx20, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(material_xx21==null?"null":material_xx21, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(eff_from_date==null?"null":"" + eff_from_date, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(eff_to_date==null?"null":"" + eff_to_date, delimiters));
    if (useRecordDelim) {
      __sb.append(delimiters.getLinesTerminatedBy());
    }
    return __sb.toString();
  }
  public void toString0(DelimiterSet delimiters, StringBuilder __sb, char fieldDelim) {
    __sb.append(FieldFormatter.escapeAndEnclose(item_id==null?"null":"" + item_id, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(material_number==null?"null":material_number, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(material_type==null?"null":material_type, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(industry_sector==null?"null":industry_sector, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(material_group==null?"null":material_group, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(base_unit_of_measure==null?"null":base_unit_of_measure, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(order_unit==null?"null":order_unit, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(material_xx1==null?"null":material_xx1, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(material_xx2==null?"null":material_xx2, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(material_xx3==null?"null":material_xx3, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(material_xx4==null?"null":material_xx4, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(material_xx5==null?"null":material_xx5, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(material_xx6==null?"null":material_xx6, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(material_xx7==null?"null":material_xx7, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(material_xx8==null?"null":material_xx8, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(material_xx9==null?"null":material_xx9, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(material_xx10==null?"null":material_xx10, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(material_xx11==null?"null":material_xx11, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(material_xx12==null?"null":material_xx12, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(material_xx13==null?"null":material_xx13, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(material_xx14==null?"null":material_xx14, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(material_xx15==null?"null":material_xx15, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(material_xx16==null?"null":material_xx16, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(material_xx17==null?"null":material_xx17, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(material_xx18==null?"null":material_xx18, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(material_xx19==null?"null":material_xx19, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(material_xx20==null?"null":material_xx20, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(material_xx21==null?"null":material_xx21, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(eff_from_date==null?"null":"" + eff_from_date, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(eff_to_date==null?"null":"" + eff_to_date, delimiters));
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
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.item_id = null; } else {
      this.item_id = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.material_number = null; } else {
      this.material_number = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.material_type = null; } else {
      this.material_type = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.industry_sector = null; } else {
      this.industry_sector = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.material_group = null; } else {
      this.material_group = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.base_unit_of_measure = null; } else {
      this.base_unit_of_measure = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.order_unit = null; } else {
      this.order_unit = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.material_xx1 = null; } else {
      this.material_xx1 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.material_xx2 = null; } else {
      this.material_xx2 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.material_xx3 = null; } else {
      this.material_xx3 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.material_xx4 = null; } else {
      this.material_xx4 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.material_xx5 = null; } else {
      this.material_xx5 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.material_xx6 = null; } else {
      this.material_xx6 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.material_xx7 = null; } else {
      this.material_xx7 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.material_xx8 = null; } else {
      this.material_xx8 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.material_xx9 = null; } else {
      this.material_xx9 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.material_xx10 = null; } else {
      this.material_xx10 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.material_xx11 = null; } else {
      this.material_xx11 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.material_xx12 = null; } else {
      this.material_xx12 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.material_xx13 = null; } else {
      this.material_xx13 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.material_xx14 = null; } else {
      this.material_xx14 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.material_xx15 = null; } else {
      this.material_xx15 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.material_xx16 = null; } else {
      this.material_xx16 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.material_xx17 = null; } else {
      this.material_xx17 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.material_xx18 = null; } else {
      this.material_xx18 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.material_xx19 = null; } else {
      this.material_xx19 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.material_xx20 = null; } else {
      this.material_xx20 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.material_xx21 = null; } else {
      this.material_xx21 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.eff_from_date = null; } else {
      this.eff_from_date = java.sql.Date.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.eff_to_date = null; } else {
      this.eff_to_date = java.sql.Date.valueOf(__cur_str);
    }

    } catch (RuntimeException e) {    throw new RuntimeException("Can't parse input data: '" + __cur_str + "'", e);    }  }

  private void __loadFromFields0(Iterator<String> __it) {
    String __cur_str = null;
    try {
    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.item_id = null; } else {
      this.item_id = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.material_number = null; } else {
      this.material_number = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.material_type = null; } else {
      this.material_type = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.industry_sector = null; } else {
      this.industry_sector = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.material_group = null; } else {
      this.material_group = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.base_unit_of_measure = null; } else {
      this.base_unit_of_measure = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.order_unit = null; } else {
      this.order_unit = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.material_xx1 = null; } else {
      this.material_xx1 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.material_xx2 = null; } else {
      this.material_xx2 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.material_xx3 = null; } else {
      this.material_xx3 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.material_xx4 = null; } else {
      this.material_xx4 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.material_xx5 = null; } else {
      this.material_xx5 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.material_xx6 = null; } else {
      this.material_xx6 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.material_xx7 = null; } else {
      this.material_xx7 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.material_xx8 = null; } else {
      this.material_xx8 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.material_xx9 = null; } else {
      this.material_xx9 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.material_xx10 = null; } else {
      this.material_xx10 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.material_xx11 = null; } else {
      this.material_xx11 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.material_xx12 = null; } else {
      this.material_xx12 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.material_xx13 = null; } else {
      this.material_xx13 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.material_xx14 = null; } else {
      this.material_xx14 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.material_xx15 = null; } else {
      this.material_xx15 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.material_xx16 = null; } else {
      this.material_xx16 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.material_xx17 = null; } else {
      this.material_xx17 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.material_xx18 = null; } else {
      this.material_xx18 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.material_xx19 = null; } else {
      this.material_xx19 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.material_xx20 = null; } else {
      this.material_xx20 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.material_xx21 = null; } else {
      this.material_xx21 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.eff_from_date = null; } else {
      this.eff_from_date = java.sql.Date.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.eff_to_date = null; } else {
      this.eff_to_date = java.sql.Date.valueOf(__cur_str);
    }

    } catch (RuntimeException e) {    throw new RuntimeException("Can't parse input data: '" + __cur_str + "'", e);    }  }

  public Object clone() throws CloneNotSupportedException {
    d_Item o = (d_Item) super.clone();
    o.eff_from_date = (o.eff_from_date != null) ? (java.sql.Date) o.eff_from_date.clone() : null;
    o.eff_to_date = (o.eff_to_date != null) ? (java.sql.Date) o.eff_to_date.clone() : null;
    return o;
  }

  public void clone0(d_Item o) throws CloneNotSupportedException {
    o.eff_from_date = (o.eff_from_date != null) ? (java.sql.Date) o.eff_from_date.clone() : null;
    o.eff_to_date = (o.eff_to_date != null) ? (java.sql.Date) o.eff_to_date.clone() : null;
  }

  public Map<String, Object> getFieldMap() {
    Map<String, Object> __sqoop$field_map = new TreeMap<String, Object>();
    __sqoop$field_map.put("item_id", this.item_id);
    __sqoop$field_map.put("material_number", this.material_number);
    __sqoop$field_map.put("material_type", this.material_type);
    __sqoop$field_map.put("industry_sector", this.industry_sector);
    __sqoop$field_map.put("material_group", this.material_group);
    __sqoop$field_map.put("base_unit_of_measure", this.base_unit_of_measure);
    __sqoop$field_map.put("order_unit", this.order_unit);
    __sqoop$field_map.put("material_xx1", this.material_xx1);
    __sqoop$field_map.put("material_xx2", this.material_xx2);
    __sqoop$field_map.put("material_xx3", this.material_xx3);
    __sqoop$field_map.put("material_xx4", this.material_xx4);
    __sqoop$field_map.put("material_xx5", this.material_xx5);
    __sqoop$field_map.put("material_xx6", this.material_xx6);
    __sqoop$field_map.put("material_xx7", this.material_xx7);
    __sqoop$field_map.put("material_xx8", this.material_xx8);
    __sqoop$field_map.put("material_xx9", this.material_xx9);
    __sqoop$field_map.put("material_xx10", this.material_xx10);
    __sqoop$field_map.put("material_xx11", this.material_xx11);
    __sqoop$field_map.put("material_xx12", this.material_xx12);
    __sqoop$field_map.put("material_xx13", this.material_xx13);
    __sqoop$field_map.put("material_xx14", this.material_xx14);
    __sqoop$field_map.put("material_xx15", this.material_xx15);
    __sqoop$field_map.put("material_xx16", this.material_xx16);
    __sqoop$field_map.put("material_xx17", this.material_xx17);
    __sqoop$field_map.put("material_xx18", this.material_xx18);
    __sqoop$field_map.put("material_xx19", this.material_xx19);
    __sqoop$field_map.put("material_xx20", this.material_xx20);
    __sqoop$field_map.put("material_xx21", this.material_xx21);
    __sqoop$field_map.put("eff_from_date", this.eff_from_date);
    __sqoop$field_map.put("eff_to_date", this.eff_to_date);
    return __sqoop$field_map;
  }

  public void getFieldMap0(Map<String, Object> __sqoop$field_map) {
    __sqoop$field_map.put("item_id", this.item_id);
    __sqoop$field_map.put("material_number", this.material_number);
    __sqoop$field_map.put("material_type", this.material_type);
    __sqoop$field_map.put("industry_sector", this.industry_sector);
    __sqoop$field_map.put("material_group", this.material_group);
    __sqoop$field_map.put("base_unit_of_measure", this.base_unit_of_measure);
    __sqoop$field_map.put("order_unit", this.order_unit);
    __sqoop$field_map.put("material_xx1", this.material_xx1);
    __sqoop$field_map.put("material_xx2", this.material_xx2);
    __sqoop$field_map.put("material_xx3", this.material_xx3);
    __sqoop$field_map.put("material_xx4", this.material_xx4);
    __sqoop$field_map.put("material_xx5", this.material_xx5);
    __sqoop$field_map.put("material_xx6", this.material_xx6);
    __sqoop$field_map.put("material_xx7", this.material_xx7);
    __sqoop$field_map.put("material_xx8", this.material_xx8);
    __sqoop$field_map.put("material_xx9", this.material_xx9);
    __sqoop$field_map.put("material_xx10", this.material_xx10);
    __sqoop$field_map.put("material_xx11", this.material_xx11);
    __sqoop$field_map.put("material_xx12", this.material_xx12);
    __sqoop$field_map.put("material_xx13", this.material_xx13);
    __sqoop$field_map.put("material_xx14", this.material_xx14);
    __sqoop$field_map.put("material_xx15", this.material_xx15);
    __sqoop$field_map.put("material_xx16", this.material_xx16);
    __sqoop$field_map.put("material_xx17", this.material_xx17);
    __sqoop$field_map.put("material_xx18", this.material_xx18);
    __sqoop$field_map.put("material_xx19", this.material_xx19);
    __sqoop$field_map.put("material_xx20", this.material_xx20);
    __sqoop$field_map.put("material_xx21", this.material_xx21);
    __sqoop$field_map.put("eff_from_date", this.eff_from_date);
    __sqoop$field_map.put("eff_to_date", this.eff_to_date);
  }

  public void setField(String __fieldName, Object __fieldVal) {
    if ("item_id".equals(__fieldName)) {
      this.item_id = (Integer) __fieldVal;
    }
    else    if ("material_number".equals(__fieldName)) {
      this.material_number = (String) __fieldVal;
    }
    else    if ("material_type".equals(__fieldName)) {
      this.material_type = (String) __fieldVal;
    }
    else    if ("industry_sector".equals(__fieldName)) {
      this.industry_sector = (String) __fieldVal;
    }
    else    if ("material_group".equals(__fieldName)) {
      this.material_group = (String) __fieldVal;
    }
    else    if ("base_unit_of_measure".equals(__fieldName)) {
      this.base_unit_of_measure = (String) __fieldVal;
    }
    else    if ("order_unit".equals(__fieldName)) {
      this.order_unit = (String) __fieldVal;
    }
    else    if ("material_xx1".equals(__fieldName)) {
      this.material_xx1 = (String) __fieldVal;
    }
    else    if ("material_xx2".equals(__fieldName)) {
      this.material_xx2 = (String) __fieldVal;
    }
    else    if ("material_xx3".equals(__fieldName)) {
      this.material_xx3 = (String) __fieldVal;
    }
    else    if ("material_xx4".equals(__fieldName)) {
      this.material_xx4 = (String) __fieldVal;
    }
    else    if ("material_xx5".equals(__fieldName)) {
      this.material_xx5 = (String) __fieldVal;
    }
    else    if ("material_xx6".equals(__fieldName)) {
      this.material_xx6 = (String) __fieldVal;
    }
    else    if ("material_xx7".equals(__fieldName)) {
      this.material_xx7 = (String) __fieldVal;
    }
    else    if ("material_xx8".equals(__fieldName)) {
      this.material_xx8 = (String) __fieldVal;
    }
    else    if ("material_xx9".equals(__fieldName)) {
      this.material_xx9 = (String) __fieldVal;
    }
    else    if ("material_xx10".equals(__fieldName)) {
      this.material_xx10 = (String) __fieldVal;
    }
    else    if ("material_xx11".equals(__fieldName)) {
      this.material_xx11 = (String) __fieldVal;
    }
    else    if ("material_xx12".equals(__fieldName)) {
      this.material_xx12 = (String) __fieldVal;
    }
    else    if ("material_xx13".equals(__fieldName)) {
      this.material_xx13 = (String) __fieldVal;
    }
    else    if ("material_xx14".equals(__fieldName)) {
      this.material_xx14 = (String) __fieldVal;
    }
    else    if ("material_xx15".equals(__fieldName)) {
      this.material_xx15 = (String) __fieldVal;
    }
    else    if ("material_xx16".equals(__fieldName)) {
      this.material_xx16 = (String) __fieldVal;
    }
    else    if ("material_xx17".equals(__fieldName)) {
      this.material_xx17 = (String) __fieldVal;
    }
    else    if ("material_xx18".equals(__fieldName)) {
      this.material_xx18 = (String) __fieldVal;
    }
    else    if ("material_xx19".equals(__fieldName)) {
      this.material_xx19 = (String) __fieldVal;
    }
    else    if ("material_xx20".equals(__fieldName)) {
      this.material_xx20 = (String) __fieldVal;
    }
    else    if ("material_xx21".equals(__fieldName)) {
      this.material_xx21 = (String) __fieldVal;
    }
    else    if ("eff_from_date".equals(__fieldName)) {
      this.eff_from_date = (java.sql.Date) __fieldVal;
    }
    else    if ("eff_to_date".equals(__fieldName)) {
      this.eff_to_date = (java.sql.Date) __fieldVal;
    }
    else {
      throw new RuntimeException("No such field: " + __fieldName);
    }
  }
  public boolean setField0(String __fieldName, Object __fieldVal) {
    if ("item_id".equals(__fieldName)) {
      this.item_id = (Integer) __fieldVal;
      return true;
    }
    else    if ("material_number".equals(__fieldName)) {
      this.material_number = (String) __fieldVal;
      return true;
    }
    else    if ("material_type".equals(__fieldName)) {
      this.material_type = (String) __fieldVal;
      return true;
    }
    else    if ("industry_sector".equals(__fieldName)) {
      this.industry_sector = (String) __fieldVal;
      return true;
    }
    else    if ("material_group".equals(__fieldName)) {
      this.material_group = (String) __fieldVal;
      return true;
    }
    else    if ("base_unit_of_measure".equals(__fieldName)) {
      this.base_unit_of_measure = (String) __fieldVal;
      return true;
    }
    else    if ("order_unit".equals(__fieldName)) {
      this.order_unit = (String) __fieldVal;
      return true;
    }
    else    if ("material_xx1".equals(__fieldName)) {
      this.material_xx1 = (String) __fieldVal;
      return true;
    }
    else    if ("material_xx2".equals(__fieldName)) {
      this.material_xx2 = (String) __fieldVal;
      return true;
    }
    else    if ("material_xx3".equals(__fieldName)) {
      this.material_xx3 = (String) __fieldVal;
      return true;
    }
    else    if ("material_xx4".equals(__fieldName)) {
      this.material_xx4 = (String) __fieldVal;
      return true;
    }
    else    if ("material_xx5".equals(__fieldName)) {
      this.material_xx5 = (String) __fieldVal;
      return true;
    }
    else    if ("material_xx6".equals(__fieldName)) {
      this.material_xx6 = (String) __fieldVal;
      return true;
    }
    else    if ("material_xx7".equals(__fieldName)) {
      this.material_xx7 = (String) __fieldVal;
      return true;
    }
    else    if ("material_xx8".equals(__fieldName)) {
      this.material_xx8 = (String) __fieldVal;
      return true;
    }
    else    if ("material_xx9".equals(__fieldName)) {
      this.material_xx9 = (String) __fieldVal;
      return true;
    }
    else    if ("material_xx10".equals(__fieldName)) {
      this.material_xx10 = (String) __fieldVal;
      return true;
    }
    else    if ("material_xx11".equals(__fieldName)) {
      this.material_xx11 = (String) __fieldVal;
      return true;
    }
    else    if ("material_xx12".equals(__fieldName)) {
      this.material_xx12 = (String) __fieldVal;
      return true;
    }
    else    if ("material_xx13".equals(__fieldName)) {
      this.material_xx13 = (String) __fieldVal;
      return true;
    }
    else    if ("material_xx14".equals(__fieldName)) {
      this.material_xx14 = (String) __fieldVal;
      return true;
    }
    else    if ("material_xx15".equals(__fieldName)) {
      this.material_xx15 = (String) __fieldVal;
      return true;
    }
    else    if ("material_xx16".equals(__fieldName)) {
      this.material_xx16 = (String) __fieldVal;
      return true;
    }
    else    if ("material_xx17".equals(__fieldName)) {
      this.material_xx17 = (String) __fieldVal;
      return true;
    }
    else    if ("material_xx18".equals(__fieldName)) {
      this.material_xx18 = (String) __fieldVal;
      return true;
    }
    else    if ("material_xx19".equals(__fieldName)) {
      this.material_xx19 = (String) __fieldVal;
      return true;
    }
    else    if ("material_xx20".equals(__fieldName)) {
      this.material_xx20 = (String) __fieldVal;
      return true;
    }
    else    if ("material_xx21".equals(__fieldName)) {
      this.material_xx21 = (String) __fieldVal;
      return true;
    }
    else    if ("eff_from_date".equals(__fieldName)) {
      this.eff_from_date = (java.sql.Date) __fieldVal;
      return true;
    }
    else    if ("eff_to_date".equals(__fieldName)) {
      this.eff_to_date = (java.sql.Date) __fieldVal;
      return true;
    }
    else {
      return false;    }
  }
}
