import{d as e,A as l,M as a,t,p as u,r as o,o as d,c as r,a as n,j as s,w as i,l as c,S as m,F as v,Q as p,P as f,G as x,R as Q}from"./index.34488a17.js";const b={class:"app-container"},h=x("注意: MBTI用来测试性格是有依据的, 建议不要轻易增删"),g=x("Delete"),_=x("新增题目"),A={class:"demo-drawer__content"},B={class:"example-block"},T={class:"demo-drawer__footer"},V=x("取消"),w=x("提交"),y=e({name:"index",setup(e){const x=l().roles,y=a([]);t((()=>{"student"==x[0]?p.alert("非管理员不可使用","WARN",{confirmButtonText:" ✔ "}):f({url:"/question",method:"get"}).then((e=>{y.value=e.data.questions}))}));const k=a([]),N="80px";let S;const q=a(!1),U=a(!1),C=u({Qtext:"",QAtext:"",QBtext:"",QTid:1,QAvalue:"",QBvalue:""}),F=u({QAtext:[{required:!0,message:"请输入A选项内容",trigger:"blur"}],QBtext:[{required:!0,message:"请输入B选项内容",trigger:"blur"}]}),I=()=>{"student"==x[0]?p.alert("非管理员不可使用","WARN",{confirmButtonText:" ✔ "}):q.value=!0},P=a([]),R=()=>{let e=!0;null==k.value[0]||null==k.value[1]?e=!1:0!=C.QAtext.length&&0!=C.QBtext.length||(e=!1),e?(P.value=[{Qid:0,Qtext:C.Qtext,QAtext:C.QAtext,QBtext:C.QBtext,QTid:C.QTid,QAvalue:k.value[0],QBvalue:k.value[1]}],P.value[0],f({url:"/question-add",method:"post",data:P.value[0]}).then((e=>{e.data.isSuccess?Q({message:"新增问题成功",type:"success"}):Q.error("新增问题失败")})),E.value.close()):p.alert("","🚩 Tip ",{message:"信息不全",confirmButtonText:"OK",dangerouslyUseHTMLString:!0})},E=a(),J=()=>{U.value||p.confirm("你想要提交吗?").then((()=>{U.value=!0,S=setTimeout((()=>{setTimeout((()=>{U.value=!1}),400)}),2e3)})).catch((()=>{}))},M=()=>{U.value=!1,q.value=!1,clearTimeout(S)},W=[{value:"E",label:"E",children:[{value:"I",label:"I"}]},{value:"I",label:"I",children:[{value:"E",label:"E"}]},{value:"S",label:"S",children:[{value:"N",label:"N"}]},{value:"N",label:"N",children:[{value:"S",label:"S"}]},{value:"T",label:"T",children:[{value:"F",label:"F"}]},{value:"F",label:"F",children:[{value:"T",label:"T"}]},{value:"J",label:"J",children:[{value:"P",label:"P"}]},{value:"P",label:"P",children:[{value:"J",label:"J"}]}];return(e,l)=>{const a=o("el-button"),t=o("center"),u=o("el-table-column"),x=o("el-table"),S=o("el-input"),P=o("el-form-item"),j=o("el-cascader"),z=o("el-form");return d(),r(v,null,[n("div",b,[s(t,null,{default:i((()=>[s(a,null,{default:i((()=>[h])),_:1})])),_:1}),s(x,{data:y.value,stripe:"",style:{width:"100%"}},{default:i((()=>[s(u,{prop:"Qid",label:"题标(唯一)"}),s(u,{prop:"Qtext",label:"题目"}),s(u,{prop:"QAtext",label:"A选项"}),s(u,{prop:"QAvalue",label:"特征权值"}),s(u,{prop:"QBtext",label:"A选项"}),s(u,{prop:"QBvalue",label:"特征权值"}),s(u,{label:"删除"},{default:i((e=>[s(a,{size:"large",type:"danger",onClick:l=>{return e.$index,a=e.row,void p.confirm("是否要删除 "+a.Qtext,"WARN",{confirmButtonText:"确定",cancelButtonText:"取消",type:"warning"}).then((()=>{f({url:"/del-question",method:"delete",data:a}),Q({type:"success",message:"删除成功"})})).catch((()=>{Q({type:"info",message:"取消删除操作"})}));var a}},{default:i((()=>[g])),_:2},1032,["onClick"])])),_:1})])),_:1},8,["data"])]),s(t,null,{default:i((()=>[s(a,{type:"success",onClick:I},{default:i((()=>[_])),_:1})])),_:1}),s(c(m),{ref_key:"drawerRef",ref:E,modelValue:q.value,"onUpdate:modelValue":l[4]||(l[4]=e=>q.value=e),title:"请填入相关信息","before-close":J,direction:"ltr","custom-class":"demo-drawer"},{default:i((()=>[n("div",A,[s(z,{model:C,rules:F,"status-icon":""},{default:i((()=>[s(P,{label:"题目(默认为空)",prop:"Qtext"},{default:i((()=>[s(S,{modelValue:C.Qtext,"onUpdate:modelValue":l[0]||(l[0]=e=>C.Qtext=e),autocomplete:"off"},null,8,["modelValue"])])),_:1}),s(P,{label:"A选项","label-width":N,prop:"QAtext"},{default:i((()=>[s(S,{modelValue:C.QAtext,"onUpdate:modelValue":l[1]||(l[1]=e=>C.QAtext=e),autocomplete:"off"},null,8,["modelValue"])])),_:1}),s(P,{label:"B选项","label-width":N,prop:"QBtext"},{default:i((()=>[s(S,{modelValue:C.QBtext,"onUpdate:modelValue":l[2]||(l[2]=e=>C.QBtext=e),autocomplete:"off"},null,8,["modelValue"])])),_:1}),s(P,{label:"","label-width":N},{default:i((()=>[n("div",B,[s(j,{modelValue:k.value,"onUpdate:modelValue":l[3]||(l[3]=e=>k.value=e),options:W,expandTrigger:"hover"},null,8,["modelValue"])])])),_:1}),s(P,null,{default:i((()=>[s(t,null,{default:i((()=>[n("div",T,[s(a,{onClick:M},{default:i((()=>[V])),_:1}),s(a,{type:"primary",loading:U.value,onClick:R},{default:i((()=>[w])),_:1},8,["loading"])])])),_:1})])),_:1})])),_:1},8,["model","rules"])])])),_:1},8,["modelValue"])],64)}}});export{y as default};
