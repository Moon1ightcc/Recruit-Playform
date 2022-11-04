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
      <el-form-item label="健康状态" prop="healthStatus">
        <el-select
          v-model="queryParams.healthStatus"
          placeholder="请选择健康状态"
          clearable
        >
          <el-option
            v-for="dict in dict.type.rct_health_status"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="政治面貌" prop="politicsStatus">
        <el-select
          v-model="queryParams.politicsStatus"
          placeholder="请选择政治面貌"
          clearable
        >
          <el-option
            v-for="dict in dict.type.rct_politics_type"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="最高学历" prop="education">
        <el-select
          v-model="queryParams.education"
          placeholder="请选择最高学历"
          clearable
        >
          <el-option
            v-for="dict in dict.type.sys_education_type"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="所学专业" prop="major">
        <el-input
          v-model="queryParams.major"
          placeholder="请输入所学专业"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="现居住地" prop="presentAddress">
        <el-input
          v-model="queryParams.presentAddress"
          placeholder="请输入现居住地"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="联系电话" prop="phone">
        <el-input
          v-model="queryParams.phone"
          placeholder="请输入联系电话"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="邮箱" prop="email">
        <el-input
          v-model="queryParams.email"
          placeholder="请输入邮箱"
          clearable
          @keyup.enter.native="handleQuery"
        />
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
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['recruit:resume:add']"
          >新增</el-button
        >
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['recruit:resume:edit']"
          >修改</el-button
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
          v-hasPermi="['recruit:resume:remove']"
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
          v-hasPermi="['recruit:resume:export']"
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
      :data="resumeList"
      @selection-change="handleSelectionChange"
    >
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="简历ID" align="center" prop="resumeId" />
      <el-table-column label="用户ID" align="center" prop="userId" />
      <el-table-column label="用户姓名" align="center" prop="nickName" />
      <el-table-column label="性别" align="center" prop="sex">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_user_sex" :value="scope.row.sex" />
        </template>
      </el-table-column>
      <el-table-column label="健康状态" align="center" prop="healthStatus">
        <template slot-scope="scope">
          <dict-tag
            :options="dict.type.rct_health_status"
            :value="scope.row.healthStatus"
          />
        </template>
      </el-table-column>
      <el-table-column label="求职意向" align="center" prop="jobIntention" />
      <el-table-column label="政治面貌" align="center" prop="politicsStatus">
        <template slot-scope="scope">
          <dict-tag
            :options="dict.type.rct_politics_type"
            :value="scope.row.politicsStatus"
          />
        </template>
      </el-table-column>
      <el-table-column label="最高学历" align="center" prop="education">
        <template slot-scope="scope">
          <dict-tag
            :options="dict.type.sys_education_type"
            :value="scope.row.education"
          />
        </template>
      </el-table-column>
      <!-- <el-table-column label="生日" align="center" prop="birthday" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.birthday, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column> -->
      <el-table-column label="所学专业" align="center" prop="major" />
      <el-table-column label="现居地" align="center" prop="presentAddress" />
      <el-table-column label="联系电话" align="center" prop="phone" />
      <el-table-column label="邮箱" align="center" prop="email" />
      <!-- <el-table-column label="所获奖项" align="center" prop="award" /> -->
      <el-table-column label="自我评价" align="center" prop="selfEvaluation" />
      <!-- <el-table-column label="简历附件" align="center" prop="resumeFile" /> -->
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
            v-hasPermi="['recruit:resume:edit']"
            >修改</el-button
          >
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['recruit:resume:remove']"
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

    <!-- 添加或修改简历信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="用户ID" prop="userId">
          <el-input v-model="form.userId" placeholder="请输入用户ID" />
        </el-form-item>
        <el-form-item label="用户姓名" prop="nickName">
          <el-input v-model="form.nickName" placeholder="请输入用户姓名" />
        </el-form-item>
        <el-form-item label="性别" prop="sex">
          <el-select v-model="form.sex" placeholder="请选择性别">
            <el-option
              v-for="dict in dict.type.rct_sex_type"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="健康状态" prop="healthStatus">
          <el-select v-model="form.healthStatus" placeholder="请选择健康状态">
            <el-option
              v-for="dict in dict.type.rct_health_status"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="求职意向" prop="jobIntention">
          <el-input v-model="form.jobIntention" placeholder="请输入求职意向" />
        </el-form-item>
        <el-form-item label="政治面貌" prop="politicsStatus">
          <el-select v-model="form.politicsStatus" placeholder="请选择政治面貌">
            <el-option
              v-for="dict in dict.type.rct_politics_type"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="最高学历" prop="education">
          <el-select v-model="form.education" placeholder="请选择最高学历">
            <el-option
              v-for="dict in dict.type.sys_education_type"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="生日" prop="birthday">
          <el-date-picker
            clearable
            v-model="form.birthday"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择生日"
          >
          </el-date-picker>
        </el-form-item>
        <el-form-item label="所学专业" prop="major">
          <el-input v-model="form.major" placeholder="请输入所学专业" />
        </el-form-item>
        <el-form-item label="现居地" prop="presentAddress">
          <el-input v-model="form.presentAddress" placeholder="请输入现居地" />
        </el-form-item>
        <el-form-item label="联系电话" prop="phone">
          <el-input v-model="form.phone" placeholder="请输入联系电话" />
        </el-form-item>
        <el-form-item label="邮箱" prop="email">
          <el-input v-model="form.email" placeholder="请输入邮箱" />
        </el-form-item>
        <el-form-item label="所获奖项" prop="award">
          <el-input v-model="form.award" placeholder="请输入所获奖项" />
        </el-form-item>
        <el-form-item label="自我评价" prop="selfEvaluation">
          <el-input
            v-model="form.selfEvaluation"
            type="textarea"
            placeholder="请输入自我评价"
          />
        </el-form-item>
        <el-form-item label="简历附件">
          <file-upload v-model="form.resumeFile" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import {
  listResume,
  getResume,
  delResume,
  addResume,
  updateResume,
} from "@/api/recruit/resume";

