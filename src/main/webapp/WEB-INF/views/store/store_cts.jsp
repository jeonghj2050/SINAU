<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<title>Insert title here</title>
</head>
<body>
  <style type="text/css">
    * {
      box-sizing: border-box;
      margin: 0px;
      padding: 0px;
      padding: 0;
      list-style: none;
      background-color: white;
    }

    header {
      width: 1300px;
      height: 150px;
      margin: auto;
      background-color: blanchedalmond;
    }

    section {
      width: 1300px;
      height: 3000px;
      margin: auto;
      /* background-color: rgba(255, 68, 0, 0.349); */
    }

    footer {
      width: 1300px;
      height: 100px;
      margin: auto;
      background-color: black; 

    }

    /* 공통 */
    a {
      color: black;
      text-decoration: none
    }

    span {
      text-align: right;
      font-size: 10px;
    }

    li {
      list-style: none;
    }

    li a:hover {
      color: #8a8e8b;
    }

    /* 카테고리 메뉴 부분 */
    div#p_cts {
      float: left;
      width: 200px;
      height: 303px;
      letter-spacing: 0px;
      margin-top: 30px;
    }

    div#p_cts>div.p_cts_menu {

      border-bottom: 0px;
      width: 200px;
      height: 30px;
    }

    div#p_cts>div.p_cts_menu>ul.p_cts_ul {
      width: 200px;
      height: 303px;
    }

    div#p_cts>div.p_cts_menu>ul.p_cts_ul>li {
      border-bottom: 1px solid black;
      margin-top: 1px;
      width: 200px;
      height: 50px;
      line-height: 50px;
      font-size: 12px;
      font-weight: 400;
      box-sizing: border-box;
      padding-left: 20px;
    }

    /*카테고리 끝*/
    article {
      margin: 0 auto;
      width: 100%;
      height: 500px;
    }
    article.product {
      margin-top: 5px;
      /* background-color: salmon; */
      float: right;
      width: 1100px;
    }
    article.product>div {
      float: left;
      width: 250px;
      height: 400px;
      margin: 12.5px;
      margin-top: 20px;
    }
    h1 {
      margin: 10px 5px;
    }
  </style>
</head>

