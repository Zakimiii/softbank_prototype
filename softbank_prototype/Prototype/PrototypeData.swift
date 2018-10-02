//
//  PrototypeData.swift
//  softbank_prototype
//
//  Created by Apple on 2018/09/06.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit
import Foundation

let defaults = UserDefaults.standard
let aiHtml = ""//defaults.object(forKey: "AI-HTML") as! String
let guitarHtml = ""//defaults.object(forKey: "GUITAR-HTML") as! String
let mentalHtml = ""//defaults.object(forKey: "MENTAL-HTML") as! String
let englishHtml = ""//defaults.object(forKey: "ENGLISH-HTML") as! String

var user1 = PrunedUser(_id: 1, uuid: "1", role: nil, nickname: "I am a 1", registrationConfirmed: true, stats: UserStats(_id: 1, followCount: 3, followedCount: 3), image: "", backgroundImage: "", permissions: nil, createdAt: nil, updatedAt: nil, version: nil)
var user2 = PrunedUser(_id: 2, uuid: "2", role: nil, nickname: "I am a 2", registrationConfirmed: true, stats: UserStats(_id: 1, followCount: 3, followedCount: 3), image: "", backgroundImage: "", permissions: nil, createdAt: nil, updatedAt: nil, version: nil)
var user3 = PrunedUser(_id: 3, uuid: "3", role: nil, nickname: "I am a 3", registrationConfirmed: true, stats: UserStats(_id: 1, followCount: 3, followedCount: 3), image: "", backgroundImage: "", permissions: nil, createdAt: nil, updatedAt: nil, version: nil)
var user4 = PrunedUser(_id: 4, uuid: "4", role: nil, nickname: "I am a 4", registrationConfirmed: true, stats: UserStats(_id: 1, followCount: 3, followedCount: 3), image: "", backgroundImage: "", permissions: nil, createdAt: nil, updatedAt: nil, version: nil)
var user5 = PrunedUser(_id: 5, uuid: "5", role: nil, nickname: "I am a 5", registrationConfirmed: true, stats: UserStats(_id: 1, followCount: 3, followedCount: 3), image: "", backgroundImage: "", permissions: nil, createdAt: nil, updatedAt: nil, version: nil)
var user6 = PrunedUser(_id: 6, uuid: "6", role: nil, nickname: "I am a 6", registrationConfirmed: true, stats: UserStats(_id: 1, followCount: 3, followedCount: 3), image: "", backgroundImage: "", permissions: nil, createdAt: nil, updatedAt: nil, version: nil)
var user7 = PrunedUser(_id: 7, uuid: "7", role: nil, nickname: "I am a 7", registrationConfirmed: true, stats: UserStats(_id: 1, followCount: 3, followedCount: 3), image: "", backgroundImage: "", permissions: nil, createdAt: nil, updatedAt: nil, version: nil)
var user8 = PrunedUser(_id: 1, uuid: "1", role: nil, nickname: "I am a 8", registrationConfirmed: true, stats: UserStats(_id: 1, followCount: 3, followedCount: 3), image: "", backgroundImage: "", permissions: nil, createdAt: nil, updatedAt: nil, version: nil)
var user9 = PrunedUser(_id: 9, uuid: "9", role: nil, nickname: "I am a 9", registrationConfirmed: true, stats: UserStats(_id: 1, followCount: 3, followedCount: 3), image: "", backgroundImage: "", permissions: nil, createdAt: nil, updatedAt: nil, version: nil)
var user10 = PrunedUser(_id: 10, uuid: "10", role: nil, nickname: "I am a 10", registrationConfirmed: true, stats: UserStats(_id: 1, followCount: 3, followedCount: 3), image: "", backgroundImage: "", permissions: nil, createdAt: nil, updatedAt: nil, version: nil)

var prototypeUsers = [user1, user2, user3, user4, user5, user6, user7, user8, user9, user10]

