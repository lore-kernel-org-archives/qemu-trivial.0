Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZfU6x-0000cL-Q7
	for mharc-qemu-trivial@gnu.org; Fri, 25 Sep 2015 10:36:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51406)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shraddha.6596@gmail.com>) id 1ZfU6s-0000UK-A2
	for qemu-trivial@nongnu.org; Fri, 25 Sep 2015 10:36:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shraddha.6596@gmail.com>) id 1ZfU6o-0007NW-Hn
	for qemu-trivial@nongnu.org; Fri, 25 Sep 2015 10:36:26 -0400
Received: from mail-pa0-x22a.google.com ([2607:f8b0:400e:c03::22a]:36138)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shraddha.6596@gmail.com>)
	id 1ZfU6o-0007N1-BB; Fri, 25 Sep 2015 10:36:22 -0400
Received: by pablk4 with SMTP id lk4so10748187pab.3;
	Fri, 25 Sep 2015 07:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9oRNYejLNts/Q1VYIGTgdG4Yfuwiq6gPI2/dNlM+LQU=;
	b=CF2FyPTmr4a/xHhsMTjChSyJXIzj99lT35JYHsxkoWFmQvfoAs67ptqtRFIuSlbfns
	776qm1n/I54iRCNEgKYB+/ZrWjC8FAtp6J6OoTpMqE33M3sf9Hj7E9t6D5wYWh9nJ+tb
	yxCFd/mkUkgVV3PIStK/jJyqxwsPJXZNEl63g69l6SX6iDiIdO/6IXoT6rykNfrbAAoD
	nNfBBFIggVdwxz/5+G35A3juHDMnri0bmGp3pkU60v2snhmbD6vXnhJZB3pRy0nSLS62
	fphn2+/IlG6M72VLoePptXBlkHUmi8LN0oQSVnntbH4P7JmEAojL+ezZPCz6PCKrGDW1
	STWA==
X-Received: by 10.66.229.67 with SMTP id so3mr7837401pac.66.1443191781829;
	Fri, 25 Sep 2015 07:36:21 -0700 (PDT)
Received: from shraddha-370R4E-370R4V-370R5E-3570RE-370R5V.bits-goa.ac.in
	([103.225.100.51]) by smtp.gmail.com with ESMTPSA id
	a17sm4332215pbu.55.2015.09.25.07.36.18
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 25 Sep 2015 07:36:21 -0700 (PDT)
From: Shraddha Barke <shraddha.6596@gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Fri, 25 Sep 2015 20:06:03 +0530
Message-Id: <1443191763-3445-2-git-send-email-shraddha.6596@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1443191763-3445-1-git-send-email-shraddha.6596@gmail.com>
References: <1443191763-3445-1-git-send-email-shraddha.6596@gmail.com>
X-Cyberoam-smtpxy-version: 1.0.6.3
X-Cyberoam-AV-Policy: default
X-CTCH-PVer: 0000001
X-CTCH-Spam: Unknown
X-CTCH-VOD: Unknown
X-CTCH-Flags: 0
X-CTCH-RefID: str=0001.0A150207.56055BE4.00BE, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0
X-CTCH-Score: 0.000
X-CTCH-ScoreCust: 0.000
X-CTCH-Rules: 
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c03::22a
Cc: qemu-devel <qemu-devel@nongnu.org>,
	Shraddha Barke <shraddha.6596@gmail.com>
Subject: [Qemu-trivial] [PATCH 2/2] Hw: timer: Remove unnecessary variable
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
X-List-Received-Date: Fri, 25 Sep 2015 14:36:30 -0000

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
 hw/timer/m48t59.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/timer/m48t59.c b/hw/timer/m48t59.c
index 8ab683d..b3df8f9 100644
--- a/hw/timer/m48t59.c
+++ b/hw/timer/m48t59.c
@@ -590,10 +590,8 @@ static void nvram_writel (void *opaque, hwaddr addr, uint32_t value)
 static uint32_t nvram_readb (void *opaque, hwaddr addr)
 {
     M48t59State *NVRAM = opaque;
-    uint32_t retval;
 
-    retval = m48t59_read(NVRAM, addr);
-    return retval;
+    return m48t59_read(NVRAM, addr);
 }
 
 static uint32_t nvram_readw (void *opaque, hwaddr addr)
-- 
2.1.4


