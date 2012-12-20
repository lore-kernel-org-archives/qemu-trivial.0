Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TlV6h-0006TQ-WC
	for mharc-qemu-trivial@gnu.org; Wed, 19 Dec 2012 20:39:31 -0500
Received: from eggs.gnu.org ([208.118.235.92]:43893)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1TlV6d-0006RA-LL
	for qemu-trivial@nongnu.org; Wed, 19 Dec 2012 20:39:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1TlV6a-0007hs-Or
	for qemu-trivial@nongnu.org; Wed, 19 Dec 2012 20:39:27 -0500
Received: from csmailer.cs.nctu.edu.tw ([140.113.235.130]:29544)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1TlV6Z-0007dB-JJ
	for qemu-trivial@nongnu.org; Wed, 19 Dec 2012 20:39:24 -0500
Received: from csmailer.cs.nctu.edu.tw (localhost [127.0.0.1])
	by csmailer.cs.nctu.edu.tw (Postfix) with ESMTP id 56F4245A;
	Thu, 20 Dec 2012 09:39:19 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=cs.nctu.edu.tw; h=date
	:from:to:cc:subject:message-id:mime-version:content-type; s=
	rsa1024; bh=qmBMFJMpl8PvPV5EAFyHsGoVAxc=; b=A+H6Hby1JxpLHGMmKIvy
	ER5xYey9iAB816vpLVYnAl9msPgrpyA+KtYb3i6/LaTWxC4URXQyAzP5M2jvgzlg
	yke8F/EQ05OpXqRpEUJeeWi0/k+CAy4R2TQdJ98CPb2VCK3SIAalrG7ym0DkQPrg
	PF9IJNuGKKwgwTpyEffyUQo=
Received: from alumni.cs.nctu.edu.tw (alumni.cs.nctu.edu.tw [140.113.235.116])
	by csmailer.cs.nctu.edu.tw (Postfix) with ESMTP id 2B5F1459;
	Thu, 20 Dec 2012 09:39:19 +0800 (CST)
Received: (from chenwj@localhost)
	by alumni.cs.nctu.edu.tw (8.14.5/8.14.5/Submit) id qBK1dGLt010591;
	Thu, 20 Dec 2012 09:39:16 +0800 (CST) (envelope-from chenwj)
Date: Thu, 20 Dec 2012 09:39:16 +0800
From: =?utf-8?B?6Zmz6Z+L5Lu7IChXZWktUmVuIENoZW4p?= <chenwj@iis.sinica.edu.tw>
To: qemu-trivial@nongnu.org
Message-ID: <20121220013916.GA10560@cs.nctu.edu.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: FreeBSD 8.x
X-Received-From: 140.113.235.130
Cc: Evgeny Voevodin <e.voevodin@samsung.com>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [Qemu-trivial] [PATCH v3] translate-all.c: Use tb1->phys_hash_next
 directly in tb_remove
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
X-List-Received-Date: Thu, 20 Dec 2012 01:39:30 -0000

  When tb_remove was first commited at fd6ce8f6, there were three different
calls pass different names to offsetof. In current codebase, the other two
calls are replaced with tb_page_remove. There is no need to have a general
tb_remove. Omit passing the third parameter and using tb1->phys_hash_next
directly.

Signed-off-by: Chen Wei-Ren <chenwj@iis.sinica.edu.tw>
---
v3: Rebasing

v2: Address Peter's comment.
    - place comment used belong tb_remove above tb_phys_invalidate.
    - remove unnecessary bracket.

 translate-all.c |   12 +++++-------
 1 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/translate-all.c b/translate-all.c
index b621748..d367fc4 100644
--- a/translate-all.c
+++ b/translate-all.c
@@ -759,19 +759,17 @@ static void tb_page_check(void)
 
 #endif
 
-/* invalidate one TB */
-static inline void tb_remove(TranslationBlock **ptb, TranslationBlock *tb,
-                             int next_offset)
+static inline void tb_hash_remove(TranslationBlock **ptb, TranslationBlock *tb)
 {
     TranslationBlock *tb1;
 
     for (;;) {
         tb1 = *ptb;
         if (tb1 == tb) {
-            *ptb = *(TranslationBlock **)((char *)tb1 + next_offset);
+            *ptb = tb1->phys_hash_next;
             break;
         }
-        ptb = (TranslationBlock **)((char *)tb1 + next_offset);
+        ptb = &tb1->phys_hash_next;
     }
 }
 
@@ -828,6 +826,7 @@ static inline void tb_reset_jump(TranslationBlock *tb, int n)
     tb_set_jmp_target(tb, n, (uintptr_t)(tb->tc_ptr + tb->tb_next_offset[n]));
 }
 
+/* invalidate one TB */
 void tb_phys_invalidate(TranslationBlock *tb, tb_page_addr_t page_addr)
 {
     CPUArchState *env;
@@ -839,8 +838,7 @@ void tb_phys_invalidate(TranslationBlock *tb, tb_page_addr_t page_addr)
     /* remove the TB from the hash list */
     phys_pc = tb->page_addr[0] + (tb->pc & ~TARGET_PAGE_MASK);
     h = tb_phys_hash_func(phys_pc);
-    tb_remove(&tb_phys_hash[h], tb,
-              offsetof(TranslationBlock, phys_hash_next));
+    tb_hash_remove(&tb_phys_hash[h], tb);
 
     /* remove the TB from the page list */
     if (tb->page_addr[0] != page_addr) {
-- 
1.7.3.4

