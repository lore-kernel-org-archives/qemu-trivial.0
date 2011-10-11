Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RDX69-0001OF-NN
	for mharc-qemu-trivial@gnu.org; Tue, 11 Oct 2011 03:50:01 -0400
Received: from eggs.gnu.org ([140.186.70.92]:43507)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1RDX66-0001CX-M9
	for qemu-trivial@nongnu.org; Tue, 11 Oct 2011 03:49:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1RDX64-000299-Gw
	for qemu-trivial@nongnu.org; Tue, 11 Oct 2011 03:49:58 -0400
Received: from mail-ww0-f53.google.com ([74.125.82.53]:61191)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1RDX62-00028h-5Z; Tue, 11 Oct 2011 03:49:54 -0400
Received: by wwg14 with SMTP id 14so8576902wwg.10
	for <multiple recipients>; Tue, 11 Oct 2011 00:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=sHl3r9Z5DarYVb3ckBtru13OSFdWfA3loUxjvhld/h8=;
	b=GdolFZG/h70cykKU4Kn2GGWEplynHl//8igY/C6lRy8WQlNwyTujF7C2FiYJnFmmvF
	6xKGZ9BLCy0lNeL4Jq5WCL7JxtYL9CQx7kqV6+PaTD1OdQjiHM0FobPK67HImEomlaFi
	QiTd8WEqX0ySJWU82snBPvWPEXy3o0RePlliA=
Received: by 10.216.179.7 with SMTP id g7mr6920614wem.64.1318319392353;
	Tue, 11 Oct 2011 00:49:52 -0700 (PDT)
Received: from localhost.localdomain (93-34-218-143.ip51.fastwebnet.it.
	[93.34.218.143])
	by mx.google.com with ESMTPS id es5sm37018870wbb.11.2011.10.11.00.49.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 11 Oct 2011 00:49:51 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 11 Oct 2011 09:49:43 +0200
Message-Id: <1318319383-3731-1-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.7.6
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.82.53
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] remove hpet.h
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
X-List-Received-Date: Tue, 11 Oct 2011 07:49:59 -0000

It is unused since the HPET and RTC timers were removed (commit
25f3151, 2011-05-31).

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hpet.h |   22 ----------------------
 1 files changed, 0 insertions(+), 22 deletions(-)
 delete mode 100644 hpet.h

diff --git a/hpet.h b/hpet.h
deleted file mode 100644
index 754051a..0000000
--- a/hpet.h
+++ /dev/null
@@ -1,22 +0,0 @@
-#ifndef	__HPET__
-#define	__HPET__ 1
-
-
-
-struct hpet_info {
-	unsigned long hi_ireqfreq;	/* Hz */
-	unsigned long hi_flags;	/* information */
-	unsigned short hi_hpet;
-	unsigned short hi_timer;
-};
-
-#define	HPET_INFO_PERIODIC	0x0001	/* timer is periodic */
-
-#define	HPET_IE_ON	_IO('h', 0x01)	/* interrupt on */
-#define	HPET_IE_OFF	_IO('h', 0x02)	/* interrupt off */
-#define	HPET_INFO	_IOR('h', 0x03, struct hpet_info)
-#define	HPET_EPI	_IO('h', 0x04)	/* enable periodic */
-#define	HPET_DPI	_IO('h', 0x05)	/* disable periodic */
-#define	HPET_IRQFREQ	_IOW('h', 0x6, unsigned long)	/* IRQFREQ usec */
-
-#endif				/* !__HPET__ */
-- 
1.7.6


