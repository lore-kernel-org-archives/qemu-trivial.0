Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YZEJU-0005Nq-E9
	for mharc-qemu-trivial@gnu.org; Sat, 21 Mar 2015 03:59:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45259)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1YZCqd-0006hm-EK
	for qemu-trivial@nongnu.org; Sat, 21 Mar 2015 02:25:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1YZCqO-0002Hb-88
	for qemu-trivial@nongnu.org; Sat, 21 Mar 2015 02:25:27 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:47953)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1YZCqN-0002Gy-Uf
	for qemu-trivial@nongnu.org; Sat, 21 Mar 2015 02:25:12 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id C679620676
	for <qemu-trivial@nongnu.org>; Sat, 21 Mar 2015 02:25:07 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
	by compute1.internal (MEProxy); Sat, 21 Mar 2015 02:25:10 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=braap.org; h=
	x-sasl-enc:from:to:cc:subject:date:message-id; s=mesmtp; bh=2dmu
	rN5GA57M3GeK2x440QpZulY=; b=1CY2moviIm7qETmF5XW5WcylnJzQGJwjgZ8P
	D7JAD1SPDfafD3TYGVZrFea1ynxkeg2e+xC/xpOMpUdjVyy4fUjYN4CIrJiVyKlw
	k7frCbpTpgG1X0wQJUeJpCpKuoeTVp2/UPOuGeb3/V+l7ZrE1YNrLFz5F9z7eJMD
	Fos19AA=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=x-sasl-enc:from:to:cc:subject:date
	:message-id; s=smtpout; bh=2dmurN5GA57M3GeK2x440QpZulY=; b=K2Ahj
	RVkAZQuI/WqOocTB8vrAEjtOchEP7K3AsIq1fE6ICUr8Hvshifm9qqUezrrYdGoW
	bt2duZ10xkrYm6JYukLJycaFin8o4OEWD5y1+vss93sxcWrrTd8TR0EnocqvMpZj
	fQXbfyr/i0RLOEuPZRqs2YR7gv+1aCFZvkv15M=
X-Sasl-enc: wERkv7PfLcuSveWbyZt6F/tpiMn+AiTNfRuMr3xQ1ciZ 1426919109
Received: from localhost (unknown [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id CAB5D680156;
	Sat, 21 Mar 2015 02:25:09 -0400 (EDT)
From: "Emilio G. Cota" <cota@braap.org>
To: qemu-devel@nongnu.org
Date: Sat, 21 Mar 2015 02:25:12 -0400
Message-Id: <1426919112-20726-1-git-send-email-cota@braap.org>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 66.111.4.27
X-Mailman-Approved-At: Sat, 21 Mar 2015 03:59:18 -0400
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] translate-all: remove superfluous #ifdef FOO
	|| 1
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
X-List-Received-Date: Sat, 21 Mar 2015 06:25:32 -0000

It always evaluates to true.

Signed-off-by: Emilio G. Cota <cota@braap.org>
---
 translate-all.c | 4 ----
 1 file changed, 4 deletions(-)

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
1.9.1


