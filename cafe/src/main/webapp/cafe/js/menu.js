// JavaScript를 사용하여 화면 전환을 처리합니다.

// 선택한 카테고리 (커피, 라떼, 스무디, 아이스크림, 과일 쥬스)
let selectedCategory = '';
// 선택한 상품 (커피 종류, 라떼 종류, 스무디 종류, 아이스크림 종류, 과일 쥬스 종류)
let selectedProduct = '';
// 선택한 온도 (Hot 또는 Ice)
let selectedTemperature = '';
// 선택한 가격
let selectedPrice = 0; // 초기 가격을 0으로 설정합니다.

// 페이지를 변경하는 함수
function changePage(category) {
	selectedCategory = category;
	if (category === '커피') {
		// 커피 메뉴 항목을 클릭하면 해당 내용을 표시합니다.
		displayCoffeeMenu();
	} else if (category === '라떼') {
		// 라떼 메뉴 항목을 클릭하면 해당 내용을 표시합니다.
		displayLatteMenu();
	} else if (category === '스무디') {
		// 스무디 메뉴 항목을 클릭하면 해당 내용을 표시합니다.
		displaySmoothieMenu();
	} else if (category === '아이스크림') {
		// 아이스크림 메뉴 항목을 클릭하면 해당 내용을 표시합니다.
		displayIceCreamMenu();
	} else if (category === '과일 쥬스') {
		// 과일 쥬스 메뉴 항목을 클릭하면 해당 내용을 표시합니다.
		displayFruitJuiceMenu();
	} else if (category === '티 & 허브티') {
		// 티 & 허브티 메뉴 항목을 클릭하면 해당 내용을 표시합니다.
		displayTeaAndHerbMenu();
	} else if (category === '디저트') {
		// 디저트 메뉴 항목을 클릭하면 해당 내용을 표시합니다.
		displayDessertMenu();
	} else if (category === '식사와 안주') {
		// 식사와 안주 메뉴 항목을 클릭하면 해당 내용을 표시합니다.
		displayMealAndSnacksMenu();
	} else {
		// 다른 메뉴 항목을 클릭하면 해당 내용을 표시합니다.
		document.getElementById('content').textContent = `${selectedCategory} 메뉴를 선택하셨습니다.`;
	}
}

