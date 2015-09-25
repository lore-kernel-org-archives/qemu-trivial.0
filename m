Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZfOWJ-0005cD-J5
	for mharc-qemu-trivial@gnu.org; Fri, 25 Sep 2015 04:38:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44091)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shraddha.6596@gmail.com>) id 1ZfOWH-0005Ya-7M
	for qemu-trivial@nongnu.org; Fri, 25 Sep 2015 04:38:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shraddha.6596@gmail.com>) id 1ZfOWG-0003Hd-HD
	for qemu-trivial@nongnu.org; Fri, 25 Sep 2015 04:38:17 -0400
Received: from mail-pa0-x22f.google.com ([2607:f8b0:400e:c03::22f]:34742)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shraddha.6596@gmail.com>)
	id 1ZfOWG-0003GX-C6; Fri, 25 Sep 2015 04:38:16 -0400
Received: by padhy16 with SMTP id hy16so100087955pad.1;
	Fri, 25 Sep 2015 01:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=a7KIFWL96WMnRvFlLt/M6X/rmJyR0GNgt62IZqUoyiY=;
	b=kOfCu/ryILNICnA1pOMHmZ8Yu0UGTbttIiCi6CBJf+23MzplncgW+PKPVREpSur5+Y
	LlrWB/D0jF+8wWuSWOk4OucoZJl6Qd9QCFiSzQFC/EUmOgup3Da6MdQj0YS9XB28onVT
	sLMihRNHvQFqB8CKQ0Poz2bOOyf6a8/1lj7AqRdSqJ4O/7wmDky/b+uow2Y5e1DU0qJ3
	kqTGNAasQcQVYNIYInm+nFZUzMuWkcsW45JiQ0EB1vV9l0TGiC6A/lQdjuxp4u7XKjEH
	wibNN6tHkak7Zjdhq0iKnjDDZ+p6NGUDVXw4ov60GMaeRNxnaotMMKou1LzoISMaD5QL
	X2Kg==
X-Received: by 10.68.213.234 with SMTP id nv10mr5654542pbc.145.1443170295507; 
	Fri, 25 Sep 2015 01:38:15 -0700 (PDT)
Received: from shraddha-370R4E-370R4V-370R5E-3570RE-370R5V.bits-goa.ac.in
	([103.225.100.51])
	by smtp.gmail.com with ESMTPSA id w5sm2619014pbs.31.2015.09.25.01.38.10
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 25 Sep 2015 01:38:14 -0700 (PDT)
From: Shraddha Barke <shraddha.6596@gmail.com>
To: kvm@vger.kernel.org, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Fri, 25 Sep 2015 14:07:57 +0530
Message-Id: <1443170278-9318-2-git-send-email-shraddha.6596@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1443170278-9318-1-git-send-email-shraddha.6596@gmail.com>
References: <1443170278-9318-1-git-send-email-shraddha.6596@gmail.com>
X-Cyberoam-smtpxy-version: 1.0.6.3
X-Cyberoam-AV-Policy: default
X-CTCH-PVer: 0000001
X-CTCH-Spam: Unknown
X-CTCH-VOD: Unknown
X-CTCH-Flags: 0
X-CTCH-RefID: str=0001.0A150209.560507F6.0059, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0
X-CTCH-Score: 0.000
X-CTCH-ScoreCust: 0.000
X-CTCH-Rules: 
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c03::22f
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
	Shraddha Barke <shraddha.6596@gmail.com>
Subject: [Qemu-trivial] [PATCH 2/3] Hw: timer: Remove unnecessary variable
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
X-List-Received-Date: Fri, 25 Sep 2015 08:38:18 -0000

Compress lines and remove the variable ret.

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
 hw/timer/tusb6010.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/timer/tusb6010.c b/hw/timer/tusb6010.c
index 459c748..ba01050 100644
--- a/hw/timer/tusb6010.c
+++ b/hw/timer/tusb6010.c
@@ -321,7 +321,6 @@ static uint32_t tusb_async_readw(void *opaque, hwaddr addr)
     TUSBState *s = (TUSBState *) opaque;
     int offset = addr & 0xfff;
     int epnum;
-    uint32_t ret;
 
     switch (offset) {
     case TUSB_DEV_CONF:
@@ -338,12 +337,11 @@ static uint32_t tusb_async_readw(void *opaque, hwaddr addr)
         return 0x00;	/* TODO */
 
     case TUSB_DEV_OTG_STAT:
-        ret = s->otg_status;
 #if 0
         if (!(s->prcm_mngmt & TUSB_PRCM_MNGMT_OTG_VBUS_DET_EN))
             ret &= ~TUSB_DEV_OTG_STAT_VBUS_VALID;
 #endif
-        return ret;
+        return s->otg_status;
     case TUSB_DEV_OTG_TIMER:
         return s->otg_timer_val;
 
-- 
2.1.4


