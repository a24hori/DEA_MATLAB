<!--<h3>DEA_MATLAB</h3>
<p>DEA_MATLAB is a MATLAB tool for data envelopment analysis (DEA). DEA is one of decision making methods, and it is studyed in the field of operations research or economics. It is used for measuring the efficiency of decision making units (DMUs)<br>
The application needs <b>Mathematical Optimization</b> package.</p>
<h3>How to use</h3>
<li>
<ul> 1. Install DEA.m from ./DEA_MATLAB.</ul>
<ul> 2. Prepare a data matrix D=(d_{ij}). It is either possible if you input evaluation items or DMUs in rows.</ul>
</li>-->
<h3>DEA_MATLABとは</h3>
<p>DEA_MATLABは包絡分析法(DEA)のMATLABツールです。DEAはオペレーションズ・リサーチや経済学の分野でしばしば研究され、意思決定ツールのひとつとして知られています。また、DEAはその意思決定主体(DMU)における効率性を測るために使われます。動作条件として、<b>数理最適化ツール(Optimization Toolbox)</b>が入っていなければ動きません。</p>
<p>DEAについて理論的な説明がされている文献は枚挙に暇がありません。ここでは、その一部（Webページで閲覧可能）を列挙します。
<ul>
<li><a href="http://www.bunkyo.ac.jp/~hotta/lab/courses/2010/2010dmt/10dmt_7.pdf">文教大学 情報学部 堀田敬介氏の講義スライド</a></li>
<li><a href="http://www.orsj.or.jp/~wiki/wiki/index.php/《DEA(包絡分析法)》">OR学会事典Wiki：《DEA(包絡分析法)》 - 日本オペレーションズ・リサーチ学会</a></li>
<li><a href="http://www.orsj.or.jp/~wiki/wiki/index.php/CCRモデル">OR学会事典Wiki：CCRモデル - 日本オペレーションズ・リサーチ学会</a></li>
</ul>
DEAのモデルは種々提案されており、制御不能変数（その意思決定主体が改善できない評価項目）が存在するような場合を考慮したモデルもあります。本ツールは、意思決定主体は全ての項目において改善可能であると仮定したCCRモデル（入力指向型）を前提としています。
</p>
<p>本ツールは分数計画問題(FP)を線形計画問題(LP)に変換したものを内点法（linprogのデフォルトでは、'interior-point-legacy'）で解いています。このときに出力されるラグランジュ乗数は、双対問題の変数に一致しますので、この双対変数を用いてそれぞれのDMUにおける努力目標値を算出しています。
</p>
<b>※ MathWorksの公式サイトによると、最適化ツールボックスは次の最新リリースで削除される予定です。</b>
<h3>使い方</h3>
<ol>
<li> <b>DEA.m</b> をダウンロード。MATLABのパスにファイルを入れてください。</li>
<li> データ行列 D=(d_{ij}) を用意してください。評価項目を行にするか、DMUを行にしてデータをそろえてください。また、このときあらかじめ入力項目と出力項目を決めておき、入力項目が先に並ぶようにしてください。<br><b>例</b>：同じ会社のライバル店舗をDEAを用いて分析しようとしたとき、評価項目が「敷地面積」「来客数」「売り上げ」「（街の）都市人口」の4つあったとします。行にDMU、列に項目が並ぶ形でデータ行列を入力するとします。このとき、「敷地面積」と「都市人口」を入力に選び、「来客数」と「売り上げ」を出力にした場合、入力である「敷地面積」と「都市人口」は1列目と2列目に来るようにしておいてください。</li>
<li> <b>DEA(D,"入力の数","出力の数")</b> の形で関数の引数を入力します。<b>"入力の数"+"出力の数"が項目の総数</b>になっていない場合はエラーがでます。</li>
<li> 出力結果は各DMUの各項目における目標値が返されます。上から各項目ごとになっています。このとき、自分のDMUに着目すれば、どの評価項目に注力すべきかがわかります。</li>
</ol>
<h3>使用例</h3>
・2016年セ・パ12球団の打撃データ<br>
（列：打数，三振，得点，安打，打点，盗塁，四死球．行：ファイターズ，ライオンズ，ソフトバンク，イーグルス，マリーンズ，バファローズ，カープ，スワローズ，ジャイアンツ，ベイスターズ，ドラゴンズ，タイガース）<br>
入力：1,2列（打数，三振）<br>
出力：残りの列（得点，安打，打点，盗塁，四死球）<br>
実行結果：

```
>> D=[4795,1076,619,1277,585,132,559;
4881,1071,619,1287,591,97,546;
4744,956,637,1240,609,107,608;
4806,952,544,1234,518,56,497;
4810,964,583,1230,559,77,533;
4747,910,499,1199,475,104,468;
4914,1063,684,1338,649,118,560;
4828,907,594,1234,565,82,573;
4797,961,519,1203,497,62,435;
4838,1049,572,1205,548,67,434;
4813,1001,500,1180,473,60,463;
4789,1149,506,1171,475,59,503];
>> DEA(D,2,5)
Optimization terminated.
Optimization terminated.
Optimization terminated.
Optimization terminated.
Optimization terminated.
Optimization terminated.
Optimization terminated.
Optimization terminated.
Optimization terminated.
Optimization terminated.
Optimization terminated.
Optimization terminated.
---- The result ----
DMU_noneff={2,4,5,9,10,11,12}
-DMU  2's obj.--DMU  4's obj.--DMU  5's obj.--DMU  9's obj.--DMU 10's obj.--DMU 11's obj.--DMU 12's obj.-
       4742.366       4717.335       4677.607       4575.767       4425.538       4413.022       4328.181
       1020.077        934.437        937.466        916.680        957.336        917.813        926.102
        658.184        607.773        608.844        595.375        616.009        593.359        599.077
       1287.000       1234.000       1230.000       1203.000       1205.000       1180.000       1171.000
        624.884        577.547        578.445        565.653        584.488        563.371        569.088
        113.308         92.032         93.949         91.810        106.271         96.877        102.931
        546.000        551.863        545.407        533.595        504.335        509.018        503.000
>> 
```

