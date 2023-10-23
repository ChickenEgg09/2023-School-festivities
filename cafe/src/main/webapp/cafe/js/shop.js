document.addEventListener('DOMContentLoaded', function() {
	
	var productName = document.getElementById('productName').value;
	const elements = {
		crushOptionSelect: document.getElementById('crushOptionSelect'),
		weightOptionSelect: document.getElementById('weightOption'),
		weightOptionWrapper: document.getElementById('weightOptionWrapper'),
		sltOptionSelect: document.getElementById('slt'),
		weightText: document.getElementById('weightText'),
		shopMoneyElement: document.querySelector('.shop-money'),
		sltftElement: document.querySelector('.sltft'),
		sltbtnElement: document.querySelector('.slt-btn'),
		sltpriceElement: document.querySelector('.slt-price'),
		countElement: document.querySelector('.count'),
		shopbtn: document.getElementById('shop-btn'),
		decrementCountBtn: document.getElementById('decrementCount'),
		incrementCountBtn: document.getElementById('incrementCount'),
	};

	let state = {
		money: 0,
		basePrice: 0,
		previousprice: '',
		previousCrushOption: '',
		previousweightOption: '',
		count: 1,
	};

	elements.shopbtn.addEventListener('click', () => {
		if (confirm('장바구니에 등록하시겠습니까?')) {
			alert('등록되었습니다.');
		}
	});

	elements.crushOptionSelect.addEventListener('change', function() {
		const selectedCrushOption = elements.crushOptionSelect.value;
		const weightOptionWrapper = elements.weightOptionWrapper;
		const weightText = elements.weightText;

		if (selectedCrushOption !== '선택') {
			weightOptionWrapper.style.display = 'block';
			weightText.style.display = 'block';
		}
	});

	elements.weightOptionSelect.addEventListener('change', function() {
		const selectedWeightOption = elements.weightOptionSelect.value;
		const selectedCrushOption = elements.crushOptionSelect.value;

		if (selectedWeightOption !== '선택') {
			if (state.previousCrushOption === selectedCrushOption && state.previousweightOption === selectedWeightOption) {
				alert('동일한 옵션이 존재합니다.');
				resetOptions();
			} else {
				state.count = 1;
				updatePrice(selectedWeightOption, productName); // 여기서 updatePrice 함수를 호출합니다
				displaySltOptions(selectedCrushOption);
				resetOptions();
				updateSltftText(selectedCrushOption, selectedWeightOption, productName);
				elements.countElement.textContent = `${state.count}`;
			}
		}
	});


	elements.decrementCountBtn.addEventListener('click', function() {
		if (state.count > 1) {
			state.count--;
			updateCount();
		}
	});

	elements.incrementCountBtn.addEventListener('click', function() {
		state.count++;
		updateCount();
	});

	function resetOptions() {
		elements.sltOptionSelect.style.display = 'block';
		elements.sltbtnElement.style.display = 'block';
		elements.sltpriceElement.style.display = 'block';
		elements.crushOptionSelect.value = '선택';
		elements.weightOptionSelect.value = '선택';
		elements.weightOptionWrapper.style.display = 'none';
		elements.weightText.style.display = 'none';
	}

	function updatePrice(weightOption, productName) {
		if(weightOption === '500g'){
			state.money = 31000;
			state.previousprice = '31,000';
		} else if(weightOption === '250g'){
			if(productName === '단풍 블렌드'){
				state.money = 25000;
				state.previousprice = '25,000';
			} else {
				state.money = 22000;
				state.previousprice = '22,000';
			}
		} else if(weightOption === '1kg'){
			if(productName === '강릉 블렌드'){
					state.money = 76500;
				state.previousprice = '76,500';
			} else {
				state.money = 67500;
				state.previousprice = '67,500';				
			}
		} else if(weightOption === '필요' || '불필요') {
			state.money = 18000;
			state.previousprice = '18,000';
		}
		state.basePrice = state.money * state.count;
		elements.shopMoneyElement.textContent = `총 상품금액 ${state.basePrice.toLocaleString('ko-KR', {
			style: 'currency',
			currency: 'KRW',
		})}`;
	}


	function updateSltftText(crushOption, weightOption, productName) {
		
		
		elements.sltftElement.textContent = `${productName}\n ${crushOption} / ${weightOption}`;
		state.previousCrushOption = crushOption;
		state.previousweightOption = weightOption;
		elements.sltpriceElement.innerHTML = `<span>${state.previousprice}<span>원`
	}

	function displaySltOptions() {
		elements.sltOptionSelect.style.display = 'block';
		elements.sltpriceElement.style.display = 'block';
		elements.sltbtnElement.style.display = 'block';
	}

	function updateCount() {
		elements.countElement.textContent = state.count;
		updatePrice();
	}
});
