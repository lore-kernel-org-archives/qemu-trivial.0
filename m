Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WeduG-0000G3-26
	for mharc-qemu-trivial@gnu.org; Mon, 28 Apr 2014 01:15:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48930)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Wedu7-0008QB-Sb
	for qemu-trivial@nongnu.org; Mon, 28 Apr 2014 01:15:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Wedu4-0002Mx-0k
	for qemu-trivial@nongnu.org; Mon, 28 Apr 2014 01:14:59 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:54785)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Wedtq-0002LX-2Q; Mon, 28 Apr 2014 01:14:42 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 98F554303E;
	Mon, 28 Apr 2014 09:14:40 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 0B70D672;
	Mon, 28 Apr 2014 09:08:28 +0400 (MSK)
Received: (nullmailer pid 19153 invoked by uid 1000);
	Mon, 28 Apr 2014 05:08:26 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 28 Apr 2014 09:07:58 +0400
Message-Id: <1398661684-19059-13-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1398661684-19059-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1398661684-19059-1-git-send-email-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>,
	=?UTF-8?q?Beno=C3=AEt=20Canet?= <benoit@irqsave.net>
Subject: [Qemu-trivial] [PULL 12/18] Add QEMU logo (SVG file)
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 28 Apr 2014 05:15:04 -0000

From: Stefan Weil <sw@weilnetz.de>

The "Q" of the logo is already included in pc-bios/qemu_logo_no_text.svg.

This file now adds the complete logo as it was designed by Beno=C3=AEt Ca=
net.
Beno=C3=AEt licensed it under CC-BY 3.0, see
http://lists.gnu.org/archive/html/qemu-devel/2012-02/msg02865.html.

Unneeded borders from Beno=C3=AEt's original logo were removed,
and metadata (license, author, date) was added in this version.

Cc: Beno=C3=AEt Canet <benoit@irqsave.net>
Signed-off-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 pc-bios/qemu_logo.svg | 1010 +++++++++++++++++++++++++++++++++++++++++++=
++++++
 1 file changed, 1010 insertions(+)
 create mode 100644 pc-bios/qemu_logo.svg

