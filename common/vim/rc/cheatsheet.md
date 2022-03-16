# Cheat Sheat

## vim

### move
- hjkl :left up down right

### action
- \\+\*
to use some plugins action
- \\+d
Open denite
- \\+d d
Installed plugins list
- \\+d f
files list
- \\+d l
files log

### sandwich


囲む		sa{motion/textobject}{addition}	(ノーマル、ビジュアルモード)

囲みを外す
		sd				(ビジュアルモード)
		sdb				(ノーマルモード)
		sd{deletion}			(ノーマルモード)

囲みを置き換える
		sr{addition}			(ビジュアルモード)
		srb{addition}			(ノーマルモード)
		sr{deletion}{addition}		(ノーマルモード)

テキストオブジェクト
		ib			(オペレータ待機、ビジュアルモード)
		ab			(オペレータ待機、ビジュアルモード)
		is			(オペレータ待機、ビジュアルモード)
		as			(オペレータ待機、ビジュアルモード)

