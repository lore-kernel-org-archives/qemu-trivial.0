Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VI2ad-0007Wl-V4
	for mharc-qemu-trivial@gnu.org; Fri, 06 Sep 2013 16:25:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51987)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1VI2aV-0007Hl-NF
	for qemu-trivial@nongnu.org; Fri, 06 Sep 2013 16:25:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1VI2aP-0001xT-LL
	for qemu-trivial@nongnu.org; Fri, 06 Sep 2013 16:25:03 -0400
Received: from mail-qe0-x234.google.com ([2607:f8b0:400d:c02::234]:43454)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1VI2aD-0001ue-Hp; Fri, 06 Sep 2013 16:24:45 -0400
Received: by mail-qe0-f52.google.com with SMTP id i11so1971936qej.39
	for <multiple recipients>; Fri, 06 Sep 2013 13:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=yUfNFmLx1VKkEt4qEkadZNbntJ+OBjoWxFs5rUpf9ts=;
	b=KgbR99P8n9XwGxHkY0OEAy2GABDZ0kA4kichKzdmDfdX22Doe/nbT59AZZBVN65w1M
	s10NmgoaO0et+pxllRV53jq0n09oxijnZFAw6Y+lcuNjPYcR6WQNUgqcqMTEDdE4aW3D
	+qDnAvdNWqIlX/TezNxboj1Zeu0QuDhfP5wbWVy4qqk/mfthjm73s+A3rWE04iug7lKN
	I9Rxi9gbIut0ppTE1UGNavYvMh1Z0iIBosGWi79XQQS4GmLq2fLuCucfzHBudpyO1Fkk
	W/SiJm8L31NbipkwgdOdCVQnHSTiuZcEZyFjU8CNC8FP12sETx45HmVNKFzBrKFcluU/
	tluA==
X-Received: by 10.224.97.3 with SMTP id j3mr4628633qan.87.1378499084988;
	Fri, 06 Sep 2013 13:24:44 -0700 (PDT)
Received: from anchor.com (50-194-63-110-static.hfc.comcastbusiness.net.
	[50.194.63.110])
	by mx.google.com with ESMTPSA id g3sm7306964qas.6.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 06 Sep 2013 13:24:44 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
From: Richard Henderson <rth@twiddle.net>
To: qemu-devel@nongnu.org
Date: Fri,  6 Sep 2013 13:24:11 -0700
Message-Id: <1378499051-25832-1-git-send-email-rth@twiddle.net>
X-Mailer: git-send-email 1.8.1.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c02::234
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] tcg-sparc: Fix parenthesis warning
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
X-List-Received-Date: Fri, 06 Sep 2013 20:25:09 -0000

error: suggest parentheses around comparison in operand of ‘&’ [-Werror=parentheses]

Signed-off-by: Richard Henderson <rth@twiddle.net>
---
 tcg/sparc/tcg-target.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tcg/sparc/tcg-target.h b/tcg/sparc/tcg-target.h
index 2edf858..1ff2922 100644
--- a/tcg/sparc/tcg-target.h
+++ b/tcg/sparc/tcg-target.h
@@ -153,7 +153,7 @@ typedef enum {
 static inline void flush_icache_range(uintptr_t start, uintptr_t stop)
 {
     uintptr_t p;
-    for (p = start & -8; p < (stop + 7) & -8; p += 8) {
+    for (p = start & -8; p < ((stop + 7) & -8); p += 8) {
         __asm__ __volatile__("flush\t%0" : : "r" (p));
     }
 }
-- 
1.8.1.4


