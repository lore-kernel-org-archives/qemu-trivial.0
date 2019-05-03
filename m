Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hMWF4-0000dU-3s
	for mharc-qemu-trivial@gnu.org; Fri, 03 May 2019 07:20:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59922)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hMWF1-0000aB-90
	for qemu-trivial@nongnu.org; Fri, 03 May 2019 07:20:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hMWF0-0002R0-83
	for qemu-trivial@nongnu.org; Fri, 03 May 2019 07:20:35 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:52677)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1hMWEz-0002Pv-Vy; Fri, 03 May 2019 07:20:34 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA
	(Nemesis)
	id 1MiakT-1grbKw1aCd-00flhN; Fri, 03 May 2019 13:20:09 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
	Fabien Chouteau <chouteau@adacore.com>, qemu-trivial@nongnu.org,
	Richard Henderson <rth@twiddle.net>, Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Michael Tokarev <mjt@tls.msk.ru>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
	Michael Roth <mdroth@linux.vnet.ibm.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Wei Yang <richardw.yang@linux.intel.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Stefano Garzarella <sgarzare@redhat.com>
Date: Fri,  3 May 2019 13:19:48 +0200
Message-Id: <20190503111958.30825-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190503111958.30825-1-laurent@vivier.eu>
References: <20190503111958.30825-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Mo0DHmSk3NXOQ39/99q/lX9tdbs4b1ZFlo11KKPGiKVH2+VmJKa
	0Cd0YVYHpijJ3+gDGvWdA0yaN1yOXchrDhi8R9TF0CpCtKQZ74J+3AZ5sSFtOJ11UyNDoWk
	ovvZ4wElGnjhzG0t26GioGcRU0sXQNHtRlBX8+iFUv4Hux2QGV7e8Wu9ApYcvwVBtbqNQ5X
	xMBShRn2O39O56lK53mKQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:4D1AAZDHlv0=:xIB9Y2RHqtxeTDvzVQnygV
	+2vQhicwVLUHTHmfF5DqI3Sc/7CBJIYl3CxGx/K6FDd/hLrnckHr67zsMOB9THNQC8cANZnzD
	Qut8GjSpgd+FszRd9HRcisewgw3YmSay2ZIbTK3Elw7a8/F/vmHg5zf8q0YVVToAZRw+6bQd/
	YEtC20znLRW6V7FryjeC1WxYE/mCKWMflbk9GV7V85c4KmA4sTsYfM4lwhp5190mS5IVNvSt+
	VM9NTdDLxVYyrinqkSvRwMf79cp33mXiB1MqVNNyV8V9/buKXqak1F61hCqA8Xw+pxsSX0gnX
	zmKQuXQokWS6KIS7roXuCGRAGPtH89rmR5q7T7rpm8yx1DIvVD9JJbwBABHtstc83VaCtLyTl
	Y5NkTV44IqtMLy/tpypxjuLeZ/zEd3LvoaR1LiaclGdHXsw3Uz/aIBlCI76iRL7r0DW5WyzAM
	BKAhFSJCCmeIyJyRHmjM7JIWOnNewyTfObMHD8OWs6TzrKbA4WKt09a7tbbNFRGINScpItAl2
	HXwgiVvjE8jqfXEJiXzGE1VIv/cEjUti4Deoq5gz3bGOANawGRKmbcE7sVQV8T4bexTDJ0Bjb
	dPGpSOtnIJew2LXd7fmH8awH7joTXOC29zre5BI8OE4/i9wWalx5nxlhOQkRR0VbbaMthwEwO
	hvvoV8jfIpVgO3GcFJFfooVAld/acsYPH1C/iP/8ZjbP1GDNY3cOfXE6/7PphPCO3IRUyTdP/
	xrpXRnNzrYuDN5TcFNfZZpCp/GoK1V5WQ0k23w==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.74
Subject: [Qemu-trivial] [PULL v2 02/12] CODING_STYLE: specify the indent
 rule for multiline code
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 03 May 2019 11:20:36 -0000

From: Wei Yang <richardw.yang@linux.intel.com>

We didn't specify the indent rule for multiline code here, which may
mislead users. And in current code, the code use various styles.

Add this rule in CODING_STYLE to make sure this is clear to every one.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
Suggested-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Message-Id: <20190304071631.27567-2-richardw.yang@linux.intel.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 CODING_STYLE | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/CODING_STYLE b/CODING_STYLE
index ec075dedc4a8..90321e9c2821 100644
--- a/CODING_STYLE
+++ b/CODING_STYLE
@@ -29,6 +29,45 @@ Spaces of course are superior to tabs because:
 
 Do not leave whitespace dangling off the ends of lines.
 
+1.1 Multiline Indent
+
+There are several places where indent is necessary:
+
+ - if/else
+ - while/for
+ - function definition & call
+
+When breaking up a long line to fit within line width, we need a proper indent
+for the following lines.
+
+In case of if/else, while/for, align the secondary lines just after the
+opening parenthesis of the first.
+
+For example:
+
+    if (a == 1 &&
+        b == 2) {
+
+    while (a == 1 &&
+           b == 2) {
+
+In case of function, there are several variants:
+
+    * 4 spaces indent from the beginning
+    * align the secondary lines just after the opening parenthesis of the
+      first
+
+For example:
+
+    do_something(x, y,
+        z);
+
+    do_something(x, y,
+                 z);
+
+    do_something(x, do_another(y,
+                               z));
+
 2. Line width
 
 Lines should be 80 characters; try not to make them longer.
-- 
2.20.1


