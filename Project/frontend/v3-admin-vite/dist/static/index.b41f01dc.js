import{d as e,M as l,A as a,t,r as s,o as u,c as n,a as r,j as d,w as o,R as i,P as p,G as c,Q as m}from"./index.533573e3.js";const v={class:"app-container"},b=c("🔍"),f=c("Delete"),g=e({name:"index",setup(e){const c=l(""),g=l("id"),h=a().roles,x=l([]);t((()=>{"student"==h[0]?i.alert("非管理员不可使用","WARN",{confirmButtonText:" ✔ "}):p({message:"若无显示,请进行刷新",type:"success"})}));return(e,l)=>{const a=s("el-button"),t=s("el-option"),y=s("el-select"),R=s("el-input"),w=s("el-table-column"),V=s("el-table");return u(),n("div",v,[r("div",null,[d(R,{modelValue:c.value,"onUpdate:modelValue":l[2]||(l[2]=e=>c.value=e),stripe:"",placeholder:"右边选择查询方式:  学院 / 系别 / 班级 / 学号 / 名字",class:"input-with-select"},{prepend:o((()=>[d(a,{onClick:l[0]||(l[0]=e=>(e=>{if("student"==h[0])i.alert("非管理员不可使用","WARN",{confirmButtonText:" ✔ "});else{let t="";if("cg"==g.value)t+="/res-cg/"+e;else if("dep"==g.value)t+="/res-dep/"+e;else if("depclass"==g.value){for(var l=0,a=0;a<e.length;a++)if(e[a]>="0"&&e[a]<="9"){l=a;break}t+="/res-depclass/"+e.substring(0,l)+"/"+e.substring(l,e.length)}else"id"==g.value?t+="/res-id/"+e:"name"==g.value&&(t+="/res-name/"+e);m({url:t,method:"get"}).then((e=>{x.value=e.data.resultResps}))}})(c.value))},{default:o((()=>[b])),_:1})])),append:o((()=>[d(y,{modelValue:g.value,"onUpdate:modelValue":l[1]||(l[1]=e=>g.value=e),placeholder:"选择",style:{width:"200px"}},{default:o((()=>[d(t,{label:"学院(如: 计算机科学与工程学院)",value:"cg"}),d(t,{label:"系别(如: 软件工程)",value:"dep"}),d(t,{label:"班级(系别+班级号, 如: 软件工程202)",value:"depclass"}),d(t,{label:"学号",value:"id"}),d(t,{label:"名字",value:"name"})])),_:1},8,["modelValue"])])),_:1},8,["modelValue"])]),d(V,{data:x.value,stripe:"",style:{width:"100%"}},{default:o((()=>[d(w,{prop:"Sid",label:"学号",sortable:""}),d(w,{prop:"Sname",label:"姓名",sortable:""}),d(w,{prop:"Rtime",label:"🕤测试时间",sortable:""}),d(w,{prop:"Ctype",label:"结果",sortable:""}),d(w,{label:"删除"},{default:o((e=>[d(a,{size:"large",type:"danger",onClick:l=>{return e.$index,a=e.row,void i.confirm("是否要删除"+a.Sname+"在"+a.Rtime+"的测试","WARN",{confirmButtonText:"确定",cancelButtonText:"取消",type:"warning"}).then((()=>{m({url:"/del-result",method:"delete",data:a}),p({type:"success",message:"删除成功"})})).catch((()=>{p({type:"info",message:"取消删除操作"})}));var a}},{default:o((()=>[f])),_:2},1032,["onClick"])])),_:1})])),_:1},8,["data"])])}}});export{g as default};
