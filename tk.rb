# ruby/tk ver.0.9.3
require "tk"

root = TkRoot.new {title "Test App"}
#ウィンドウタイトルの定義
root.title("Json Tool")
#ウィンドウサイズ変更の禁止
root.resizable(0, 0)
#背景色の変更 -> rootに背景色の設定は無い？
root.bg = 'white'
#root.bg = '#DDFFDD'    #色コードで

#■画面表示ウィンドウ関連
#画面サイズの取得
screenX = root.winfo_screenwidth  # root.winfo_vrootwidthでも可
screenY = root.winfo_screenheight # root.winfo_vrootheightでも可

#ウィンドウ位置を取得
windowX = root.winfo_x
windowY = root.winfo_y

#ウィンドウサイズ+位置の決定(ウィンドウサイズ800*600で0,0の位置に表示)
root.geometry = "800x600+0+0"

#ウィンドウサイズのみ設定
#root.width(800)
#root.height(600)
#+以降のみを入力すると位置の移動のみ(widthやheightのような他のメソッドがありそう)
#root.geometry = "+100+100"

#上記から、画面中央表示
windowWidth  = 800
windowHeight = 600
windowLeft = ((screenX / 2).to_i - (windowWidth / 2).to_i)
windowTop  = ((screenY / 2).to_i - (windowHeight / 2).to_i)
root.geometry(windowWidth.to_s + "x" + windowHeight.to_s + 
"+" + windowLeft.to_s + "+" + windowTop.to_s )

#■使う人は使うであろう処理
#overrideredirectはウィンドウ描画中には効果が無いので、再表示する。
#ウィンドウのフレーム除去(true:フレーム除去 false:フレーム付加)
#root.overrideredirect(false)
#ウィンドウを消す
#root.withdraw
#ウィンドウを表示
#root.deiconify
#画面を最前面に出す
#root.attributes('topmost', 1)

# 検索枠
content = Tk::Tile::Frame.new(root) {padding "3 3 12 12"}.grid( :sticky => 'nsew')
TkGrid.columnconfigure root, 0, :weight => 1; TkGrid.rowconfigure root, 0, :weight => 1

# text
$job = TkVariable.new; $status = TkVariable.new
$j = Tk::Tile::Entry.new(content) { width 14; textvariable $job}.grid( :column => 1, :row => 1, :sticky => 'we' )

Tk::Tile::Button.new(content) {
    text 'Find Job'
    command {go_do_something}
}.grid( :column => 2, :row => 1, :sticky => 'w')

def go_do_something()
   # input text
    print $job
end

#Buttonも試しにつけてみる
button = TkButton.new {
    text "Button"
    command {
        #overrideredirectの使用例。更に応用して擬似フルスクリーンとかに使用
        root.overrideredirect(!root.overrideredirect).withdraw.deiconify
    }
}.place('x' => 400, 'y' => 200)

button.command = proc { exit }   ### ボタンが押されたときに終了する


Tk.mainloop
