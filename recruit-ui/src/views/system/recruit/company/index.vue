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
      <el-form-item label="公司名称" prop="companyName">
        <el-input
          v-model="queryParams.companyName"
          placeholder="请输入公司名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="公司地址" prop="companyAddress">
        <el-input
          v-model="queryParams.companyAddress"
          placeholder="请输入公司地址"
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
            v-for="dict in dict.type.rct_company_auditing"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="公司性质" prop="nature">
        <el-select
          v-model="queryParams.nature"
          placeholder="请选择公司性质"
          clearable
        >
          <el-option
            v-for="dict in dict.type.rct_company_nature"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <!-- <el-form-item label="创建时间">
            <el-date-picker
              v-model="dateRange"
              style="width: 240px"
              value-format="yyyy-MM-dd"
              type="daterange"
              range-separator="-"
              start-placeholder="开始日期"
              end-placeholder="结束日期"
            ></el-date-picker>
          </el-form-item> -->
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
          v-hasPermi="['recruit:company:add']"
          v-if="isCompany"
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
          v-hasPermi="['recruit:company:edit']"
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
          v-hasPermi="['recruit:company:remove']"
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
          v-hasPermi="['recruit:company:export']"
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
      :data="companyList"
      @selection-change="handleSelectionChange"
    >
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="ID" align="center" prop="companyId" />
      <!-- <el-table-column label="公司名称" align="center" prop="companyName" /> -->
      <el-table-column label="公司名称" align="center" prop="companyName">
        <template slot-scope="scope">
          <el-popover trigger="hover" placement="top">
            <el-form label-suffix=":">
              <el-form-item label="公司logo">
                <image-preview
                  :src="scope.row.logo"
                  :width="100"
                  :height="100"
                />
              </el-form-item>
              <el-form-item label="营业执照">
                <image-preview
                  :src="scope.row.license"
                  :width="100"
                  :height="100"
                />
              </el-form-item>
              <el-form-item label="公司描述" style="width: 250px">
                {{ scope.row.remark }}
              </el-form-item>
            </el-form>
            <div slot="reference" class="name-wrapper">
              <el-tag size="medium">{{ scope.row.companyName }}</el-tag>
            </div>
          </el-popover>
        </template>
      </el-table-column>
      <el-table-column label="公司地址" align="center" prop="companyAddress" />
      <el-table-column label="联系电话" align="center" prop="phonenumber" />
      <!-- <el-table-column label="公司logo" align="center" prop="logo" width="100">
        <template slot-scope="scope">
          <image-preview :src="scope.row.logo" :width="50" :height="50" />
        </template>
      </el-table-column> -->
      <!-- <el-table-column
        label="营业执照"
        align="center"
        prop="license"
        width="100"
      >
        <template slot-scope="scope">
          <image-preview :src="scope.row.license" :width="50" :height="50" />
        </template>
      </el-table-column> -->
      <el-table-column label="审核状态" align="center" prop="status">
        <template slot-scope="scope">
          <dict-tag
            :options="dict.type.rct_company_auditing"
            :value="scope.row.status"
          />
        </template>
      </el-table-column>
      <el-table-column label="公司性质" align="center" prop="nature">
        <template slot-scope="scope">
          <dict-tag
            :options="dict.type.rct_company_nature"
            :value="scope.row.nature"
          />
        </template>
      </el-table-column>
      <el-table-column
        v-if="this.userId != this.queryParams.userId"
        label="所属用户ID"
        align="center"
        prop="userId"
      />
      <!-- <el-table-column label="公司描述" align="center" prop="remark" /> -->
      <el-table-column
        label="创建时间"
        align="center"
        prop="createTime"
        width="180"
      >
        <!-- <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createTime, "{y}-{m}-{d}") }}</span>
        </template> -->
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
            v-hasPermi="['recruit:company:edit']"
            >{{ isCompany ? "修改" : "审核" }}</el-button
          >
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['recruit:company:remove']"
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

    <!-- 添加或修改公司信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item v-if="isCompany" label="公司名称" prop="companyName">
          <el-input v-model="form.companyName" placeholder="请输入公司名称" />
        </el-form-item>
        <el-form-item v-if="isCompany" label="公司地址" prop="companyAddress">
          <el-input
            v-model="form.companyAddress"
            placeholder="请输入公司地址"
          />
        </el-form-item>
        <el-form-item v-if="isCompany" label="联系电话" prop="phonenumber">
          <el-input v-model="form.phonenumber" placeholder="请输入联系电话" />
        </el-form-item>
        <el-form-item
          v-if="
            form.companyId != null && this.userId != this.queryParams.userId
          "
          label="审核状态"
          prop="status"
        >
          <el-select v-model="form.status" placeholder="请选择审核状态">
            <el-option
              v-for="dict in dict.type.rct_company_auditing"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item v-if="isCompany" label="公司性质" prop="nature">
          <el-select v-model="form.nature" placeholder="请选择公司性质">
            <el-option
              v-for="dict in dict.type.rct_company_nature"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <!-- <el-form-item
          v-if="isCompany"
          label="公司logo"
        >
          <image-upload v-model="form.logo" />
        </el-form-item>
        <el-form-item
          v-if="isCompany"
          label="营业执照"
        >
          <image-upload v-model="form.license" />
        </el-form-item> -->
        <el-form-item  
        v-if="isCompany" 
        label="公司描述" prop="remark">
          <el-input
            v-model="form.remark"
            type="textarea"
            placeholder="请输入内容"
            :autosize="{ minRows: 5, maxRows: 10 }"
            :maxlength="100"
          />
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
  listCompany,
  getCompany,
  delCompany,
  addCompany,
  updateCompany,
} from "@/api/recruit/company";

