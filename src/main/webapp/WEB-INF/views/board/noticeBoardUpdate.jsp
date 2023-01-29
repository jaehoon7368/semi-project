<%@page import="com.sh.airbnb.board.model.dto.NoticeBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%
	NoticeBoard noticeBoard = (NoticeBoard) request.getAttribute("noticeBoard");
%>
<style>
#main-content {width: 1024px; height: 500px; margin: auto;}
.wrap {padding: 54px 0 50px 0;}
.board-menu {width: 210px; margin: 0; display: block; float: left;}
.board-menu-list {list-style: none; margin: 0;}
.board-menu-list li {margin-bottom: 24px;}
#main-content>nav>ul>li>a {color: rgba(0,0,0,0.60); text-decoration: none; font-size: 18px;}
.notice {width: 770px; height: 300px; float: right;}
.notice-board {width: 770px; height: 500px;}
.notice-head {font-size: 18px; border-bottom: rgba(0,0,0,0.3) solid 1px; height: 41px; margin: 0; padding: 0;}
.notice-list {list-style: none; padding: 0 0 0 0;}
.notice-show {padding: 0 0 0 0;}
.btn-tab {margin-right: 22px; color: rgba(0,0,0,0.6); height: 40px; line-height: normal;}
.notice-update {color: #f7323f; font-weight: bold; height: 40px;}
</style>

    <div id="main-content" class="wrap">
        <nav class="board-menu">
            <ul class="board-menu-list">
                <li><a href="<%= request.getContextPath() %>/board/noticeBoardList" style="font-weight: bold; color: #f7323f;">공지사항</a></li>
                <li><a href="">이벤트</a></li>
                <li><a href="<%= request.getContextPath() %>/board/faqBoardList">자주 묻는 질문</a></li>
                <li><a href="<%= request.getContextPath() %>/board/inquiyBoardList">1:1 문의</a></li>
            </ul>
        </nav>
        <div class="notice">
            <div class="notice-board">
                <div class="notice-head">
                    <a class="btn-tab notice-view" href="<%= request.getContextPath() %>/board/noticeBoardList">서비스 공지사항</a>
                    <!-- 관리자만 볼수 있는 작성메뉴 -->
                    <a class="btn-tab notice-enroll" href="<%= request.getContextPath() %>/board/noticeBoardEnroll">공지사항 작성</a>
                    <span class="btn-tab notice-update">공지사항 수정</span>
                </div>
                <div style="padding-top: 35px;">
                    <form name="noticeBoardUpdateFrm" action="<%=request.getContextPath() %>/board/noticeBoardUpdate" method="post">
                        <table id="tbl-board-view">
                            <tr>
                                <th>제 목</th>
                                <td><input type="text" name="title" value="<%= noticeBoard.getTitle() %>" required style="width: 99%;"></td>
                            </tr>
                            <tr hidden>
                                <th>작성자</th>
                                <td>
                                    <input type="text" name="writer" value="<%= noticeBoard.getWriter() %>" readonly/>
                                </td>
                            </tr>
                            <tr>
                                <th>내 용</th>
                                <td><textarea rows="30" cols="100" name="content" style="resize: none;"><%= noticeBoard.getContent() %></textarea></td>
                            </tr>
                            <tr>
                                <th colspan="2">
                                    <input type="submit" value="작성하기">
                                </th>
                            </tr>
                         </table>
                         <input type="hidden" name="noticeNo" value="<%= noticeBoard.getNoticeNo() %>" />
                    </form>
                </div>
            </div>
        </div>
    </div>
    
<%@ include file="/WEB-INF/views/common/footer.jsp" %>