// 커피 메뉴를 표시하는 함수
function displayCoffeeMenu() {
	document.getElementById('content').innerHTML = `
        <h1>커피 메뉴</h1>
		<ul>
			<li class="menu-card">
				<a>
					<div>
						<img class="menu-img" src="menu-images/에스프레소.jpg" alt="원두">
					</div>
					<div class="menu-contents">
						<span class="menu-name">에스프레소</span><br> <span
							class="menu-price">3,000 / 3,200</span>
					</div>
				</a>
			</li>
			<li class="menu-card">
				<a>
					<div>
						<img class="menu-img" src="menu-images/아메리카노.jpg" alt="원두">
					</div>
					<div class="menu-contents">
						<span class="menu-name">아메리카노</span><br> <span
							class="menu-price">2,000 / 2,200</span>
					</div>
				</a>
			</li>
			<li class="menu-card">
				<a>
					<div>
						<img class="menu-img" src="menu-images/헤이즐넛 아메리카노.jpg" alt="원두">
					</div>
					<div class="menu-contents">
						<span class="menu-name">헤이즐넛<br>아메리카노</span><br> <span
							class="menu-price">2,500 / 2,600</span>
					</div>
				</a>
			</li>
			<li class="menu-card">
				<a>
					<div>
						<img class="menu-img" src="menu-images/카페라떼.jpg" alt="원두">
					</div>
					<div class="menu-contents">
						<span class="menu-name">카페라떼</span><br> <span
							class="menu-price">3,200 / 3,300</span>
					</div>
				</a>
			</li>
			<li class="menu-card">
				<a>
					<div>
						<img class="menu-img" src="menu-images/카푸치노.jpg" alt="원두">
					</div>
					<div class="menu-contents">
						<span class="menu-name">카푸치노</span><br> <span
							class="menu-price">4,000 / 4,200</span>
					</div>
				</a>
			</li>
			<li class="menu-card">
				<a>
					<div>
						<img class="menu-img" src="menu-images/카라멜마끼아또.jpg" alt="원두">
					</div>
					<div class="menu-contents">
						<span class="menu-name">카라멜<br>마끼아또</span><br> <span
							class="menu-price">4,500 / 4,700</span>
					</div>
				</a>
			</li>
			<li class="menu-card">
				<a>
					<div>
						<img class="menu-img" src="menu-images/카페모카.jpg" alt="원두">
					</div>
					<div class="menu-contents">
						<span class="menu-name">카페모카</span><br> <span
							class="menu-price">4,300 / 4,500</span>
					</div>
				</a>
			</li>
			<li class="menu-card">
				<a>
					<div>
						<img class="menu-img" src="menu-images/카라멜모카.jfif" alt="원두">
					</div>
					<div class="menu-contents">
						<span class="menu-name">카라멜모카</span><br> <span
							class="menu-price">4,300 / 4,500</span>
					</div>
				</a>
			</li>
			<li class="menu-card">
				<a>
					<div>
						<img class="menu-img" src="menu-images/바닐라라떼.jpg" alt="원두">
					</div>
					<div class="menu-contents">
						<span class="menu-name">바닐라라떼</span><br> <span
							class="menu-price">4,000 / 4,300</span>
					</div>
				</a>
			</li>
			<li class="menu-card">
				<a>
					<div>
						<img class="menu-img" src="menu-images/헤이즐넛라떼.jfif" alt="원두">
					</div>
					<div class="menu-contents">
						<span class="menu-name">헤이즐넛<br>라떼</span><br> <span
							class="menu-price">4,000 / 4,300</span>
					</div>
				</a>
			</li>
		</ul>`;
}

// 라떼 메뉴를 표시하는 함수
function displayLatteMenu() {
	document.getElementById('content').innerHTML = `
        <h1>라떼 메뉴</h1>
        <ul>
            <li class="menu-card">
				<a>
					<div>
						<img class="menu-img" src="menu-images/초코라떼.png" alt="원두">
					</div>
					<div class="menu-contents">
						<span class="menu-name">초코라떼</span><br> <span
							class="menu-price">4,300 / 4,500</span>
					</div>
				</a>
			</li>
			<li class="menu-card">
				<a>
					<div>
						<img class="menu-img" src="menu-images/블루베리라떼.jfif" alt="원두">
					</div>
					<div class="menu-contents">
						<span class="menu-name">블루베리<br>라떼</span><br> <span
							class="menu-price">4,300 / 4,500</span>
					</div>
				</a>
			</li>
			<li class="menu-card">
				<a>
					<div>
						<img class="menu-img" src="menu-images/녹차라떼.jpg" alt="원두">
					</div>
					<div class="menu-contents">
						<span class="menu-name">녹차라떼</span><br> <span
							class="menu-price">4,000 / 4,300</span>
					</div>
				</a>
			</li>
			<li class="menu-card">
				<a>
					<div>
						<img class="menu-img" src="menu-images/자색고구마라떼.jpg" alt="원두">
					</div>
					<div class="menu-contents">
						<span class="menu-name">자색고구마<br>라떼</span><br> <span
							class="menu-price">4,000 / 4,300</span>
					</div>
				</a>
			</li>
        </ul>`;
}

