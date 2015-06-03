Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z09d9-00049A-J4
	for mharc-qemu-trivial@gnu.org; Wed, 03 Jun 2015 10:26:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59755)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z09cz-0003p3-Pl
	for qemu-trivial@nongnu.org; Wed, 03 Jun 2015 10:26:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z09cy-0006zx-SC
	for qemu-trivial@nongnu.org; Wed, 03 Jun 2015 10:26:45 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:49071)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Z09cr-0006wM-7b; Wed, 03 Jun 2015 10:26:37 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 02A7C407CA;
	Wed,  3 Jun 2015 17:26:34 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 21AFDA6A;
	Wed,  3 Jun 2015 16:08:55 +0300 (MSK)
Received: (nullmailer pid 27468 invoked by uid 1000);
	Wed, 03 Jun 2015 13:08:52 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed,  3 Jun 2015 16:08:47 +0300
Message-Id: <b6b099541d6cf3c50b0fb5af916fff0db6508805.1433336870.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1433336870.git.mjt@msgid.tls.msk.ru>
References: <cover.1433336870.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 27/30] translate-all: delete prototype for
	non-existent function
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
X-List-Received-Date: Wed, 03 Jun 2015 14:26:51 -0000

From: Paolo Bonzini <pbonzini@redhat.com>

Missed in commit 3a808cc40

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 translate-all.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/translate-all.h b/translate-all.h
index 02832b2..b6a07bd 100644
--- a/translate-all.h
+++ b/translate-all.h
@@ -21,7 +21,6 @@
 
 /* translate-all.c */
 void tb_invalidate_phys_page_fast(tb_page_addr_t start, int len);
-void cpu_unlink_tb(CPUState *cpu);
 void tb_check_watchpoint(CPUState *cpu);
 
 #endif /* TRANSLATE_ALL_H */
-- 
2.1.4