var content1 = Content(_id: 1, title: "AIはこれさえやってれば大丈夫", image: "", detail: aiHtml, role: 1, userId: user1._id, user: user1, createdBy: nil, createdAt: nil, updatedAt: nil, deleted: nil, deletedAt: nil)
var content2 = Content(_id: 2, title: "AIって何?", image: "", detail: aiHtml, role: 0, userId: user1._id, user: user1, createdBy: nil, createdAt: nil, updatedAt: nil, deleted: nil, deletedAt: nil)
var content3 = Content(_id: 3, title: "ロジスティクス回帰を極めるということ", image: "", detail: aiHtml, role: 2, userId: user1._id, user: user1, createdBy: nil, createdAt: nil, updatedAt: nil, deleted: nil, deletedAt: nil)
var content4 = Content(_id: 4, title: "俺はこうしてAIを学んだ", image: "", detail: aiHtml, role: 1, userId: user1._id, user: user1, createdBy: nil, createdAt: nil, updatedAt: nil, deleted: nil, deletedAt: nil)
var content5 = Content(_id: 5, title: "ギターの種類一覧", image: "", detail: guitarHtml, role: 0, userId: user2._id, user: user2, createdBy: nil, createdAt: nil, updatedAt: nil, deleted: nil, deletedAt: nil)
var content6 = Content(_id: 6, title: "アルペジオ奏法練習法", image: "", detail: guitarHtml, role: 1, userId: user2._id, user: user2, createdBy: nil, createdAt: nil, updatedAt: nil, deleted: nil, deletedAt: nil)
var content7 = Content(_id: 7, title: "ギターは楽しめ", image: "", detail: guitarHtml, role: 2, userId: user1._id, user: user1, createdBy: nil, createdAt: nil, updatedAt: nil, deleted: nil, deletedAt: nil)
var content8 = Content(_id: 8, title: "最高のギタリストへ", image: "", detail: guitarHtml, role: 2, userId: user1._id, user: user1, createdBy: nil, createdAt: nil, updatedAt: nil, deleted: nil, deletedAt: nil)
var content9 = Content(_id: 9, title: "ギター初心者必見 最強の練習術", image: "", detail: guitarHtml, role: 0, userId: user1._id, user: user1, createdBy: nil, createdAt: nil, updatedAt: nil, deleted: nil, deletedAt: nil)
var content10 = Content(_id: 10, title: "チューンニングやり方", image: "", detail: guitarHtml, role: 1, userId: user1._id, user: user1, createdBy: nil, createdAt: nil, updatedAt: nil, deleted: nil, deletedAt: nil)
var content11 = Content(_id: 11, title: "ギタリストとはどんな仕事", image: "", detail: guitarHtml, role: 0, userId: user1._id, user: user1, createdBy: nil, createdAt: nil, updatedAt: nil, deleted: nil, deletedAt: nil)
var content12 = Content(_id: 12, title: "１次関数", image: "", detail: mentalHtml, role: 0, userId: user1._id, user: user1, createdBy: nil, createdAt: nil, updatedAt: nil, deleted: nil, deletedAt: nil)
var content13 = Content(_id: 13, title: "二次関数", image: "", detail: mentalHtml, role: 0, userId: user1._id, user: user1, createdBy: nil, createdAt: nil, updatedAt: nil, deleted: nil, deletedAt: nil)
var content14 = Content(_id: 14, title: "三角関数", image: "", detail: mentalHtml, role: 0, userId: user1._id, user: user1, createdBy: nil, createdAt: nil, updatedAt: nil, deleted: nil, deletedAt: nil)
var content15 = Content(_id: 15, title: "東大数学応用", image: "", detail: mentalHtml, role: 2, userId: user1._id, user: user1, createdBy: nil, createdAt: nil, updatedAt: nil, deleted: nil, deletedAt: nil)
var content16 = Content(_id: 16, title: "京都大学数学過去問", image: "", detail: mentalHtml, role: 2, userId: user1._id, user: user1, createdBy: nil, createdAt: nil, updatedAt: nil, deleted: nil, deletedAt: nil)
var content17 = Content(_id: 17, title: "日々をポジティブに生きる", image: "", detail: mentalHtml, role: 0, userId: user1._id, user: user1, createdBy: nil, createdAt: nil, updatedAt: nil, deleted: nil, deletedAt: nil)
var content18 = Content(_id: 18, title: "最高の気分転換", image: "", detail: "", role: 2, userId: user1._id, user: user1, createdBy: nil, createdAt: nil, updatedAt: nil, deleted: nil, deletedAt: nil)
var content19 = Content(_id: 19, title: "気持ちが落ち込むときはこれ", image: "", detail: mentalHtml, role: 1, userId: user1._id, user: user1, createdBy: nil, createdAt: nil, updatedAt: nil, deleted: nil, deletedAt: nil)
var content20 = Content(_id: 20, title: "ポジティブな名言", image: "", detail: mentalHtml, role: 1, userId: user1._id, user: user1, createdBy: nil, createdAt: nil, updatedAt: nil, deleted: nil, deletedAt: nil)
var content21 = Content(_id: 21, title: "やればできる", image: "", detail: mentalHtml, role: 1, userId: user1._id, user: user1, createdBy: nil, createdAt: nil, updatedAt: nil, deleted: nil, deletedAt: nil)
var content22 = Content(_id: 22, title: "負けないための習慣", image: "", detail: mentalHtml, role: 1, userId: user1._id, user: user1, createdBy: nil, createdAt: nil, updatedAt: nil, deleted: nil, deletedAt: nil)
var content23 = Content(_id: 23, title: "テンションの上がるBGMまとめ", image: "", detail: mentalHtml, role: 1, userId: user1._id, user: user1, createdBy: nil, createdAt: nil, updatedAt: nil, deleted: nil, deletedAt: nil)
var content24 = Content(_id: 24, title: "最高な日々を手に入れよう", image: "", detail: mentalHtml, role: 0, userId: user1._id, user: user1, createdBy: nil, createdAt: nil, updatedAt: nil, deleted: nil, deletedAt: nil)
var content25 = Content(_id: 25, title: "TOEIC勉強法", image: "", detail: mentalHtml, role: 2, userId: user1._id, user: user1, createdBy: nil, createdAt: nil, updatedAt: nil, deleted: nil, deletedAt: nil)
var content26 = Content(_id: 26, title: "英単語の覚え方", image: "", detail: mentalHtml, role: 1, userId: user1._id, user: user1, createdBy: nil, createdAt: nil, updatedAt: nil, deleted: nil, deletedAt: nil)
var content27 = Content(_id: 27, title: "英語をしゃべることとは", image: "", detail: mentalHtml, role: 0, userId: user1._id, user: user1, createdBy: nil, createdAt: nil, updatedAt: nil, deleted: nil, deletedAt: nil)
var content28 = Content(_id: 28, title: "英語が喋りたいならまず海外に行こう", image: "", detail: mentalHtml, role: 0, userId: user1._id, user: user1, createdBy: nil, createdAt: nil, updatedAt: nil, deleted: nil, deletedAt: nil)
var content29 = Content(_id: 29, title: "英語の勉強をしよう", image: "", detail: mentalHtml, role: 0, userId: user1._id, user: user1, createdBy: nil, createdAt: nil, updatedAt: nil, deleted: nil, deletedAt: nil)
var content30 = Content(_id: 30, title: "英語は楽しい", image: "", detail: mentalHtml, role: 0, userId: user1._id, user: user1, createdBy: nil, createdAt: nil, updatedAt: nil, deleted: nil, deletedAt: nil)
var content31 = Content(_id: 31, title: "Let's start English !!", image: "", detail: mentalHtml, role: 0, userId: user1._id, user: user1, createdBy: nil, createdAt: nil, updatedAt: nil, deleted: nil, deletedAt: nil)
var content32 = Content(_id: 32, title: "英語をしゃべるためのステップ", image: "", detail: mentalHtml, role: 0, userId: user1._id, user: user1, createdBy: nil, createdAt: nil, updatedAt: nil, deleted: nil, deletedAt: nil)
var content33 = Content(_id: 33, title: "英語が楽しいと思える理由とは", image: "", detail: mentalHtml, role: 1, userId: user1._id, user: user1, createdBy: nil, createdAt: nil, updatedAt: nil, deleted: nil, deletedAt: nil)
var content34 = Content(_id: 34, title: "TOEICを満点とった人の勉強法とは", image: "", detail: mentalHtml, role: 1, userId: user1._id, user: user1, createdBy: nil, createdAt: nil, updatedAt: nil, deleted: nil, deletedAt: nil)
var content35 = Content(_id: 35, title: "TOEICの勉強を始めよう！", image: "", detail: mentalHtml, role: 1, userId: user1._id, user: user1, createdBy: nil, createdAt: nil, updatedAt: nil, deleted: nil, deletedAt: nil)