diff --git a/pc-bios/qemu_logo.svg b/pc-bios/qemu_logo.svg
new file mode 100644
index 0000000..07b5b51
--- /dev/null
+++ b/pc-bios/qemu_logo.svg
@@ -0,0 +1,1010 @@
+<?xml version=3D"1.0" encoding=3D"UTF-8" standalone=3D"no"?>
+<!-- Created with Inkscape (http://www.inkscape.org/) -->
+
+<svg
+   xmlns:dc=3D"http://purl.org/dc/elements/1.1/"
+   xmlns:cc=3D"http://creativecommons.org/ns#"
+   xmlns:rdf=3D"http://www.w3.org/1999/02/22-rdf-syntax-ns#"
+   xmlns:svg=3D"http://www.w3.org/2000/svg"
+   xmlns=3D"http://www.w3.org/2000/svg"
+   xmlns:xlink=3D"http://www.w3.org/1999/xlink"
+   xmlns:sodipodi=3D"http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd"
+   xmlns:inkscape=3D"http://www.inkscape.org/namespaces/inkscape"
+   width=3D"351.84259"
+   height=3D"111.86757"
+   id=3D"svg2"
+   version=3D"1.1"
+   inkscape:version=3D"0.48.3.1 r9886"
+   sodipodi:docname=3D"qemu_logo.svg">
+  <title
+     id=3D"title3182">Kew the Angry Emu</title>
+  <defs
+     id=3D"defs4">
+    <linearGradient
+       id=3D"linearGradient4686">
+      <stop
+         style=3D"stop-color:#000000;stop-opacity:1;"
+         offset=3D"0"
+         id=3D"stop4688" />
+      <stop
+         id=3D"stop3956"
+         offset=3D"0.75"
+         style=3D"stop-color:#000000;stop-opacity:0.87843138;" />
+      <stop
+         style=3D"stop-color:#ffffff;stop-opacity:0.43921569;"
+         offset=3D"0.75"
+         id=3D"stop3958" />
+      <stop
+         id=3D"stop3960"
+         offset=3D"0.88"
+         style=3D"stop-color:#181818;stop-opacity:1;" />
+      <stop
+         style=3D"stop-color:#242424;stop-opacity:1;"
+         offset=3D"0.88"
+         id=3D"stop3962" />
+      <stop
+         style=3D"stop-color:#000000;stop-opacity:1;"
+         offset=3D"1"
+         id=3D"stop4690" />
+    </linearGradient>
+    <linearGradient
+       id=3D"linearGradient4467">
+      <stop
+         style=3D"stop-color:#000000;stop-opacity:1;"
+         offset=3D"0"
+         id=3D"stop4469" />
+      <stop
+         style=3D"stop-color:#000000;stop-opacity:0.8974359;"
+         offset=3D"1"
+         id=3D"stop4471" />
+    </linearGradient>
+    <linearGradient
+       id=3D"linearGradient4431">
+      <stop
+         style=3D"stop-color:#ffffff;stop-opacity:1;"
+         offset=3D"0"
+         id=3D"stop4433" />
+      <stop
+         style=3D"stop-color:#ffffff;stop-opacity:0;"
+         offset=3D"1"
+         id=3D"stop4435" />
+    </linearGradient>
+    <linearGradient
+       id=3D"linearGradient4466">
+      <stop
+         style=3D"stop-color:#ffffff;stop-opacity:1;"
+         offset=3D"0"
+         id=3D"stop4468" />
+      <stop
+         style=3D"stop-color:#ffffff;stop-opacity:0;"
+         offset=3D"1"
+         id=3D"stop4470" />
+    </linearGradient>
+    <linearGradient
+       id=3D"linearGradient4321">
+      <stop
+         style=3D"stop-color:#ff6702;stop-opacity:1;"
+         offset=3D"0"
+         id=3D"stop4323" />
+      <stop
+         style=3D"stop-color:#ff9a55;stop-opacity:1;"
+         offset=3D"1"
+         id=3D"stop4325" />
+    </linearGradient>
+    <linearGradient
+       id=3D"linearGradient4283">
+      <stop
+         style=3D"stop-color:#000000;stop-opacity:1;"
+         offset=3D"0"
+         id=3D"stop4285" />
+      <stop
+         style=3D"stop-color:#000000;stop-opacity:0;"
+         offset=3D"1"
+         id=3D"stop4287" />
+    </linearGradient>
+    <linearGradient
+       id=3D"linearGradient4251">
+      <stop
+         style=3D"stop-color:#000000;stop-opacity:1;"
+         offset=3D"0"
+         id=3D"stop4253" />
+      <stop
+         style=3D"stop-color:#000000;stop-opacity:0;"
+         offset=3D"1"
+         id=3D"stop4255" />
+    </linearGradient>
+    <linearGradient
+       id=3D"linearGradient4007">
+      <stop
+         style=3D"stop-color:#ff6600;stop-opacity:1;"
+         offset=3D"0"
+         id=3D"stop4009" />
+      <stop
+         style=3D"stop-color:#ff9148;stop-opacity:1;"
+         offset=3D"1"
+         id=3D"stop4011" />
+    </linearGradient>
+    <linearGradient
+       id=3D"linearGradient3999">
+      <stop
+         style=3D"stop-color:#fff7f2;stop-opacity:1;"
+         offset=3D"0"
+         id=3D"stop4001" />
+      <stop
+         style=3D"stop-color:#ffffff;stop-opacity:0;"
+         offset=3D"1"
+         id=3D"stop4003" />
+    </linearGradient>
+    <linearGradient
+       id=3D"linearGradient3890">
+      <stop
+         style=3D"stop-color:#ffffff;stop-opacity:1;"
+         offset=3D"0"
+         id=3D"stop3892" />
+      <stop
+         style=3D"stop-color:#ffffff;stop-opacity:0;"
+         offset=3D"1"
+         id=3D"stop3894" />
+    </linearGradient>
+    <linearGradient
+       id=3D"linearGradient3880">
+      <stop
+         style=3D"stop-color:#eb7400;stop-opacity:1;"
+         offset=3D"0"
+         id=3D"stop3882" />
+      <stop
+         style=3D"stop-color:#f7b06a;stop-opacity:1;"
+         offset=3D"1"
+         id=3D"stop3884" />
+    </linearGradient>
+    <linearGradient
+       id=3D"linearGradient4011">
+      <stop
+         style=3D"stop-color:#042dc8;stop-opacity:1;"
+         offset=3D"0"
+         id=3D"stop4013" />
+      <stop
+         style=3D"stop-color:#4260d5;stop-opacity:1;"
+         offset=3D"1"
+         id=3D"stop4015" />
+    </linearGradient>
+    <linearGradient
+       id=3D"linearGradient3879">
+      <stop
+         style=3D"stop-color:#ffffff;stop-opacity:0.90598291;"
+         offset=3D"0"
+         id=3D"stop3881" />
+      <stop
+         style=3D"stop-color:#ffffff;stop-opacity:0;"
+         offset=3D"1"
+         id=3D"stop3883" />
+    </linearGradient>
+    <linearGradient
+       id=3D"linearGradient3869">
+      <stop
+         style=3D"stop-color:#c95000;stop-opacity:1;"
+         offset=3D"0"
+         id=3D"stop3871" />
+      <stop
+         style=3D"stop-color:#ff9e5e;stop-opacity:1;"
+         offset=3D"1"
+         id=3D"stop3873" />
+    </linearGradient>
+    <linearGradient
+       id=3D"linearGradient3861">
+      <stop
+         style=3D"stop-color:#f06000;stop-opacity:1;"
+         offset=3D"0"
+         id=3D"stop3863" />
+      <stop
+         style=3D"stop-color:#ffccaa;stop-opacity:1;"
+         offset=3D"1"
+         id=3D"stop3865" />
+    </linearGradient>
+    <linearGradient
+       id=3D"linearGradient3826">
+      <stop
+         style=3D"stop-color:#ff6600;stop-opacity:1;"
+         offset=3D"0"
+         id=3D"stop3828" />
+      <stop
+         style=3D"stop-color:#ff893b;stop-opacity:1;"
+         offset=3D"1"
+         id=3D"stop3830" />
+    </linearGradient>
+    <linearGradient
+       id=3D"linearGradient3879-6">
+      <stop
+         style=3D"stop-color:#ffffff;stop-opacity:0.90598291;"
+         offset=3D"0"
+         id=3D"stop3881-4" />
+      <stop
+         style=3D"stop-color:#ffffff;stop-opacity:0;"
+         offset=3D"1"
+         id=3D"stop3883-7" />
+    </linearGradient>
+    <linearGradient
+       id=3D"linearGradient3869-5">
+      <stop
+         style=3D"stop-color:#c95000;stop-opacity:1;"
+         offset=3D"0"
+         id=3D"stop3871-9" />
+      <stop
+         style=3D"stop-color:#ff9e5e;stop-opacity:1;"
+         offset=3D"1"
+         id=3D"stop3873-4" />
+    </linearGradient>
+    <linearGradient
+       inkscape:collect=3D"always"
+       xlink:href=3D"#linearGradient3879-4"
+       id=3D"linearGradient3885-6"
+       x1=3D"76.025352"
+       y1=3D"124.8497"
+       x2=3D"75.874107"
+       y2=3D"143.03978"
+       gradientUnits=3D"userSpaceOnUse" />
+    <linearGradient
+       id=3D"linearGradient3879-4">
+      <stop
+         style=3D"stop-color:#ffffff;stop-opacity:0.93162394;"
+         offset=3D"0"
+         id=3D"stop3881-6" />
+      <stop
+         style=3D"stop-color:#ffffff;stop-opacity:0;"
+         offset=3D"1"
+         id=3D"stop3883-74" />
+    </linearGradient>
+    <linearGradient
+       id=3D"linearGradient3869-2">
+      <stop
+         style=3D"stop-color:#c95000;stop-opacity:1;"
+         offset=3D"0"
+         id=3D"stop3871-99" />
+      <stop
+         style=3D"stop-color:#ff9e5e;stop-opacity:1;"
+         offset=3D"1"
+         id=3D"stop3873-6" />
+    </linearGradient>
+    <radialGradient
+       inkscape:collect=3D"always"
+       xlink:href=3D"#linearGradient4011"
+       id=3D"radialGradient4017"
+       cx=3D"66.639"
+       cy=3D"93.096375"
+       fx=3D"66.639"
+       fy=3D"93.096375"
+       r=3D"11.515625"
+       gradientTransform=3D"matrix(0.23244854,1.600893,-1.0124495,0.1470=
0695,145.40424,-26.300303)"
+       gradientUnits=3D"userSpaceOnUse" />
+    <linearGradient
+       inkscape:collect=3D"always"
+       xlink:href=3D"#linearGradient3879-4-7"
+       id=3D"linearGradient3885-6-2"
+       x1=3D"76.025352"
+       y1=3D"124.8497"
+       x2=3D"75.874107"
+       y2=3D"143.03978"
+       gradientUnits=3D"userSpaceOnUse" />
+    <linearGradient
+       id=3D"linearGradient3879-4-7">
+      <stop
+         style=3D"stop-color:#ffffff;stop-opacity:0.93162394;"
+         offset=3D"0"
+         id=3D"stop3881-6-7" />
+      <stop
+         style=3D"stop-color:#ffffff;stop-opacity:0;"
+         offset=3D"1"
+         id=3D"stop3883-74-6" />
+    </linearGradient>
+    <radialGradient
+       inkscape:collect=3D"always"
+       xlink:href=3D"#linearGradient4011-5"
+       id=3D"radialGradient4017-7"
+       cx=3D"66.639"
+       cy=3D"93.096375"
+       fx=3D"66.639"
+       fy=3D"93.096375"
+       r=3D"11.515625"
+       gradientTransform=3D"matrix(0.99779178,6.8718773,-4.3459674,0.631=
0314,452.75975,-225.98471)"
+       gradientUnits=3D"userSpaceOnUse" />
+    <linearGradient
+       id=3D"linearGradient4011-5">
+      <stop
+         style=3D"stop-color:#042dc8;stop-opacity:1;"
+         offset=3D"0"
+         id=3D"stop4013-1" />
+      <stop
+         style=3D"stop-color:#4260d5;stop-opacity:1;"
+         offset=3D"1"
+         id=3D"stop4015-3" />
+    </linearGradient>
+    <linearGradient
+       inkscape:collect=3D"always"
+       xlink:href=3D"#linearGradient3879-4-75"
+       id=3D"linearGradient3885-6-8"
+       x1=3D"76.025352"
+       y1=3D"124.8497"
+       x2=3D"75.874107"
+       y2=3D"143.03978"
+       gradientUnits=3D"userSpaceOnUse" />
+    <linearGradient
+       id=3D"linearGradient3879-4-75">
+      <stop
+         style=3D"stop-color:#ffffff;stop-opacity:0.93162394;"
+         offset=3D"0"
+         id=3D"stop3881-6-1" />
+      <stop
+         style=3D"stop-color:#ffffff;stop-opacity:0;"
+         offset=3D"1"
+         id=3D"stop3883-74-4" />
+    </linearGradient>
+    <radialGradient
+       inkscape:collect=3D"always"
+       xlink:href=3D"#linearGradient4011-0"
+       id=3D"radialGradient4017-5"
+       cx=3D"66.639"
+       cy=3D"93.096375"
+       fx=3D"66.639"
+       fy=3D"93.096375"
+       r=3D"11.515625"
+       gradientTransform=3D"matrix(0.23244854,1.600893,-1.0124495,0.1470=
0695,146.34996,53.681728)"
+       gradientUnits=3D"userSpaceOnUse" />
+    <linearGradient
+       id=3D"linearGradient4011-0">
+      <stop
+         style=3D"stop-color:#042dc8;stop-opacity:1;"
+         offset=3D"0"
+         id=3D"stop4013-4" />
+      <stop
+         style=3D"stop-color:#4260d5;stop-opacity:1;"
+         offset=3D"1"
+         id=3D"stop4015-0" />
+    </linearGradient>
+    <linearGradient
+       inkscape:collect=3D"always"
+       xlink:href=3D"#linearGradient4011-0"
+       id=3D"linearGradient4117"
+       x1=3D"107.03001"
+       y1=3D"189.72537"
+       x2=3D"107.18476"
+       y2=3D"173.47537"
+       gradientUnits=3D"userSpaceOnUse" />
+    <linearGradient
+       inkscape:collect=3D"always"
+       xlink:href=3D"#linearGradient3879-4-7-2"
+       id=3D"linearGradient3885-6-2-8"
+       x1=3D"76.025352"
+       y1=3D"124.8497"
+       x2=3D"75.874107"
+       y2=3D"143.03978"
+       gradientUnits=3D"userSpaceOnUse" />
+    <linearGradient
+       id=3D"linearGradient3879-4-7-2">
+      <stop
+         style=3D"stop-color:#ffffff;stop-opacity:0.93162394;"
+         offset=3D"0"
+         id=3D"stop3881-6-7-9" />
+      <stop
+         style=3D"stop-color:#ffffff;stop-opacity:0;"
+         offset=3D"1"
+         id=3D"stop3883-74-6-9" />
+    </linearGradient>
+    <radialGradient
+       inkscape:collect=3D"always"
+       xlink:href=3D"#linearGradient4011-5-1"
+       id=3D"radialGradient4017-7-9"
+       cx=3D"66.639"
+       cy=3D"93.096375"
+       fx=3D"66.639"
+       fy=3D"93.096375"
+       r=3D"11.515625"
+       gradientTransform=3D"matrix(0.99779178,6.8718773,-4.3459674,0.631=
0314,448.94742,-406.99277)"
+       gradientUnits=3D"userSpaceOnUse" />
+    <linearGradient
+       id=3D"linearGradient4011-5-1">
+      <stop
+         style=3D"stop-color:#042dc8;stop-opacity:1;"
+         offset=3D"0"
+         id=3D"stop4013-1-9" />
+      <stop
+         style=3D"stop-color:#4260d5;stop-opacity:1;"
+         offset=3D"1"
+         id=3D"stop4015-3-8" />
+    </linearGradient>
+    <linearGradient
+       inkscape:collect=3D"always"
+       xlink:href=3D"#linearGradient3879-4-7-2-7"
+       id=3D"linearGradient3885-6-2-8-0"
+       x1=3D"76.025352"
+       y1=3D"124.8497"
+       x2=3D"75.874107"
+       y2=3D"143.03978"
+       gradientUnits=3D"userSpaceOnUse" />
+    <linearGradient
+       id=3D"linearGradient3879-4-7-2-7">
+      <stop
+         style=3D"stop-color:#ffffff;stop-opacity:0.93162394;"
+         offset=3D"0"
+         id=3D"stop3881-6-7-9-3" />
+      <stop
+         style=3D"stop-color:#ffffff;stop-opacity:0;"
+         offset=3D"1"
+         id=3D"stop3883-74-6-9-6" />
+    </linearGradient>
+    <radialGradient
+       inkscape:collect=3D"always"
+       xlink:href=3D"#linearGradient4011-5-1-5"
+       id=3D"radialGradient4017-7-9-5"
+       cx=3D"66.639"
+       cy=3D"93.096375"
+       fx=3D"66.639"
+       fy=3D"93.096375"
+       r=3D"11.515625"
+       gradientTransform=3D"matrix(0.55965334,3.8543806,-2.4376181,0.353=
9404,454.75182,-145.44353)"
+       gradientUnits=3D"userSpaceOnUse" />
+    <linearGradient
+       id=3D"linearGradient4011-5-1-5">
+      <stop
+         style=3D"stop-color:#042dc8;stop-opacity:1;"
+         offset=3D"0"
+         id=3D"stop4013-1-9-6" />
+      <stop
+         style=3D"stop-color:#4260d5;stop-opacity:1;"
+         offset=3D"1"
+         id=3D"stop4015-3-8-9" />
+    </linearGradient>
+    <linearGradient
+       inkscape:collect=3D"always"
+       xlink:href=3D"#linearGradient3879-4-7-2-4"
+       id=3D"linearGradient3885-6-2-8-4"
+       x1=3D"76.025352"
+       y1=3D"124.8497"
+       x2=3D"75.874107"
+       y2=3D"143.03978"
+       gradientUnits=3D"userSpaceOnUse" />
+    <linearGradient
+       id=3D"linearGradient3879-4-7-2-4">
+      <stop
+         style=3D"stop-color:#ffffff;stop-opacity:0.93162394;"
+         offset=3D"0"
+         id=3D"stop3881-6-7-9-9" />
+      <stop
+         style=3D"stop-color:#ffffff;stop-opacity:0;"
+         offset=3D"1"
+         id=3D"stop3883-74-6-9-3" />
+    </linearGradient>
+    <radialGradient
+       inkscape:collect=3D"always"
+       xlink:href=3D"#linearGradient4011-5-1-7"
+       id=3D"radialGradient4017-7-9-7"
+       cx=3D"66.639"
+       cy=3D"93.096375"
+       fx=3D"66.639"
+       fy=3D"93.096375"
+       r=3D"11.515625"
+       gradientTransform=3D"matrix(0.26837158,1.8482981,-1.1689154,0.169=
72569,466.57614,26.180822)"
+       gradientUnits=3D"userSpaceOnUse" />
+    <linearGradient
+       id=3D"linearGradient4011-5-1-7">
+      <stop
+         style=3D"stop-color:#042dc8;stop-opacity:1;"
+         offset=3D"0"
+         id=3D"stop4013-1-9-1" />
+      <stop
+         style=3D"stop-color:#4260d5;stop-opacity:1;"
+         offset=3D"1"
+         id=3D"stop4015-3-8-5" />
+    </linearGradient>
+    <linearGradient
+       id=3D"linearGradient3879-4-7-2-0">
+      <stop
+         style=3D"stop-color:#ffffff;stop-opacity:0.93162394;"
+         offset=3D"0"
+         id=3D"stop3881-6-7-9-7" />
+      <stop
+         style=3D"stop-color:#ffffff;stop-opacity:0;"
+         offset=3D"1"
+         id=3D"stop3883-74-6-9-8" />
+    </linearGradient>
+    <linearGradient
+       id=3D"linearGradient4011-5-1-55">
+      <stop
+         style=3D"stop-color:#000a30;stop-opacity:1;"
+         offset=3D"0"
+         id=3D"stop4013-1-9-8" />
+      <stop
+         style=3D"stop-color:#4260d5;stop-opacity:1;"
+         offset=3D"1"
+         id=3D"stop4015-3-8-3" />
+    </linearGradient>
+    <linearGradient
+       id=3D"linearGradient3890-9">
+      <stop
+         style=3D"stop-color:#ffffff;stop-opacity:1;"
+         offset=3D"0"
+         id=3D"stop3892-0" />
+      <stop
+         style=3D"stop-color:#ffffff;stop-opacity:0;"
+         offset=3D"1"
+         id=3D"stop3894-9" />
+    </linearGradient>
+    <linearGradient
+       id=3D"linearGradient3880-4">
+      <stop
+         style=3D"stop-color:#eb7400;stop-opacity:1;"
+         offset=3D"0"
+         id=3D"stop3882-5" />
+      <stop
+         style=3D"stop-color:#f7b06a;stop-opacity:1;"
+         offset=3D"1"
+         id=3D"stop3884-1" />
+    </linearGradient>
+    <linearGradient
+       id=3D"linearGradient3999-7">
+      <stop
+         style=3D"stop-color:#fff7f2;stop-opacity:1;"
+         offset=3D"0"
+         id=3D"stop4001-9" />
+      <stop
+         style=3D"stop-color:#ffffff;stop-opacity:0;"
+         offset=3D"1"
+         id=3D"stop4003-4" />
+    </linearGradient>
+    <linearGradient
+       id=3D"linearGradient4007-9">
+      <stop
+         style=3D"stop-color:#ff6600;stop-opacity:1;"
+         offset=3D"0"
+         id=3D"stop4009-1" />
+      <stop
+         style=3D"stop-color:#ff9148;stop-opacity:1;"
+         offset=3D"1"
+         id=3D"stop4011-9" />
+    </linearGradient>
+    <linearGradient
+       id=3D"linearGradient4007-9-5">
+      <stop
+         style=3D"stop-color:#ff6600;stop-opacity:1;"
+         offset=3D"0"
+         id=3D"stop4009-1-9" />
+      <stop
+         style=3D"stop-color:#ff9148;stop-opacity:1;"
+         offset=3D"1"
+         id=3D"stop4011-9-5" />
+    </linearGradient>
+    <linearGradient
+       id=3D"linearGradient3999-7-1">
+      <stop
+         style=3D"stop-color:#fff7f2;stop-opacity:1;"
+         offset=3D"0"
+         id=3D"stop4001-9-1" />
+      <stop
+         style=3D"stop-color:#ffffff;stop-opacity:0;"
+         offset=3D"1"
+         id=3D"stop4003-4-4" />
+    </linearGradient>
+    <linearGradient
+       id=3D"linearGradient4007-9-5-3">
+      <stop
+         style=3D"stop-color:#ff6600;stop-opacity:1;"
+         offset=3D"0"
+         id=3D"stop4009-1-9-3" />
+      <stop
+         style=3D"stop-color:#ff9148;stop-opacity:1;"
+         offset=3D"1"
+         id=3D"stop4011-9-5-9" />
+    </linearGradient>
+    <linearGradient
+       id=3D"linearGradient3999-7-1-4">
+      <stop
+         style=3D"stop-color:#fff7f2;stop-opacity:1;"
+         offset=3D"0"
+         id=3D"stop4001-9-1-4" />
+      <stop
+         style=3D"stop-color:#ffffff;stop-opacity:0;"
+         offset=3D"1"
+         id=3D"stop4003-4-4-4" />
+    </linearGradient>
+    <linearGradient
+       id=3D"linearGradient3879-4-7-2-3">
+      <stop
+         style=3D"stop-color:#ffffff;stop-opacity:0.93162394;"
+         offset=3D"0"
+         id=3D"stop3881-6-7-9-1" />
+      <stop
+         style=3D"stop-color:#ffffff;stop-opacity:0;"
+         offset=3D"1"
+         id=3D"stop3883-74-6-9-87" />
+    </linearGradient>
+    <linearGradient
+       id=3D"linearGradient4011-5-1-1">
+      <stop
+         style=3D"stop-color:#fde8a1;stop-opacity:1;"
+         offset=3D"0"
+         id=3D"stop4013-1-9-63" />
+      <stop
+         style=3D"stop-color:#2947b9;stop-opacity:1;"
+         offset=3D"1"
+         id=3D"stop4015-3-8-8" />
+    </linearGradient>
+    <linearGradient
+       inkscape:collect=3D"always"
+       xlink:href=3D"#linearGradient4466"
+       id=3D"linearGradient4472"
+       x1=3D"161.7561"
+       y1=3D"540.72662"
+       x2=3D"161.7561"
+       y2=3D"579.80206"
+       gradientUnits=3D"userSpaceOnUse" />
+    <radialGradient
+       inkscape:collect=3D"always"
+       xlink:href=3D"#linearGradient4321"
+       id=3D"radialGradient4474"
+       cx=3D"130.8242"
+       cy=3D"575.27838"
+       fx=3D"130.8242"
+       fy=3D"575.27838"
+       r=3D"49.498173"
+       gradientTransform=3D"matrix(0.95670828,0.96684666,-0.72623533,0.7=
1862001,423.45109,35.05138)"
+       gradientUnits=3D"userSpaceOnUse" />
+    <linearGradient
+       inkscape:collect=3D"always"
+       xlink:href=3D"#linearGradient4466-5"
+       id=3D"linearGradient4472-9"
+       x1=3D"161.7561"
+       y1=3D"540.72662"
+       x2=3D"161.7561"
+       y2=3D"579.80206"
+       gradientUnits=3D"userSpaceOnUse" />
+    <linearGradient
+       id=3D"linearGradient4466-5">
+      <stop
+         style=3D"stop-color:#ffffff;stop-opacity:1;"
+         offset=3D"0"
+         id=3D"stop4468-2" />
+      <stop
+         style=3D"stop-color:#ffffff;stop-opacity:0;"
+         offset=3D"1"
+         id=3D"stop4470-3" />
+    </linearGradient>
+    <radialGradient
+       inkscape:collect=3D"always"
+       xlink:href=3D"#linearGradient4321-0"
+       id=3D"radialGradient4474-6"
+       cx=3D"130.8242"
+       cy=3D"575.27838"
+       fx=3D"130.8242"
+       fy=3D"575.27838"
+       r=3D"49.498173"
+       gradientTransform=3D"matrix(0.95670828,0.96684666,-0.72623533,0.7=
1862001,442.64399,170.9169)"
+       gradientUnits=3D"userSpaceOnUse" />
+    <linearGradient
+       id=3D"linearGradient4321-0">
+      <stop
+         style=3D"stop-color:#ff6702;stop-opacity:1;"
+         offset=3D"0"
+         id=3D"stop4323-3" />
+      <stop
+         style=3D"stop-color:#ff9a55;stop-opacity:1;"
+         offset=3D"1"
+         id=3D"stop4325-1" />
+    </linearGradient>
+    <linearGradient
+       id=3D"linearGradient4466-5-5">
+      <stop
+         style=3D"stop-color:#ffffff;stop-opacity:1;"
+         offset=3D"0"
+         id=3D"stop4468-2-9" />
+      <stop
+         style=3D"stop-color:#ffffff;stop-opacity:0;"
+         offset=3D"1"
+         id=3D"stop4470-3-4" />
+    </linearGradient>
+    <linearGradient
+       id=3D"linearGradient4321-0-0">
+      <stop
+         style=3D"stop-color:#ff6702;stop-opacity:1;"
+         offset=3D"0"
+         id=3D"stop4323-3-9" />
+      <stop
+         style=3D"stop-color:#ff9a55;stop-opacity:1;"
+         offset=3D"1"
+         id=3D"stop4325-1-1" />
+    </linearGradient>
+    <linearGradient
+       id=3D"linearGradient4466-5-9">
+      <stop
+         style=3D"stop-color:#ffffff;stop-opacity:1;"
+         offset=3D"0"
+         id=3D"stop4468-2-7" />
+      <stop
+         style=3D"stop-color:#ffffff;stop-opacity:0;"
+         offset=3D"1"
+         id=3D"stop4470-3-7" />
+    </linearGradient>
+    <linearGradient
+       id=3D"linearGradient4321-0-7">
+      <stop
+         style=3D"stop-color:#ff6702;stop-opacity:1;"
+         offset=3D"0"
+         id=3D"stop4323-3-3" />
+      <stop
+         style=3D"stop-color:#ff9a55;stop-opacity:1;"
+         offset=3D"1"
+         id=3D"stop4325-1-6" />
+    </linearGradient>
+    <linearGradient
+       inkscape:collect=3D"always"
+       xlink:href=3D"#linearGradient4431"
+       id=3D"linearGradient4437"
+       x1=3D"142.81854"
+       y1=3D"831.52283"
+       x2=3D"142.81854"
+       y2=3D"878.90735"
+       gradientUnits=3D"userSpaceOnUse" />
+    <radialGradient
+       inkscape:collect=3D"always"
+       xlink:href=3D"#linearGradient4467"
+       id=3D"radialGradient4475"
+       cx=3D"116.51958"
+       cy=3D"98.282051"
+       fx=3D"116.51958"
+       fy=3D"98.282051"
+       r=3D"55.859375"
+       gradientTransform=3D"matrix(0.97442557,1.5088911,-0.83559154,0.53=
961599,79.641615,-130.28522)"
+       gradientUnits=3D"userSpaceOnUse" />
+    <linearGradient
+       inkscape:collect=3D"always"
+       xlink:href=3D"#linearGradient4431-3"
+       id=3D"linearGradient4437-6"
+       x1=3D"142.81854"
+       y1=3D"831.52283"
+       x2=3D"142.81854"
+       y2=3D"878.90735"
+       gradientUnits=3D"userSpaceOnUse" />
+    <linearGradient
+       id=3D"linearGradient4431-3">
+      <stop
+         style=3D"stop-color:#ffffff;stop-opacity:1;"
+         offset=3D"0"
+         id=3D"stop4433-0" />
+      <stop
+         style=3D"stop-color:#ffffff;stop-opacity:0;"
+         offset=3D"1"
+         id=3D"stop4435-2" />
+    </linearGradient>
+    <radialGradient
+       inkscape:collect=3D"always"
+       xlink:href=3D"#linearGradient4467-7"
+       id=3D"radialGradient4475-0"
+       cx=3D"116.51958"
+       cy=3D"98.282051"
+       fx=3D"116.51958"
+       fy=3D"98.282051"
+       r=3D"55.859375"
+       gradientTransform=3D"matrix(0.97442557,1.5088911,-0.83559154,0.53=
961599,225.10358,63.664066)"
+       gradientUnits=3D"userSpaceOnUse" />
+    <linearGradient
+       id=3D"linearGradient4467-7">
+      <stop
+         style=3D"stop-color:#000000;stop-opacity:1;"
+         offset=3D"0"
+         id=3D"stop4469-4" />
+      <stop
+         style=3D"stop-color:#000000;stop-opacity:0.8974359;"
+         offset=3D"1"
+         id=3D"stop4471-7" />
+    </linearGradient>
+  </defs>
+  <sodipodi:namedview
+     id=3D"base"
+     pagecolor=3D"#ffffff"
+     bordercolor=3D"#666666"
+     borderopacity=3D"1.0"
+     inkscape:pageopacity=3D"0.0"
+     inkscape:pageshadow=3D"2"
+     inkscape:zoom=3D"1.0170184"
+     inkscape:cx=3D"539.34448"
+     inkscape:cy=3D"-81.088823"
+     inkscape:document-units=3D"px"
+     inkscape:current-layer=3D"layer1"
+     showgrid=3D"false"
+     showguides=3D"false"
+     inkscape:guide-bbox=3D"true"
+     inkscape:window-width=3D"992"
+     inkscape:window-height=3D"547"
+     inkscape:window-x=3D"30"
+     inkscape:window-y=3D"24"
+     inkscape:window-maximized=3D"0"
+     fit-margin-top=3D"0"
+     fit-margin-left=3D"0"
+     fit-margin-right=3D"0"
+     fit-margin-bottom=3D"0">
+    <sodipodi:guide
+       orientation=3D"0,1"
+       position=3D"52.563745,58.089579"
+       id=3D"guide2989" />
+    <sodipodi:guide
+       orientation=3D"0,1"
+       position=3D"54.584055,28.037549"
+       id=3D"guide2991" />
+    <sodipodi:guide
+       orientation=3D"1,0"
+       position=3D"51.048515,41.169529"
+       id=3D"guide2993" />
+    <sodipodi:guide
+       orientation=3D"1,0"
+       position=3D"77.817565,40.916989"
+       id=3D"guide2995" />
+    <sodipodi:guide
+       orientation=3D"1,0"
+       position=3D"51.048515,41.169529"
+       id=3D"guide3017" />
+    <inkscape:grid
+       type=3D"xygrid"
+       id=3D"grid3019"
+       empspacing=3D"5"
+       visible=3D"true"
+       enabled=3D"true"
+       snapvisiblegridlinesonly=3D"true"
+       originx=3D"-62.341105px"
+       originy=3D"-884.63528px" />
+    <sodipodi:guide
+       orientation=3D"1,0"
+       position=3D"85.658895,8.3647193"
+       id=3D"guide3021" />
+    <sodipodi:guide
+       orientation=3D"1,0"
+       position=3D"106.6589,4.3647193"
+       id=3D"guide3023" />
+    <sodipodi:guide
+       orientation=3D"0,1"
+       position=3D"90.658895,17.364719"
+       id=3D"guide3025" />
+    <sodipodi:guide
+       orientation=3D"0,1"
+       position=3D"90.658895,-6.6352807"
+       id=3D"guide3027" />
+    <sodipodi:guide
+       orientation=3D"0,1"
+       position=3D"-0.341105,-14.635281"
+       id=3D"guide3810" />
+    <sodipodi:guide
+       orientation=3D"0,1"
+       position=3D"1.658895,-49.635281"
+       id=3D"guide3814" />
+    <sodipodi:guide
+       orientation=3D"0,1"
+       position=3D"-17.698248,11.257579"
+       id=3D"guide3856" />
+    <sodipodi:guide
+       orientation=3D"0,1"
+       position=3D"6.601806,11.257579"
+       id=3D"guide3887" />
+    <sodipodi:guide
+       orientation=3D"0,1"
+       position=3D"24.658283,58.089579"
+       id=3D"guide4019" />
+    <sodipodi:guide
+       orientation=3D"0,1"
+       position=3D"106.6589,-6.6352807"
+       id=3D"guide4481" />
+    <sodipodi:guide
+       orientation=3D"0,1"
+       position=3D"139.08747,-193.20671"
+       id=3D"guide4483" />
+  </sodipodi:namedview>
+  <metadata
+     id=3D"metadata7">
+    <rdf:RDF>
+      <cc:Work
+         rdf:about=3D"">
+        <dc:format>image/svg+xml</dc:format>
+        <dc:type
+           rdf:resource=3D"http://purl.org/dc/dcmitype/StillImage" />
+        <dc:title>Kew the Angry Emu</dc:title>
+        <dc:creator>
+          <cc:Agent>
+            <dc:title>Beno=C3=AEt Canet</dc:title>
+          </cc:Agent>
+        </dc:creator>
+        <dc:rights>
+          <cc:Agent>
+            <dc:title>CC BY 3.0</dc:title>
+          </cc:Agent>
+        </dc:rights>
+        <dc:publisher>
+          <cc:Agent>
+            <dc:title>QEMU Community</dc:title>
+          </cc:Agent>
+        </dc:publisher>
+        <dc:date>2012-02-15</dc:date>
+        <cc:license
+           rdf:resource=3D"http://creativecommons.org/licenses/by/3.0/" =
/>
+        <dc:subject>
+          <rdf:Bag>
+            <rdf:li>QEMU logo</rdf:li>
+            <rdf:li>QEMU mascot</rdf:li>
+          </rdf:Bag>
+        </dc:subject>
+        <dc:source>http://lists.gnu.org/archive/html/qemu-devel/2012-02/=
msg01961.html</dc:source>
+      </cc:Work>
+      <cc:License
+         rdf:about=3D"http://creativecommons.org/licenses/by/3.0/">
+        <cc:permits
+           rdf:resource=3D"http://creativecommons.org/ns#Reproduction" /=
>
+        <cc:permits
+           rdf:resource=3D"http://creativecommons.org/ns#Distribution" /=
>
+        <cc:requires
+           rdf:resource=3D"http://creativecommons.org/ns#Notice" />
+        <cc:requires
+           rdf:resource=3D"http://creativecommons.org/ns#Attribution" />
+        <cc:permits
+           rdf:resource=3D"http://creativecommons.org/ns#DerivativeWorks=
" />
+      </cc:License>
+    </rdf:RDF>
+  </metadata>
+  <g
+     inkscape:label=3D"Layer 1"
+     inkscape:groupmode=3D"layer"
+     id=3D"layer1"
+     transform=3D"translate(-62.341105,-55.859333)">
+    <path
+       inkscape:connector-curvature=3D"0"
+       style=3D"fill:url(#radialGradient4475);fill-opacity:1;stroke:none=
"
+       d=3D"m 118.2161,55.859333 c -30.850815,0 -55.874995,24.87043 -55.=
874995,55.562497 0,30.69207 25.02418,55.56249 55.874995,55.56249 10.09496=
,0 19.54625,-2.6525 27.71875,-7.3125 l 2.90625,7.3125 2.40625,0 20,0 0.12=
5,0 -8.8125,-21.78124 c 7.21537,-9.3622 11.5,-21.07236 11.5,-33.78125 0,-=
30.692067 -24.99293,-55.562497 -55.84375,-55.562497 z"
+       id=3D"path3834-7-7-2-5-5-0-5-4" />
+    <path
+       sodipodi:type=3D"arc"
+       style=3D"fill:url(#linearGradient4437);fill-opacity:1;stroke:none=
"
+       id=3D"path3661"
+       sodipodi:cx=3D"142.5"
+       sodipodi:cy=3D"856.29077"
+       sodipodi:rx=3D"35.357143"
+       sodipodi:ry=3D"24.642857"
+       d=3D"m 177.85714,856.29077 c 0,13.60988 -15.82993,24.64286 -35.35=
714,24.64286 -19.52721,0 -35.35714,-11.03298 -35.35714,-24.64286 0,-13.60=
987 15.82993,-24.64286 35.35714,-24.64286 19.52721,0 35.35714,11.03299 35=
.35714,24.64286 z"
+       transform=3D"matrix(1.0465082,0,0,1.2920463,-31.641235,-1016.8612=
)" />
+    <path
+       sodipodi:type=3D"arc"
+       style=3D"fill:#000000;fill-opacity:1;stroke:none"
+       id=3D"path4442"
+       sodipodi:cx=3D"115.66247"
+       sodipodi:cy=3D"856.39258"
+       sodipodi:rx=3D"6.5659914"
+       sodipodi:ry=3D"6.5659914"
+       d=3D"m 122.22846,856.39258 c 0,3.6263 -2.9397,6.56599 -6.56599,6.=
56599 -3.6263,0 -6.56599,-2.93969 -6.56599,-6.56599 0,-3.6263 2.93969,-6.=
56599 6.56599,-6.56599 3.62629,0 6.56599,2.93969 6.56599,6.56599 z"
+       transform=3D"translate(7.6700247,-777.60351)" />
+    <rect
+       style=3D"fill:#000000;fill-opacity:1;stroke:none"
+       id=3D"rect4444"
+       width=3D"37.643608"
+       height=3D"5.5005069"
+       x=3D"125.01157"
+       y=3D"65.255234"
+       transform=3D"matrix(0.98974903,0.14281759,-0.18972639,0.981837,0,=
0)" />
+    <rect
+       style=3D"fill:#000000;fill-opacity:1;stroke:none"
+       id=3D"rect4446"
+       width=3D"6.5659914"
+       height=3D"2.9041886"
+       x=3D"144.92451"
+       y=3D"89.016899" />
+    <path
+       style=3D"fill:#ff6600;fill-opacity:1"
+       d=3D"m 103.38797,65.010543 c -0.057,2.18531 -3.865755,0.28296 -4.=
031245,2.78125 -4.22387,-1.88052 0.32884,2.87188 -0.0937,3.3125 l -0.0312=
,0 -0.3125,-0.0312 c -0.20386,-0.0728 -0.49977,-0.19904 -0.9375,-0.46875 =
-2.9499,2.35025 -3.02157,7.23369 -6.0625,9.9375 -1.99467,4.30504 -2.47977=
,8.98337 -3.9375,13.46875 -0.71796,4.30292 -1.34881,8.597857 -0.28125,12.=
906247 0.32053,3.50159 -0.68919,8.25865 2.5,10.71875 4.72728,3.88304 8.65=
575,8.79543 12.624995,13.46875 6.21914,7.65333 11.72948,15.86251 16.59375=
,24.4375 0.32431,-2.11756 1.10954,4.26459 2.53125,4.6875 -0.49161,-3.1923=
1 -1.13213,-8.26328 -1.4375,-12.1875 -1.5814,-10.2909 -6.65305,-19.64903 =
-8.5625,-29.84375 -0.0587,-0.43037 -0.12809,-0.87203 -0.1875,-1.3125 l 0,=
-1.28125 -0.15625,0 c -0.62551,-5.04297 -0.8504,-10.46546 2.8125,-14.4062=
5 3.73968,-3.772097 9.30633,-4.722447 13.8125,-7.343747 1.00194,-0.59119 =
2.04921,-1.07174 3.125,-1.40625 0.009,-0.003 0.0228,0.003 0.0312,0 3.1170=
1,-0.96341 6.44862,-0.93323 9.6875,-0.40625 0.0479,
 0.008 0.10841,0.0233 0.15625,0.0312 0.29455,0.0493 0.61389,0.099 0.90625=
