Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZfU6o-0000O3-Dh
	for mharc-qemu-trivial@gnu.org; Fri, 25 Sep 2015 10:36:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51335)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shraddha.6596@gmail.com>) id 1ZfU6l-0000IW-GT
	for qemu-trivial@nongnu.org; Fri, 25 Sep 2015 10:36:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shraddha.6596@gmail.com>) id 1ZfU6h-0007EW-Oh
	for qemu-trivial@nongnu.org; Fri, 25 Sep 2015 10:36:19 -0400
Received: from mail-pa0-x22f.google.com ([2607:f8b0:400e:c03::22f]:34522)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shraddha.6596@gmail.com>)
	id 1ZfU6h-0007EC-Hi; Fri, 25 Sep 2015 10:36:15 -0400
Received: by padhy16 with SMTP id hy16so107688033pad.1;
	Fri, 25 Sep 2015 07:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=z6UnFLN92Rx5uqM1KEkccCNO8zGs4b1GEKrUCzxRrsE=;
	b=F7V+qBSB4GyanYmd15nilbgizHP0vzYkpfC5D5CpnHzmr8V2A+QbvaxcYIqX3rPZuA
	G9gsGm2pRV6RmYrur7XYETcKIsjW9VKBkdDOfj1+xzV5uJpryI+lklpCDI3sgE1UQsQO
	li0PsA7ytkuvm5rTwU9XDzCFkid+5Rjn3qH8iPeiCMIFv0IwsFgHRQXb5DHDhKHh2TrZ
	CUho1vht3DpU1w9VCfsTV/kAMVeSoGyM+FpUxaQoPiUuas4fICS6jGDIiTpOhNeGENuq
	BLvWQqh/vC3BawswPpRouws3BOZnEFJw88sRyr/35yL4zSWFXnqDG8If3Oe9tOh3akA8
	w6xw==
X-Received: by 10.66.121.163 with SMTP id ll3mr7585542pab.146.1443191774760;
	Fri, 25 Sep 2015 07:36:14 -0700 (PDT)
Received: from shraddha-370R4E-370R4V-370R5E-3570RE-370R5V.bits-goa.ac.in
	([103.225.100.51]) by smtp.gmail.com with ESMTPSA id
	a17sm4332215pbu.55.2015.09.25.07.36.10
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 25 Sep 2015 07:36:14 -0700 (PDT)
From: Shraddha Barke <shraddha.6596@gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Fri, 25 Sep 2015 20:06:02 +0530
Message-Id: <1443191763-3445-1-git-send-email-shraddha.6596@gmail.com>
X-Mailer: git-send-email 2.1.4
X-Cyberoam-smtpxy-version: 1.0.6.3
X-Cyberoam-AV-Policy: default
X-CTCH-PVer: 0000001
X-CTCH-Spam: Unknown
X-CTCH-VOD: Unknown
X-CTCH-Flags: 0
X-CTCH-RefID: str=0001.0A150207.56055BDD.00C4, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0
X-CTCH-Score: 0.000
X-CTCH-ScoreCust: 0.000
X-CTCH-Rules: 
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c03::22f
Cc: qemu-devel <qemu-devel@nongnu.org>,
	Shraddha Barke <shraddha.6596@gmail.com>
Subject: [Qemu-trivial] [PATCH 1/2] Hw: char: Remove unnecessary variable
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
X-List-Received-Date: Fri, 25 Sep 2015 14:36:20 -0000

Compress lines and remove the variable.

Change made using Coccinelle script

@@
expression ret;
@@
- if (ret) return ret;
- return 0;
+ return ret;
@@
local idexpression ret;
expression e;
@@
- ret = e;
- return ret;
+ return e;
@@
type T; identifier i;
@@
- T i;
... when != i

Signed-off-by: Shraddha Barke <shraddha.6596@gmail.com>
---
 hw/char/etraxfs_ser.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/char/etraxfs_ser.c b/hw/char/etraxfs_ser.c
index 857c136..562021e 100644
--- a/hw/char/etraxfs_ser.c
+++ b/hw/char/etraxfs_ser.c
@@ -182,15 +182,13 @@ static void serial_receive(void *opaque, const uint8_t *buf, int size)
 static int serial_can_receive(void *opaque)
 {
     ETRAXSerial *s = opaque;
-    int r;
 
     /* Is the receiver enabled?  */
     if (!(s->regs[RW_REC_CTRL] & (1 << 3))) {
         return 0;
     }
 
-    r = sizeof(s->rx_fifo) - s->rx_fifo_len;
-    return r;
+    return sizeof(s->rx_fifo) - s->rx_fifo_len;
 }
 
 static void serial_event(void *opaque, int event)
-- 
2.1.4