var prototypeContents = [content1, content2, content3, content4, content5, content6, content7, content8, content9, content10, content11, content12, content13, content14, content15, content16, content17, content18, content19, content20, content21, content22, content23, content24, content25, content26, content27, content28, content29, content30, content31, content32, content33, content34, content24]

var prototypeNewContents = [content1, content2, content3, content4, content5, content6, content7, content8, content9, content10, content11, content12, content13, content14, content15, content16, content17, content18, content19, content20, content21, content22, content23, content24]

var prototypeRankingContents = [content1, content2, content3, content4, content5, content6, content7, content8, content9, content10, content11, content12, content13, content14, content15, content16, content17, content18, content19, content20, content21, content22, content23, content24]

var log1 = Log(_id: 1, title: "y=2x+1 のグラフってなんですか", image: "", detail: "y=2x+1 のグラフってなんですか\nいつもよく見るやつなんですけど具体的にどうやって書けばいいかわからないです。\nどうかご教授お願いします", role: 1, userId: user3._id, user: user3, createdBy: nil, createdAt: nil, updatedAt: nil, deleted: nil, deletedAt: nil)
var log2 = Log(_id: 2, title: "このプログラムが理解できません", image: "", detail: "このプログラムが理解できません\nいつもよく見るやつなんですけど\n@IBOutlet weak var badView: BadView!\n@IBOutlet weak var goodView: GoodView!@IBOutlet weak var nameLabel: UILabel!@IBOutlet weak var dateLabel: UILabel!@IBOutlet weak var commentLabel: UILabel!func setData(){}\nどうかご教授お願いします", role: 1, userId: user3._id, user: user3, createdBy: nil, createdAt: nil, updatedAt: nil, deleted: nil, deletedAt: nil)
var log3 = Log(_id: 3, title: "カスタマージャーニーがわからないです", image: "", detail: "カスタマージャーニーがわからないです\nつづいて、各フェーズのペルソナの行動が本当に合っているのか、仮説を検証していきます。この工程には、なるべく顧客に参加していただきましょう。しかし、どうしても難しい場合は顧客アンケートを作成して、顧客の声を集めるのも手です。もし１つ前の工程に顧客が参加していれば、この工程は必要ありません。顧客へのヒアリング・アンケートで仮説を検証すると、大抵の場合、想定と異なることがでてきます。改めて顧客の声を正として、各フェーズのペルソナの行動を整理し直していきましょう。\nとかって説明を受けたけど全くわからないです\nどうかご教授お願いします", role: 2, userId: user3._id, user: user3, createdBy: nil, createdAt: nil, updatedAt: nil, deleted: nil, deletedAt: nil)
var log4 = Log(_id: 4, title: "カスタマージャーニーがわからないです", image: "", detail: "カスタマージャーニーがわからないです\nつづいて、各フェーズのペルソナの行動が本当に合っているのか、仮説を検証していきます。この工程には、なるべく顧客に参加していただきましょう。しかし、どうしても難しい場合は顧客アンケートを作成して、顧客の声を集めるのも手です。もし１つ前の工程に顧客が参加していれば、この工程は必要ありません。顧客へのヒアリング・アンケートで仮説を検証すると、大抵の場合、想定と異なることがでてきます。改めて顧客の声を正として、各フェーズのペルソナの行動を整理し直していきましょう。\nとかって説明を受けたけど全くわからないです\nどうかご教授お願いします", role: 0, userId: user3._id, user: user3, createdBy: nil, createdAt: nil, updatedAt: nil, deleted: nil, deletedAt: nil)
var log5 = Log(_id: 5, title: "カスタマージャーニーがわからないです", image: "", detail: "カスタマージャーニーがわからないです\nつづいて、各フェーズのペルソナの行動が本当に合っているのか、仮説を検証していきます。この工程には、なるべく顧客に参加していただきましょう。しかし、どうしても難しい場合は顧客アンケートを作成して、顧客の声を集めるのも手です。もし１つ前の工程に顧客が参加していれば、この工程は必要ありません。顧客へのヒアリング・アンケートで仮説を検証すると、大抵の場合、想定と異なることがでてきます。改めて顧客の声を正として、各フェーズのペルソナの行動を整理し直していきましょう。\nとかって説明を受けたけど全くわからないです\nどうかご教授お願いします", role: 0, userId: user3._id, user: user3, createdBy: nil, createdAt: nil, updatedAt: nil, deleted: nil, deletedAt: nil)
var log6 = Log(_id: 6, title: "カスタマージャーニーがわからないです", image: "", detail: "カスタマージャーニーがわからないです\nつづいて、各フェーズのペルソナの行動が本当に合っているのか、仮説を検証していきます。この工程には、なるべく顧客に参加していただきましょう。しかし、どうしても難しい場合は顧客アンケートを作成して、顧客の声を集めるのも手です。もし１つ前の工程に顧客が参加していれば、この工程は必要ありません。顧客へのヒアリング・アンケートで仮説を検証すると、大抵の場合、想定と異なることがでてきます。改めて顧客の声を正として、各フェーズのペルソナの行動を整理し直していきましょう。\nとかって説明を受けたけど全くわからないです\nどうかご教授お願いします", role: 1, userId: user3._id, user: user3, createdBy: nil, createdAt: nil, updatedAt: nil, deleted: nil, deletedAt: nil)
var log7 = Log(_id: 7, title: "カスタマージャーニーがわからないです", image: "", detail: "カスタマージャーニーがわからないです\nつづいて、各フェーズのペルソナの行動が本当に合っているのか、仮説を検証していきます。この工程には、なるべく顧客に参加していただきましょう。しかし、どうしても難しい場合は顧客アンケートを作成して、顧客の声を集めるのも手です。もし１つ前の工程に顧客が参加していれば、この工程は必要ありません。顧客へのヒアリング・アンケートで仮説を検証すると、大抵の場合、想定と異なることがでてきます。改めて顧客の声を正として、各フェーズのペルソナの行動を整理し直していきましょう。\nとかって説明を受けたけど全くわからないです\nどうかご教授お願いします", role: 1, userId: user3._id, user: user3, createdBy: nil, createdAt: nil, updatedAt: nil, deleted: nil, deletedAt: nil)
var log8 = Log(_id: 8, title: "カスタマージャーニーがわからないです", image: "", detail: "カスタマージャーニーがわからないです\nつづいて、各フェーズのペルソナの行動が本当に合っているのか、仮説を検証していきます。この工程には、なるべく顧客に参加していただきましょう。しかし、どうしても難しい場合は顧客アンケートを作成して、顧客の声を集めるのも手です。もし１つ前の工程に顧客が参加していれば、この工程は必要ありません。顧客へのヒアリング・アンケートで仮説を検証すると、大抵の場合、想定と異なることがでてきます。改めて顧客の声を正として、各フェーズのペルソナの行動を整理し直していきましょう。\nとかって説明を受けたけど全くわからないです\nどうかご教授お願いします", role: 2, userId: user3._id, user: user3, createdBy: nil, createdAt: nil, updatedAt: nil, deleted: nil, deletedAt: nil)
var log9 = Log(_id: 9, title: "カスタマージャーニーがわからないです", image: "", detail: "カスタマージャーニーがわからないです\nつづいて、各フェーズのペルソナの行動が本当に合っているのか、仮説を検証していきます。この工程には、なるべく顧客に参加していただきましょう。しかし、どうしても難しい場合は顧客アンケートを作成して、顧客の声を集めるのも手です。もし１つ前の工程に顧客が参加していれば、この工程は必要ありません。顧客へのヒアリング・アンケートで仮説を検証すると、大抵の場合、想定と異なることがでてきます。改めて顧客の声を正として、各フェーズのペルソナの行動を整理し直していきましょう。\nとかって説明を受けたけど全くわからないです\nどうかご教授お願いします", role: 2, userId: user3._id, user: user3, createdBy: nil, createdAt: nil, updatedAt: nil, deleted: nil, deletedAt: nil)