,0.15625 2.37136,0.21133 7.14463,1.13687 8,-0.5 -3.27225,-2.78631 -7.9852=
6,-2.59211 -11.96875,-3.6875 -0.63059,-0.11469 -1.41182,-0.24041 -2.1875,=
-0.3125 l -3.90625,-0.875 -0.96875,-0.25 0,0.0312 -13.96875,-2.71875 c -0=
.22212,-0.20226 -0.46434,-0.40933 -0.6875,-0.5625 l 13.625,1.6875 0,-0.06=
25 c 0.48011,0.10699 0.95576,0.19361 1.4375,0.25 l 0,0.0312 9.625,1.78125=
 c 1.66103,0.61952 3.4322,1.08374 5.09375,1.1875 2.74263,0.39907 6.22526,=
4.49092 7.125,4.6875 -0.44096,-4.307 -4.7422,-6.23586 -8.3125,-7.5 -4.171=
2,-2.02803 -10.4023,-1.95417 -11.0625,-7.5625 -0.1756,-0.39076 -0.34902,-=
0.78118 -0.5625,-1.15625 l -1.625,-2.15625 0.0625,-0.0312 c -2.21724,-2.6=
1691 -5.34011,-4.52196 -8.65625,-5.25 -3.2914,-1.13611 -6.98773,-2.2671 -=
10.46875,-2.71875 -1.18132,3.47826 -2.5031,-2.75561 -5.34375,-0.90625 -2.=
48996,0.29488 -2.14614,0.95256 -4,-0.625 z m 17.90625,10.15625 c 0.90187,=
-0.0238 1.93277,0.14208 2.96875,0.5 2.76259,0.954
 47 4.56151,2.96523 4.03125,4.5 -0.53026,1.53477 -3.20616,1.98572 -5.9687=
5,1.03125 -2.76259,-0.95447 -4.5615,-2.93398 -4.03125,-4.46875 0.33141,-0=
.95923 1.49689,-1.52281 3,-1.5625 z"
+       id=3D"path3499-9-7"
+       inkscape:connector-curvature=3D"0" />
+    <text
+       xml:space=3D"preserve"
+       style=3D"font-size:95.54121399px;font-style:normal;font-variant:n=
ormal;font-weight:bold;font-stretch:normal;text-align:start;line-height:1=
25%;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:st=
art;fill:#000000;fill-opacity:1;stroke:none;font-family:Sans;-inkscape-fo=
nt-specification:Sans Bold"
+       x=3D"184.89412"
+       y=3D"166.37402"
+       id=3D"text4477"
+       sodipodi:linespacing=3D"125%"><tspan
+         sodipodi:role=3D"line"
+         id=3D"tspan4479"
+         x=3D"184.89412"
+         y=3D"166.37402"
+         style=3D"fill:#000000;fill-opacity:1">EMU</tspan></text>
+  </g>
+</svg>
--=20
1.7.10.4


