Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SHSLF-0003XR-2k
	for mharc-qemu-trivial@gnu.org; Tue, 10 Apr 2012 00:06:05 -0400
Received: from eggs.gnu.org ([208.118.235.92]:35216)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1SHSLC-0003WI-Ut
	for qemu-trivial@nongnu.org; Tue, 10 Apr 2012 00:06:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1SHSLB-0006Vb-Cz
	for qemu-trivial@nongnu.org; Tue, 10 Apr 2012 00:06:02 -0400
Received: from mail-iy0-f173.google.com ([209.85.210.173]:37808)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1SHSLB-0006VK-8d
	for qemu-trivial@nongnu.org; Tue, 10 Apr 2012 00:06:01 -0400
Received: by iafj26 with SMTP id j26so8118352iaf.4
	for <qemu-trivial@nongnu.org>; Mon, 09 Apr 2012 21:05:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=fqmW0MYeL4i05msNGdiinD6lZ0OwGGV3J4QzYSGQL4o=;
	b=CSjm7Vs7KHgPdV9j1DlJ2cWH9lwXtv9a0YlxdFKdqPyUEGhhmEwA7CUM96PVy47awU
	H1oieMDF7zQww2BU9GkyAT/ZhUnRMT3AKjpj6YgCv05wK87BeFDOASBtxe64ZZD5gZ0J
	syhOjtE+Y1qCuGBw0EGa8N3U3LYtl/ZauvO9x6nAq8lF0N30B9PgjzAo2j6CSFHuwY6M
	tOk29fSJol5GCxqv60N1Gln6tOFno7+d4Yi9E0Lpk894915eZGWkKpftU00zXzW5chnl
	HMAMo2oeshKopI7eT9aDxkPw6ptThKnXX7PxCtkk3xrDqbHen7jYfX+MawcwkWC3IRY5
	IgZQ==
Received: by 10.50.181.193 with SMTP id dy1mr1022215igc.9.1334030758550;
	Mon, 09 Apr 2012 21:05:58 -0700 (PDT)
Received: from localhost ([124.148.20.9])
	by mx.google.com with ESMTPS id en8sm18734323igc.7.2012.04.09.21.05.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 09 Apr 2012 21:05:57 -0700 (PDT)
From: "Peter A. G. Crosthwaite" <peter.crosthwaite@petalogix.com>
To: qemu-devel@nongnu.org,
	edgar.iglesias@gmail.com
Date: Tue, 10 Apr 2012 14:05:52 +1000
Message-Id: <1334030752-26476-1-git-send-email-peter.crosthwaite@petalogix.com>
X-Mailer: git-send-email 1.7.3.2
X-Gm-Message-State: ALoCoQnmYeb4AtNZfmZzuKhM9PBMuGTo4Kt09ncrF76kvx5brkFQDNy1mfXxzHlls6jSFDpdTArW
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.210.173
Cc: peter.crosthwaite@petalogix.com, qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] petalogix_s3adsp1800: deleted bad FIXME
	comment
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
X-List-Received-Date: Tue, 10 Apr 2012 04:06:04 -0000

This FIXME has already been actioned. Deleted comment.

Signed-off-by: Peter A. G. Crosthwaite <peter.crosthwaite@petalogix.com>
---
 hw/petalogix_s3adsp1800_mmu.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/hw/petalogix_s3adsp1800_mmu.c b/hw/petalogix_s3adsp1800_mmu.c
index ff154c7..8b37336 100644
--- a/hw/petalogix_s3adsp1800_mmu.c
+++ b/hw/petalogix_s3adsp1800_mmu.c
@@ -51,7 +51,6 @@
 
 static void machine_cpu_reset(CPUMBState *env)
 {
-    /* FIXME: move to machine specfic cpu reset */
     env->pvr.regs[10] = 0x0c000000; /* spartan 3a dsp family.  */
 }
 
-- 
1.7.3.2