var log10 = Log(_id: 10, title: "カスタマージャーニーがわからないです", image: "", detail: "カスタマージャーニーがわからないです\nつづいて、各フェーズのペルソナの行動が本当に合っているのか、仮説を検証していきます。この工程には、なるべく顧客に参加していただきましょう。しかし、どうしても難しい場合は顧客アンケートを作成して、顧客の声を集めるのも手です。もし１つ前の工程に顧客が参加していれば、この工程は必要ありません。顧客へのヒアリング・アンケートで仮説を検証すると、大抵の場合、想定と異なることがでてきます。改めて顧客の声を正として、各フェーズのペルソナの行動を整理し直していきましょう。\nとかって説明を受けたけど全くわからないです\nどうかご教授お願いします", role: 0, userId: user3._id, user: user3, createdBy: nil, createdAt: nil, updatedAt: nil, deleted: nil, deletedAt: nil)
var log11 = Log(_id: 11, title: "共にする事務所づくりをする仲間募集中", image: "", detail: "共に社会貢献する仲間募集中\n自分が本当にやりたい仕事をしてるのだろうか…\n正直つまらないし今すぐ辞めたい又は仕事したくないけど趣味にお金使いたい人もいると思います。\nそこで、アーティストやアイドル等のファンだけでグッズやイベントを開くことで\n今までにないものを作れると思っています！そして、自分の好きな事に熱中するのは苦ではない、稼いだお金で自分の好きなアーティストやアイドルに使えるという一石二鳥ではないですか？\nいずれかは、事務所を作るのも夢ではないと思っています！\nこれを見てくれた人で興味がある人や一緒にしてくれる人を募集します！\nここからは個人的な話なので読んでくれると幸いです…\n自分は生まれた時から円形脱毛症という病気で悩まされ続けました(もちろん今も続いています)\n気軽に遊ぶことは全く出来ず周りがとても羨ましくてしょうがなかったです…\n大学受験も落ちてしまい浪人生活も本当に苦でした\nしかし、中学生の時にアイドルに興味を持ち今では幅広く興味を持つようになりました、おかげで病気で何も出来ないのはもったいないと思い高校の時に以上のようなことが出来ればいいなぁ、起業したいなぁと思い始めました。しかし、人脈もなく資金もなく、夢で終わってしまいたく無かった時にこのサイトを見つけました。少しでもきっかけになればいいと思っています。最後まで読んでいただきありがとうございました\n", role: 0, userId: user3._id, user: user3, createdBy: nil, createdAt: nil, updatedAt: nil, deleted: nil, deletedAt: nil)
var log12 = Log(_id: 12, title: "キュレータービジネス仲間募集中", image: "", detail: "自分が興味関心のあるテーマについて、とことん情報を集めて発信する専門サイトのウェブマスター募集。\n似たようなコンセプトにAll Aboutがありますが、差別化はヴィジュアルとビジター参加。\nGIS、インフォグラム、時空マップなどでグラフィカルに表現。\n投稿、アンケート、共同制作などで訪問者が参加する仕組み。\n欲しい情報をネットを探してもいまいち。\n網羅されてるサイトが見当たらない。あっても見にくい。\nそんなジャンルならチャンス。早い者勝ち。\n自分ならこうするのに。\nもっと面白く分かりやすくできる。\n好きなことの情報を集めて発信するので収入になればサイコー。\nそんな人にはうってつけ。\nその分野のオーソリティになる。\nまずはリサーチ。関係者へのインタビュー。\n今まで遠い憧れだった業界のアイドルやカリスマにコンタクト。\nウェブ制作の技術はいりません。\n必要なのはサイトの構成のアイデアと情報を集める行動力。\n一緒に作っていきましょう。", role: 0, userId: user3._id, user: user3, createdBy: nil, createdAt: nil, updatedAt: nil, deleted: nil, deletedAt: nil)
var log13 = Log(_id: 13, title: "最高の夢を見よう！", image: "", detail: "共に社会貢献する仲間募集中\n自分が本当にやりたい仕事をしてるのだろうか…\n正直つまらないし今すぐ辞めたい又は仕事したくないけど趣味にお金使いたい人もいると思います。\nそこで、アーティストやアイドル等のファンだけでグッズやイベントを開くことで\n今までにないものを作れると思っています！そして、自分の好きな事に熱中するのは苦ではない、稼いだお金で自分の好きなアーティストやアイドルに使えるという一石二鳥ではないですか？\nいずれかは、事務所を作るのも夢ではないと思っています！\nこれを見てくれた人で興味がある人や一緒にしてくれる人を募集します！\nここからは個人的な話なので読んでくれると幸いです…\n自分は生まれた時から円形脱毛症という病気で悩まされ続けました(もちろん今も続いています)\n気軽に遊ぶことは全く出来ず周りがとても羨ましくてしょうがなかったです…\n大学受験も落ちてしまい浪人生活も本当に苦でした\nしかし、中学生の時にアイドルに興味を持ち今では幅広く興味を持つようになりました、おかげで病気で何も出来ないのはもったいないと思い高校の時に以上のようなことが出来ればいいなぁ、起業したいなぁと思い始めました。しかし、人脈もなく資金もなく、夢で終わってしまいたく無かった時にこのサイトを見つけました。少しでもきっかけになればいいと思っています。最後まで読んでいただきありがとうございました\n", role: 0, userId: user3._id, user: user3, createdBy: nil, createdAt: nil, updatedAt: nil, deleted: nil, deletedAt: nil)
var log14 = Log(_id: 14, title: "こんなアイデアどうですか？", image: "", detail: "自分が興味関心のあるテーマについて、とことん情報を集めて発信する専門サイトのウェブマスター募集。\n似たようなコンセプトにAll Aboutがありますが、差別化はヴィジュアルとビジター参加。\nGIS、インフォグラム、時空マップなどでグラフィカルに表現。\n投稿、アンケート、共同制作などで訪問者が参加する仕組み。\n欲しい情報をネットを探してもいまいち。\n網羅されてるサイトが見当たらない。あっても見にくい。\nそんなジャンルならチャンス。早い者勝ち。\n自分ならこうするのに。\nもっと面白く分かりやすくできる。\n好きなことの情報を集めて発信するので収入になればサイコー。\nそんな人にはうってつけ。\nその分野のオーソリティになる。\nまずはリサーチ。関係者へのインタビュー。\n今まで遠い憧れだった業界のアイドルやカリスマにコンタクト。\nウェブ制作の技術はいりません。\n必要なのはサイトの構成のアイデアと情報を集める行動力。\n一緒に作っていきましょう。", role: 2, userId: user3._id, user: user3, createdBy: nil, createdAt: nil, updatedAt: nil, deleted: nil, deletedAt: nil)
var prototypeLog = [log1, log2, log3, log4, log5, log6, log7, log8, log9, log10, log11, log12, log13, log14]
var prototypeNewLogs = prototypeLog
var prototypeRankingLogs = prototypeLog

