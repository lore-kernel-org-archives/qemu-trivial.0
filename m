Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YZEJV-0005P1-IX
	for mharc-qemu-trivial@gnu.org; Sat, 21 Mar 2015 03:59:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45994)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1YZCsS-0000nq-KY
	for qemu-trivial@nongnu.org; Sat, 21 Mar 2015 02:27:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1YZCsI-0002w7-Jv
	for qemu-trivial@nongnu.org; Sat, 21 Mar 2015 02:27:20 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:50845)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1YZCsI-0002w0-GO
	for qemu-trivial@nongnu.org; Sat, 21 Mar 2015 02:27:10 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 03B1E20710
	for <qemu-trivial@nongnu.org>; Sat, 21 Mar 2015 02:27:07 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
	by compute6.internal (MEProxy); Sat, 21 Mar 2015 02:27:10 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=braap.org; h=
	x-sasl-enc:from:to:cc:subject:date:message-id; s=mesmtp; bh=NqOh
	rQ1VlLq7K/q0ggoB1BCQFhI=; b=BuPBx39KOt7hJ/sNRE5lF04rzKMCMqWf90EC
	Ozm56ARgn4tdGtuisVvDQ3/vbYl2hw9TvpWMYC1vVKaig9pTUTkKFXGZHkAjXZUJ
	BTMLM1QQ92v2NbvMj/iHbu/P/bYfnmIwnKwCIxS84Lb4JtI03zdKJ3kP/DIWNKs/
	ZHzezUE=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=x-sasl-enc:from:to:cc:subject:date
	:message-id; s=smtpout; bh=NqOhrQ1VlLq7K/q0ggoB1BCQFhI=; b=rwTG6
	yxN6JKhGvB5N5rVbN1udKCJ1EdH5oJTwdLPCG33v9Ar/vArL/+J0btYw44UyEDNA
	drNyAIRkE6GWJPHFI92SldaNvVp1v9kEAN98q60x629dKmoZOV+PIt5Ge1rrDlBy
	yCBsTeoKfrzTPPQUt+h+yXvHVYb/4KaEbfmtDo=
X-Sasl-enc: uU9iHdGKAcKpqghRgYZVKulnB+FVqQomzCuBxbR+3PHu 1426919230
Received: from localhost (unknown [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 15C45680156;
	Sat, 21 Mar 2015 02:27:10 -0400 (EDT)
From: "Emilio G. Cota" <cota@braap.org>
To: qemu-devel@nongnu.org
Date: Sat, 21 Mar 2015 02:27:12 -0400
Message-Id: <1426919232-20813-1-git-send-email-cota@braap.org>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 66.111.4.27
X-Mailman-Approved-At: Sat, 21 Mar 2015 03:59:20 -0400
Cc: qemu-trivial@nongnu.org, Richard Henderson <rth@twiddle.net>
Subject: [Qemu-trivial] [PATCH] tcg: pack TCGTemp to reduce size by 8 bytes
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
X-List-Received-Date: Sat, 21 Mar 2015 06:27:23 -0000

This brings down the size of the struct from 56 to 48 bytes.

Signed-off-by: Emilio G. Cota <cota@braap.org>
---
 tcg/tcg.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tcg/tcg.h b/tcg/tcg.h
index add7f75..3276924 100644
--- a/tcg/tcg.h
+++ b/tcg/tcg.h
@@ -429,8 +429,8 @@ typedef struct TCGTemp {
     int val_type;
     int reg;
     tcg_target_long val;
-    int mem_reg;
     intptr_t mem_offset;
+    int mem_reg;
     unsigned int fixed_reg:1;
     unsigned int mem_coherent:1;
     unsigned int mem_allocated:1;
-- 
1.9.1


