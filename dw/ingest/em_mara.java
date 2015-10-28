// ORM class for table 'em_mara'
// WARNING: This class is AUTO-GENERATED. Modify at your own risk.
//
// Debug information:
// Generated date: Tue Oct 27 22:47:40 PDT 2015
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

public class em_mara extends SqoopRecord  implements DBWritable, Writable {
  private final int PROTOCOL_VERSION = 3;
  public int getClassFormatVersion() { return PROTOCOL_VERSION; }
  protected ResultSet __cur_result_set;
  private Integer MATNR;
  public Integer get_MATNR() {
    return MATNR;
  }
  public void set_MATNR(Integer MATNR) {
    this.MATNR = MATNR;
  }
  public em_mara with_MATNR(Integer MATNR) {
    this.MATNR = MATNR;
    return this;
  }
  private String MTART;
  public String get_MTART() {
    return MTART;
  }
  public void set_MTART(String MTART) {
    this.MTART = MTART;
  }
  public em_mara with_MTART(String MTART) {
    this.MTART = MTART;
    return this;
  }
  private String MBRSH;
  public String get_MBRSH() {
    return MBRSH;
  }
  public void set_MBRSH(String MBRSH) {
    this.MBRSH = MBRSH;
  }
  public em_mara with_MBRSH(String MBRSH) {
    this.MBRSH = MBRSH;
    return this;
  }
  private String MATKL;
  public String get_MATKL() {
    return MATKL;
  }
  public void set_MATKL(String MATKL) {
    this.MATKL = MATKL;
  }
  public em_mara with_MATKL(String MATKL) {
    this.MATKL = MATKL;
    return this;
  }
  private String MEINS;
  public String get_MEINS() {
    return MEINS;
  }
  public void set_MEINS(String MEINS) {
    this.MEINS = MEINS;
  }
  public em_mara with_MEINS(String MEINS) {
    this.MEINS = MEINS;
    return this;
  }
  private String BSTME;
  public String get_BSTME() {
    return BSTME;
  }
  public void set_BSTME(String BSTME) {
    this.BSTME = BSTME;
  }
  public em_mara with_BSTME(String BSTME) {
    this.BSTME = BSTME;
    return this;
  }
  private String MAX01;
  public String get_MAX01() {
    return MAX01;
  }
  public void set_MAX01(String MAX01) {
    this.MAX01 = MAX01;
  }
  public em_mara with_MAX01(String MAX01) {
    this.MAX01 = MAX01;
    return this;
  }
  private String MAX02;
  public String get_MAX02() {
    return MAX02;
  }
  public void set_MAX02(String MAX02) {
    this.MAX02 = MAX02;
  }
  public em_mara with_MAX02(String MAX02) {
    this.MAX02 = MAX02;
    return this;
  }
  private String MAX03;
  public String get_MAX03() {
    return MAX03;
  }
  public void set_MAX03(String MAX03) {
    this.MAX03 = MAX03;
  }
  public em_mara with_MAX03(String MAX03) {
    this.MAX03 = MAX03;
    return this;
  }
  private String MAX04;
  public String get_MAX04() {
    return MAX04;
  }
  public void set_MAX04(String MAX04) {
    this.MAX04 = MAX04;
  }
  public em_mara with_MAX04(String MAX04) {
    this.MAX04 = MAX04;
    return this;
  }
  private String MAX05;
  public String get_MAX05() {
    return MAX05;
  }
  public void set_MAX05(String MAX05) {
    this.MAX05 = MAX05;
  }
  public em_mara with_MAX05(String MAX05) {
    this.MAX05 = MAX05;
    return this;
  }
  private String MAX06;
  public String get_MAX06() {
    return MAX06;
  }
  public void set_MAX06(String MAX06) {
    this.MAX06 = MAX06;
  }
  public em_mara with_MAX06(String MAX06) {
    this.MAX06 = MAX06;
    return this;
  }
  private String MAX07;
  public String get_MAX07() {
    return MAX07;
  }
  public void set_MAX07(String MAX07) {
    this.MAX07 = MAX07;
  }
  public em_mara with_MAX07(String MAX07) {
    this.MAX07 = MAX07;
    return this;
  }
  private String MAX08;
  public String get_MAX08() {
    return MAX08;
  }
  public void set_MAX08(String MAX08) {
    this.MAX08 = MAX08;
  }
  public em_mara with_MAX08(String MAX08) {
    this.MAX08 = MAX08;
    return this;
  }
  private String MAX09;
  public String get_MAX09() {
    return MAX09;
  }
  public void set_MAX09(String MAX09) {
    this.MAX09 = MAX09;
  }
  public em_mara with_MAX09(String MAX09) {
    this.MAX09 = MAX09;
    return this;
  }
  private String MAX10;
  public String get_MAX10() {
    return MAX10;
  }
  public void set_MAX10(String MAX10) {
    this.MAX10 = MAX10;
  }
  public em_mara with_MAX10(String MAX10) {
    this.MAX10 = MAX10;
    return this;
  }
  private String MAX11;
  public String get_MAX11() {
    return MAX11;
  }
  public void set_MAX11(String MAX11) {
    this.MAX11 = MAX11;
  }
  public em_mara with_MAX11(String MAX11) {
    this.MAX11 = MAX11;
    return this;
  }
  private String MAX12;
  public String get_MAX12() {
    return MAX12;
  }
  public void set_MAX12(String MAX12) {
    this.MAX12 = MAX12;
  }
  public em_mara with_MAX12(String MAX12) {
    this.MAX12 = MAX12;
    return this;
  }
  private String MAX13;
  public String get_MAX13() {
    return MAX13;
  }
  public void set_MAX13(String MAX13) {
    this.MAX13 = MAX13;
  }
  public em_mara with_MAX13(String MAX13) {
    this.MAX13 = MAX13;
    return this;
  }
  private String MAX14;
  public String get_MAX14() {
    return MAX14;
  }
  public void set_MAX14(String MAX14) {
    this.MAX14 = MAX14;
  }
  public em_mara with_MAX14(String MAX14) {
    this.MAX14 = MAX14;
    return this;
  }
  private String MAX15;
  public String get_MAX15() {
    return MAX15;
  }
  public void set_MAX15(String MAX15) {
    this.MAX15 = MAX15;
  }
  public em_mara with_MAX15(String MAX15) {
    this.MAX15 = MAX15;
    return this;
  }
  private String MAX16;
  public String get_MAX16() {
    return MAX16;
  }
  public void set_MAX16(String MAX16) {
    this.MAX16 = MAX16;
  }
  public em_mara with_MAX16(String MAX16) {
    this.MAX16 = MAX16;
    return this;
  }
  private String MAX17;
  public String get_MAX17() {
    return MAX17;
  }
  public void set_MAX17(String MAX17) {
    this.MAX17 = MAX17;
  }
  public em_mara with_MAX17(String MAX17) {
    this.MAX17 = MAX17;
    return this;
  }
  private String MAX18;
  public String get_MAX18() {
    return MAX18;
  }
  public void set_MAX18(String MAX18) {
    this.MAX18 = MAX18;
  }
  public em_mara with_MAX18(String MAX18) {
    this.MAX18 = MAX18;
    return this;
  }
  private String MAX19;
  public String get_MAX19() {
    return MAX19;
  }
  public void set_MAX19(String MAX19) {
    this.MAX19 = MAX19;
  }
  public em_mara with_MAX19(String MAX19) {
    this.MAX19 = MAX19;
    return this;
  }
  private String MAX20;
  public String get_MAX20() {
    return MAX20;
  }
  public void set_MAX20(String MAX20) {
    this.MAX20 = MAX20;
  }
  public em_mara with_MAX20(String MAX20) {
    this.MAX20 = MAX20;
    return this;
  }
  private String MAX21;
  public String get_MAX21() {
    return MAX21;
  }
  public void set_MAX21(String MAX21) {
    this.MAX21 = MAX21;
  }
  public em_mara with_MAX21(String MAX21) {
    this.MAX21 = MAX21;
    return this;
  }
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (!(o instanceof em_mara)) {
      return false;
    }
    em_mara that = (em_mara) o;
    boolean equal = true;
    equal = equal && (this.MATNR == null ? that.MATNR == null : this.MATNR.equals(that.MATNR));
    equal = equal && (this.MTART == null ? that.MTART == null : this.MTART.equals(that.MTART));
    equal = equal && (this.MBRSH == null ? that.MBRSH == null : this.MBRSH.equals(that.MBRSH));
    equal = equal && (this.MATKL == null ? that.MATKL == null : this.MATKL.equals(that.MATKL));
    equal = equal && (this.MEINS == null ? that.MEINS == null : this.MEINS.equals(that.MEINS));
    equal = equal && (this.BSTME == null ? that.BSTME == null : this.BSTME.equals(that.BSTME));
    equal = equal && (this.MAX01 == null ? that.MAX01 == null : this.MAX01.equals(that.MAX01));
    equal = equal && (this.MAX02 == null ? that.MAX02 == null : this.MAX02.equals(that.MAX02));
    equal = equal && (this.MAX03 == null ? that.MAX03 == null : this.MAX03.equals(that.MAX03));
    equal = equal && (this.MAX04 == null ? that.MAX04 == null : this.MAX04.equals(that.MAX04));
    equal = equal && (this.MAX05 == null ? that.MAX05 == null : this.MAX05.equals(that.MAX05));
    equal = equal && (this.MAX06 == null ? that.MAX06 == null : this.MAX06.equals(that.MAX06));
    equal = equal && (this.MAX07 == null ? that.MAX07 == null : this.MAX07.equals(that.MAX07));
    equal = equal && (this.MAX08 == null ? that.MAX08 == null : this.MAX08.equals(that.MAX08));
    equal = equal && (this.MAX09 == null ? that.MAX09 == null : this.MAX09.equals(that.MAX09));
    equal = equal && (this.MAX10 == null ? that.MAX10 == null : this.MAX10.equals(that.MAX10));
    equal = equal && (this.MAX11 == null ? that.MAX11 == null : this.MAX11.equals(that.MAX11));
    equal = equal && (this.MAX12 == null ? that.MAX12 == null : this.MAX12.equals(that.MAX12));
    equal = equal && (this.MAX13 == null ? that.MAX13 == null : this.MAX13.equals(that.MAX13));
    equal = equal && (this.MAX14 == null ? that.MAX14 == null : this.MAX14.equals(that.MAX14));
    equal = equal && (this.MAX15 == null ? that.MAX15 == null : this.MAX15.equals(that.MAX15));
    equal = equal && (this.MAX16 == null ? that.MAX16 == null : this.MAX16.equals(that.MAX16));
    equal = equal && (this.MAX17 == null ? that.MAX17 == null : this.MAX17.equals(that.MAX17));
    equal = equal && (this.MAX18 == null ? that.MAX18 == null : this.MAX18.equals(that.MAX18));
    equal = equal && (this.MAX19 == null ? that.MAX19 == null : this.MAX19.equals(that.MAX19));
    equal = equal && (this.MAX20 == null ? that.MAX20 == null : this.MAX20.equals(that.MAX20));
    equal = equal && (this.MAX21 == null ? that.MAX21 == null : this.MAX21.equals(that.MAX21));
    return equal;
  }
  public boolean equals0(Object o) {
    if (this == o) {
      return true;
    }
    if (!(o instanceof em_mara)) {
      return false;
    }
    em_mara that = (em_mara) o;
    boolean equal = true;
    equal = equal && (this.MATNR == null ? that.MATNR == null : this.MATNR.equals(that.MATNR));
    equal = equal && (this.MTART == null ? that.MTART == null : this.MTART.equals(that.MTART));
    equal = equal && (this.MBRSH == null ? that.MBRSH == null : this.MBRSH.equals(that.MBRSH));
    equal = equal && (this.MATKL == null ? that.MATKL == null : this.MATKL.equals(that.MATKL));
    equal = equal && (this.MEINS == null ? that.MEINS == null : this.MEINS.equals(that.MEINS));
    equal = equal && (this.BSTME == null ? that.BSTME == null : this.BSTME.equals(that.BSTME));
    equal = equal && (this.MAX01 == null ? that.MAX01 == null : this.MAX01.equals(that.MAX01));
    equal = equal && (this.MAX02 == null ? that.MAX02 == null : this.MAX02.equals(that.MAX02));
    equal = equal && (this.MAX03 == null ? that.MAX03 == null : this.MAX03.equals(that.MAX03));
    equal = equal && (this.MAX04 == null ? that.MAX04 == null : this.MAX04.equals(that.MAX04));
    equal = equal && (this.MAX05 == null ? that.MAX05 == null : this.MAX05.equals(that.MAX05));
    equal = equal && (this.MAX06 == null ? that.MAX06 == null : this.MAX06.equals(that.MAX06));
    equal = equal && (this.MAX07 == null ? that.MAX07 == null : this.MAX07.equals(that.MAX07));
    equal = equal && (this.MAX08 == null ? that.MAX08 == null : this.MAX08.equals(that.MAX08));
    equal = equal && (this.MAX09 == null ? that.MAX09 == null : this.MAX09.equals(that.MAX09));
    equal = equal && (this.MAX10 == null ? that.MAX10 == null : this.MAX10.equals(that.MAX10));
    equal = equal && (this.MAX11 == null ? that.MAX11 == null : this.MAX11.equals(that.MAX11));
    equal = equal && (this.MAX12 == null ? that.MAX12 == null : this.MAX12.equals(that.MAX12));
    equal = equal && (this.MAX13 == null ? that.MAX13 == null : this.MAX13.equals(that.MAX13));
    equal = equal && (this.MAX14 == null ? that.MAX14 == null : this.MAX14.equals(that.MAX14));
    equal = equal && (this.MAX15 == null ? that.MAX15 == null : this.MAX15.equals(that.MAX15));
    equal = equal && (this.MAX16 == null ? that.MAX16 == null : this.MAX16.equals(that.MAX16));
    equal = equal && (this.MAX17 == null ? that.MAX17 == null : this.MAX17.equals(that.MAX17));
    equal = equal && (this.MAX18 == null ? that.MAX18 == null : this.MAX18.equals(that.MAX18));
    equal = equal && (this.MAX19 == null ? that.MAX19 == null : this.MAX19.equals(that.MAX19));
    equal = equal && (this.MAX20 == null ? that.MAX20 == null : this.MAX20.equals(that.MAX20));
    equal = equal && (this.MAX21 == null ? that.MAX21 == null : this.MAX21.equals(that.MAX21));
    return equal;
  }
  public void readFields(ResultSet __dbResults) throws SQLException {
    this.__cur_result_set = __dbResults;
    this.MATNR = JdbcWritableBridge.readInteger(1, __dbResults);
    this.MTART = JdbcWritableBridge.readString(2, __dbResults);
    this.MBRSH = JdbcWritableBridge.readString(3, __dbResults);
    this.MATKL = JdbcWritableBridge.readString(4, __dbResults);
    this.MEINS = JdbcWritableBridge.readString(5, __dbResults);
    this.BSTME = JdbcWritableBridge.readString(6, __dbResults);
    this.MAX01 = JdbcWritableBridge.readString(7, __dbResults);
    this.MAX02 = JdbcWritableBridge.readString(8, __dbResults);
    this.MAX03 = JdbcWritableBridge.readString(9, __dbResults);
    this.MAX04 = JdbcWritableBridge.readString(10, __dbResults);
    this.MAX05 = JdbcWritableBridge.readString(11, __dbResults);
    this.MAX06 = JdbcWritableBridge.readString(12, __dbResults);
    this.MAX07 = JdbcWritableBridge.readString(13, __dbResults);
    this.MAX08 = JdbcWritableBridge.readString(14, __dbResults);
    this.MAX09 = JdbcWritableBridge.readString(15, __dbResults);
    this.MAX10 = JdbcWritableBridge.readString(16, __dbResults);
    this.MAX11 = JdbcWritableBridge.readString(17, __dbResults);
    this.MAX12 = JdbcWritableBridge.readString(18, __dbResults);
    this.MAX13 = JdbcWritableBridge.readString(19, __dbResults);
    this.MAX14 = JdbcWritableBridge.readString(20, __dbResults);
    this.MAX15 = JdbcWritableBridge.readString(21, __dbResults);
    this.MAX16 = JdbcWritableBridge.readString(22, __dbResults);
    this.MAX17 = JdbcWritableBridge.readString(23, __dbResults);
    this.MAX18 = JdbcWritableBridge.readString(24, __dbResults);
    this.MAX19 = JdbcWritableBridge.readString(25, __dbResults);
    this.MAX20 = JdbcWritableBridge.readString(26, __dbResults);
    this.MAX21 = JdbcWritableBridge.readString(27, __dbResults);
  }
  public void readFields0(ResultSet __dbResults) throws SQLException {
    this.MATNR = JdbcWritableBridge.readInteger(1, __dbResults);
    this.MTART = JdbcWritableBridge.readString(2, __dbResults);
    this.MBRSH = JdbcWritableBridge.readString(3, __dbResults);
    this.MATKL = JdbcWritableBridge.readString(4, __dbResults);
    this.MEINS = JdbcWritableBridge.readString(5, __dbResults);
    this.BSTME = JdbcWritableBridge.readString(6, __dbResults);
    this.MAX01 = JdbcWritableBridge.readString(7, __dbResults);
    this.MAX02 = JdbcWritableBridge.readString(8, __dbResults);
    this.MAX03 = JdbcWritableBridge.readString(9, __dbResults);
    this.MAX04 = JdbcWritableBridge.readString(10, __dbResults);
    this.MAX05 = JdbcWritableBridge.readString(11, __dbResults);
    this.MAX06 = JdbcWritableBridge.readString(12, __dbResults);
    this.MAX07 = JdbcWritableBridge.readString(13, __dbResults);
    this.MAX08 = JdbcWritableBridge.readString(14, __dbResults);
    this.MAX09 = JdbcWritableBridge.readString(15, __dbResults);
    this.MAX10 = JdbcWritableBridge.readString(16, __dbResults);
    this.MAX11 = JdbcWritableBridge.readString(17, __dbResults);
    this.MAX12 = JdbcWritableBridge.readString(18, __dbResults);
    this.MAX13 = JdbcWritableBridge.readString(19, __dbResults);
    this.MAX14 = JdbcWritableBridge.readString(20, __dbResults);
    this.MAX15 = JdbcWritableBridge.readString(21, __dbResults);
    this.MAX16 = JdbcWritableBridge.readString(22, __dbResults);
    this.MAX17 = JdbcWritableBridge.readString(23, __dbResults);
    this.MAX18 = JdbcWritableBridge.readString(24, __dbResults);
    this.MAX19 = JdbcWritableBridge.readString(25, __dbResults);
    this.MAX20 = JdbcWritableBridge.readString(26, __dbResults);
    this.MAX21 = JdbcWritableBridge.readString(27, __dbResults);
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
    JdbcWritableBridge.writeInteger(MATNR, 1 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeString(MTART, 2 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(MBRSH, 3 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(MATKL, 4 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(MEINS, 5 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(BSTME, 6 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(MAX01, 7 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(MAX02, 8 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(MAX03, 9 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(MAX04, 10 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(MAX05, 11 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(MAX06, 12 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(MAX07, 13 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(MAX08, 14 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(MAX09, 15 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(MAX10, 16 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(MAX11, 17 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(MAX12, 18 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(MAX13, 19 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(MAX14, 20 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(MAX15, 21 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(MAX16, 22 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(MAX17, 23 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(MAX18, 24 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(MAX19, 25 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(MAX20, 26 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(MAX21, 27 + __off, 12, __dbStmt);
    return 27;
  }
  public void write0(PreparedStatement __dbStmt, int __off) throws SQLException {
    JdbcWritableBridge.writeInteger(MATNR, 1 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeString(MTART, 2 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(MBRSH, 3 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(MATKL, 4 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(MEINS, 5 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(BSTME, 6 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(MAX01, 7 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(MAX02, 8 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(MAX03, 9 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(MAX04, 10 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(MAX05, 11 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(MAX06, 12 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(MAX07, 13 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(MAX08, 14 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(MAX09, 15 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(MAX10, 16 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(MAX11, 17 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(MAX12, 18 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(MAX13, 19 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(MAX14, 20 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(MAX15, 21 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(MAX16, 22 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(MAX17, 23 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(MAX18, 24 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(MAX19, 25 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(MAX20, 26 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(MAX21, 27 + __off, 12, __dbStmt);
  }
  public void readFields(DataInput __dataIn) throws IOException {
this.readFields0(__dataIn);  }
  public void readFields0(DataInput __dataIn) throws IOException {
    if (__dataIn.readBoolean()) { 
        this.MATNR = null;
    } else {
    this.MATNR = Integer.valueOf(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.MTART = null;
    } else {
    this.MTART = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.MBRSH = null;
    } else {
    this.MBRSH = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.MATKL = null;
    } else {
    this.MATKL = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.MEINS = null;
    } else {
    this.MEINS = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.BSTME = null;
    } else {
    this.BSTME = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.MAX01 = null;
    } else {
    this.MAX01 = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.MAX02 = null;
    } else {
    this.MAX02 = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.MAX03 = null;
    } else {
    this.MAX03 = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.MAX04 = null;
    } else {
    this.MAX04 = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.MAX05 = null;
    } else {
    this.MAX05 = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.MAX06 = null;
    } else {
    this.MAX06 = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.MAX07 = null;
    } else {
    this.MAX07 = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.MAX08 = null;
    } else {
    this.MAX08 = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.MAX09 = null;
    } else {
    this.MAX09 = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.MAX10 = null;
    } else {
    this.MAX10 = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.MAX11 = null;
    } else {
    this.MAX11 = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.MAX12 = null;
    } else {
    this.MAX12 = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.MAX13 = null;
    } else {
    this.MAX13 = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.MAX14 = null;
    } else {
    this.MAX14 = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.MAX15 = null;
    } else {
    this.MAX15 = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.MAX16 = null;
    } else {
    this.MAX16 = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.MAX17 = null;
    } else {
    this.MAX17 = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.MAX18 = null;
    } else {
    this.MAX18 = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.MAX19 = null;
    } else {
    this.MAX19 = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.MAX20 = null;
    } else {
    this.MAX20 = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.MAX21 = null;
    } else {
    this.MAX21 = Text.readString(__dataIn);
    }
  }
  public void write(DataOutput __dataOut) throws IOException {
    if (null == this.MATNR) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.MATNR);
    }
    if (null == this.MTART) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, MTART);
    }
    if (null == this.MBRSH) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, MBRSH);
    }
    if (null == this.MATKL) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, MATKL);
    }
    if (null == this.MEINS) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, MEINS);
    }
    if (null == this.BSTME) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, BSTME);
    }
    if (null == this.MAX01) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, MAX01);
    }
    if (null == this.MAX02) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, MAX02);
    }
    if (null == this.MAX03) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, MAX03);
    }
    if (null == this.MAX04) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, MAX04);
    }
    if (null == this.MAX05) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, MAX05);
    }
    if (null == this.MAX06) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, MAX06);
    }
    if (null == this.MAX07) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, MAX07);
    }
    if (null == this.MAX08) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, MAX08);
    }
    if (null == this.MAX09) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, MAX09);
    }
    if (null == this.MAX10) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, MAX10);
    }
    if (null == this.MAX11) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, MAX11);
    }
    if (null == this.MAX12) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, MAX12);
    }
    if (null == this.MAX13) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, MAX13);
    }
    if (null == this.MAX14) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, MAX14);
    }
    if (null == this.MAX15) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, MAX15);
    }
    if (null == this.MAX16) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, MAX16);
    }
    if (null == this.MAX17) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, MAX17);
    }
    if (null == this.MAX18) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, MAX18);
    }
    if (null == this.MAX19) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, MAX19);
    }
    if (null == this.MAX20) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, MAX20);
    }
    if (null == this.MAX21) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, MAX21);
    }
  }
  public void write0(DataOutput __dataOut) throws IOException {
    if (null == this.MATNR) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.MATNR);
    }
    if (null == this.MTART) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, MTART);
    }
    if (null == this.MBRSH) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, MBRSH);
    }
    if (null == this.MATKL) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, MATKL);
    }
    if (null == this.MEINS) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, MEINS);
    }
    if (null == this.BSTME) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, BSTME);
    }
    if (null == this.MAX01) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, MAX01);
    }
    if (null == this.MAX02) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, MAX02);
    }
    if (null == this.MAX03) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, MAX03);
    }
    if (null == this.MAX04) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, MAX04);
    }
    if (null == this.MAX05) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, MAX05);
    }
    if (null == this.MAX06) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, MAX06);
    }
    if (null == this.MAX07) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, MAX07);
    }
    if (null == this.MAX08) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, MAX08);
    }
    if (null == this.MAX09) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, MAX09);
    }
    if (null == this.MAX10) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, MAX10);
    }
    if (null == this.MAX11) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, MAX11);
    }
    if (null == this.MAX12) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, MAX12);
    }
    if (null == this.MAX13) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, MAX13);
    }
    if (null == this.MAX14) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, MAX14);
    }
    if (null == this.MAX15) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, MAX15);
    }
    if (null == this.MAX16) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, MAX16);
    }
    if (null == this.MAX17) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, MAX17);
    }
    if (null == this.MAX18) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, MAX18);
    }
    if (null == this.MAX19) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, MAX19);
    }
    if (null == this.MAX20) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, MAX20);
    }
    if (null == this.MAX21) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, MAX21);
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
    __sb.append(FieldFormatter.escapeAndEnclose(MATNR==null?"null":"" + MATNR, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(MTART==null?"null":MTART, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(MBRSH==null?"null":MBRSH, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(MATKL==null?"null":MATKL, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(MEINS==null?"null":MEINS, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(BSTME==null?"null":BSTME, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(MAX01==null?"null":MAX01, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(MAX02==null?"null":MAX02, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(MAX03==null?"null":MAX03, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(MAX04==null?"null":MAX04, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(MAX05==null?"null":MAX05, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(MAX06==null?"null":MAX06, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(MAX07==null?"null":MAX07, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(MAX08==null?"null":MAX08, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(MAX09==null?"null":MAX09, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(MAX10==null?"null":MAX10, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(MAX11==null?"null":MAX11, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(MAX12==null?"null":MAX12, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(MAX13==null?"null":MAX13, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(MAX14==null?"null":MAX14, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(MAX15==null?"null":MAX15, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(MAX16==null?"null":MAX16, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(MAX17==null?"null":MAX17, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(MAX18==null?"null":MAX18, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(MAX19==null?"null":MAX19, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(MAX20==null?"null":MAX20, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(MAX21==null?"null":MAX21, delimiters));
    if (useRecordDelim) {
      __sb.append(delimiters.getLinesTerminatedBy());
    }
    return __sb.toString();
  }
  public void toString0(DelimiterSet delimiters, StringBuilder __sb, char fieldDelim) {
    __sb.append(FieldFormatter.escapeAndEnclose(MATNR==null?"null":"" + MATNR, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(MTART==null?"null":MTART, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(MBRSH==null?"null":MBRSH, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(MATKL==null?"null":MATKL, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(MEINS==null?"null":MEINS, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(BSTME==null?"null":BSTME, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(MAX01==null?"null":MAX01, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(MAX02==null?"null":MAX02, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(MAX03==null?"null":MAX03, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(MAX04==null?"null":MAX04, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(MAX05==null?"null":MAX05, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(MAX06==null?"null":MAX06, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(MAX07==null?"null":MAX07, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(MAX08==null?"null":MAX08, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(MAX09==null?"null":MAX09, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(MAX10==null?"null":MAX10, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(MAX11==null?"null":MAX11, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(MAX12==null?"null":MAX12, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(MAX13==null?"null":MAX13, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(MAX14==null?"null":MAX14, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(MAX15==null?"null":MAX15, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(MAX16==null?"null":MAX16, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(MAX17==null?"null":MAX17, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(MAX18==null?"null":MAX18, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(MAX19==null?"null":MAX19, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(MAX20==null?"null":MAX20, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(MAX21==null?"null":MAX21, delimiters));
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
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.MATNR = null; } else {
      this.MATNR = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.MTART = null; } else {
      this.MTART = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.MBRSH = null; } else {
      this.MBRSH = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.MATKL = null; } else {
      this.MATKL = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.MEINS = null; } else {
      this.MEINS = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.BSTME = null; } else {
      this.BSTME = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.MAX01 = null; } else {
      this.MAX01 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.MAX02 = null; } else {
      this.MAX02 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.MAX03 = null; } else {
      this.MAX03 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.MAX04 = null; } else {
      this.MAX04 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.MAX05 = null; } else {
      this.MAX05 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.MAX06 = null; } else {
      this.MAX06 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.MAX07 = null; } else {
      this.MAX07 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.MAX08 = null; } else {
      this.MAX08 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.MAX09 = null; } else {
      this.MAX09 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.MAX10 = null; } else {
      this.MAX10 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.MAX11 = null; } else {
      this.MAX11 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.MAX12 = null; } else {
      this.MAX12 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.MAX13 = null; } else {
      this.MAX13 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.MAX14 = null; } else {
      this.MAX14 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.MAX15 = null; } else {
      this.MAX15 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.MAX16 = null; } else {
      this.MAX16 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.MAX17 = null; } else {
      this.MAX17 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.MAX18 = null; } else {
      this.MAX18 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.MAX19 = null; } else {
      this.MAX19 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.MAX20 = null; } else {
      this.MAX20 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.MAX21 = null; } else {
      this.MAX21 = __cur_str;
    }

    } catch (RuntimeException e) {    throw new RuntimeException("Can't parse input data: '" + __cur_str + "'", e);    }  }

  private void __loadFromFields0(Iterator<String> __it) {
    String __cur_str = null;
    try {
    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.MATNR = null; } else {
      this.MATNR = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.MTART = null; } else {
      this.MTART = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.MBRSH = null; } else {
      this.MBRSH = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.MATKL = null; } else {
      this.MATKL = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.MEINS = null; } else {
      this.MEINS = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.BSTME = null; } else {
      this.BSTME = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.MAX01 = null; } else {
      this.MAX01 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.MAX02 = null; } else {
      this.MAX02 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.MAX03 = null; } else {
      this.MAX03 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.MAX04 = null; } else {
      this.MAX04 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.MAX05 = null; } else {
      this.MAX05 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.MAX06 = null; } else {
      this.MAX06 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.MAX07 = null; } else {
      this.MAX07 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.MAX08 = null; } else {
      this.MAX08 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.MAX09 = null; } else {
      this.MAX09 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.MAX10 = null; } else {
      this.MAX10 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.MAX11 = null; } else {
      this.MAX11 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.MAX12 = null; } else {
      this.MAX12 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.MAX13 = null; } else {
      this.MAX13 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.MAX14 = null; } else {
      this.MAX14 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.MAX15 = null; } else {
      this.MAX15 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.MAX16 = null; } else {
      this.MAX16 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.MAX17 = null; } else {
      this.MAX17 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.MAX18 = null; } else {
      this.MAX18 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.MAX19 = null; } else {
      this.MAX19 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.MAX20 = null; } else {
      this.MAX20 = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.MAX21 = null; } else {
      this.MAX21 = __cur_str;
    }

    } catch (RuntimeException e) {    throw new RuntimeException("Can't parse input data: '" + __cur_str + "'", e);    }  }

  public Object clone() throws CloneNotSupportedException {
    em_mara o = (em_mara) super.clone();
    return o;
  }

  public void clone0(em_mara o) throws CloneNotSupportedException {
  }

  public Map<String, Object> getFieldMap() {
    Map<String, Object> __sqoop$field_map = new TreeMap<String, Object>();
    __sqoop$field_map.put("MATNR", this.MATNR);
    __sqoop$field_map.put("MTART", this.MTART);
    __sqoop$field_map.put("MBRSH", this.MBRSH);
    __sqoop$field_map.put("MATKL", this.MATKL);
    __sqoop$field_map.put("MEINS", this.MEINS);
    __sqoop$field_map.put("BSTME", this.BSTME);
    __sqoop$field_map.put("MAX01", this.MAX01);
    __sqoop$field_map.put("MAX02", this.MAX02);
    __sqoop$field_map.put("MAX03", this.MAX03);
    __sqoop$field_map.put("MAX04", this.MAX04);
    __sqoop$field_map.put("MAX05", this.MAX05);
    __sqoop$field_map.put("MAX06", this.MAX06);
    __sqoop$field_map.put("MAX07", this.MAX07);
    __sqoop$field_map.put("MAX08", this.MAX08);
    __sqoop$field_map.put("MAX09", this.MAX09);
    __sqoop$field_map.put("MAX10", this.MAX10);
    __sqoop$field_map.put("MAX11", this.MAX11);
    __sqoop$field_map.put("MAX12", this.MAX12);
    __sqoop$field_map.put("MAX13", this.MAX13);
    __sqoop$field_map.put("MAX14", this.MAX14);
    __sqoop$field_map.put("MAX15", this.MAX15);
    __sqoop$field_map.put("MAX16", this.MAX16);
    __sqoop$field_map.put("MAX17", this.MAX17);
    __sqoop$field_map.put("MAX18", this.MAX18);
    __sqoop$field_map.put("MAX19", this.MAX19);
    __sqoop$field_map.put("MAX20", this.MAX20);
    __sqoop$field_map.put("MAX21", this.MAX21);
    return __sqoop$field_map;
  }

  public void getFieldMap0(Map<String, Object> __sqoop$field_map) {
    __sqoop$field_map.put("MATNR", this.MATNR);
    __sqoop$field_map.put("MTART", this.MTART);
    __sqoop$field_map.put("MBRSH", this.MBRSH);
    __sqoop$field_map.put("MATKL", this.MATKL);
    __sqoop$field_map.put("MEINS", this.MEINS);
    __sqoop$field_map.put("BSTME", this.BSTME);
    __sqoop$field_map.put("MAX01", this.MAX01);
    __sqoop$field_map.put("MAX02", this.MAX02);
    __sqoop$field_map.put("MAX03", this.MAX03);
    __sqoop$field_map.put("MAX04", this.MAX04);
    __sqoop$field_map.put("MAX05", this.MAX05);
    __sqoop$field_map.put("MAX06", this.MAX06);
    __sqoop$field_map.put("MAX07", this.MAX07);
    __sqoop$field_map.put("MAX08", this.MAX08);
    __sqoop$field_map.put("MAX09", this.MAX09);
    __sqoop$field_map.put("MAX10", this.MAX10);
    __sqoop$field_map.put("MAX11", this.MAX11);
    __sqoop$field_map.put("MAX12", this.MAX12);
    __sqoop$field_map.put("MAX13", this.MAX13);
    __sqoop$field_map.put("MAX14", this.MAX14);
    __sqoop$field_map.put("MAX15", this.MAX15);
    __sqoop$field_map.put("MAX16", this.MAX16);
    __sqoop$field_map.put("MAX17", this.MAX17);
    __sqoop$field_map.put("MAX18", this.MAX18);
    __sqoop$field_map.put("MAX19", this.MAX19);
    __sqoop$field_map.put("MAX20", this.MAX20);
    __sqoop$field_map.put("MAX21", this.MAX21);
  }

  public void setField(String __fieldName, Object __fieldVal) {
    if ("MATNR".equals(__fieldName)) {
      this.MATNR = (Integer) __fieldVal;
    }
    else    if ("MTART".equals(__fieldName)) {
      this.MTART = (String) __fieldVal;
    }
    else    if ("MBRSH".equals(__fieldName)) {
      this.MBRSH = (String) __fieldVal;
    }
    else    if ("MATKL".equals(__fieldName)) {
      this.MATKL = (String) __fieldVal;
    }
    else    if ("MEINS".equals(__fieldName)) {
      this.MEINS = (String) __fieldVal;
    }
    else    if ("BSTME".equals(__fieldName)) {
      this.BSTME = (String) __fieldVal;
    }
    else    if ("MAX01".equals(__fieldName)) {
      this.MAX01 = (String) __fieldVal;
    }
    else    if ("MAX02".equals(__fieldName)) {
      this.MAX02 = (String) __fieldVal;
    }
    else    if ("MAX03".equals(__fieldName)) {
      this.MAX03 = (String) __fieldVal;
    }
    else    if ("MAX04".equals(__fieldName)) {
      this.MAX04 = (String) __fieldVal;
    }
    else    if ("MAX05".equals(__fieldName)) {
      this.MAX05 = (String) __fieldVal;
    }
    else    if ("MAX06".equals(__fieldName)) {
      this.MAX06 = (String) __fieldVal;
    }
    else    if ("MAX07".equals(__fieldName)) {
      this.MAX07 = (String) __fieldVal;
    }
    else    if ("MAX08".equals(__fieldName)) {
      this.MAX08 = (String) __fieldVal;
    }
    else    if ("MAX09".equals(__fieldName)) {
      this.MAX09 = (String) __fieldVal;
    }
    else    if ("MAX10".equals(__fieldName)) {
      this.MAX10 = (String) __fieldVal;
    }
    else    if ("MAX11".equals(__fieldName)) {
      this.MAX11 = (String) __fieldVal;
    }
    else    if ("MAX12".equals(__fieldName)) {
      this.MAX12 = (String) __fieldVal;
    }
    else    if ("MAX13".equals(__fieldName)) {
      this.MAX13 = (String) __fieldVal;
    }
    else    if ("MAX14".equals(__fieldName)) {
      this.MAX14 = (String) __fieldVal;
    }
    else    if ("MAX15".equals(__fieldName)) {
      this.MAX15 = (String) __fieldVal;
    }
    else    if ("MAX16".equals(__fieldName)) {
      this.MAX16 = (String) __fieldVal;
    }
    else    if ("MAX17".equals(__fieldName)) {
      this.MAX17 = (String) __fieldVal;
    }
    else    if ("MAX18".equals(__fieldName)) {
      this.MAX18 = (String) __fieldVal;
    }
    else    if ("MAX19".equals(__fieldName)) {
      this.MAX19 = (String) __fieldVal;
    }
    else    if ("MAX20".equals(__fieldName)) {
      this.MAX20 = (String) __fieldVal;
    }
    else    if ("MAX21".equals(__fieldName)) {
      this.MAX21 = (String) __fieldVal;
    }
    else {
      throw new RuntimeException("No such field: " + __fieldName);
    }
  }
  public boolean setField0(String __fieldName, Object __fieldVal) {
    if ("MATNR".equals(__fieldName)) {
      this.MATNR = (Integer) __fieldVal;
      return true;
    }
    else    if ("MTART".equals(__fieldName)) {
      this.MTART = (String) __fieldVal;
      return true;
    }
    else    if ("MBRSH".equals(__fieldName)) {
      this.MBRSH = (String) __fieldVal;
      return true;
    }
    else    if ("MATKL".equals(__fieldName)) {
      this.MATKL = (String) __fieldVal;
      return true;
    }
    else    if ("MEINS".equals(__fieldName)) {
      this.MEINS = (String) __fieldVal;
      return true;
    }
    else    if ("BSTME".equals(__fieldName)) {
      this.BSTME = (String) __fieldVal;
      return true;
    }
    else    if ("MAX01".equals(__fieldName)) {
      this.MAX01 = (String) __fieldVal;
      return true;
    }
    else    if ("MAX02".equals(__fieldName)) {
      this.MAX02 = (String) __fieldVal;
      return true;
    }
    else    if ("MAX03".equals(__fieldName)) {
      this.MAX03 = (String) __fieldVal;
      return true;
    }
    else    if ("MAX04".equals(__fieldName)) {
      this.MAX04 = (String) __fieldVal;
      return true;
    }
    else    if ("MAX05".equals(__fieldName)) {
      this.MAX05 = (String) __fieldVal;
      return true;
    }
    else    if ("MAX06".equals(__fieldName)) {
      this.MAX06 = (String) __fieldVal;
      return true;
    }
    else    if ("MAX07".equals(__fieldName)) {
      this.MAX07 = (String) __fieldVal;
      return true;
    }
    else    if ("MAX08".equals(__fieldName)) {
      this.MAX08 = (String) __fieldVal;
      return true;
    }
    else    if ("MAX09".equals(__fieldName)) {
      this.MAX09 = (String) __fieldVal;
      return true;
    }
    else    if ("MAX10".equals(__fieldName)) {
      this.MAX10 = (String) __fieldVal;
      return true;
    }
    else    if ("MAX11".equals(__fieldName)) {
      this.MAX11 = (String) __fieldVal;
      return true;
    }
    else    if ("MAX12".equals(__fieldName)) {
      this.MAX12 = (String) __fieldVal;
      return true;
    }
    else    if ("MAX13".equals(__fieldName)) {
      this.MAX13 = (String) __fieldVal;
      return true;
    }
    else    if ("MAX14".equals(__fieldName)) {
      this.MAX14 = (String) __fieldVal;
      return true;
    }
    else    if ("MAX15".equals(__fieldName)) {
      this.MAX15 = (String) __fieldVal;
      return true;
    }
    else    if ("MAX16".equals(__fieldName)) {
      this.MAX16 = (String) __fieldVal;
      return true;
    }
    else    if ("MAX17".equals(__fieldName)) {
      this.MAX17 = (String) __fieldVal;
      return true;
    }
    else    if ("MAX18".equals(__fieldName)) {
      this.MAX18 = (String) __fieldVal;
      return true;
    }
    else    if ("MAX19".equals(__fieldName)) {
      this.MAX19 = (String) __fieldVal;
      return true;
    }
    else    if ("MAX20".equals(__fieldName)) {
      this.MAX20 = (String) __fieldVal;
      return true;
    }
    else    if ("MAX21".equals(__fieldName)) {
      this.MAX21 = (String) __fieldVal;
      return true;
    }
    else {
      return false;    }
  }
}