var field1 = Field(_id: 1, title: "AI")
var field2 = Field(_id: 2, title: "ギター")
var field3 = Field(_id: 3, title: "受験数学")
var field4 = Field(_id: 4, title: "メンタリズム")

var prototypeFieldForContent = [field1, field2, field3, field4]


var field5 = Field(_id: 5, title: "中学数学")
var field6 = Field(_id: 6, title: "プログラミング")
var field7 = Field(_id: 7, title: "マーケティング")
var field8 = Field(_id: 8, title: "ビジネス")

var prototypeFieldForLog = [field8, field5, field6, field7]

var prototypeFields = [field1, field2, field3, field4, field5, field6, field7]


var contentFielding1 = ContentFielding(_id: 1, fieldId: field1._id, field: field1, contentId: content1._id, content: content1)
var contentFielding2 = ContentFielding(_id: 2, fieldId: field1._id, field: field1, contentId: content2._id, content: content2)
var contentFielding3 = ContentFielding(_id: 3, fieldId: field1._id, field: field1, contentId: content3._id, content: content3)
var contentFielding4 = ContentFielding(_id: 4, fieldId: field1._id, field: field1, contentId: content4._id, content: content4)
var contentFielding5 = ContentFielding(_id: 5, fieldId: field2._id, field: field2, contentId: content5._id, content: content5)
var contentFielding6 = ContentFielding(_id: 6, fieldId: field2._id, field: field2, contentId: content6._id, content: content6)
var contentFielding7 = ContentFielding(_id: 7, fieldId: field2._id, field: field2, contentId: content7._id, content: content7)
var contentFielding8 = ContentFielding(_id: 8, fieldId: field2._id, field: field2, contentId: content8._id, content: content8)
var contentFielding9 = ContentFielding(_id: 9, fieldId: field2._id, field: field2, contentId: content9._id, content: content9)
var contentFielding10 = ContentFielding(_id: 10, fieldId: field2._id, field: field2, contentId: content10._id, content: content10)
var contentFielding11 = ContentFielding(_id: 11, fieldId: field2._id, field: field2, contentId: content11._id, content: content11)
var contentFielding12 = ContentFielding(_id: 12, fieldId: field2._id, field: field2, contentId: content12._id, content: content12)
var contentFielding13 = ContentFielding(_id: 13, fieldId: field3._id, field: field3, contentId: content13._id, content: content13)
var contentFielding14 = ContentFielding(_id: 14, fieldId: field3._id, field: field3, contentId: content14._id, content: content14)
var contentFielding15 = ContentFielding(_id: 15, fieldId: field3._id, field: field3, contentId: content15._id, content: content15)
var contentFielding16 = ContentFielding(_id: 16, fieldId: field3._id, field: field3, contentId: content16._id, content: content16)
var contentFielding17 = ContentFielding(_id: 17, fieldId: field3._id, field: field3, contentId: content17._id, content: content17)
var contentFielding18 = ContentFielding(_id: 18, fieldId: field4._id, field: field4, contentId: content18._id, content: content18)
var contentFielding19 = ContentFielding(_id: 19, fieldId: field4._id, field: field4, contentId: content19._id, content: content19)
var contentFielding20 = ContentFielding(_id: 20, fieldId: field4._id, field: field4, contentId: content20._id, content: content20)
var contentFielding21 = ContentFielding(_id: 21, fieldId: field4._id, field: field4, contentId: content21._id, content: content21)
var contentFielding22 = ContentFielding(_id: 22, fieldId: field4._id, field: field4, contentId: content22._id, content: content22)
var contentFielding23 = ContentFielding(_id: 23, fieldId: field4._id, field: field4, contentId: content23._id, content: content23)
var contentFielding24 = ContentFielding(_id: 24, fieldId: field4._id, field: field4, contentId: content24._id, content: content24)

