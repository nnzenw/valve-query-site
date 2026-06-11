# ValveSpecs Pro - GitHub 部署脚本
# 在你自己电脑上执行

# 1. 在 GitHub 上创建仓库（需要先登录）
# 浏览器打开 https://github.com/new
# 仓库名：valve-specs-pro
# 公开/私有都可以，不要勾任何初始化选项

# 2. 复制代码到本地（如果代码还在服务器上）
# 可以通过 scp 或直接下载

# 3. 推送到 GitHub
cd valve-query-site
git remote add origin https://github.com/你的用户名/valve-specs-pro.git
git push -u origin main

# 4. （可选）推送到多个备份地址
# 码云：
# git remote add gitee https://gitee.com/你的用户名/valve-specs-pro.git
# git push -u gitee main
