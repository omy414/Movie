<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<!--  상단메뉴바 -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/board.css">
<script type="text/javascript">
	/*[ Fixed Header ]*/
	var headerDesktop = $('.container-menu-desktop');
	var wrapMenu = $('.wrap-menu-desktop');
	$(headerDesktop).addClass('fix-menu-desktop');
	$(window).on('scroll', function() {
		if (true) {
			$(headerDesktop).addClass('fix-menu-desktop');
			$(wrapMenu).css('top', 0);
		}
	});
</script>
</head>
<body>
	<div class="container">
		<a href="#" class="board_logo"><img src="resources/img/report.png" alt="IMG-LOGO"></a>
		<table class="table table-hover boardTable-report">
			<thead>
				<tr>
					<th width="100">번호</th>
					<th width="100">구분</th>
					<th id="title" width="500" align="center">제목</th>
					<th id="writer" width="150">작성자</th>
					<th width="170">작성일</th>
					<th id="like" width="80">추천</th>
					<th id="hit" width="80">조회수</th>
					<th id="report" width="80">신고!!</th>
				</tr>
			</thead>
			<tbody>
				<!-- 공지넣을곳? -->
				<tr height="63" id="board_notice">
					<td align="left">#459234</td>
					<td align="left">공지</td>
					<td width="500"><a href=""> 자유롭게 이야기를 나누는 곳입니다. 욕설은 하지마세요 </a></td>
					<td align="left" width="150">관리자</td>
					<td align="left" width="170">2019-11-11 11:11:11 <!--  원하는 날짜 형식으로 출력하기 위해 fmt태그 사용 --> <%-- <fmt:formatDate
                value="${row.regdate}" pattern="yyyy-MM-dd HH:mm:ss" />
            </td> --%>
					<td width="80" align="center">4523</td>
					<td width="80" align="center">54231</td>
					<td width="80" align="center">0</td>
				</tr>

				<!--  게시글 -->
				<c:if test="${map.count ==0}">
					<tr align="center" bgcolor="#FFFFFF" height="30">
						<td colspan="6">등록된 글이 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach var="row" items="${map.list}">
					<tr>
						<td align="left" >${row.mboard_no}</td>
						<td align="left" >${row.mboard_header}</td>
						<td width="500" ><a href="${path}/view?mboard_no=${row.mboard_no}"> ${row.mboard_title} <c:if test="${row.mboard_reply_cnt >0 }">
									<span style="color: red;">(${row.mboard_reply_cnt}) </span>
								</c:if>
						</a></td>
						<td align="left" width="150" >${row.member_id}</td>
						<td align="left" width="170" >
							<!--  원하는 날짜 형식으로 출력하기 위해 fmt태그 사용 --> <fmt:formatDate value="${row.mboard_reg_date}" pattern="yyyy-MM-dd HH:mm:ss" />
						</td>
						<td width="80" align="center">${row.mboard_like_cnt}</td>
						<td width="80" align="center" >${row.mboard_hit_cnt}</td>
						<td width="80" align="center" >${row.mboard_report_cnt}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<div class="text-center">
			<button class="btn btn-primary Rbtnmargin" type="button">글쓰기</button>
			<ul class="pagination justify-content-center">
				<li class="page-item">
					<%-- <c:if test="${map.boardPager.curBlock > 1 }"> 처음으로 가는 코드 --%> <a class="page-link" href="javascript:list('1')" aria-label="previous"> <span aria-hidden="true">&laquo;</span> <span class="sr-only">previous</span>
				</a>
				</li>
				<c:forEach var="num" begin="${map.boardPager.blockBegin}" end="${map.boardPager.blockEnd}">
					<c:choose>
						<c:when test="${num ==map.boardPager.curPage}">
							<li class="page-item"><a class="page-link" style="color: red">${num}</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link" href="javascript:list('${num}')">${num}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<li class="page-item"><c:if test="${map.boardPager.curBlock <=map.boardPager.totBlock}">
						<a class="page-link" href="javascript:list('${map.boardPager.nextPage}')" aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span class="sr-only">Next</span>
						</a>
					</c:if></li>
				<li class="page-item"><c:if test="${map.boardPager.curPage <=map.boardPager.totPage}">
						<a class="page-link" href="javascript:list('${map.boardPager.totPage}')" aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span class="sr-only">Next</span>
						</a>
					</c:if></li>
			</ul>
		</div>
	</div>
	<hr>
	<br>
	<footer id="main_footer">
		<p class="copyright">
			"위 내용에 대한 저작권 및 법적 책임은 자료제공사 또는 글쓴이에 있으며 MovieAce의 입장과 다를 수 있습니다."<br> "Copyright (c)" <a href="home">www.MoiveAce.com</a> " All right reserved."
		</p>
	</footer>
	

</body>
</html>