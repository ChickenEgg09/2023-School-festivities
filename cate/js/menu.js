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
    }else {
        // 다른 메뉴 항목을 클릭하면 해당 내용을 표시합니다.
        document.getElementById('content').textContent = `${selectedCategory} 메뉴를 선택하셨습니다.`;
    }
}

// 커피 메뉴를 표시하는 함수
function displayCoffeeMenu() {
    document.getElementById('content').innerHTML = `
        <h1>커피 메뉴</h1>
        <ul>
            <li onclick="selectProduct('에스프레소')">에스프레소</li>
            <li onclick="selectProduct('아메리카노')">아메리카노</li>
            <li onclick="selectProduct('헤이즐넛 아메리카노')">헤이즐넛 아메리카노</li>
            <li onclick="selectProduct('카페라떼')">카페라떼</li>
            <li onclick="selectProduct('카푸치노')">카푸치노</li>
            <li onclick="selectProduct('카라멜 마끼아또')">카라멜 마끼아또</li>
            <li onclick="selectProduct('카페모카')">카페모카</li>
            <li onclick="selectProduct('카라멜 모카')">카라멜 모카</li>
            <li onclick="selectProduct('바닐라 라떼')">바닐라 라떼</li>
            <li onclick="selectProduct('헤이즐넛 라떼')">헤이즐넛 라떼</li>
            <li onclick="selectProduct('아포가또')">아포가또</li>
            <li onclick="selectProduct('샷추가')">샷추가</li>
        </ul>
        <div id="selectedProductInfo"></div>
    `;
}

// 라떼 메뉴를 표시하는 함수
function displayLatteMenu() {
    document.getElementById('content').innerHTML = `
        <h1>라떼 메뉴</h1>
        <ul>
            <li onclick="selectProduct('초코라떼')">초코라떼</li>
            <li onclick="selectProduct('블루베리 라떼')">블루베리 라떼</li>
            <li onclick="selectProduct('녹차라떼')">녹차라떼</li>
            <li onclick="selectProduct('자색고구 라떼')">자색고구 라떼</li>
        </ul>
        <div id="selectedProductInfo"></div>
    `;
}

// 스무디 메뉴를 표시하는 함수
function displaySmoothieMenu() {
    document.getElementById('content').innerHTML = `
        <h1>스무디 메뉴</h1>
        <ul>
            <li onclick="selectProduct('딸기, 블루베리, 요거트')">딸기, 블루베리, 요거트</li>
            <li onclick="selectProduct('키위, 청포도')">키위, 청포도</li>
        </ul>
        <div id="selectedProductInfo"></div>
    `;
}

// 아이스크림 메뉴를 표시하는 함수
function displayIceCreamMenu() {
    document.getElementById('content').innerHTML = `
        <h1>아이스크림 메뉴</h1>
        <ul>
            <li onclick="selectProduct('바닐라 아이스크림')">바닐라 아이스크림</li>
            <li onclick="selectProduct('딸기 아이스크림')">딸기 아이스크림</li>
            <li onclick="selectProduct('녹차 아이스크림')">녹차 아이스크림</li>
        </ul>
        <div id="selectedProductInfo"></div>
    `;
}

function displayFruitJuiceMenu() {
    document.getElementById('content').innerHTML = `
        <h1>과일 쥬스 메뉴</h1>
        <ul>
            <li onclick="selectProduct('청포도')">청포도</li>
            <li onclick="selectProduct('토마토')">토마토</li>
        </ul>
        <div id="selectedProductInfo"></div>
    `;
}

function displayTeaAndHerbMenu() {
    document.getElementById('content').innerHTML = `
        <h1>티 & 허브티 메뉴</h1>
        <ul>
            <li onclick="selectProduct('복숭아 아이스티')">복숭아 아이스티</li>
            <li onclick="selectProduct('아.샷.추')">아.샷.추</li>
            <li onclick="selectProduct('허니레몬티')">허니레몬티</li>
            <li onclick="selectProduct('허니자몽티')">허니자몽티</li>
            <li onclick="selectProduct('자몽에이드')">자몽에이드</li>
            <li onclick="selectProduct('레몬에이드')">레몬에이드</li>
            <li onclick="selectProduct('블루레몬에이드')">블루레몬에이드</li>
            <li onclick="selectProduct('로즈마리 허브티')">로즈마리 허브티</li>
            <li onclick="selectProduct('캐모마일 허브티')">캐모마일 허브티</li>
            <li onclick="selectProduct('자스민 허브티')">자스민 허브티</li>
            <li onclick="selectProduct('페퍼민트')">페퍼민트</li>
            <li onclick="selectProduct('루이보스티')">루이보스티</li>
            <li onclick="selectProduct('다즐링 홍차')">다즐링 홍차</li>
            <li onclick="selectProduct('잉글리쉬 브렉스트티')">잉글리쉬 브렉스트티</li>
            <li onclick="selectProduct('얼그레이')">얼그레이</li>
        </ul>
        <div id="selectedProductInfo"></div>
    `;
}

