<template>
  <div class="app-container">
    <el-form
      :model="queryParams"
      ref="queryForm"
      size="small"
      :inline="true"
      v-show="showSearch"
      label-width="68px"
    >
      <el-form-item label="用户姓名" prop="nickName">
        <el-input
          v-model="queryParams.nickName"
          placeholder="请输入用户姓名"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="岗位名称" prop="positionName">
        <el-input
          v-model="queryParams.positionName"
          placeholder="请输入岗位名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="投递状态" prop="deliveryStatus">
        <el-select
          v-model="queryParams.deliveryStatus"
          placeholder="请选择投递状态"
          clearable
        >
          <el-option
            v-for="dict in dict.type.rct_delivery_status"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="公司名称" prop="companyName">
        <el-input
          v-model="queryParams.companyName"
          placeholder="请输入公司名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="创建时间">
        <el-date-picker
          v-model="daterangeCreateTime"
          style="width: 240px"
          value-format="yyyy-MM-dd"
          type="daterange"
          range-separator="-"
          start-placeholder="开始日期"
          end-placeholder="结束日期"
        ></el-date-picker>
      </el-form-item>
      <el-form-item>
        <el-button
          type="primary"
          icon="el-icon-search"
          size="mini"
          @click="handleQuery"
          >搜索</el-button
        >
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery"
          >重置</el-button
        >
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <!-- <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['recruit:delivery:add']"
        >新增</el-button> -->
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['recruit:delivery:edit']"
          >审核</el-button
        >
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['recruit:delivery:remove']"
          >删除</el-button
        >
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['recruit:delivery:export']"
          >导出</el-button
        >
      </el-col>
      <right-toolbar
        :showSearch.sync="showSearch"
        @queryTable="getList"
      ></right-toolbar>
    </el-row>

    <el-table
      v-loading="loading"
      :data="deliveryList"
      @selection-change="handleSelectionChange"
    >
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="ID" align="center" prop="deliveryId" />
      <el-table-column label="用户ID" align="center" prop="userId" />
      <el-table-column label="用户姓名" align="center" prop="nickName">
        <template slot-scope="scope">
          <el-tag size="medium" @click="seeResume(scope.row)">{{
            scope.row.nickName
          }}</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="招聘信息ID" align="center" prop="positionId" />
      <el-table-column
        label="岗位名称"
        align="center"
        prop="positionName"
        width="150"
      />
      <el-table-column label="公司ID" align="center" prop="companyId" />
      <el-table-column label="公司名称" align="center" prop="companyName" />
      <el-table-column label="投递状态" align="center" prop="deliveryStatus">
        <template slot-scope="scope">
          <dict-tag
            :options="dict.type.rct_delivery_status"
            :value="scope.row.deliveryStatus"
          />
        </template>
      </el-table-column>
      <el-table-column
        label="创建时间"
        align="center"
        prop="createTime"
        width="180"
      >
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createTime, "{y}-{m}-{d}") }}</span>
        </template>
      </el-table-column>
      <el-table-column
        label="操作"
        align="center"
        class-name="small-padding fixed-width"
      >
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['recruit:delivery:edit']"
            >审核</el-button
          >
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['recruit:delivery:remove']"
            >删除</el-button
          >
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total > 0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或审核简历投递信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item
          v-if="form.deliveryId == null"
          label="用户ID"
          prop="userId"
        >
          <el-input v-model="form.userId" placeholder="请输入用户ID" />
        </el-form-item>
        <el-form-item
          v-if="form.deliveryId == null"
          label="用户姓名"
          prop="nickName"
        >
          <el-input v-model="form.nickName" placeholder="请输入用户姓名" />
        </el-form-item>
        <el-form-item
          v-if="form.deliveryId == null"
          label="招聘ID"
          prop="positionId"
        >
          <el-input v-model="form.positionId" placeholder="请输入招聘信息ID" />
        </el-form-item>
        <el-form-item
          v-if="form.deliveryId == null"
          label="岗位名称"
          prop="positionName"
        >
          <el-input v-model="form.positionName" placeholder="请输入岗位名称" />
        </el-form-item>
        <el-form-item
          v-if="form.deliveryId != null"
          label="投递状态"
          prop="deliveryStatus"
        >
          <el-select v-model="form.deliveryStatus" placeholder="请选择投递状态">
            <el-option
              v-for="dict in dict.type.rct_delivery_status"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item
          v-if="form.deliveryId == null"
          label="公司ID"
          prop="companyId"
        >
          <el-input v-model="form.companyId" placeholder="请输入公司ID" />
        </el-form-item>
        <el-form-item
          v-if="form.deliveryId == null"
          label="公司名称"
          prop="companyName"
        >
          <el-input v-model="form.companyName" placeholder="请输入公司名称" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

    <!-- 简历信息对话框 -->
    <el-dialog title="简历基本信息" :visible.sync="resumeVisible" width="500px">
      <ul class="list-group list-group-striped">
        <li
          v-for="(enKey, index) in enList"
          class="list-group-item"
          :key="index"
        >
          {{ zhList[index] }}
          <div class="pull-right">
            <span v-if="enKey === 'sex'">{{ sexFormat(resume[enKey]) }} </span>
            <span v-else-if="enKey === 'politicsStatus'"
              >{{ politicsFormat(resume[enKey]) }}
            </span>
            <span v-else-if="enKey === 'healthStatus'"
              >{{ healthFormat(resume[enKey]) }}
            </span>
            <span v-else-if="enKey === 'education'"
              >{{ educationFormat(resume[enKey]) }}
            </span>
            <span v-else>{{ resume[enKey] }} </span>
          </div>
        </li>
        <li class="list-group-item">
          简历附件
          <div class="pull-right">
            <a :href=this.resume.resumeFile target="_blank">预览简历</a>
          </div>
        </li>
      </ul>
      <span slot="footer" class="dialog-footer">
        <el-button @click="resumeVisible = false">取 消</el-button>
        <el-button type="danger" @click="updDelivery(2)">拒绝</el-button>
        <el-button type="success" @click="updDelivery(1)">通过</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
