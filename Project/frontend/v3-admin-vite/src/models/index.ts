//加载问题
export type Question = {
  Qid: number
  Qtext: string
  QAtext: string
  QBtext: string
  QTid: number
  QAvalue: string
  QBvalue: string
  choice: string
}

//加载性格描述
export type Character = {
  Ctype: string
  Ctext: string
}

//学生测试记录
export type ResultResp = {
  Sid: string
  Sname: string
  Rtime: string
  Ctype: string
}

//学生所有信息
export type StudentInfo = {
  Sid: string
  Sname: string
  CGname: string
  Dname: string
  Cid: string
}
