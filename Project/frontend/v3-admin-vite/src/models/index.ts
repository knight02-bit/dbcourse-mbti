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