// 스무디 메뉴를 표시하는 함수
function displaySmoothieMenu() {
	document.getElementById('content').innerHTML = `
        <h1>스무디 메뉴</h1>
        <ul>
            <li class="menu-card">
				<a>
					<div>
						<img class="menu-img" src="menu-images/딸기스무디.jfif" alt="원두">
					</div>
					<div class="menu-contents">
						<span class="menu-name">딸기<br>스무디</span><br> <span
							class="menu-price">4,000 / 4,300</span>
					</div>
				</a>
			</li>
			<li class="menu-card">
				<a>
					<div>
						<img class="menu-img" src="menu-images/블루베리스무디.jpg" alt="원두">
					</div>
					<div class="menu-contents">
						<span class="menu-name">블루베리<br>스무디</span><br> <span
							class="menu-price">4,000 / 4,300</span>
					</div>
				</a>
			</li>
			<li class="menu-card">
				<a>
					<div>
						<img class="menu-img" src="menu-images/요거트스무디.jpg" alt="원두">
					</div>
					<div class="menu-contents">
						<span class="menu-name">요거트<br>스무디</span><br> <span
							class="menu-price">4,000 / 4,300</span>
					</div>
				</a>
			</li>
			<li class="menu-card">
				<a>
					<div>
						<img class="menu-img" src="menu-images/키위스무디.jpg" alt="원두">
					</div>
					<div class="menu-contents">
						<span class="menu-name">키위<br>스무디</span><br> <span
							class="menu-price">4,000 / 4,300</span>
					</div>
				</a>
			</li>
			<li class="menu-card">
				<a>
					<div>
						<img class="menu-img" src="menu-images/청포도스무디.jpg" alt="원두">
					</div>
					<div class="menu-contents">
						<span class="menu-name">청포도<br>스무디</span><br> <span
							class="menu-price">4,000 / 4,300</span>
					</div>
				</a>
			</li>
        </ul>`;
}

// 아이스크림 메뉴를 표시하는 함수
function displayIceCreamMenu() {
	document.getElementById('content').innerHTML = `
        <h1>아이스크림 메뉴</h1>
        <ul>
            <li class="menu-card">
				<a>
					<div>
						<img class="menu-img" src="menu-images/바닐라아이스크림.jpg" alt="원두">
					</div>
					<div class="menu-contents">
						<span class="menu-name">바닐라<br>아이스크림</span><br> <span
							class="menu-price">2,000</span>
					</div>
				</a>
			</li>
			<li class="menu-card">
				<a>
					<div>
						<img class="menu-img" src="menu-images/딸기아이스크림.jfif" alt="원두">
					</div>
					<div class="menu-contents">
						<span class="menu-name">딸기<br>아이스크림</span><br> <span
							class="menu-price">2,000</span>
					</div>
				</a>
			</li>
			<li class="menu-card">
				<a>
					<div>
						<img class="menu-img" src="menu-images/녹차아이스크림.jpg" alt="원두">
					</div>
					<div class="menu-contents">
						<span class="menu-name">녹차<br>아이스크림</span><br> <span
							class="menu-price">2,000</span>
					</div>
				</a>
			</li>
			<li class="menu-card">
				<a>
					<div>
						<img class="menu-img" src="menu-images/초코아이스크림.jpg" alt="원두">
					</div>
					<div class="menu-contents">
						<span class="menu-name">초코<br>아이스크림</span><br> <span
							class="menu-price">2,000</span>
					</div>
				</a>
			</li>
        </ul>`;
}

function displayFruitJuiceMenu() {
	document.getElementById('content').innerHTML = `
        <h1>과일 주스 메뉴</h1>
        <ul>
            <li class="menu-card">
				<a>
					<div>
						<img class="menu-img" src="menu-images/청포도주스.jpg" alt="원두">
					</div>
					<div class="menu-contents">
						<span class="menu-name">청포도주스</span><br> <span
							class="menu-price">3,500 / 3700</span>
					</div>
				</a>
			</li>
			<li class="menu-card">
				<a>
					<div>
						<img class="menu-img" src="menu-images/토마토주스.jpg" alt="원두">
					</div>
					<div class="menu-contents">
						<span class="menu-name">토마토주스</span><br> <span
							class="menu-price">3,500 / 3700</span>
					</div>
				</a>
			</li>
        </ul> `;
}