var prototypeContentFielding = [contentFielding1, contentFielding2, contentFielding3, contentFielding4, contentFielding5, contentFielding6, contentFielding7, contentFielding8, contentFielding9, contentFielding10, contentFielding11, contentFielding12, contentFielding13, contentFielding14, contentFielding15, contentFielding16, contentFielding17, contentFielding18, contentFielding19, contentFielding20, contentFielding21, contentFielding22, contentFielding23, contentFielding24]


var logFielding1 = LogFielding(_id: 1, fieldId: field5._id, field: field5, logId: log1._id, log: log1)
var logFielding2 = LogFielding(_id: 2, fieldId: field6._id, field: field6, logId: log2._id, log: log2)
var logFielding3 = LogFielding(_id: 3, fieldId: field7._id, field: field7, logId: log3._id, log: log3)
var logFielding4 = LogFielding(_id: 4, fieldId: field8._id, field: field8, logId: log11._id, log: log11)
var logFielding5 = LogFielding(_id: 5, fieldId: field8._id, field: field8, logId: log12._id, log: log12)
var logFielding6 = LogFielding(_id: 6, fieldId: field8._id, field: field8, logId: log13._id, log: log13)
var logFielding7 = LogFielding(_id: 7, fieldId: field8._id, field: field8, logId: log14._id, log: log14)
var logFielding8 = LogFielding(_id: 8, fieldId: field8._id, field: field8, logId: log3._id, log: log3)
var logFielding9 = LogFielding(_id: 9, fieldId: field8._id, field: field8, logId: log11._id, log: log11)
var logFielding10 = LogFielding(_id: 10, fieldId: field8._id, field: field8, logId: log12._id, log: log12)
var logFielding11 = LogFielding(_id: 11, fieldId: field8._id, field: field8, logId: log13._id, log: log13)
var logFielding12 = LogFielding(_id: 12, fieldId: field8._id, field: field8, logId: log14._id, log: log14)


