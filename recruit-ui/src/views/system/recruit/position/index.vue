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
      <el-form-item label="岗位名称" prop="positionName">
        <el-input
          v-model="queryParams.positionName"
          placeholder="请输入岗位名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <!-- <el-form-item label="要求" prop="requirement">
        <el-input
          v-model="queryParams.requirement"
          placeholder="请输入要求"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item> -->
      <el-form-item label="工作城市" prop="workCity">
        <el-input
          v-model="queryParams.workCity"
          placeholder="请输入工作城市"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="截止时间">
        <el-date-picker
          v-model="daterangeDeadline"
          style="width: 240px"
          value-format="yyyy-MM-dd"
          type="daterange"
          range-separator="-"
          start-placeholder="开始日期"
          end-placeholder="结束日期"
        ></el-date-picker>
      </el-form-item>
      <el-form-item label="公司ID" prop="companyId">
        <el-input
          v-model="queryParams.companyId"
          placeholder="请输入发布公司ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="审核状态" prop="status">
        <el-select
          v-model="queryParams.status"
          placeholder="请选择审核状态"
          clearable
        >
          <el-option
            v-for="dict in dict.type.rct_recruit_type"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
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
          v-if="companyStatus == 1 || isCompany"
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['recruit:position:add']"
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
          v-hasPermi="['recruit:position:edit']"
          >{{ isCompany ? "修改" : "审核" }}</el-button
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
          v-hasPermi="['recruit:position:remove']"
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
          v-hasPermi="['recruit:position:export']"
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
      :data="positionList"
      @selection-change="handleSelectionChange"
    >
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="招聘ID" align="center" prop="recruitId" />
      <el-table-column label="岗位名称" align="center" prop="positionName" width="175">
        <template slot-scope="scope">
          <el-popover trigger="hover" placement="top">
            <el-form label-suffix=":">
              <el-form-item label="岗位描述" style="width: 250px" v-html=" scope.row.requirement">
              </el-form-item>
            </el-form>
            <div slot="reference" class="name-wrapper">
              <el-tag size="medium">{{ scope.row.positionName }}</el-tag>
            </div>
          </el-popover>
        </template>
      </el-table-column>
      <!-- <el-table-column label="要求" align="center" prop="requirement" /> -->
      <el-table-column label="工作城市" align="center" prop="workCity" />
      <el-table-column label="招聘人数" align="center" prop="numbers" />
      <el-table-column label="最高薪资" align="center" prop="maxSalary" />
      <el-table-column label="最低薪资" align="center" prop="minSalary" />
      <el-table-column
        label="发布时间"
        align="center"
        prop="startTime"
        width="120"
      >
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.startTime, "{y}-{m}-{d}") }}</span>
        </template>
      </el-table-column>
      <el-table-column
        label="截止时间"
        align="center"
        prop="deadline"
        width="120"
      >
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.deadline, "{y}-{m}-{d}") }}</span>
        </template>
      </el-table-column>
      <!-- <el-table-column
        label="联系电话"
        align="center"
        prop="phone"
        width="120"
      /> -->
      <el-table-column label="发布公司ID" align="center" prop="companyId" />
      <el-table-column label="审核状态" align="center" prop="status">
        <template slot-scope="scope">
          <dict-tag
            :options="dict.type.rct_recruit_type"
            :value="scope.row.status"
          />
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
            v-hasPermi="['recruit:position:edit']"
            >{{ isCompany ? "修改" : "审核" }}</el-button
          >
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['recruit:position:remove']"
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

    <!-- 添加或修改招聘信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item v-if="isCompany" label="岗位名称" prop="positionName">
          <el-input v-model="form.positionName" placeholder="请选择工作岗位" />
        </el-form-item>
        <el-form-item v-if="isCompany" label="岗位分类" prop="categoryId">
          <el-select v-model="form.categoryId" placeholder="请选择所属分类">
            <el-option
              v-for="item in categoryList"
              :key="item.positionId"
              :label="item.positionName"
              :value="item.positionId"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item v-if="isCompany" label="工作城市" prop="workCity">
          <el-input v-model="form.workCity" placeholder="请输入工作城市" />
        </el-form-item>
        <el-form-item v-if="isCompany" label="联系电话" prop="phone">
          <el-input v-model="form.phone" placeholder="请输入联系电话" />
        </el-form-item>
        <el-form-item v-if="isCompany" label="发布时间" prop="startTime">
          <el-date-picker
            clearable
            v-model="form.startTime"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择发布时间"
          >
          </el-date-picker>
        </el-form-item>
        <el-form-item v-if="isCompany" label="截止时间" prop="deadline">
          <el-date-picker
            clearable
            v-model="form.deadline"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择截止时间"
          >
          </el-date-picker>
        </el-form-item>
        <el-form-item v-if="isCompany" label="招聘人数" prop="numbers">
          <el-input v-model="form.numbers" placeholder="请输入招聘人数" />
        </el-form-item>
        <el-form-item v-if="isCompany" label="最高薪资" prop="maxSalary">
          <el-input v-model="form.maxSalary" placeholder="请输入最高薪资" />
        </el-form-item>
        <el-form-item v-if="isCompany" label="最低薪资" prop="minSalary">
          <el-input v-model="form.minSalary" placeholder="请输入最低薪资" />
        </el-form-item>
        <el-form-item
          v-if="form.recruitId != null && !isCompany"
          label="审核状态"
          prop="status"
        >
          <el-select v-model="form.status" placeholder="请选择审核状态">
            <el-option
              v-for="dict in dict.type.rct_recruit_type"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item v-if="isCompany" label="要求" prop="requirement">
          <!-- <el-input
            v-model="form.requirement"
            type="textarea"
            placeholder="请输入要求"
            :autosize="{ minRows: 5, maxRows: 10 }"
            :maxlength="500"
          /> -->
        <editor v-model="form.requirement" :min-height="192"/>
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
  listPosition,
  getPosition,
  delPosition,
  addPosition,
  updatePosition,
} from "@/api/recruit/position";

