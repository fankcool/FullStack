package com.example.mongo.pojo;

import lombok.Data;
import org.springframework.data.annotation.Id;
import org.springframework.data.annotation.Transient;
import org.springframework.data.mongodb.core.index.CompoundIndex;
import org.springframework.data.mongodb.core.index.Indexed;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Date;

@Data

/**
 * mongo注释参见：https://blog.csdn.net/tianyaleixiaowu/article/details/73530679
 * */

/**
 * 类似于hibernate的entity注解，标明有mongo来维护该表。
 * 如不设置collection，默认会将类名小写作为collation名，同entity。
 * 此处注意Document有collection(集合) 和 collation(校对) 两个属性！！！
 *
 * 在此，如下跟本行代码同意：
 * @Document("comment")：value和collection互为别名
 * @Document()：默认以类名小写作为集合(tableName)名
 * */
@Document(collection = "comment")

// 复合索引，索引方向对单键索引无所谓，单对复合索引很重要，如执行分组、排序操作时
@CompoundIndex(name = "userid_nickname", def = "{'userid': 1, 'nickname': -1}")

public class Comment implements Serializable {

    /**
    * 主见，不可重复，自带索引，可自己维护不重复的主键，当主键名叫id时，该字段可省略。
    * 如果自己不设置@Id主键，mongo会自动生成名为_id的主键，并且插入时效率远高于自己设置主键。
    * 在实际业务中不建议自己设置主键，应交给mongo自己生成，自己可以设置一个业务id，用自己设置的业务id来维护相关联的表。
    * */
    @Id
    private String id;

    // 不加的话默认以字段名作为映射，同JPA的@Column
    @Field("content")
    private String content;
    private Date publishtime;

    /**
    * 单键索引，如果该字段的值不可重复，也可以声明称唯一索引，当插入的值重复时也会异常
    * */
    @Indexed(unique = true)
    private String userid;

    private String nickname;
    private LocalDateTime createdatetime;
    private Integer likenum;
    private Integer replaynum;
    private String state;
    private String parentid;

    /**
     * 想返回给端上的值不是null，只需要在模型里赋个默认值即可，比如空字符串
     * */
    private String articleid = "";

    /**
     * 被次注解标注的字段，将不会被录入到数据库中，只做普通的Java bean 属性
     * */
    @Transient
    private String others;
}