function displayTeaAndHerbMenu() {
	document.getElementById('content').innerHTML = `
        <h1>티 & 허브티 메뉴</h1>
        <ul>
					<li class="menu-card">
						<a>
							<div>
								<img class="menu-img" src="menu-images/허니레몬티.jfif" alt="원두">
							</div>
							<div class="menu-contents">
								<span class="menu-name">허니레몬티</span><br> <span
									class="menu-price">3,500 / 3700</span>
							</div>
						</a>
					</li>
					<li class="menu-card">
						<a>
							<div>
								<img class="menu-img" src="menu-images/허니자몽티.jpg" alt="원두">
							</div>
							<div class="menu-contents">
								<span class="menu-name">허니자몽티</span><br> <span
									class="menu-price">3,500 / 3700</span>
							</div>
						</a>
					</li>
					<li class="menu-card">
						<a>
							<div>
								<img class="menu-img" src="menu-images/복숭아아이스티.jpg" alt="원두">
							</div>
							<div class="menu-contents">
								<span class="menu-name">복숭아<br>아이스티</span><br> <span
									class="menu-price">4,000</span>
							</div>
						</a>
					</li>
					<li class="menu-card">
						<a>
							<div>
								<img class="menu-img" src="menu-images/아샷추.jpg" alt="원두">
							</div>
							<div class="menu-contents">
								<span class="menu-name">아.샷.추</span><br> <span
									class="menu-price">4,000</span>
							</div>
						</a>
					</li>
					<li class="menu-card">
						<a>
							<div>
								<img class="menu-img" src="menu-images/자몽에이드.jpg" alt="원두">
							</div>
							<div class="menu-contents">
								<span class="menu-name">자몽에이드</span><br> <span
									class="menu-price">4,000</span>
							</div>
						</a>
					</li>
					<li class="menu-card">
						<a>
							<div>
								<img class="menu-img" src="menu-images/레몬에이드.jpg" alt="원두">
							</div>
							<div class="menu-contents">
								<span class="menu-name">레몬에이드</span><br> <span
									class="menu-price">4,000</span>
							</div>
						</a>
					</li>
					<li class="menu-card">
						<a>
							<div>
								<img class="menu-img" src="menu-images/블루레몬에이드.png" alt="원두">
							</div>
							<div class="menu-contents">
								<span class="menu-name">블루레몬<br>에이드</span><br> <span
									class="menu-price">4,000</span>
							</div>
						</a>
					</li>
					<li class="menu-card">
						<a>
							<div>
								<img class="menu-img" src="menu-images/로즈마리허브티.jpg" alt="원두">
							</div>
							<div class="menu-contents">
								<span class="menu-name">로즈마리<br>허브티</span><br> <span
									class="menu-price">4,000</span>
							</div>
						</a>
					</li>
					<li class="menu-card">
						<a>
							<div>
								<img class="menu-img" src="menu-images/캐모마일허브티.jpg" alt="원두">
							</div>
							<div class="menu-contents">
								<span class="menu-name">캐모마일<br>허브티</span><br> <span
									class="menu-price">4,000</span>
							</div>
						</a>
					</li>
					<li class="menu-card">
						<a>
							<div>
								<img class="menu-img" src="menu-images/자스민허브티.jpg" alt="원두">
							</div>
							<div class="menu-contents">
								<span class="menu-name">자스민<br>허브티</span><br> <span
									class="menu-price">4,000</span>
							</div>
						</a>
					</li>
					<li class="menu-card">
						<a>
							<div>
								<img class="menu-img" src="menu-images/페퍼민트.jpg" alt="원두">
							</div>
							<div class="menu-contents">
								<span class="menu-name">페퍼민트</span><br> <span
									class="menu-price">4,000</span>
							</div>
						</a>
					</li>
					<li class="menu-card">
						<a>
							<div>
								<img class="menu-img" src="menu-images/다즐링 홍차.jpeg" alt="원두">
							</div>
							<div class="menu-contents">
								<span class="menu-name">다즐링 홍차</span><br> <span
									class="menu-price">4,000</span>
							</div>
						</a>
					</li>
					<li class="menu-card">
						<a>
							<div>
								<img class="menu-img" src="menu-images/잉글리쉬브렉스트티.jpg" alt="원두">
							</div>
							<div class="menu-contents">
								<span class="menu-name">잉글리쉬<br>브렉스트티</span><br> <span
									class="menu-price">4,000</span>
							</div>
						</a>
					</li>
					<li class="menu-card">
						<a>
							<div>
								<img class="menu-img" src="menu-images/얼그레이.png" alt="원두">
							</div>
							<div class="menu-contents">
								<span class="menu-name">얼그레이</span><br> <span
									class="menu-price">4,000</span>
							</div>
						</a>
					</li>
					<li class="menu-card">
						<a>
							<div>
								<img class="menu-img" src="menu-images/루이보스티.jpg" alt="원두">
							</div>
							<div class="menu-contents">
								<span class="menu-name">루이보스티</span><br> <span
									class="menu-price">4,000</span>
							</div>
						</a>
					</li>
				</ul>`;
}