export default {
  name: "Resume",
  dicts: [
    "rct_politics_type",
    "sys_education_type",
    "rct_health_status",
    "sys_user_sex",
  ],
  data() {
    return {
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
      // 简历信息表格数据
      resumeList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        nickName: null,
        healthStatus: null,
        politicsStatus: null,
        education: null,
        major: null,
        presentAddress: null,
        phone: null,
        email: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        userId: [
          { required: true, message: "用户ID不能为空", trigger: "blur" },
        ],
      },
    };
  },

  created() {
    this.getList();
  },
  methods: {
    /** 查询简历信息列表 */
    getList() {
      this.loading = true;
      listResume(this.queryParams).then((response) => {
        this.resumeList = response.rows;
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
        resumeId: null,
        userId: null,
        nickName: null,
        sex: null,
        healthStatus: null,
        jobIntention: null,
        politicsStatus: null,
        education: null,
        birthday: null,
        major: null,
        presentAddress: null,
        phone: null,
        email: null,
        award: null,
        selfEvaluation: null,
        resumeFile: null,
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
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map((item) => item.resumeId);
      this.single = selection.length !== 1;
      this.multiple = !selection.length;
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加简历信息";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const resumeId = row.resumeId || this.ids;
      getResume(resumeId).then((response) => {
        this.form = response.data;
        this.open = true;
        this.title = "修改简历信息";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate((valid) => {
        if (valid) {
          if (this.form.resumeId != null) {
            updateResume(this.form).then((response) => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addResume(this.form).then((response) => {
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
      const resumeIds = row.resumeId || this.ids;
      this.$modal
        .confirm('是否确认删除简历信息编号为"' + resumeIds + '"的数据项？')
        .then(function () {
          return delResume(resumeIds);
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
        "recruit/resume/export",
        {
          ...this.queryParams,
        },
        `resume_${new Date().getTime()}.xlsx`
      );
    },
  },
};
</script>
