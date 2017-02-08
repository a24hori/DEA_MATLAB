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
<ul>
<li> 1. DEA.m をダウンロード。</li>
<li> 2. データ行列D=(d_{ij})を用意してください。評価項目を行にするか、DMUを行にしてデータをそろえてください。また、このときあらかじめ入力項目と出力項目を決めておき、入力項目が先に並ぶようにしてください。<br>たとえば、同じ会社のライバル店舗をDEA用いて分析しようとしたとき、項目が「敷地面積」「来客数」「売り上げ」「（街の）都市人口」の4つあったとします。また、行にDMU、列に項目が並ぶ形でデータ行列を入力するとします。このとき、「敷地面積」と「都市人口」を入力に選び、「来客数」「売り上げ」を出力にした場合、「敷地面積」と「都市人口」は1列目と2列目に来るようにしておいてください。</li>
<li> 3. > <b>DEA(D,"入力の数","出力の数","データ行列を転置するかどうか(0,1)")</b>の形で関数の引数を入力します。"入力の数"+"出力の数"が項目の総数になっていない場合はエラーがでます。データ行列を転置するかどうかは<b>「行にDMU、列に項目が並ぶ形」</b>でデータ行列を作成した場合は 1 としてください。先の例で示した場合、データ行列は転置して入力する必要があります。</li>
<li> 4. 出力結果は各DMUの各項目における目標値が返されます。上から各項目ごとになっています。</li>
</ul>
<h3>使用例</h3>
