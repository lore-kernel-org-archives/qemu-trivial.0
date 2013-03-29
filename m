Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ULXxo-0004kr-27
	for mharc-qemu-trivial@gnu.org; Fri, 29 Mar 2013 07:59:20 -0400
Received: from eggs.gnu.org ([208.118.235.92]:42463)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.aring@gmail.com>) id 1ULXxj-0004jn-0W
	for qemu-trivial@nongnu.org; Fri, 29 Mar 2013 07:59:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.aring@gmail.com>) id 1ULXxc-0002Z5-FU
	for qemu-trivial@nongnu.org; Fri, 29 Mar 2013 07:59:14 -0400
Received: from mail-ee0-f43.google.com ([74.125.83.43]:37810)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.aring@gmail.com>) id 1ULXxc-0002Yz-6U
	for qemu-trivial@nongnu.org; Fri, 29 Mar 2013 07:59:08 -0400
Received: by mail-ee0-f43.google.com with SMTP id e50so197078eek.16
	for <qemu-trivial@nongnu.org>; Fri, 29 Mar 2013 04:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=TjofXBjiM9rVLtq9jyQzd9s3aukKdx4qQBSWIUhdmc0=;
	b=g0YhH8v01E80d9+ZhZatrQIl9HjCkAd8DSleyOs1NLPwPeI8GPc8SmU4hnpCZqSA1Y
	yMdJxDqddw5VyVNBpiAHXKMWb3z3tWvu+U7QMpk8iiS4+8fyucnhRwwhnMi0Cmj85VjX
	3TAHqrubv6JI4PgRr4tHTrjfrRxVjKGIF29GgOLh9KGI7iEC2BGihjCV6gtP4lo471ou
	3vpNoWbKrIjF2YxvvpWQsJ4bi/yz/y1mpglKtW9M90UYC8hWwCxHkJ6Y2YABFobZuLqY
	s/c7zIA/IrDtOR/xax6wM9sfEqVMBpW3ImsAfPOcF3aMrgieEVww//ui70hk/5tdobdQ
	0yZg==
X-Received: by 10.14.5.137 with SMTP id 9mr7095062eel.30.1364558346856;
	Fri, 29 Mar 2013 04:59:06 -0700 (PDT)
Received: from x61s.8.8.8.8 (p4FD35555.dip.t-dialin.net. [79.211.85.85])
	by mx.google.com with ESMTPS id a1sm3679998eep.2.2013.03.29.04.59.05
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 29 Mar 2013 04:59:06 -0700 (PDT)
From: Alexander Aring <alex.aring@gmail.com>
To: qemu-trivial@nongnu.org
Date: Fri, 29 Mar 2013 13:00:42 +0100
Message-Id: <1364558442-11392-1-git-send-email-alex.aring@gmail.com>
X-Mailer: git-send-email 1.8.2
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 74.125.83.43
Cc: Alexander Aring <alex.aring@gmail.com>
Subject: [Qemu-trivial] [PATCH] softfloat: fix mask in extractFloat32Exp
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
X-List-Received-Date: Fri, 29 Mar 2013 11:59:18 -0000

This will fix the mask of extractFloat32Exp from 0xFF to 0x7F.
On bit 0x80 is the sign bit of IEEE 754.

Signed-off-by: Alexander Aring <alex.aring@gmail.com>
---
 fpu/softfloat.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 83ccc4b..4e8ed79 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -221,7 +221,7 @@ INLINE uint32_t extractFloat32Frac( float32 a )
 INLINE int_fast16_t extractFloat32Exp(float32 a)
 {
 
-    return ( float32_val(a)>>23 ) & 0xFF;
+    return ( float32_val(a)>>23 ) & 0x7F;
 
 }
 
-- 
1.8.2