import { listUser } from "@/api/system/user";
import { mapGetters } from "vuex";

export default {
  name: "Company",
  dicts: ["rct_company_auditing", "rct_company_nature"],
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
      //公司信息表格数据
      companyList: [],
      // 企业用户数据
      userList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 日期范围
      dateRange: [],
      // 用户类型
      params: {
        userType: 11, //企业用户类型为11
      },
      isTure: true,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        companyName: null,
        companyAddress: null,
        status: null,
        nature: null,
        userId: null,
        createTime: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        companyName: [
          { required: true, message: "公司名称不能为空", trigger: "blur" },
        ],
        companyAddress: [
          { required: true, message: "公司地址不能为空", trigger: "blur" },
        ],
        userId: [
          { required: true, message: "所属用户不能为空", trigger: "blur" },
        ],
      },
    };
  },
  computed: {
    ...mapGetters(["userId", "isCompany"]),
  },
  created() {
    this.getList();
    this.getUserList();
    this.isTure = this.isCompany;
  },
  methods: {
    /** 查询公司信息列表 */
    getList() {
      this.loading = true;
      //如果是企业，只查询自己的
      if (this.isCompany) {
        this.queryParams.userId = this.userId;
      }
      listCompany(this.queryParams, this.dateRange).then((response) => {
        this.companyList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    /** 查询企业用户信息列表 */
    getUserList() {
      listUser(this.params).then((response) => {
        this.userList = response.rows;
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
        companyId: null,
        companyName: null,
        companyAddress: null,
        phonenumber: null,
        logo: null,
        license: null,
        status: 0,
        nature: null,
        userId: null,
        createBy: null,
        remark: null,
        createTime: null,
        updateBy: null,
        updateTime: null,
      };
      // this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.dateRange = [];
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map((item) => item.companyId);
      this.single = selection.length !== 1;
      this.multiple = !selection.length;
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加公司信息";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const companyId = row.companyId || this.ids;
      getCompany(companyId).then((response) => {
        this.form = response.data;
        this.open = true;
        this.title = "修改公司信息";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate((valid) => {
        if (valid) {
          if (this.form.companyId != null) {
            updateCompany(this.form).then((response) => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addCompany(this.form).then((response) => {
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
      const companyIds = row.companyId || this.ids;
      this.$modal
        .confirm('是否确认删除公司信息编号为"' + companyIds + '"的数据项？')
        .then(function () {
          return delCompany(companyIds);
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
        "recruit/company/export",
        {
          ...this.queryParams,
        },
        `company_${new Date().getTime()}.xlsx`
      );
    },
  },
};
</script>
