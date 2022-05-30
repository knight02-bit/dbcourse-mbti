function calculate(){
    var initMoney = document.getElementById("initMoney").value;
    var rate = document.getElementById("rate").value;
    var year = document.getElementById("year").value;
    var addition = document.getElementById("addition").value;
    try{
        initMoney = Number.parseFloat(initMoney);
        rate = Number.parseFloat(rate);
        year = Number.parseFloat(year);
        addition = Number.parseFloat(addition);
        if(year){
            var principalSum = initMoney+(year-1)*addition;//本金总和
        }else{
            var principalSum = initMoney;
        }
        
        var sum = CalculateSum(initMoney,1+rate/100,year,addition);//利息总和
        var profitSum=sum-principalSum;//本息和
        SetValue('principalSum',principalSum);
        SetValue('profitSum',profitSum);
        SetValue('sum',sum);
    }
    catch(err){
        alert(err.message);
    }
}

function SetValue(id,value){
    document.getElementById(id).value = value;
}
function CalculateSum(initMoney,multiplyPower,year,addition){
    if(0==year) return initMoney;

    var result=initMoney;
    for(var i=0;i<year;i++){
        if(i){//第一年无新增本金,之后每年年初增加本金
            result+=addition;
        }
        result *= multiplyPower;   
    }
    return result;
}

