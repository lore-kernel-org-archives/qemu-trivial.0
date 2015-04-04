Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YeIED-0006Md-69
	for mharc-qemu-trivial@gnu.org; Sat, 04 Apr 2015 03:10:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53873)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YeIE7-0006EY-81
	for qemu-trivial@nongnu.org; Sat, 04 Apr 2015 03:10:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YeIE3-0006Tx-Gv
	for qemu-trivial@nongnu.org; Sat, 04 Apr 2015 03:10:43 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:40444)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YeIDu-0006Q3-Ne; Sat, 04 Apr 2015 03:10:30 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id B05A7405F6;
	Sat,  4 Apr 2015 10:10:28 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 9B204927;
	Sat,  4 Apr 2015 10:10:28 +0300 (MSK)
Received: (nullmailer pid 20944 invoked by uid 1000);
	Sat, 04 Apr 2015 07:10:28 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Sat,  4 Apr 2015 10:10:23 +0300
Message-Id: <9c04146ad4696b20c440bfbb4a6ab27ea254e7ca.1428131273.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1428131273.git.mjt@msgid.tls.msk.ru>
References: <cover.1428131273.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, "Emilio G. Cota" <cota@braap.org>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 2/5] target-i386: remove superfluous
	TARGET_HAS_SMC macro
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
X-List-Received-Date: Sat, 04 Apr 2015 07:10:47 -0000

From: "Emilio G. Cota" <cota@braap.org>

Signed-off-by: Emilio G. Cota <cota@braap.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 target-i386/cpu.h | 2 --
 translate-all.c   | 4 ----
 2 files changed, 6 deletions(-)

diff --git a/target-i386/cpu.h b/target-i386/cpu.h
index 15db6d7..4ee12ca 100644
--- a/target-i386/cpu.h
+++ b/target-i386/cpu.h
@@ -31,8 +31,6 @@
 /* Maximum instruction code size */
 #define TARGET_MAX_INSN_SIZE 16
 
-/* target supports implicit self modifying code */
-#define TARGET_HAS_SMC
 /* support for self modifying code even if the modified instruction is
    close to the modifying instruction */
 #define TARGET_HAS_PRECISE_SMC
diff --git a/translate-all.c b/translate-all.c
index 9f47ce7..11763c6 100644
--- a/translate-all.c
+++ b/translate-all.c
@@ -1334,8 +1334,6 @@ static inline void tb_alloc_page(TranslationBlock *tb,
     p->first_tb = (TranslationBlock *)((uintptr_t)tb | n);
     invalidate_page_bitmap(p);
 
-#if defined(TARGET_HAS_SMC) || 1
-
 #if defined(CONFIG_USER_ONLY)
     if (p->flags & PAGE_WRITE) {
         target_ulong addr;
@@ -1371,8 +1369,6 @@ static inline void tb_alloc_page(TranslationBlock *tb,
         tlb_protect_code(page_addr);
     }
 #endif
-
-#endif /* TARGET_HAS_SMC */
 }
 
 /* add a new TB and link it to the physical page tables. phys_page2 is
-- 
2.1.4