<body>
  <header>
  </header>
  <article style="background-color: aliceblue;">이미지</article>
    <section>
      <div id=p_cts>
        <div class=p_cts_menu>
          <ul class=p_cts_ul>
            <li>전체보기</1i>
            <li>아트</li>
            <li>전자제품</li>
            <li>건강/헬스</li>
            <li>음악악기</li>
            <li>푸드/키친</li>
          </ul>
        </div>
      </div>
      <div>
        <article class="product">
          <h1>아트</h1>
          <div class="product"><img src="resources/images/storeimg/1.PNG" width="250px" height="300px">
            <div class="product-text">공예
              <div class="product_title">센티멘탈 감성이 짙게 묻은 굿즈</div>
              <div class="plike_view"><span class="plike_icon"><svg width="8px" height="8px" viewBox="0 0 16 16"
                    class="bi bi-heart-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd"
                      d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z" />
                  </svg></span> 246</div>
              <div class="price">10,450원</div>
            </div>
          </div>
          <div class="product"><img src="resources/images/storeimg/2.PNG" width="250px" height="300px">
            <div class="product-text">공예
              <div class="product_title">센티멘탈 감성이 짙게 묻은 굿즈</div>
              <div class="plike_view"><span class="plike_icon"><svg width="8px" height="8px" viewBox="0 0 16 16"
                    class="bi bi-heart-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd"
                      d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z" />
                  </svg></span> 246</div>
              <div class="price">10,450원</div>
            </div>
          </div>
          <div class="product"><img src="resources/images/storeimg/3.PNG" width="250px" height="300px">
            <div class="product-text">공예
              <div class="product_title">센티멘탈 감성이 짙게 묻은 굿즈</div>
              <div class="plike_view"><span class="plike_icon"><svg width="8px" height="8px" viewBox="0 0 16 16"
                    class="bi bi-heart-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd"
                      d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z" />
                  </svg></span> 246</div>
              <div class="price">10,450원</div>
            </div>
          </div>
          <div class="product"><img src="resources/images/storeimg/1.PNG" width="250px" height="300px">
            <div class="product-text">공예
              <div class="product_title">센티멘탈 감성이 짙게 묻은 굿즈</div>
              <div class="plike_view"><span class="plike_icon"><svg width="8px" height="8px" viewBox="0 0 16 16"
                    class="bi bi-heart-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd"
                      d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z" />
                  </svg></span> 246</div>
              <div class="price">10,450원</div>
            </div>
          </div>
        </article>
        <article class="product">
          <div class="product"><img src="resources/images/storeimg/5.PNG" width="250px" height="300px">
            <div class="product-text">공예
              <div class="product_title">센티멘탈 감성이 짙게 묻은 굿즈</div>
              <div class="plike_view"><span class="plike_icon"><svg width="8px" height="8px" viewBox="0 0 16 16"
                    class="bi bi-heart-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd"
                      d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z" />
                  </svg></span> 246</div>
              <div class="price">10,450원</div>
            </div>
          </div>
          <div class="product"><img src="resources/images/storeimg/7.PNG" width="250px" height="300px">
            <div class="product-text">공예
              <div class="product_title">센티멘탈 감성이 짙게 묻은 굿즈</div>
              <div class="plike_view"><span class="plike_icon"><svg width="8px" height="8px" viewBox="0 0 16 16"
                    class="bi bi-heart-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd"
                      d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z" />
                  </svg></span> 246</div>
              <div class="price">10,450원</div>
            </div>
          </div>
          <div class="product"><img src="resources/images/storeimg/2.PNG" width="250px" height="300px">
            <div class="product-text">공예
              <div class="product_title">센티멘탈 감성이 짙게 묻은 굿즈</div>
              <div class="plike_view"><span class="plike_icon"><svg width="8px" height="8px" viewBox="0 0 16 16"
                    class="bi bi-heart-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd"
                      d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z" />
                  </svg></span> 246</div>
              <div class="price">10,450원</div>
            </div>
          </div>
          <div class="product"><img src="resources/images/storeimg/1.PNG" width="250px" height="300px">
            <div class="product-text">공예
              <div class="product_title">센티멘탈 감성이 짙게 묻은 굿즈</div>
              <div class="plike_view"><span class="plike_icon"><svg width="8px" height="8px" viewBox="0 0 16 16"
                    class="bi bi-heart-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd"
                      d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z" />
                  </svg></span> 246</div>
              <div class="price">10,450원</div>
            </div>
          </div>
        </article>
        <article class="product">
          <div class="product"><img src="resources/images/storeimg/3.PNG" width="250px" height="300px">
            <div class="product-text">공예
              <div class="product_title">센티멘탈 감성이 짙게 묻은 굿즈</div>
              <div class="plike_view"><span class="plike_icon"><svg width="8px" height="8px" viewBox="0 0 16 16"
                    class="bi bi-heart-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd"
                      d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z" />
                  </svg></span> 246</div>
              <div class="price">10,450원</div>
            </div>
          </div>
          <div class="product"><img src="resources/images/storeimg/5.PNG" width="250px" height="300px">
            <div class="product-text">공예
              <div class="product_title">센티멘탈 감성이 짙게 묻은 굿즈</div>
              <div class="plike_view"><span class="plike_icon"><svg width="8px" height="8px" viewBox="0 0 16 16"
                    class="bi bi-heart-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd"
                      d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z" />
                  </svg></span> 246</div>
              <div class="price">10,450원</div>
            </div>
          </div>
          <div class="product"><img src="resources/images/storeimg/4.PNG" width="250px" height="300px">
            <div class="product-text">공예
              <div class="product_title">센티멘탈 감성이 짙게 묻은 굿즈</div>
              <div class="plike_view"><span class="plike_icon"><svg width="8px" height="8px" viewBox="0 0 16 16"
                    class="bi bi-heart-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd"
                      d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z" />
                  </svg></span> 246</div>
              <div class="price">10,450원</div>
            </div>
          </div>
          <div class="product"><img src="resources/images/storeimg/6.PNG" width="250px" height="300px">
            <div class="product-text">공예
              <div class="product_title">센티멘탈 감성이 짙게 묻은 굿즈</div>
              <div class="plike_view"><span class="plike_icon"><svg width="8px" height="8px" viewBox="0 0 16 16"
                    class="bi bi-heart-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd"
                      d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z" />
                  </svg></span> 246</div>
              <div class="price">10,450원</div>
            </div>
          </div>
        </article>
        <article class="product">
          <div class="product"><img src="resources/images/storeimg/7.PNG" width="250px" height="300px">
            <div class="product-text">공예
              <div class="product_title">센티멘탈 감성이 짙게 묻은 굿즈</div>
              <div class="plike_view"><span class="plike_icon"><svg width="8px" height="8px" viewBox="0 0 16 16"
                    class="bi bi-heart-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd"
                      d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z" />
                  </svg></span> 246</div>
              <div class="price">10,450원</div>
            </div>
          </div>
          <div class="product"><img src="resources/images/storeimg/3.PNG" width="250px" height="300px">
            <div class="product-text">공예
              <div class="product_title">센티멘탈 감성이 짙게 묻은 굿즈</div>
              <div class="plike_view"><span class="plike_icon"><svg width="8px" height="8px" viewBox="0 0 16 16"
                    class="bi bi-heart-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd"
                      d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z" />
                  </svg></span> 246</div>
              <div class="price">10,450원</div>
            </div>
          </div>
          <div class="product"><img src="resources/images/storeimg/2.PNG" width="250px" height="300px">
            <div class="product-text">공예
              <div class="product_title">센티멘탈 감성이 짙게 묻은 굿즈</div>
              <div class="plike_view"><span class="plike_icon"><svg width="8px" height="8px" viewBox="0 0 16 16"
                    class="bi bi-heart-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd"
                      d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z" />
                  </svg></span> 246</div>
              <div class="price">10,450원</div>
            </div>
          </div>
          <div class="product"><img src="resources/images/storeimg/5.PNG" width="250px" height="300px">
            <div class="product-text">공예
              <div class="product_title">센티멘탈 감성이 짙게 묻은 굿즈</div>
              <div class="plike_view"><span class="plike_icon"><svg width="8px" height="8px" viewBox="0 0 16 16"
                    class="bi bi-heart-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd"
                      d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z" />
                  </svg></span> 246</div>
              <div class="price">10,450원</div>
            </div>
          </div>
        </article>
        <article class="product">
          <div class="product"><img src="resources/images/storeimg/1.PNG" width="250px" height="300px">
            <div class="product-text">공예
              <div class="product_title">센티멘탈 감성이 짙게 묻은 굿즈</div>
              <div class="plike_view"><span class="plike_icon"><svg width="8px" height="8px" viewBox="0 0 16 16"
                    class="bi bi-heart-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd"
                      d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z" />
                  </svg></span> 246</div>
              <div class="price">10,450원</div>
            </div>
          </div>
          <div class="product"><img src="resources/images/storeimg/6.PNG" width="250px" height="300px">
            <div class="product-text">공예
              <div class="product_title">센티멘탈 감성이 짙게 묻은 굿즈</div>
              <div class="plike_view"><span class="plike_icon"><svg width="8px" height="8px" viewBox="0 0 16 16"
                    class="bi bi-heart-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd"
                      d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z" />
                  </svg></span> 246</div>
              <div class="price">10,450원</div>
            </div>
          </div>
          <div class="product"><img src="resources/images/storeimg/7.PNG" width="250px" height="300px">
            <div class="product-text">공예
              <div class="product_title">센티멘탈 감성이 짙게 묻은 굿즈</div>
              <div class="plike_view"><span class="plike_icon"><svg width="8px" height="8px" viewBox="0 0 16 16"
                    class="bi bi-heart-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd"
                      d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z" />
                  </svg></span> 246</div>
              <div class="price">10,450원</div>
            </div>
          </div>
          <div class="product"><img src="resources/images/storeimg/3.PNG" width="250px" height="300px">
            <div class="product-text">공예
              <div class="product_title">센티멘탈 감성이 짙게 묻은 굿즈</div>
              <div class="plike_view"><span class="plike_icon"><svg width="8px" height="8px" viewBox="0 0 16 16"
                    class="bi bi-heart-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd"
                      d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z" />
                  </svg></span> 246</div>
              <div class="price">10,450원</div>
            </div>
          </div>
        </article>
      </div>
    </section>
    <footer>
    </footer>
</body>
</html>