Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Uotrp-0007pv-8g
	for mharc-qemu-trivial@gnu.org; Tue, 18 Jun 2013 07:14:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46737)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1Uotrl-0007kk-7b
	for qemu-trivial@nongnu.org; Tue, 18 Jun 2013 07:14:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1Uotrj-0000r9-Vi
	for qemu-trivial@nongnu.org; Tue, 18 Jun 2013 07:14:25 -0400
Received: from mail-pb0-x233.google.com ([2607:f8b0:400e:c01::233]:47092)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1Uotrj-0000qz-PI
	for qemu-trivial@nongnu.org; Tue, 18 Jun 2013 07:14:23 -0400
Received: by mail-pb0-f51.google.com with SMTP id um15so3793593pbc.38
	for <qemu-trivial@nongnu.org>; Tue, 18 Jun 2013 04:14:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:x-gm-message-state;
	bh=bT+2q4pktkWsqbpNi3R1x5lZGtTGfSdth9IrZWIkmn4=;
	b=hxyIr/I9yfMl15r+NQWV9gqAb62dBUdiQXR4CMdHHMygF/z8dAzToEY9jK7GB+2Pk5
	yFTVyF/DhvUFiuFt0W9SmtPRkDHFtWWAwElWSFn6d5oo051LnmZZ4LQMoFbl4t687NEU
	JJEJ0jgWayOSJorzLaw1Gmvcpff6FsFP+IAcLrDXG0E8MZqoMFFPNAELFxvz0CJoiYeM
	I361NTmx5Pfj5qW3HK3kYJxddNUZrX4MG6E8w/QYiSTPpWr2/OTnb5+kH2tb5ZInaD1Y
	N7BWFq12YhlMM2UZS8SeEPmms2UO0c9lo5r4oz7DDuDufyo+pSWrZqiB3e6GTZ+0HuT8
	22XQ==
X-Received: by 10.66.9.72 with SMTP id x8mr1780967paa.13.1371554063079;
	Tue, 18 Jun 2013 04:14:23 -0700 (PDT)
Received: from localhost ([203.126.243.116]) by mx.google.com with ESMTPSA id
	pm7sm17829888pbb.31.2013.06.18.04.14.16 for <multiple recipients>
	(version=TLSv1.1 cipher=RC4-SHA bits=128/128);
	Tue, 18 Jun 2013 04:14:22 -0700 (PDT)
Sender: Peter Crosthwaite <peter.crosthwaite@petalogix.com>
From: peter.crosthwaite@xilinx.com
To: qemu-devel@nongnu.org
Date: Tue, 18 Jun 2013 21:08:02 +1000
Message-Id: <f65ba24ae67c04af46940c8cc67093894af97871.1371553360.git.peter.crosthwaite@xilinx.com>
X-Mailer: git-send-email 1.8.3.rc1.44.gb387c77.dirty
In-Reply-To: <cover.1371553360.git.peter.crosthwaite@xilinx.com>
References: <cover.1371553360.git.peter.crosthwaite@xilinx.com>
X-Gm-Message-State: ALoCoQn1kYEpttDrMZpmLJnsvAKov5eK86lAGgZNnIBq5tgI/fhadMYku9YFj+2dD4s2nhpJHCYX
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c01::233
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org,
	Peter Crosthwaite <peter.crosthwaite@xilinx.com>, edgar.iglesias@gmail.com
Subject: [Qemu-trivial] [PATCH v1 1/5] block/nand: Factor out common code
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
X-List-Received-Date: Tue, 18 Jun 2013 11:14:27 -0000

From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>

Most of this computation of s->iolen is the same for both the if and
else paths here. Factor out the common parts outside the if.

Cc: qemu-trivial@nongnu.org

Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
---

 hw/block/nand.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/block/nand.c b/hw/block/nand.c
index 087ca14..6309f93 100644
--- a/hw/block/nand.c
+++ b/hw/block/nand.c
@@ -272,10 +272,10 @@ static void nand_command(NANDFlashState *s)
             break;
         offset = s->addr & ((1 << s->addr_shift) - 1);
         s->blk_load(s, s->addr, offset);
-        if (s->gnd)
-            s->iolen = (1 << s->page_shift) - offset;
-        else
-            s->iolen = (1 << s->page_shift) + (1 << s->oob_shift) - offset;
+        s->iolen = (1 << s->page_shift) - offset;
+        if (!s->gnd) {
+            s->iolen += 1 << s->oob_shift;
+        }
         break;
 
     case NAND_CMD_RESET:
-- 
1.8.3.rc1.44.gb387c77.dirty