// 디저트 메뉴를 표시하는 함수
function displayDessertMenu() {
    document.getElementById('content').innerHTML = `
        <h1>디저트 메뉴</h1>
        <ul>
            <li onclick="selectProduct('티라미스 케익')">티라미스 케익</li>
            <li onclick="selectProduct('치즈케익')">치즈케익</li>
            <li onclick="selectProduct('페이스트리 슈크림빵')">페이스트리 슈크림빵</li>
            <li onclick="selectProduct('플레인 앨리스쿠키')">플레인 앨리스쿠키</li>
            <li onclick="selectProduct('초코 앨리스쿠키')">초코 앨리스쿠키</li>
            <li onclick="selectProduct('얼그레이 앨리스쿠키')">얼그레이 앨리스쿠키</li>
            <li onclick="selectProduct('초코쿠키')">초코쿠키</li>
            <li onclick="selectProduct('아몬드 쿠키')">아몬드 쿠키</li>
            <li onclick="selectProduct('치즈 쿠키')">치즈 쿠키</li>
        </ul>
        <div id="selectedProductInfo"></div>
    `;
}

function displayMealAndSnacksMenu() {
    document.getElementById('content').innerHTML = `
        <h1>식사와 안주 메뉴</h1>
        <ul>
            <li onclick="selectProduct('차돌박이 비빔밥')">차돌박이 비빔밥</li>
            <li onclick="selectProduct('무화과처트니 샌드위치')">무화과처트니 샌드위치</li>
            <li onclick="selectProduct('와사비마요 샌드위치(매운맛)')">와사비마요 샌드위치(매운맛)</li>
            <li onclick="selectProduct('고르곤졸라 피자')">고르곤졸라 피자</li>
            <li onclick="selectProduct('마르게리따 피자')">마르게리따 피자</li>
            <li onclick="selectProduct('치즈&올리브 플레이트')">치즈&올리브 플레이트</li>
            <li onclick="selectProduct('콘치즈')">콘치즈</li>
            <li onclick="selectProduct('감바스')">감바스</li>
        </ul>
        <div id="selectedProductInfo"></div>
    `;
}

// 상품을 선택하는 함수
function selectProduct(product) {
    selectedProduct = product;

    if (selectedCategory === '티 & 허브티' && [
        '복숭아 아이스티', '아.샷.추', '자몽에이드', '레몬에이드', '블루레몬에이드', 
        '로즈마리 허브티', '캐모마일 허브티', '자스민 허브티', '페퍼민트', '루이보스티', 
        '다즐링 홍차', '잉글리쉬 브렉스트티', '얼그레이'
    ].includes(selectedProduct)) {
        document.getElementById('selectedProductInfo').innerHTML = `
            <h2>${selectedProduct} 메뉴</h2>
            <ul>
                <li onclick="selectTemperature('Ice')">Ice</li>
            </ul>
        `;
    } else if (selectedCategory === '디저트') {
        const price = getPrice('Ice', product);
    
        // 선택한 메뉴와 가격을 화면에 표시합니다.
        document.getElementById('selectedProductInfo').innerHTML = `
            <h2>${product} 메뉴</h2>
            <p>가격: $${price.toFixed(2)}</p>
        `;
    } else if(selectedCategory === '식사와 안주') {
        const price = getPrice('Ice', product);
    
        // 선택한 메뉴와 가격을 화면에 표시합니다.
        document.getElementById('selectedProductInfo').innerHTML = `
            <h2>${product} 메뉴</h2>
            <p>가격: $${price.toFixed(2)}</p>
        `;
    } else {
        document.getElementById('selectedProductInfo').innerHTML = `
            <h2>${selectedProduct} 메뉴</h2>
            <ul>
                <li onclick="selectTemperature('Hot')">Hot</li>
                <li onclick="selectTemperature('Ice')">Ice</li>
            </ul>
        `;
    }
}

function selectTemperature(temperature) {
    selectedTemperature = temperature;

    if (selectedCategory === '아이스크림' && selectedTemperature === 'Hot') {
        document.getElementById('selectedProductInfo').innerHTML = `
            <h2>${selectedProduct} 메뉴</h2>
            <p>선택한 온도: ${selectedTemperature}</p>
            <p>아이스크림은 따뜻하면 녹아요</p>
            <img src="../../images/아이스크림.png" alt="녹는 사진">
        `;
    } else {
        const price = getPrice(selectedTemperature, selectedProduct);
        selectedPrice = price.toFixed(2);
        document.getElementById('selectedProductInfo').innerHTML = `
            <h2>${selectedProduct} 메뉴</h2>
            <p>선택한 온도 ${selectedTemperature}</p>
            <p>가격: $${selectedPrice}</p>
        `;
    }
}

// 가격 정보를 가져오는 함수
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
