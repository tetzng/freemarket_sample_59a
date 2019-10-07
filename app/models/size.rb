class Size < ActiveHash::Base
  include ActiveHash::Associations
  self.data = [
    # 洋服のサイズ
    { id: 1, value: 'XXS以下', group: '1' },
    { id: 2, value: 'XS(SS)', group: '1' },
    { id: 3, value: 'S', group: '1' },
    { id: 4, value: 'M', group: '1' },
    { id: 5, value: 'L', group: '1' },
    { id: 6, value: 'XL(LL)', group: '1' },
    { id: 7, value: '2XL(3L)', group: '1' },
    { id: 8, value: '3XL(4L)', group: '1' },
    { id: 9, value: '4XL(5L)以上', group: '1' },
    { id: 10, value: 'FREE SIZE', group: '1' },

    # レディース靴のサイズ
    { id: 11, value: '20cm以下', group: '2' },
    { id: 12, value: '20.5cm', group: '2' },
    { id: 13, value: '21cm', group: '2' },
    { id: 14, value: '21.5cm', group: '2' },
    { id: 15, value: '22cm', group: '2' },
    { id: 16, value: '22.5cm', group: '2' },
    { id: 17, value: '23cm', group: '2' },
    { id: 18, value: '23.5cm', group: '2' },
    { id: 19, value: '24cm', group: '2' },
    { id: 20, value: '24.5cm', group: '2' },
    { id: 21, value: '25cm', group: '2' },
    { id: 22, value: '25.5cm', group: '2' },
    { id: 23, value: '26cm', group: '2' },
    { id: 24, value: '26.5cm', group: '2' },
    { id: 25, value: '27cm', group: '2' },
    { id: 26, value: '27.5cm以上', group: '2' },

    # メンズ靴のサイズ
    { id: 27, value: '23.5cm以下', group: '3' },
    { id: 28, value: '24cm', group: '3' },
    { id: 29, value: '24.5cm', group: '3' },
    { id: 30, value: '25cm', group: '3' },
    { id: 31, value: '25.5cm', group: '3' },
    { id: 32, value: '26cm', group: '3' },
    { id: 33, value: '26.5cm', group: '3' },
    { id: 34, value: '27cm', group: '3' },
    { id: 35, value: '27.5cm', group: '3' },
    { id: 36, value: '28cm', group: '3' },
    { id: 37, value: '28.5cm', group: '3' },
    { id: 38, value: '29cm', group: '3' },
    { id: 39, value: '29.5cm', group: '3' },
    { id: 40, value: '30cm', group: '3' },
    { id: 41, value: '30.5cm', group: '3' },
    { id: 42, value: '31cm以上', group: '3' },

    # スカートのサイズ
    { id: 43, value: '60cm以下', group: '4' },
    { id: 44, value: '~70cm', group: '4' },
    { id: 45, value: '~80cm', group: '4' },
    { id: 46, value: '~90cm', group: '4' },
    { id: 47, value: '90cm以上', group: '4' },

    # キッズ服のサイズ
    { id: 48, value: '100cm', group: '5' },
    { id: 49, value: '110cm', group: '5' },
    { id: 50, value: '120cm', group: '5' },
    { id: 51, value: '130cm', group: '5' },
    { id: 52, value: '140cm', group: '5' },
    { id: 53, value: '150cm', group: '5' },
    { id: 54, value: '160cm', group: '5' },

    # ベビー・キッズ靴のサイズ
    { id: 55, value: '10.5cm以下', group: '6' },
    { id: 56, value: '11cm・11.5cm', group: '6' },
    { id: 57, value: '12cm・12.5cm', group: '6' },
    { id: 58, value: '13cm・13.5cm', group: '6' },
    { id: 59, value: '14cm・14.5cm', group: '6' },
    { id: 60, value: '15cm・15.5cm', group: '6' },
    { id: 61, value: '16cm・16.5cm', group: '6' },
    { id: 62, value: '17cm以上', group: '6' },

    # ベビー服のサイズ
    { id: 63, value: '60cm', group: '7' },
    { id: 64, value: '70cm', group: '7' },
    { id: 65, value: '80cm', group: '7' },
    { id: 66, value: '90cm', group: '7' },
    { id: 67, value: '95cm', group: '7' },

    # テレビのサイズ
    { id: 68, value: '～20インチ', group: '8' },
    { id: 69, value: '20～26インチ', group: '8' },
    { id: 70, value: '26～32インチ', group: '8' },
    { id: 71, value: '32～37インチ', group: '8' },
    { id: 72, value: '37～40インチ', group: '8' },
    { id: 73, value: '40～42インチ', group: '8' },
    { id: 74, value: '42～46インチ', group: '8' },
    { id: 75, value: '46～52インチ', group: '8' },
    { id: 76, value: '52～60インチ', group: '8' },
    { id: 77, value: '60インチ～', group: '8' },

    # カメラレンズのサイズ
    { id: 78, value: 'ニコンFマウント', group: '9' },
    { id: 79, value: 'キヤノンEFマウント', group: '9' },
    { id: 80, value: 'ペンタックスKマウント', group: '9' },
    { id: 81, value: 'ペンタックスQマウント', group: '9' },
    { id: 82, value: 'フォーサーズマウント', group: '9' },
    { id: 83, value: 'マイクロフォーサーズマウント', group: '9' },
    { id: 84, value: 'α Aマウント', group: '9' },
    { id: 85, value: 'α Eマウント', group: '9' },
    { id: 86, value: 'ニコン1マウント', group: '9' },
    { id: 87, value: 'キヤノンEF-Mマウント', group: '9' },
    { id: 88, value: 'Xマウント', group: '9' },
    { id: 89, value: 'シグマSAマウント', group: '9' },

    # オートバイのサイズ
    { id: 90, value: '50cc以下', group: '10' },
    { id: 91, value: '51cc-125cc', group: '10' },
    { id: 92, value: '126cc-250cc', group: '10' },
    { id: 93, value: '251cc-400cc', group: '10' },
    { id: 94, value: '401cc-750cc', group: '10' },
    { id: 95, value: '751cc以上', group: '10' },

    # ヘルメットのサイズ
    { id: 96, value: 'XSサイズ以下', group: '11' },
    { id: 97, value: 'Sサイズ', group: '11' },
    { id: 98, value: 'Mサイズ', group: '11' },
    { id: 100, value: 'Lサイズ', group: '11' },
    { id: 101, value: 'XLサイズ', group: '11' },
    { id: 102, value: 'XXLサイズ以上', group: '11' },
    { id: 103, value: 'フリーサイズ', group: '11' },
    { id: 104, value: '子ども用', group: '11' },

    # タイヤのサイズ
    { id: 105, value: '12インチ', group: '12' },
    { id: 106, value: '13インチ', group: '12' },
    { id: 107, value: '14インチ', group: '12' },
    { id: 108, value: '15インチ', group: '12' },
    { id: 109, value: '16インチ', group: '12' },
    { id: 110, value: '17インチ', group: '12' },
    { id: 111, value: '18インチ', group: '12' },
    { id: 112, value: '19インチ', group: '12' },
    { id: 113, value: '20インチ', group: '12' },
    { id: 114, value: '21インチ', group: '12' },
    { id: 115, value: '22インチ', group: '12' },
    { id: 116, value: '23インチ', group: '12' },
    { id: 117, value: '24インチ', group: '12' },

    # スキーのサイズ
    { id: 118, value: '140cm～', group: '13' },
    { id: 119, value: '150cm～', group: '13' },
    { id: 120, value: '160cm～', group: '13' },
    { id: 121, value: '170cm～', group: '13' },
    { id: 122, value: 'スキーボード', group: '13' },
    { id: 123, value: '子ども用', group: '13' },
    { id: 124, value: 'その他', group: '13' },

    # スノーボードのサイズ
    { id: 125, value: '135cm-140cm未満', group: '14' },
    { id: 126, value: '140cm-145cm未満', group: '14' },
    { id: 127, value: '145cm-150cm未満', group: '14' },
    { id: 128, value: '150cm-155cm未満', group: '14' },
    { id: 129, value: '155cm-160cm未満', group: '14' },
    { id: 130, value: '160cm-165cm未満', group: '14' },
    { id: 131, value: '165cm-170cm未満', group: '14' },

    # 必須項目のため空のバリューを用意
    { id: 99, value: '', group: '' }
  ]
end