// 디저트 메뉴를 표시하는 함수
function displayDessertMenu() {
	document.getElementById('content').innerHTML = `
        <h1>디저트 메뉴</h1>
        <ul>
            <li class="menu-card">
						<a>
							<div>
								<img class="menu-img" src="menu-images/티라미수케익.jpg" alt="원두">
							</div>
							<div class="menu-contents">
								<span class="menu-name">티라미수<br>케익</span><br> <span
									class="menu-price">5,000</span>
							</div>
						</a>
					</li>
					<li class="menu-card">
						<a>
							<div>
								<img class="menu-img" src="menu-images/치즈케익.jpeg" alt="원두">
							</div>
							<div class="menu-contents">
								<span class="menu-name">치즈케익</span><br> <span
									class="menu-price">4,500</span>
							</div>
						</a>
					</li>
					<li class="menu-card">
						<a>
							<div>
								<img class="menu-img" src="menu-images/페이스트리슈크림빵.jpg" alt="원두">
							</div>
							<div class="menu-contents">
								<span class="menu-name">페이스트리<br>슈크림빵</span><br> <span
									class="menu-price">3,000</span>
							</div>
						</a>
					</li>
					<li class="menu-card">
						<a>
							<div>
								<img class="menu-img" src="menu-images/플레인쿠키.jpeg" alt="원두">
							</div>
							<div class="menu-contents">
								<span class="menu-name">플레인<br>앨리스쿠키</span><br> <span
									class="menu-price">2,000</span>
							</div>
						</a>
					</li>
					<li class="menu-card">
						<a>
							<div>
								<img class="menu-img" src="menu-images/초코앨리스쿠키.jpg" alt="원두">
							</div>
							<div class="menu-contents">
								<span class="menu-name">초코<br>앨리스쿠키</span><br> <span
									class="menu-price">2,000</span>
							</div>
						</a>
					</li>
					<li class="menu-card">
						<a>
							<div>
								<img class="menu-img" src="menu-images/얼그레이쿠키.jfif" alt="원두">
							</div>
							<div class="menu-contents">
								<span class="menu-name">얼그레이<br>앨리스쿠키</span><br> <span
									class="menu-price">2,000</span>
							</div>
						</a>
					</li>
					<li class="menu-card">
						<a>
							<div>
								<img class="menu-img" src="menu-images/초코쿠키.png" alt="원두">
							</div>
							<div class="menu-contents">
								<span class="menu-name">초코쿠키</span><br> <span
									class="menu-price">1,500</span>
							</div>
						</a>
					</li>
					<li class="menu-card">
						<a>
							<div>
								<img class="menu-img" src="menu-images/아몬드쿠키.jpg" alt="원두">
							</div>
							<div class="menu-contents">
								<span class="menu-name">아몬드쿠키</span><br> <span
									class="menu-price">1,500</span>
							</div>
						</a>
					</li>
					<li class="menu-card">
						<a>
							<div>
								<img class="menu-img" src="menu-images/치즈쿠키.jpg" alt="원두">
							</div>
							<div class="menu-contents">
								<span class="menu-name">치즈 쿠키</span><br> <span
									class="menu-price">1,500</span>
							</div>
						</a>
					</li>
        </ul>`;
}