import { listCompany } from "@/api/recruit/company";

import { listCategoryNotParent } from "@/api/recruit/category";
import { mapGetters } from "vuex";

export default {
  name: "Position",
  dicts: ["rct_recruit_type"],
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
      // 招聘信息表格数据
      positionList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 审核状态时间范围
      daterangeDeadline: [],
      // 岗位分类数据
      categoryList: [],
      // 招聘公司数据，
      companyList: [],
      // 公司审核状态
      companyStatus: null,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        positionName: null,
        categoryId: null,
        requirement: null,
        workCity: null,
        deadline: null,
        companyId: null,
        status: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        positionName: [
          { required: true, message: "岗位名称不能为空", trigger: "blur" },
        ],
      },
    };
  },
  computed: {
    ...mapGetters(["userId", "isCompany"]),
  },
  created() {
    this.getList();
    this.getCategoryList();
    this.getComapnyList();
  },
  methods: {
    /** 查询招聘信息列表 */
    async getList() {
      this.loading = true;
      this.queryParams.params = {};
      //企业用户查询本公司发布的招聘信息
      if (this.isCompany) {
        //根据userid查询他的企业信息，将公司id设置为查询条件
        await listCompany({ userId: this.userId }).then((res) => {
          this.queryParams.companyId = res.rows[0].companyId;
          this.companyStatus = res.rows[0].status;
        });
      }
      if (null != this.daterangeDeadline && "" != this.daterangeDeadline) {
        this.queryParams.params["beginDeadline"] = this.daterangeDeadline[0];
        this.queryParams.params["endDeadline"] = this.daterangeDeadline[1];
      }
      listPosition(this.queryParams).then((response) => {
        this.positionList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    /** 查询招聘岗位 */
    getCategoryList() {
      listCategoryNotParent().then((response) => {
        this.categoryList = response.rows;
      });
    },
    /** 查询招聘公司 */
    getComapnyList() {
      listCompany().then((response) => {
        this.companyList = response.rows;
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
        recruitId: null,
        positionName: null,
        categoryId: null,
        requirement: null,
        workCity: null,
        phone: null,
        startTime: null,
        deadline: null,
        numbers: null,
        maxSalary: null,
        minSalary: null,
        companyId: null,
        status: "0",
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
      this.daterangeDeadline = [];
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map((item) => item.recruitId);
      this.single = selection.length !== 1;
      this.multiple = !selection.length;
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加招聘信息";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const recruitId = row.recruitId || this.ids;
      getPosition(recruitId).then((response) => {
        this.form = response.data;
        this.open = true;
        this.title = "修改招聘信息";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate((valid) => {
        if (valid) {
          if (this.form.recruitId != null) {
            updatePosition(this.form).then((response) => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            // 如果是企业用户的话,新增直接就是将自己绑定的公司名称插入到数据库
            if (this.isCompany) {
              //根据userid查询他的企业信息，将公司id设置上
              listCompany({ userId: this.userId }).then((res) => {
                this.form.companyId = res.rows[0].companyId;
                addPosition(this.form).then((response) => {
                  this.$modal.msgSuccess("新增成功");
                  this.open = false;
                  this.getList();
                });
              });
            } else {
              // 如果是管理员可以选择公司
              addPosition(this.form).then((response) => {
                this.$modal.msgSuccess("新增成功");
                this.open = false;
                this.getList();
              });
            }
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const recruitIds = row.recruitId || this.ids;
      this.$modal
        .confirm('是否确认删除招聘信息编号为"' + recruitIds + '"的数据项？')
        .then(function () {
          return delPosition(recruitIds);
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
        "recruit/recruit/export",
        {
          ...this.queryParams,
        },
        `recruit_${new Date().getTime()}.xlsx`
      );
    },
  },
};
</script>