var prototypeImage = [R.image.starrr()!, R.image.sunset()!,R.image.natural()!, R.image.car()!, R.image.running()!, R.image.pink()!, R.image.brightSun()!, R.image.soccer()!, R.image.gold()!, R.image.mount()!, R.image.sup()!, R.image.adidas()!,R.image.hiro()!, R.image.rose()!, R.image.takuya()!, R.image.mfS(), R.image.testImage1()!, R.image.testImage2()!, R.image.tranp()!]

var prototypeLogFielding = [logFielding1, logFielding2, logFielding3, logFielding3, logFielding3, logFielding3, logFielding3, logFielding3, logFielding3, logFielding4, logFielding5, logFielding6, logFielding7, logFielding8, logFielding9, logFielding10, logFielding11, logFielding12]


var group1 = Group(_id: 1, title: "AI初心者勉強会")
var group2 = Group(_id: 2, title: "サッカー愛好会")
var group3 = Group(_id: 3, title: "Apple信者")
var group4 = Group(_id: 4, title: "新聞記者集まれ")
var group5 = Group(_id: 5, title: "I love the world")


var prototypeGroups = [group1, group2, group3, group4, group5]

var userGrouping1 = UserGrouping(_id: 1, groupId: group1._id, group: group1, userId: user1._id, user: user1)
var userGrouping2 = UserGrouping(_id: 2, groupId: group1._id, group: group1, userId: user2._id, user: user2)
var userGrouping3 = UserGrouping(_id: 3, groupId: group1._id, group: group1, userId: user3._id, user: user3)
var userGrouping4 = UserGrouping(_id: 4, groupId: group1._id, group: group1, userId: user4._id, user: user4)
var userGrouping5 = UserGrouping(_id: 5, groupId: group2._id, group: group2, userId: user4._id, user: user4)
var userGrouping6 = UserGrouping(_id: 6, groupId: group3._id, group: group3, userId: user4._id, user: user4)
var userGrouping7 = UserGrouping(_id: 7, groupId: group4._id, group: group4, userId: user4._id, user: user4)

var list1 = List(_id: 1, title: "AIまとめ", stats: ListStats(_id: 1, favoriteCount: 10000, goodCount: 34000, badCount: 234))
var list2 = List(_id: 2, title: "ギター練習おすすめコンテンツ", stats: ListStats(_id: 1, favoriteCount: 10000, goodCount: 34000, badCount: 234))
var list3 = List(_id: 3, title: "メンタルセットまとめ", stats: ListStats(_id: 1, favoriteCount: 10000, goodCount: 34000, badCount: 234))
var list4 = List(_id: 4, title: "受験数学勉強", stats: ListStats(_id: 1, favoriteCount: 10000, goodCount: 34000, badCount: 234))

var prototypeLists = [list1, list2, list3, list4]

var contentListing1 = ContentListing(_id: 1, listId: list1._id, list: list1, contentId: content1._id, content: content1)
var contentListing2 = ContentListing(_id: 2, listId: list1._id, list: list1, contentId: content2._id, content: content2)
var contentListing3 = ContentListing(_id: 3, listId: list1._id, list: list1, contentId: content3._id, content: content3)
var contentListing4 = ContentListing(_id: 4, listId: list1._id, list: list1, contentId: content4._id, content: content4)
var contentListing5 = ContentListing(_id: 5, listId: list1._id, list: list1, contentId: content5._id, content: content5)
var contentListing6 = ContentListing(_id: 6, listId: list2._id, list: list2, contentId: content1._id, content: content1)
var contentListing7 = ContentListing(_id: 7, listId: list3._id, list: list3, contentId: content1._id, content: content1)
var contentListing8 = ContentListing(_id: 8, listId: list4._id, list: list4, contentId: content1._id, content: content1)


