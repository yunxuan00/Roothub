<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>roothub</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <!-- 引入 Bootstrap -->
  <link href="/resources/css/bootstrap.min.css" rel="stylesheet">
  <link href="/resources/css/app.css" rel="stylesheet" type="text/css">
  <link rel="shortcut icon" href="/resources/images/favicon.ico">
  <script src="/resources/js/logout.js"></script>
</head>
<body>
 <div class="wrapper" style="width: 100%;background-color: #e5e5e5;">
  <jsp:include page="components/head.jsp"></jsp:include>
    <div class="row">
      <div class="col-md-9">
        <div class="panel panel-default">
          <div class="panel-heading">
            <ul class="nav nav-pills" id="section">
              <c:forEach var="section" items="${sectionAll}" varStatus="status">
              <li class=""><a href="/?tab=${section.sectionTab}">${section.sectionName}</a></li>
            </c:forEach>
          </ul>
        </div>
        <div class="panel-body paginate-bot">
          <c:forEach var="item" items="${page.list}">
          <div class="media" id="topic">
            <div class="media-left">
              <a href="/user/${item.author}"><img src="/resources/images/${item.avatar}" class="avatar" alt=""></a>
            </div>
            <div class="media-body">
              <div class="title">
                <a href="/topic/${item.topicId}">
                  ${item.title}
                </a>
              </div>
              <p class="gray">
              <c:if test="${item.top}">
			  <span class="label label-primary">置顶</span> <span>•</span>
			  </c:if>
			  <c:if test="${item.good}">
			  <span class="label label-primary">精华</span> <span>•</span>
			  </c:if>
                <span><a href="/user/${item.author}">${item.author}</a></span>
                <span class="hidden-sm hidden-xs">•</span>
                <span class="hidden-sm hidden-xs"><a href="/topic/41">${item.replyCount}个评论</a></span>
                <span class="hidden-sm hidden-xs">•</span>
                <span class="hidden-sm hidden-xs">${item.viewCount}次浏览</span>
                <span>•</span>
                <span><fmt:formatDate type="date" 
                  value="${item.createDate}" /></span>
                  <c:if test="${item.lastReplyAuthor != null}">
                  <span>•</span>
                  <span>最后回复来自 <a href="/user/${item.lastReplyAuthor}">${item.lastReplyAuthor}</a></span>
                  </c:if>
                  <span>•</span>
                  <a href="/topic/tag/${item.tag}"><span class="label label-success">${item.tag}</span></a>
                </p>
              </div>
              <div class="divide mar-top-5"></div>
            </div>
          </c:forEach>
          <ul class="pagination pagination-sm pagination2">
        </ul>
      </div>
    </div>
  </div>
  <div class="col-md-3 hidden-sm hidden-xs">
    <div class="panel panel-default" id="session">
    <c:if test="${user == null}">
      <div class="panel-body" id="nologin">
        <h5>属于技术与资讯的社区</h5><p>在这里你可以学习、分享、提问、回答、诉说，这是一个小众且优雅的社区，欢迎你的加入！</p>
      </div>
      </c:if>
      <c:if test="${user != null}">
       <div class="panel-body">
              <div class="media">
                <div class="media-left">
                  <a href="/user/${user.userName}">
                    <img src="/resources/images/${user.avatar}" title="" class="avatar">
                  </a>
                </div>
                <div class="media-body">
                  <div class="media-heading">
                    <a href="/user/public">${user.userName}</a>
                    <div style="color: #7A7A7A; font-size: 12px; margin-top:5px;">
                      <i>${user.signature}</i>
                    </div>
                  </div>
                </div>
                <div style="margin-top: 15px;">
                  <a href="/topic/create" style="text-decoration: underline"><span class="glyphicon glyphicon-pencil"></span><i>发布话题</i></a>
                </div>
              </div>
            </div>
            <div class="panel-footer" style="background-color: white">
              <div class="row">
                <span class="col-md-6"><a href="/notification/list"><span id="n_count">${notReadNotice}</span> 条未读消息</a></span>
                <span class="col-md-6 text-right">声望：<a href="/top100">0</a></span>
              </div>
            </div>
            </c:if>
    </div>
    <!-- 今日热议主题 -->
    <div class="panel panel-default">
      <div class="panel-heading"><span style="color: #ccc;">今日热议主题</span> <!-- <a href="/top100">TOP 100 &gt;&gt;</a> --></div>
      <table class="table" style="font-size: 14px;">
        <tbody>
        <c:forEach var="item" items="${findHot}">
          <tr>
          <td width="24" valign="middle" align="center">
                <a href="/user/${item.author}"><img src="/resources/images/${item.avatar}" class="avatar" border="0" align="default" style="max-width: 24px; max-height: 24px;"></a>
            </td>
            <td><a href="/topic/${item.topicId}" style="color:#778087">${item.title}</a></td>
            <%-- <td align="right" class="ago"><fmt:formatDate type="date" 
                  value="${item.createDate}" /></td> --%>
          </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>
    <!-- 今日热议主题 -->
    <!-- 最热标签 -->
    <div class="panel panel-default">
    <div class="panel-heading"><span style="color: #ccc;">最热标签</span></div>
    <div class="panel-body">
      <div class="row">
      <c:forEach var="item" items="${tag.list}">
          <div class="col-md-6" style="margin-bottom: 10px; padding-left: 10px;">
            <a href="/topic/tag/${item.tag}">
              <span class="label label-success">${item.tag}</span>
            </a>
            <%-- <span class="text-muted">x ${item.number}</span> --%>
            <small class="excerpt text-muted" style="display: block; margin-top: 10px;"></small>
          </div>
          </c:forEach>       
      </div>
    </div>
  </div>
  <!-- 最热标签 -->
    <!-- 社区运行状况 -->
    <div class="panel panel-default">
    <div class="panel-heading"><span style="color: #ccc;">社区运行状况</span></div>
    <div class="cell">
    	<table cellpadding="5" cellspacing="0" border="0" width="100%">
            <tbody style="font-size: 14px;">
            <tr>
                <td width="80" align="right"><span class="gray">注册会员：</span></td>
                <td width="auto" align="left"><strong>${countUserAll}</strong></td>
            </tr>
            <tr>
                <td width="80" align="right" style="font-size: 14px;"><span class="gray">主题：</span></td>
                <td width="auto" align="left"><strong>${countAllTopic}</strong></td>
            </tr>
            <tr>
                <td width="80" align="right"><span class="gray">回复：</span></td>
                <td width="auto" align="left"><strong>${countAllReply}</strong></td>
            </tr>
           </tbody>
        </table>
      </div>
  </div>
 <!-- 社区运行状况 -->
  </div>
</div>
</div>
</div>
<jsp:include page="components/foot.jsp"></jsp:include>
<!-- jQuery (Bootstrap 的 JavaScript 插件需要引入 jQuery) -->
<script src="/resources/js/jquery.js"></script>
<!-- 引入 Bootstrap -->
<script src="/resources/js/bootstrap.min.js"></script>
<!-- 分页 -->
<script src="/resources/js/pagination2.js"></script>
<script src="/resources/js/index.js"></script>
<script type="text/javascript">
var tab = "${tab}";
var url = "/?tab="+tab+"&"
  $(".pagination2").pagination("${page.pageNumber}","${page.totalPage}",10);
</script>
</body>
</html>