function displayMealAndSnacksMenu() {
	document.getElementById('content').innerHTML = `
        <h1>식사와 안주 메뉴</h1>
        <ul>
            <li class="menu-card">
						<a>
							<div>
								<img class="menu-img" src="menu-images/차돌박이비빔밥.jpg" alt="원두">
							</div>
							<div class="menu-contents">
								<span class="menu-name">차돌박이<br>비빔밥</span><br> <span
									class="menu-price">8,500</span>
							</div>
						</a>
					</li>
					<li class="menu-card">
						<a>
							<div>
								<img class="menu-img" src="menu-images/무화과처트니샌드위치.jpg" alt="원두">
							</div>
							<div class="menu-contents">
								<span class="menu-name">무화과처트니<br>샌드위치</span><br> <span
									class="menu-price">7,500</span>
							</div>
						</a>
					</li>
					<li class="menu-card">
						<a>
							<div>
								<img class="menu-img" src="menu-images/와사비마요샌드위치.jpg" alt="원두">
							</div>
							<div class="menu-contents">
								<span class="menu-name">와사비마요<br>샌드위치</span><br> <span
									class="menu-price">8,000</span>
							</div>
						</a>
					</li>
					<li class="menu-card">
						<a>
							<div>
								<img class="menu-img" src="menu-images/고르곤졸라피자.jpg" alt="원두">
							</div>
							<div class="menu-contents">
								<span class="menu-name">고르곤졸라<br>피자</span><br> <span
									class="menu-price">10,000</span>
							</div>
						</a>
					</li>
					<li class="menu-card">
						<a>
							<div>
								<img class="menu-img" src="menu-images/마르게리따피자.jpg" alt="원두">
							</div>
							<div class="menu-contents">
								<span class="menu-name">마르게리따 피자</span><br> <span
									class="menu-price">10,000</span>
							</div>
						</a>
					</li>
					<li class="menu-card">
						<a>
							<div>
								<img class="menu-img" src="menu-images/치즈올리브플레이트.jpg" alt="원두">
							</div>
							<div class="menu-contents">
								<span class="menu-name">치즈&올리브<br>플레이트</span><br> <span
									class="menu-price">7,500</span>
							</div>
						</a>
					</li>
					<li class="menu-card">
						<a>
							<div>
								<img class="menu-img" src="menu-images/콘치즈.jpg" alt="원두">
							</div>
							<div class="menu-contents">
								<span class="menu-name">콘치즈</span><br> <span
									class="menu-price">5,500</span>
							</div>
						</a>
					</li>
					<li class="menu-card">
						<a>
							<div>
								<img class="menu-img" src="menu-images/감바스.jpg" alt="원두">
							</div>
							<div class="menu-contents">
								<span class="menu-name">감바스</span><br> <span
									class="menu-price">9,500</span>
							</div>
						</a>
					</li>
        </ul>`;
}

// 상품을 선택하는 함수

