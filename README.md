<!--<h3>DEA_MATLAB</h3>
<p>DEA_MATLAB is a MATLAB tool for data envelopment analysis (DEA). DEA is one of decision making methods, and it is studyed in the field of operations research or economics. It is used for measuring the efficiency of decision making units (DMUs)<br>
The application needs <b>Mathematical Optimization</b> package.</p>
<h3>How to use</h3>
<li>
<ul> 1. Install DEA.m from ./DEA_MATLAB.</ul>
<ul> 2. Prepare a data matrix D=(d_{ij}). It is either possible if you input evaluation items or DMUs in rows.</ul>
</li>-->
<br>
<h3>DEA_MATLAB</h3>
<p>DEA_MATLABは包絡分析法をするためのMATLABツールです。オペレーションズ・リサーチや経済学の分野でしばしば研究され、意思決定ツールのひとつとして知られています。また、DEAはその意思決定主体(DMU)における効率性を測るために使われます。<br>
動作条件として、<b>数理最適化ツール</b>が入っていなければ動きません。</p>
<h3>使い方</h3>
<ol>
<li> DEA.m をダウンロード。</li>
<li> データ行列D=(d_{ij})を用意してください。評価項目を行にするか、DMUを行にしてデータをそろえてください。また、このときあらかじめ入力項目と出力項目を決めておき、入力項目が先に並ぶようにしてください。<br><b>例</b>：同じ会社のライバル店舗をDEAを用いて分析しようとしたとき、評価項目が「敷地面積」「来客数」「売り上げ」「（街の）都市人口」の4つあったとします。行にDMU、列に項目が並ぶ形でデータ行列を入力するとします。このとき、「敷地面積」と「都市人口」を入力に選び、「来客数」と「売り上げ」を出力にした場合、入力である「敷地面積」と「都市人口」は1列目と2列目に来るようにしておいてください。</li>
<li> <b>DEA(D,"入力の数","出力の数")</b>の形で関数の引数を入力します。"入力の数"+"出力の数"が項目の総数になっていない場合はエラーがでます。</li>
<li> 出力結果は各DMUの各項目における目標値が返されます。上から各項目ごとになっています。このとき、自分のDMUに着目すれば、どの評価項目に注力すべきかがわかります。</li>
</ol>
<h3>使用例</h3>
セ・パ12球団の打撃データ<br>
（列：打数，三振，得点，安打，打点，盗塁，四死球．行：ファイターズ，ライオンズ，ソフトバンク，イーグルス，マリーンズ，バファローズ，カープ，スワローズ，ジャイアンツ，ベイスターズ，ドラゴンズ，タイガース）<br>
入力：1,2列（打数，三振）<br>
出力：残りの列（得点，安打，打点，盗塁，四死球）<br>

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
-DMU  1's obj.--DMU  2's obj.--DMU  3's obj.--DMU  4's obj.--DMU  5's obj.--DMU  6's obj.--DMU  7's obj.--DMU  8's obj.--DMU  9's obj.--DMU 10's obj.--DMU 11's obj.--DMU 12's obj.-
       4795.000       4742.366       4744.000       4717.335       4677.607       4747.000       4914.000       4828.000       4575.767       4425.538       4413.022       4328.181
       1076.000       1020.077        956.000        934.437        937.466        910.000       1063.000        907.000        916.680        957.336        917.813        926.102
        619.000        658.184        637.000        607.773        608.844        499.000        684.000        594.000        595.375        616.009        593.359        599.077
       1277.000       1287.000       1240.000       1234.000       1230.000       1199.000       1338.000       1234.000       1203.000       1205.000       1180.000       1171.000
        585.000        624.884        609.000        577.547        578.445        475.000        649.000        565.000        565.653        584.488        563.371        569.088
        132.000        113.308        107.000         92.032         93.949        104.000        118.000         82.000         91.810        106.271         96.877        102.931
        559.000        546.000        608.000        551.863        545.407        468.000        560.000        573.000        533.595        504.335        509.018        503.000
>>
```

