document.addEventListener('DOMContentLoaded', function () {
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
    basePrice: 0,
    previousCrushOption: '',
    count: 1,
  };

  elements.shopbtn.addEventListener('click', () => {
    if (confirm('장바구니에 등록하시겠습니까?')) {
      alert('등록되었습니다.');
    }
  });

  elements.crushOptionSelect.addEventListener('change', function () {
    const selectedCrushOption = elements.crushOptionSelect.value;
    const weightOptionWrapper = elements.weightOptionWrapper;
    const weightText = elements.weightText;

    if (selectedCrushOption !== '선택') {
      weightOptionWrapper.style.display = 'block';
      weightText.style.display = 'block';
    }
  });

  elements.weightOptionSelect.addEventListener('change', function () {
    const selectedWeightOption = elements.weightOptionSelect.value;
    const selectedCrushOption = elements.crushOptionSelect.value;

    if (selectedWeightOption !== '선택') {
      if (state.previousCrushOption === selectedCrushOption) {
        alert('동일한 옵션이 존재합니다.');
        resetOptions();
      } else {
        displaySltOptions(selectedCrushOption);
        resetOptions();
        updateSltftText(selectedCrushOption);
        updatePrice();
        elements.countElement.textContent = `${state.count}`;
      }
    }
  });

  elements.decrementCountBtn.addEventListener('click', function () {
    if (state.count > 1) {
      state.count--;
      updateCount();
    }
  });

  elements.incrementCountBtn.addEventListener('click', function () {
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

  function updatePrice() {
    state.basePrice = 31000 * state.count;
    elements.shopMoneyElement.textContent = `총 상품금액 ${state.basePrice.toLocaleString('en-US', {
      style: 'currency',
      currency: 'KRW',
    })}`;
  }

  function updateSltftText(crushOption) {
    elements.sltftElement.textContent = `[갤러리 앨리스] 10월 원두콩\n ${crushOption} / 500g`;
    state.previousCrushOption = crushOption;
  }

  function displaySltOptions(crushOption) {
    elements.sltOptionSelect.style.display = 'block';
    elements.sltpriceElement.style.display = 'block';
    elements.sltbtnElement.style.display = 'block';
  }

  function updateCount() {
    elements.countElement.textContent = state.count;
    updatePrice();
  }
});