function getPrice(temperature, product) {
	// 가격을 반환합니다. 실제 가격 정보를 어떻게 저장하고 관리하는지에 따라 수정이 필요할 수 있습니다.
	// 이 예제에서는 단순하게 하드코딩하여 가격을 반환합니다.
	const priceMap = {
		'에스프레소': { 'Hot': 3.50, 'Ice': 4.00 },
		'아메리카노': { 'Hot': 3.00, 'Ice': 3.50 },
		'헤이즐넛 아메리카노': { 'Hot': 3.50, 'Ice': 4.00 },
		'카페라떼': { 'Hot': 4.00, 'Ice': 4.50 },
		'카푸치노': { 'Hot': 4.00, 'Ice': 4.50 },
		'카라멜 마끼아또': { 'Hot': 4.50, 'Ice': 5.00 },
		'카페모카': { 'Hot': 4.50, 'Ice': 5.00 },
		'카라멜 모카': { 'Hot': 4.50, 'Ice': 5.00 },
		'바닐라 라떼': { 'Hot': 4.00, 'Ice': 4.50 },
		'헤이즐넛 라떼': { 'Hot': 4.00, 'Ice': 4.50 },
		'아포가또': { 'Hot': 4.50, 'Ice': 5.00 },
		'샷추가': { 'Hot': 0.50, 'Ice': 0.50 },

		'초코라떼': { 'Hot': 4.50, 'Ice': 5.00 },
		'블루베리 라떼': { 'Hot': 4.50, 'Ice': 5.00 },
		'녹차라떼': { 'Hot': 4.00, 'Ice': 4.50 },
		'자색고구 라떼': { 'Hot': 4.00, 'Ice': 4.50 },

		'딸기, 블루베리, 요거트': { 'Hot': 4.00, 'Ice': 4.50 },
		'키위, 청포도': { 'Hot': 4.00, 'Ice': 4.50 },

		'바닐라 아이스크림': { 'Ice': 2.00 },
		'딸기 아이스크림': { 'Ice': 2.00 },
		'녹차 아이스크림': { 'Ice': 2.00 },

		'청포도': { 'Hot': 4.00, 'Ice': 4.50 }, // 청포도 과일 쥬스 가격
		'토마토': { 'Hot': 4.00, 'Ice': 4.50 }, // 토마토 과일 쥬스 가격

		'허니레몬티': { 'Hot': 3.50, 'Ice': 4.00 },
		'허니자몽티': { 'Hot': 3.50, 'Ice': 4.00 },
		'복숭아 아이스티': { 'Ice': 4.00 },
		'아.샷.추': { 'Ice': 4.00 },
		'자몽에이드': { 'Ice': 4.00 },
		'레몬에이드': { 'Ice': 4.00 },
		'블루레몬에이드': { 'Ice': 4.00 },
		'로즈마리 허브티': { 'Ice': 4.00 },
		'캐모마일 허브티': { 'Ice': 4.00 },
		'자스민 허브티': { 'Ice': 4.00 },
		'페퍼민트': { 'Ice': 4.00 },
		'루이보스티': { 'Ice': 4.00 },
		'다즐링 홍차': { 'Ice': 4.00 },
		'잉글리쉬 브렉스트티': { 'Ice': 4.00 },
		'얼그레이': { 'Ice': 4.00 },

		'티라미스 케익': { 'Ice': 5.00 },
		'치즈케익': { 'Ice': 4.50 },
		'페이스트리 슈크림빵': { 'Ice': 3.00 },
		'플레인 앨리스쿠키': { 'Ice': 2.00 },
		'초코 앨리스쿠키': { 'Ice': 2.00 },
		'얼그레이 앨리스쿠키': { 'Ice': 2.00 },
		'초코쿠키': { 'Ice': 1.50 },
		'아몬드 쿠키': { 'Ice': 1.50 },
		'치즈 쿠키': { 'Ice': 1.50 },

		'차돌박이 비빔밥': { 'Hot': 8.00, 'Ice': 8.50 },
		'무화과처트니 샌드위치': { 'Hot': 7.00, 'Ice': 7.50 },
		'와사비마요 샌드위치(매운맛)': { 'Hot': 7.50, 'Ice': 8.00 },
		'고르곤졸라 피자': { 'Hot': 10.00, 'Ice': 10.50 },
		'마르게리따 피자': { 'Hot': 9.00, 'Ice': 9.50 },
		'치즈&올리브 플레이트': { 'Hot': 6.00, 'Ice': 6.50 },
		'콘치즈': { 'Hot': 5.00, 'Ice': 5.50 },
		'감바스': { 'Hot': 9.00, 'Ice': 9.50 },
	};
	return priceMap[product][temperature];
}
