package com.zeus.recruit.service.impl;

import com.zeus.common.utils.DateUtils;
import com.zeus.recruit.domain.RctCategory;
import com.zeus.recruit.mapper.RctCategoryMapper;
import com.zeus.recruit.service.IRctCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * 招聘分类Service业务层处理
 *
 * @author Ayase
 * @date 2022-10-15
 */
@Service
public class RctCategoryServiceImpl implements IRctCategoryService
{
    @Autowired
    private RctCategoryMapper rctCategoryMapper;

    /**
     * 查询招聘分类
     *
     * @param positionId 招聘分类主键
     * @return 招聘分类
     */
    @Override
    public RctCategory selectRctCategoryByPositionId(Long positionId)
    {
        return rctCategoryMapper.selectRctCategoryByPositionId(positionId);
    }

    @Override
    public List<RctCategory> selectRctCategoryNotParent() {
        return rctCategoryMapper.selectRctCategoryNotParent();
    }

    /**
     * 查询招聘分类列表
     *
     * @param rctCategory 招聘分类
     * @return 招聘分类
     */
    @Override
    public List<RctCategory> selectRctCategoryList(RctCategory rctCategory)
    {
        return rctCategoryMapper.selectRctCategoryList(rctCategory);
    }

    /**
     * 新增招聘分类
     *
     * @param rctCategory 招聘分类
     * @return 结果
     */
    @Override
    public int insertRctCategory(RctCategory rctCategory)
    {
        rctCategory.setCreateTime(DateUtils.getNowDate());
        return rctCategoryMapper.insertRctCategory(rctCategory);
    }

    /**
     * 修改招聘分类
     *
     * @param rctCategory 招聘分类
     * @return 结果
     */
    @Override
    public int updateRctCategory(RctCategory rctCategory)
    {
        rctCategory.setUpdateTime(DateUtils.getNowDate());
        return rctCategoryMapper.updateRctCategory(rctCategory);
    }

    /**
     * 批量删除招聘分类
     *
     * @param positionIds 需要删除的招聘分类主键
     * @return 结果
     */
    @Override
    public int deleteRctCategoryByPositionIds(Long[] positionIds)
    {
        return rctCategoryMapper.deleteRctCategoryByPositionIds(positionIds);
    }

    /**
     * 删除招聘分类信息
     *
     * @param positionId 招聘分类主键
     * @return 结果
     */
    @Override
    public int deleteRctCategoryByPositionId(Long positionId)
    {
        return rctCategoryMapper.deleteRctCategoryByPositionId(positionId);
    }

    /**
     * 查询全部分类
     * @return 结果
     */
    @Override
    public List<RctCategory> selectAllCategory() {
        // 创建一个新的分类对象
        RctCategory rctCategory = new RctCategory();
        
        // 查询所有的分类对象
        List<RctCategory> categoryList = rctCategoryMapper.selectRctCategoryList(rctCategory);
        
        // 把查询所有分类list集合按照要求进行封装
        return bulidPermission(categoryList);
    }

    private List<RctCategory> bulidPermission(List<RctCategory> categoryList) {
        // 创建list集合,用于数据最终封装
        ArrayList<RctCategory> finalNode = new ArrayList<>();

        // 把所有菜单list集合遍历,得到顶层菜单 parentId=0菜单 设置level是1
        for (RctCategory categoryNode : categoryList) {
            // 得到顶层菜单
            if(categoryNode.getParentId()==0){
                // 设置顶层菜单的level是1
//                categoryNode.setLevel(1L);
                // 根据顶层分类,向里面进行查询子菜单,封装到finalNode里面
                finalNode.add(selectChildren(categoryNode,categoryList));
            }
        }

        return finalNode;

    }

    private RctCategory selectChildren(RctCategory categoryNode, List<RctCategory> categoryList) {
        //1 因为向一层菜单里面放二层菜单，二层里面还要放三层，把对象初始化
        categoryNode.setChildren(new ArrayList<RctCategory>());

        // 遍历所有分类list结合,进行判断比较，比较id和parentId是否相同
        for (RctCategory category : categoryList) {
            // 判断id和parentId值是否相同
            if(categoryNode.getPositionId().equals(category.getParentId())){
//                Long level = categoryNode.getLevel()+1L;
                // 把父菜单的level+1
//                category.setLevel(level);
                // 如果children为空,进行初始化操作
                if(categoryNode.getChildren()==null){
                    categoryNode.setChildren(new ArrayList<RctCategory>());
                }
                // 把查询出来的子菜单放到父菜单中
                categoryNode.getChildren().add(selectChildren(category,categoryList));
            }
        }
        return categoryNode;
    }
}
