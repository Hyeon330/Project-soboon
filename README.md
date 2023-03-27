# 🧑‍🤝‍🧑<a href="http://3.35.208.207/">소분소분</a>
> 이웃 대상 나눔 커뮤니티

---
## 서비스 소개
소분소분, 말 그대로 무엇인가를 소분한다는 말에서 아이디어를 얻었습니다. 
이웃이 해결해 줄 수 있는 나의 불편한 점들, 반대로 내가 이웃의 문제를 해결해 줄 수 있는 방법을 공유합니다.
1인가구가 증대되면서 삭막해진 사회를 좀 더 따뜻하게 만들고자 만들게 되었습니다.

## 🛠️ Stacks 
---
![JAVA](https://img.shields.io/badge/-JAVA-%23525C86)
![Spring boot](https://img.shields.io/badge/-Spring%20boot-%236DB33F)
![Node.js](https://img.shields.io/badge/-Node.js-%23339933)
![MySql](https://img.shields.io/badge/-Mysql-%234479A1)
![myBatis](https://img.shields.io/badge/-myBatis-%23FF5A5F)
![Apache Tomcat](https://img.shields.io/badge/-Apache%20Tomcat-%23F8DC75)
![Amazon RDS](https://img.shields.io/badge/-Amazon%20RDS-%23527FFF)

![HTML5](https://img.shields.io/badge/-HTML5-%23E34F26)
![CSS3](https://img.shields.io/badge/-CSS3-%231572B6)
![JavaScript](https://img.shields.io/badge/-JavaScript-%23F7DF1E)
![Ajax](https://img.shields.io/badge/-Ajax-%235A29E4)
![jQuery](https://img.shields.io/badge/-jQuery-%230769AD)
![Bootstrap](https://img.shields.io/badge/-Bootstrap-%237952B3)

![Git](https://img.shields.io/badge/-Git-%23F05032)
![Slack](https://img.shields.io/badge/-Slack-%234A154B)
![Discord](https://img.shields.io/badge/-Discord-%235865F2)

---
## 👍 주요 기능 

### ⭐️ 게시판 페이지(나눔, 대여, 판매, 도움)
- 검색 기능(키워드로 검색해서 키워드에 맞는 게시판의 내용 표시)
- 글 작성자와 댓글 및 1:1 채팅으로 교류 

### ⭐️ 회원 페이지
- 로그인 및 로그아웃, 회원가입, 수정, 탈퇴

### ⭐️ 관리자 페이지
- 회원관리, 게시판 글 관리, 신고 관리

---
## 📌 아키텍쳐

#### 디렉토리 구조
```bash
├── README.md
├── build.gradle
├── src
│   ├── main 
│   │   ├── java/com/semiproject/soboon
│   │   │   ├── controller 
│   │   │   │   ├── AddressController : 위치 관련 Controller
│   │   │   │   ├── AdminController : 관리자 페이지 관련 Controller
│   │   │   │   ├── ChatController : 채팅 페이지 관련 Controller
│   │   │   │   ├── MemberController : 회원 관련 Controller
│   │   │   │   ├── MypageController : 마이페이지 관련 Controller
│   │   │   │   ├── RentAndSaleController : 대여, 판매 페이지 관련 Controller
│   │   │   │   ├── ReplyController : 댓글 관련 Controller
│   │   │   │   ├── ReportController : 신고 관련 Controller
│   │   │   │   └── ShareAndReqController : 나눔, 요청 페이지 관련 Controller
│   │   │   ├── dao
│   │   │   │   ├── AddressDAO : 위치 관련 DAO
│   │   │   │   ├── AdminDAO : 관리자 관련 DAO
│   │   │   │   ├── BoardDAO : 게시판 관련 DAO
│   │   │   │   ├── ChatDAO : 채팅 관련 DAO
│   │   │   │   ├── EditDAO : 마이페이지 수정 관련 DAO
│   │   │   │   ├── HomeDAO : 홈 관련 DAO
│   │   │   │   ├── MemberDAO : 회원 관련 DAO
│   │   │   │   ├── ReplyDAO : 댓글 관련 DAO
│   │   │   │   └── ReportDAO : 신고 관련 DAO
│   │   │   ├── service
│   │   │   │   ├── AddressService, AddressServiceImpl : 위치 관련 service
│   │   │   │   ├── AdminService, AdminServiceImpl : 관리자 관련 service
│   │   │   │   ├── BoardService, BoardServiceImpl : 게시판 관련 service
│   │   │   │   ├── ChatService, ChatServiceImpl : 채팅 관련 service
│   │   │   │   ├── EditService, EditServiceImpl : 마이페이지 수정 관련 service
│   │   │   │   ├── HomeService, HomeServiceImpl : 홈 관련 service
│   │   │   │   ├── KakaoAPI : 카카오 로그인 관련 service
│   │   │   │   ├── MemberService, MemberSerciceImpl : 회원 관련 service
│   │   │   │   ├── ReplyAndPickService, ReplyServiceImpl : 댓글, 찜 관련 service
│   │   │   │   └── ReportService, ReportServiceImpl : 신고 관련 service
│   │   │   ├── vo
│   │   │   │   ├── AdminVO : 관리자 관련 vo
│   │   │   │   ├── BoardVO : 게시판 관련 vo
│   │   │   │   ├── ChatVO : 채팅 관련 vo
│   │   │   │   ├── HomeVO : 홈 관련 vo
│   │   │   │   ├── MemberVO : 회원 관련 vo
│   │   │   │   ├── MyPageVO : 마이페이지 관련 vo
│   │   │   │   ├── MyPagingVO : 마이페이지 페이징 관련 vo
│   │   │   │   ├── PagingVO : 게시판 관련 vo
│   │   │   │   ├── PickVO : 좋아요 관련 vo
│   │   │   │   ├── ReplyVO : 댓글 관련 vo
│   │   │   │   └── ReportVO : 신고 관련 vo
│   │   │   ├── AdminInterceptor : 관리자 페이지로 인터셉트 관련
│   │   │   ├── HomeController : 홈페이지 관련 
│   │   │   ├── LoginInterceptor : 로그인 인터셉트 관련
│   │   │   ├── RelateUploadFile : 게시판 이미지 파일 업로드 관련
│   │   │   ├── ServerConfigure : 로그인한 유저만 사용할 수 있게 하는 setting 
│   │   │   ├── SerletInitializer 
│   │   │   └── soboonApplication
│   │   ├── resources
│   │   │   ├── mapper
│   │   │   │   ├── addrMapper.xml : 위치(주소) 관련 쿼리문
│   │   │   │   ├── boardMapper.xml : 게시판 관련 쿼리문
│   │   │   │   ├── chatMapper.xml : 채팅 관련 쿼리문
│   │   │   │   ├── editMapper.xml : 마이페이지 관련 쿼리문
│   │   │   │   ├── homeMapper.xml : 홈 관련 쿼리문
│   │   │   │   ├── memberMapper.xml : 회원 관련 쿼리문
│   │   │   │   ├── replyMapper.xml : 댓글 관련 쿼리문
│   │   │   │   └── reportMapper.xml : 신고 관련 쿼리문
│   │   │   ├── application.yml : db와 mybatis 세팅
│   │   │   └── mybatis-config.xml
│   │   └── webapp
│   │   │   ├── WEB/INF/views
│   │   │   │   ├── admin : 관리자 페이지 jsp들
│   │   │   │   ├── board : 게시판 페이지 jsp들 share(나눔), rent(대여), req(요청), sale(판매)
│   │   │   │   ├── inc : 페이지에 포함되는 jsp 블럭들
│   │   │   │   │   ├── addrSelectDialog.jsp : 위치
│   │   │   │   │   ├── bottom.jspf : 홈 하단 부분
│   │   │   │   │   ├── chat.jspf : 채팅
│   │   │   │   │   ├── mypageSideBar.jsp : 마이페이지 사이드바
│   │   │   │   │   ├── report.jsp : 신고
│   │   │   │   │   └── top.jspf : 홈 상단 부분
│   │   │   │   ├── member : 회원 관련 jsp 파일들
│   │   │   │   ├── mypage : 마이페이지 관련 jsp 파일들
│   │   │   │   └── home.jsp
│   │   │   ├── css : view 관련 css
│   │   │   ├── img
│   │   │   ├── img2
│   │   │   ├── js : view 관련 js
│   │   │   ├── notice
│   │   │   └── upload : 업로드된 이미지 폴더
