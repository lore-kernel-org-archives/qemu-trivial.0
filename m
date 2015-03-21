Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YZNCy-0003J8-Uy
	for mharc-qemu-trivial@gnu.org; Sat, 21 Mar 2015 13:29:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33022)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1YZNCw-0003I2-8T
	for qemu-trivial@nongnu.org; Sat, 21 Mar 2015 13:29:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1YZNCt-0005U8-36
	for qemu-trivial@nongnu.org; Sat, 21 Mar 2015 13:29:10 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:40479)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1YZNCs-0005Ty-Pb
	for qemu-trivial@nongnu.org; Sat, 21 Mar 2015 13:29:07 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 1B91F209A7
	for <qemu-trivial@nongnu.org>; Sat, 21 Mar 2015 13:29:04 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
	by compute3.internal (MEProxy); Sat, 21 Mar 2015 13:29:06 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=braap.org; h=
	x-sasl-enc:from:to:cc:subject:date:message-id:in-reply-to
	:references; s=mesmtp; bh=G43Ndm+NpkJS7kdqeWi9EKH8/t4=; b=x14QHp
	elKK/dxbD9dpjNRmwE5UzdyagzORknXgOjXVqLX6dDcEYjhG2HAuSkL/eqFDaZcT
	pJyErVdAJjXlTiR1Lo9AZ/L34NqBXGUa4K5p2WShlKfTlt8wAGPHArKeSRnD0EyO
	91XXUgJnbEfBYRAbYFiUP0b0+UJyPuAebzLtE=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=x-sasl-enc:from:to:cc:subject:date
	:message-id:in-reply-to:references; s=smtpout; bh=G43Ndm+NpkJS7k
	dqeWi9EKH8/t4=; b=WhxeexLe+WX270anLmaMwcK+eBh6uF0Tkq3AcN3DH1k5ym
	j/DMNwRCNnQmBhLGZVoi23e4oIPcVW24dBn1+Oz+XHIlUVZ0sWe+yrkjRNOE2/9o
	H9+TFezpDwGpH58Hu713UzTWFfGprVThvLLTPPc0dlwspORPU4HKXZjz3RX+U=
X-Sasl-enc: vFqj9Kerdfnd3BPggYG+s5b96kQa9Iyjd+Gbrop22Xvc 1426958946
Received: from localhost (unknown [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 3A72F68012C;
	Sat, 21 Mar 2015 13:29:06 -0400 (EDT)
From: "Emilio G. Cota" <cota@braap.org>
To: qemu-devel@nongnu.org
Date: Sat, 21 Mar 2015 13:29:09 -0400
Message-Id: <1426958949-2729-1-git-send-email-cota@braap.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <550D8014.2020000@redhat.com>
References: <550D8014.2020000@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 66.111.4.27
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: [Qemu-trivial] [PATCH] target-i386: remove superfluous
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
X-List-Received-Date: Sat, 21 Mar 2015 17:29:11 -0000

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Emilio G. Cota <cota@braap.org>
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
1.9.1


