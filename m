Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RLAqS-00040U-Ju
	for mharc-qemu-trivial@gnu.org; Tue, 01 Nov 2011 05:41:24 -0400
Received: from eggs.gnu.org ([140.186.70.92]:45603)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ericsunshine@gmail.com>) id 1RLAqN-0003fG-1N
	for qemu-trivial@nongnu.org; Tue, 01 Nov 2011 05:41:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ericsunshine@gmail.com>) id 1RLAqM-0003B2-7g
	for qemu-trivial@nongnu.org; Tue, 01 Nov 2011 05:41:19 -0400
Received: from mail-vx0-f173.google.com ([209.85.220.173]:62177)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ericsunshine@gmail.com>)
	id 1RLAqC-00039S-6e; Tue, 01 Nov 2011 05:41:08 -0400
Received: by vcbfl10 with SMTP id fl10so1591984vcb.4
	for <multiple recipients>; Tue, 01 Nov 2011 02:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=vDr/dis+Twk1DcDov2xGJy5AiA3nuMQiG88EgcZE8G0=;
	b=HR/er1iL7y4RPCUhFm/eaTNzd2VEw/dtvVayTauM+q7FbdU3YAOB6uZB9PvAeCTLTA
	pbtm9mvm8Gi3xkQGGFUQwl+7T+uHyw29h4y5WDFvct2hwJFFTwx7nrQo/dL2cPsR3vJ5
	A4YCUV6cAYV8t5w5szClZVQeHotnUjUkJA3j4=
Received: by 10.220.162.11 with SMTP id t11mr2809280vcx.81.1320140467562;
	Tue, 01 Nov 2011 02:41:07 -0700 (PDT)
Received: from localhost.localdomain (user-0c936tj.cable.mindspring.com.
	[24.145.155.179])
	by mx.google.com with ESMTPS id el1sm13909398vdc.13.2011.11.01.02.41.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 01 Nov 2011 02:41:07 -0700 (PDT)
Sender: Eric Sunshine <ericsunshine@gmail.com>
From: Eric Sunshine <sunshine@sunshineco.com>
To: qemu-devel@nongnu.org
Date: Tue,  1 Nov 2011 05:39:49 -0400
Message-Id: <1320140389-22079-1-git-send-email-sunshine@sunshineco.com>
X-Mailer: git-send-email 1.7.7.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.220.173
Cc: qemu-trivial@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Subject: [Qemu-trivial] [PATCH] qemu-barrier: Fix build failure on PowerPC
	Mac OS X
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
X-List-Received-Date: Tue, 01 Nov 2011 09:41:23 -0000

qemu-barrier.h tests if macro __powerpc__ is defined, however, the
preprocessor on PowerPC Mac OS X defines only __POWERPC__, not
__powerpc__.  Resolve by testing instead for qemu-provided _ARCH_PPC.

Signed-off-by: Eric Sunshine <sunshine@sunshineco.com>
---

The anomalous __powerpc__ test appears only in qemu-barrier.h.
No other source files reference this name.

Cc: David Gibson <david@gibson.dropbear.id.au>

 qemu-barrier.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/qemu-barrier.h b/qemu-barrier.h
index 735eea6..c11bb2b 100644
--- a/qemu-barrier.h
+++ b/qemu-barrier.h
@@ -14,7 +14,7 @@
  */
 #define smp_wmb()   barrier()
 
-#elif defined(__powerpc__)
+#elif defined(_ARCH_PPC)
 
 /*
  * We use an eieio() for a wmb() on powerpc.  This assumes we don't
-- 
1.7.7.1


