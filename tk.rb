# ruby/tk ver.0.9.3
require "tk"

#ウィンドウタイトルの定義
Tk.root.title("Json Tool")
#ウィンドウサイズ変更の禁止
Tk.root.resizable(0, 0)
#背景色の変更 -> rootに背景色の設定は無い？
Tk.root.bg = 'white'
#Tk.root.bg = '#DDFFDD'	#色コードで

#■画面表示ウィンドウ関連
#画面サイズの取得
screenX = Tk.root.winfo_screenwidth  # Tk.root.winfo_vrootwidthでも可
screenY = Tk.root.winfo_screenheight # Tk.root.winfo_vrootheightでも可

#ウィンドウ位置を取得
windowX = Tk.root.winfo_x
windowY = Tk.root.winfo_y

#ウィンドウサイズ+位置の決定(ウィンドウサイズ800*600で0,0の位置に表示)
Tk.root.geometry = "800x600+0+0"

#ウィンドウサイズのみ設定
#Tk.root.width(800)
#Tk.root.height(600)
#+以降のみを入力すると位置の移動のみ(widthやheightのような他のメソッドがありそう)
#Tk.root.geometry = "+100+100"

#上記から、画面中央表示
windowWidth  = 800
windowHeight = 600
windowLeft = ((screenX / 2).to_i - (windowWidth / 2).to_i)
windowTop  = ((screenY / 2).to_i - (windowHeight / 2).to_i)
Tk.root.geometry(windowWidth.to_s + "x" + windowHeight.to_s + 
"+" + windowLeft.to_s + "+" + windowTop.to_s )

#■使う人は使うであろう処理
#overrideredirectはウィンドウ描画中には効果が無いので、再表示する。
#ウィンドウのフレーム除去(true:フレーム除去 false:フレーム付加)
#Tk.root.overrideredirect(false)
#ウィンドウを消す
#Tk.root.withdraw
#ウィンドウを表示
#Tk.root.deiconify
#画面を最前面に出す
#Tk.root.attributes('topmost', 1)

#Buttonも試しにつけてみる
button = TkButton.new {
	text "Button"
	command {
		#overrideredirectの使用例。更に応用して擬似フルスクリーンとかに使用
		Tk.root.overrideredirect(!Tk.root.overrideredirect).withdraw.deiconify
	}
}.place('x' => 400, 'y' => 200)
button.command = proc { exit }   ### ボタンが押されたときに終了する

Tk.mainloop
