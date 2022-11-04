package com.zeus.web.controller.common;

import com.zeus.common.config.RuoYiConfig;
import com.zeus.common.constant.Constants;
import com.zeus.common.core.domain.AjaxResult;
import com.zeus.common.core.domain.param.RegisterParam;
import com.zeus.common.utils.StringUtils;
import com.zeus.common.utils.file.FileUploadUtils;
import com.zeus.common.utils.file.FileUtils;
import com.zeus.framework.config.ServerConfig;
import com.zeus.recruit.Common.CommonService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

/**
 * 通用请求处理
 * 
 * @author ruoyi
 */
@RestController
@RequestMapping("/common")
@Api(tags = "工具包")
public class CommonController
{
    private static final Logger log = LoggerFactory.getLogger(CommonController.class);

    @Autowired
    private ServerConfig serverConfig;

    @Autowired
    private CommonService commonService;

    private static final String FILE_DELIMETER = ",";

    /**
     * 获取权限码请求接口
     * @param emailJson emailJson字符串
     */
    @ApiOperation("权限码请求接口")
    @PostMapping("/code/request")
    public AjaxResult getRequestPermissionCode(@RequestBody String emailJson){
        return commonService.getRequestPermissionCode(emailJson);
    }

    /**
     * 获取邮箱验证码接口
     * @param registerParam 获取验证码需要的请求参数(邮箱和权限码)
     */
    @ApiOperation("邮箱验证码接口")
    @PostMapping("/code/email")
    public AjaxResult sendEmailCode(@RequestBody RegisterParam registerParam){
        return commonService.sendEmailCode(registerParam);
    }

    /**
     * 通用下载请求
     * 
     * @param fileName 文件名称
     * @param delete 是否删除
     */
    @ApiOperation("下载")
    @GetMapping("/download")
    public void fileDownload(String fileName, Boolean delete, HttpServletResponse response, HttpServletRequest request)
    {
        try
        {
//            fileName = fileName.replaceAll("/profile", "D:/ruoyi/uploadPath");

            if (!FileUtils.checkAllowDownload(fileName))
            {
                throw new Exception(StringUtils.format("文件名称({})非法，不允许下载。 ", fileName));
            }
            String realFileName = System.currentTimeMillis() + fileName.substring(fileName.indexOf("_") + 1);
            String filePath = RuoYiConfig.getDownloadPath() + fileName;

            response.setContentType(MediaType.APPLICATION_OCTET_STREAM_VALUE);
            FileUtils.setAttachmentResponseHeader(response, realFileName);
            FileUtils.writeBytes(filePath, response.getOutputStream());
            if (delete)
            {
                FileUtils.deleteFile(filePath);
            }
        }
        catch (Exception e)
        {
            log.error("下载文件失败", e);
        }
    }

    /**
     * description:根据url下载返回给前端二进制文件流
     *
     * @param request
     * @param response
     * @param url
     */
    @ApiOperation("下载111")
    @GetMapping("/download/url")
    public void downLoadFromUrl(HttpServletRequest request, HttpServletResponse response, String url) {
        try {
            URL urls = new URL(url);
//            根据url创建URL对象
            BufferedInputStream bis = new BufferedInputStream(urls.openStream());
            byte[] tmp = new byte[1024];
            String name = url.substring(url.lastIndexOf('/') + 1);
            response.reset();
            response.setCharacterEncoding("UTF-8");
            response.setContentType(MediaType.APPLICATION_OCTET_STREAM_VALUE);
            response.addHeader("Access-Control-Allow-Origin", "*");//后端允许跨域
            response.addHeader("Access-Control-Expose-Headers", "Content-Disposition,download-filename");
//            将文件名转成utf8的字符串形式
            response.addHeader("Content-Disposition", "attachment;filename=" + new String(name.getBytes(), "utf-8"));
//            获取输出流，将文件流返回给前端
            OutputStream out = response.getOutputStream();
            int len = 0;
//            从url指向的链接中读取数据保存到tmp字节数组中，写入到输出流中
            while ((len = bis.read(tmp, 0, 1024)) != -1) {
                out.write(tmp, 0, len);
            }
            bis.close();
            out.close();
        } catch (IOException e) {
            log.error("下载文件失败", e);
        }
    }

    /**
     * 通用上传请求（单个）
     */
    @PostMapping("/upload")
    public AjaxResult uploadFile(MultipartFile file) throws Exception
    {
        try
        {
            // 上传文件路径
            String filePath = RuoYiConfig.getUploadPath();
            // 上传并返回新文件名称
            String fileName = FileUploadUtils.upload(filePath, file);
            String url = serverConfig.getUrl() + fileName;
            AjaxResult ajax = AjaxResult.success();
            ajax.put("url", url);
            ajax.put("fileName", fileName);
            ajax.put("newFileName", FileUtils.getName(fileName));
            ajax.put("originalFilename", file.getOriginalFilename());
            return ajax;
        }
        catch (Exception e)
        {
            return AjaxResult.error(e.getMessage());
        }
    }

    /**
     * 通用上传请求（多个）
     */
    @PostMapping("/uploads")
    public AjaxResult uploadFiles(List<MultipartFile> files) throws Exception
    {
        try
        {
            // 上传文件路径
            String filePath = RuoYiConfig.getUploadPath();
            List<String> urls = new ArrayList<String>();
            List<String> fileNames = new ArrayList<String>();
            List<String> newFileNames = new ArrayList<String>();
            List<String> originalFilenames = new ArrayList<String>();
            for (MultipartFile file : files)
            {
                // 上传并返回新文件名称
                String fileName = FileUploadUtils.upload(filePath, file);
                String url = serverConfig.getUrl() + fileName;
                urls.add(url);
                fileNames.add(fileName);
                newFileNames.add(FileUtils.getName(fileName));
                originalFilenames.add(file.getOriginalFilename());
            }
            AjaxResult ajax = AjaxResult.success();
            ajax.put("urls", StringUtils.join(urls, FILE_DELIMETER));
            ajax.put("fileNames", StringUtils.join(fileNames, FILE_DELIMETER));
            ajax.put("newFileNames", StringUtils.join(newFileNames, FILE_DELIMETER));
            ajax.put("originalFilenames", StringUtils.join(originalFilenames, FILE_DELIMETER));
            return ajax;
        }
        catch (Exception e)
        {
            return AjaxResult.error(e.getMessage());
        }
    }

    /**
     * 本地资源通用下载
     */
    @GetMapping("/download/resource")
    public void resourceDownload(String resource, HttpServletRequest request, HttpServletResponse response)
            throws Exception
    {
        try
        {
            if (!FileUtils.checkAllowDownload(resource))
            {
                throw new Exception(StringUtils.format("资源文件({})非法，不允许下载。 ", resource));
            }
            // 本地资源路径
            String localPath = RuoYiConfig.getProfile();
            // 数据库资源地址
            String downloadPath = localPath + StringUtils.substringAfter(resource, Constants.RESOURCE_PREFIX);
            // 下载名称
            String downloadName = StringUtils.substringAfterLast(downloadPath, "/");
            response.setContentType(MediaType.APPLICATION_OCTET_STREAM_VALUE);
            FileUtils.setAttachmentResponseHeader(response, downloadName);
            FileUtils.writeBytes(downloadPath, response.getOutputStream());
        }
        catch (Exception e)
        {
            log.error("下载文件失败", e);
        }
    }
}