import {
  listDelivery,
  getDelivery,
  delDelivery,
  addDelivery,
  updateDelivery,
  downloadFile,
  downloadImgs,
} from "@/api/recruit/delivery";

import { companyListResume } from "@/api/recruit/resume";

import { listCompany } from "@/api/recruit/company";

import { mapGetters } from "vuex";

export default {
  name: "Delivery",
  dicts: ["rct_delivery_status"],
  data() {
    return {
      // 下载路径
      filePath: null,
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 简历投递信息表格数据
      deliveryList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 是否显示简历弹出层
      resumeVisible: false,
      // 公司名称时间范围
      daterangeCreateTime: [],
      // 是否显示简历弹出层
      resumeVisible: false,
      // 简历参数
      resume: {},
      //通过或者拒绝时的简历id
      resumeId: 0,
      // 性别字典
      sexOptions: [],
      // 政治面貌字典
      politicsOptions: [],
      // 最高学历字典
      educationOptions: [],
      // 健康状态字典
      healthOptions: [],
      enList: [
        "nickName",
        "sex",
        "politicsStatus",
        "education",
        "healthStatus",
        "jobIntention",
        "birthday",
        "major",
        "presentAddress",
        "phone",
        "email",
        "award",
        "selfEvaluation",
      ],
      zhList: [
        "姓名",
        "性别",
        "政治面貌",
        "最高学历",
        "健康状况",
        "求职意向",
        "生日",
        "所学专业",
        "现居住地",
        "联系电话",
        "邮箱",
        "所获奖项",
        "专业课程",
        "自我评价",
      ],
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        nickName: null,
        positionName: null,
        deliveryStatus: null,
        companyName: null,
        createTime: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        userId: [
          { required: true, message: "用户ID不能为空", trigger: "blur" },
        ],
        deliveryStatus: [
          { required: true, message: "投递状态不能为空", trigger: "change" },
        ],
      },
    };
  },
  computed: {
    ...mapGetters(["userId", "isCompany"]),
  },
  created() {
    this.getList();
    this.getDicts("sys_user_sex").then((response) => {
      this.sexOptions = response.data;
    });
    this.getDicts("rct_politics_type").then((response) => {
      this.politicsOptions = response.data;
    });
    this.getDicts("rct_health_status").then((response) => {
      this.healthOptions = response.data;
    });
    this.getDicts("sys_education_type").then((response) => {
      this.educationOptions = response.data;
    });
    queryParams;
  },
  methods: {
    /** 查询简历投递信息列表 */
    async getList() {
      this.loading = true;
      this.queryParams.params = {};
      //公司查询自己岗位
      if (this.isCompany) {
        //根据userid查询他的企业信息，将公司id设置上
        await listCompany({ userId: this.userId }).then((res) => {
          this.queryParams.companyName = res.rows[0].companyName;
        });
      }
      if (null != this.daterangeCreateTime && "" != this.daterangeCreateTime) {
        this.queryParams.params["beginCreateTime"] =
          this.daterangeCreateTime[0];
        this.queryParams.params["endCreateTime"] = this.daterangeCreateTime[1];
      }
      listDelivery(this.queryParams).then((response) => {
        this.deliveryList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        deliveryId: null,
        userId: null,
        nickName: null,
        positionId: null,
        positionName: null,
        deliveryStatus: 0,
        companyId: null,
        companyName: null,
        createTime: null,
        updateTime: null,
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.daterangeCreateTime = [];
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map((item) => item.deliveryId);
      this.single = selection.length !== 1;
      this.multiple = !selection.length;
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加简历投递信息";
    },
    /** 审核按钮操作 */
    handleUpdate(row) {
      this.reset();
      const deliveryId = row.deliveryId || this.ids;
      getDelivery(deliveryId).then((response) => {
        this.form = response.data;
        this.open = true;
        this.title = "审核简历投递信息";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate((valid) => {
        if (valid) {
          if (this.form.deliveryId != null) {
            updateDelivery(this.form).then((response) => {
              this.$modal.msgSuccess("审核成功");
              this.open = false;
              this.getList();
            });
          } else {
            addDelivery(this.form).then((response) => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const deliveryIds = row.deliveryId || this.ids;
      this.$modal
        .confirm(
          '是否确认删除简历投递信息编号为"' + deliveryIds + '"的数据项？'
        )
        .then(function () {
          return delDelivery(deliveryIds);
        })
        .then(() => {
          this.getList();
          this.$modal.msgSuccess("删除成功");
        })
        .catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download(
        "recruit/delivery/export",
        {
          ...this.queryParams,
        },
        `delivery_${new Date().getTime()}.xlsx`
      );
    },
    // 性别字典翻译
    sexFormat(value) {
      return this.selectDictLabel(this.sexOptions, value);
    },
    // 政治面貌字典翻译
    politicsFormat(value) {
      return this.selectDictLabel(this.politicsOptions, value);
    },
    // 最高学历字典翻译
    educationFormat(value) {
      return this.selectDictLabel(this.educationOptions, value);
    },
    // 最高学历字典翻译
    healthFormat(value) {
      return this.selectDictLabel(this.healthOptions, value);
    },
    /** 查看简历,审核 */
    seeResume(row) {
      this.resumeId = row.deliveryId;
      var local = "http://localhost:82/dev-api";
      companyListResume({ userId: row.userId }).then((res) => {
        this.resume = res.rows[0];
        this.resumeVisible = true;
        this.resume.resumeFile = local + this.resume.resumeFile;
        console.log(this.resume.resumeFile);
      });
    },
    /** 下载简历附件 */
    // downloadFiles(filePath) {
    //   var flag = false;
    //   console.log("1111" + this.filePath);
    //   downloadFile(filePath, flag).then((res) => {
    //     this.$modal.msgSuccess("下载成功");
    //   });
    // },
    handleUpload(row) {
      const url = row.processedImg; //图片的https链接
      const imgName = url.substr(url.lastIndexOf("/") + 1);
      downloadImgs({
        url: url,
      }).then((res) => {
        let href = window.URL.createObjectURL(new Blob([res])); // 根据后端返回的url对应的文件流创建URL对象
        const link = document.createElement("a"); //创建一个隐藏的a标签
        link.style.display = "none";
        link.href = href; //设置下载的url
        link.download = imgName; //设置下载的文件名
        document.body.appendChild(link);
        link.click();
        document.body.removeChild(link);
        window.URL.revokeObjectURL(href); // 释放掉blob对象
      });
    },

    /** 审核简历,修改简历状态 */
    updDelivery(status) {
      updateDelivery({
        deliveryId: this.resumeId,
        deliveryStatus: status,
      }).then((res) => {
        debugger;
        this.$modal.msgSuccess("审核成功");
        this.getList();
        this.resumeVisible = false;
      });
    },
  },
};
</script>