var comment1 = ContentComment(_id: 1, detail: "とても共感できる記事をありがとうございます！\n今も記事と同じようなことに興味があって、もっと勉強しようと思うのですがもっといい勉強法などありましたら何か教えていただけませんか？", userId: user1._id, user: user1, contentId: content1._id, content: content1, createdBy: nil, createdAt: nil, updatedAt: nil, deleted: nil, deletedAt: nil)
var comment2 = ContentComment(_id: 2, detail: "〇〇○っていうものをご存知ですか？\nとてもこういうものは良い勉強になるのですが是非試してみてください！", userId: user2._id, user: user2, contentId: content1._id, content: content1, createdBy: nil, createdAt: nil, updatedAt: nil, deleted: nil, deletedAt: nil)
var comment3 = ContentComment(_id: 3, detail: "わかりました！ありがとうございます！", userId: user1._id, user: user1, contentId: content1._id, content: content1, createdBy: nil, createdAt: nil, updatedAt: nil, deleted: nil, deletedAt: nil)
var comment4 = ContentComment(_id: 4, detail: "とても共感できる記事をありがとうございます！\n今も記事と同じようなことに興味があって、もっと勉強しようと思うのですがもっといい勉強法などありましたら何か教えていただけませんか？", userId: user1._id, user: user1, contentId: content2._id, content: content2, createdBy: nil, createdAt: nil, updatedAt: nil, deleted: nil, deletedAt: nil)
var comment5 = ContentComment(_id: 5, detail: "〇〇○っていうものをご存知ですか？\nとてもこういうものは良い勉強になるのですが是非試してみてください！", userId: user2._id, user: user2, contentId: content2._id, content: content2, createdBy: nil, createdAt: nil, updatedAt: nil, deleted: nil, deletedAt: nil)
var comment6 = ContentComment(_id: 6, detail: "わかりました！ありがとうございます！", userId: user1._id, user: user1, contentId: content2._id, content: content2, createdBy: nil, createdAt: nil, updatedAt: nil, deleted: nil, deletedAt: nil)
var comment7 = ContentComment(_id: 7, detail: "とても共感できる記事をありがとうございます！\n今も記事と同じようなことに興味があって、もっと勉強しようと思うのですがもっといい勉強法などありましたら何か教えていただけませんか？", userId: user1._id, user: user1, contentId: content3._id, content: content3, createdBy: nil, createdAt: nil, updatedAt: nil, deleted: nil, deletedAt: nil)
var comment8 = ContentComment(_id: 8, detail: "〇〇○っていうものをご存知ですか？\nとてもこういうものは良い勉強になるのですが是非試してみてください！", userId: user2._id, user: user2, contentId: content3._id, content: content3, createdBy: nil, createdAt: nil, updatedAt: nil, deleted: nil, deletedAt: nil)
var comment9 = ContentComment(_id: 9, detail: "わかりました！ありがとうございます！", userId: user2._id, user: user2, contentId: content3._id, content: content3, createdBy: nil, createdAt: nil, updatedAt: nil, deleted: nil, deletedAt: nil)
var comment10 = ContentComment(_id: 10, detail: "とても共感できる記事をありがとうございます！\n今も記事と同じようなことに興味があって、もっと勉強しようと思うのですがもっといい勉強法などありましたら何か教えていただけませんか？", userId: user1._id, user: user1, contentId: content4._id, content: content4, createdBy: nil, createdAt: nil, updatedAt: nil, deleted: nil, deletedAt: nil)
var comment11 = ContentComment(_id: 11, detail: "〇〇○っていうものをご存知ですか？\nとてもこういうものは良い勉強になるのですが是非試してみてください！", userId: user2._id, user: user2, contentId: content4._id, content: content4, createdBy: nil, createdAt: nil, updatedAt: nil, deleted: nil, deletedAt: nil)
var comment12 = ContentComment(_id: 12, detail: "わかりました！ありがとうございます！", userId: user1._id, user: user1, contentId: content4._id, content: content4, createdBy: nil, createdAt: nil, updatedAt: nil, deleted: nil, deletedAt: nil)
var comment13 = ContentComment(_id: 13, detail: "とても共感できる記事をありがとうございます！\n今も記事と同じようなことに興味があって、もっと勉強しようと思うのですがもっといい勉強法などありましたら何か教えていただけませんか？", userId: user1._id, user: user1, contentId: content5._id, content: content5, createdBy: nil, createdAt: nil, updatedAt: nil, deleted: nil, deletedAt: nil)
var comment14 = ContentComment(_id: 14, detail: "〇〇○っていうものをご存知ですか？\nとてもこういうものは良い勉強になるのですが是非試してみてください！", userId: user2._id, user: user2, contentId: content5._id, content: content5, createdBy: nil, createdAt: nil, updatedAt: nil, deleted: nil, deletedAt: nil)
var comment15 = ContentComment(_id: 15, detail: "わかりました！ありがとうございます！", userId: user1._id, user: user1, contentId: content5._id, content: content5, createdBy: nil, createdAt: nil, updatedAt: nil, deleted: nil, deletedAt: nil)


var prototypeUrls = ["https://japan.cnet.com/article/35125117/", "http://techtarget.itmedia.co.jp/tt/news/1809/07/news05.html", "https://codezine.jp/article/detail/11023", "https://www.barks.jp/news/?id=1000159312", "https://prtimes.jp/main/html/rd/p/000000002.000035313.html"]

var prototypeCategories = ["英語", "スポーツ", "プログラミング", "音楽", "ビジネス", "マネー", "マーケティング"]
var prototypeFieldsForTop = [prototypeFields1, prototypeFields2, prototypeFields3, prototypeFields4, prototypeFields5, prototypeFields6, prototypeFields7]

var prototypeFields1 = ["TOEIC", "英会話", "受験英語"]
var prototypeFields2 = ["サッカー", "野球", "バスケットボール", "バレーボール", "レスリング"]
var prototypeFields3 = ["Java", "Python", "Ruby", "Swift", "R", "Go", "C++", "Javascript"]
var prototypeFields4 = ["サッカー", "野球", "バスケットボール", "バレーボール", "レスリング"]
var prototypeFields5 = ["サッカー", "野球", "バスケットボール", "バレーボール", "レスリング"]
var prototypeFields6 = ["サッカー", "野球", "バスケットボール", "バレーボール", "レスリング"]
var prototypeFields7 = ["サッカー", "野球", "バスケットボール", "バレーボール", "レスリング"]
