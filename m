Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UbyzG-0001qz-2D
	for mharc-qemu-trivial@gnu.org; Mon, 13 May 2013 16:04:46 -0400
Received: from eggs.gnu.org ([208.118.235.92]:35495)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <green@moxielogic.com>) id 1UbyzC-0001lO-Hd
	for qemu-trivial@nongnu.org; Mon, 13 May 2013 16:04:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <green@moxielogic.com>) id 1UbyzB-00011X-BS
	for qemu-trivial@nongnu.org; Mon, 13 May 2013 16:04:42 -0400
Received: from mail-gg0-x233.google.com ([2607:f8b0:4002:c02::233]:63673)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <green@moxielogic.com>) id 1UbyzB-00011K-7D
	for qemu-trivial@nongnu.org; Mon, 13 May 2013 16:04:41 -0400
Received: by mail-gg0-f179.google.com with SMTP id i2so1501001ggm.38
	for <qemu-trivial@nongnu.org>; Mon, 13 May 2013 13:04:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=jFdKfSqGELFeHmAoY9IICzGgwGfffLdvyAxYtAkyHmY=;
	b=i5LGVKuXsy8dSPRgj9LgsTv4A8+itAYR0cUn9EU/Uv50UM0yxJwXcHGkRaJrSVRLuV
	IBt9321BTONwiIfDsyHvl8su2nM7IBQOKEBLNxpIixYUB1nTNg/StxiNoTwFaVUqsGQa
	nxNIfUoTr7EcEQfZSrWTiYqtBlIRd4OKJP37rtH0v0ru3TQ2WhWpWCBDrxTlTv5o5Kac
	A/WTkMvtRH9RwXSrbr4JseZPQRvnkL85RF9gb+td3JME/BhsccyLHKlLLOivdTWhBk2/
	TcXpzO3QUmqOfGyWYPsXWhuyr5kUB7MTEgquwGG7zwA7G+LtINpwaLhXUimd6ByxQTe+
	bJCg==
X-Received: by 10.236.201.70 with SMTP id a46mr16379725yho.75.1368475480384;
	Mon, 13 May 2013 13:04:40 -0700 (PDT)
Received: from dev.moxielogic.com ([66.187.233.208])
	by mx.google.com with ESMTPSA id
	s20sm16939806yhh.17.2013.05.13.13.04.37 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 13 May 2013 13:04:39 -0700 (PDT)
Received: by dev.moxielogic.com (sSMTP sendmail emulation);
	Mon, 13 May 2013 16:04:34 -0400
From: Anthony Green <green@moxielogic.com>
To: qemu-devel@nongnu.org
Date: Mon, 13 May 2013 16:04:24 -0400
Message-Id: <1368475464-3116-1-git-send-email-green@moxielogic.com>
X-Mailer: git-send-email 1.8.1.4
X-Gm-Message-State: ALoCoQmgsEbfM7jpsHmMd8L0nUA2pSkKp45PgkfAS3M39Hzq/NFSbPpJmeXK+PjpAB1kkND3iae1
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4002:c02::233
Cc: qemu-trivial@nongnu.org, Anthony Green <green@moxielogic.com>
Subject: [Qemu-trivial] [PATCH moxie] Fix bug in tlb_fill.
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
X-List-Received-Date: Mon, 13 May 2013 20:04:44 -0000

Fix a simple bug in tlb_fill for moxie.  The port was mostly working
before, which is why I only really noticed it recently.  Thanks to
@jcmvbkbc for tracking it down.

Signed-off-by: Anthony Green <green@moxielogic.com>
---
 target-moxie/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target-moxie/helper.c b/target-moxie/helper.c
index 6e0ac2a..6c36c49 100644
--- a/target-moxie/helper.c
+++ b/target-moxie/helper.c
@@ -55,8 +55,8 @@ void tlb_fill(CPUMoxieState *env, target_ulong addr, int is_write, int mmu_idx,
         if (retaddr) {
             cpu_restore_state(env, retaddr);
         }
+	cpu_loop_exit(env);
     }
-    cpu_loop_exit(env);
 }
 
 void helper_raise_exception(CPUMoxieState *env, int ex)
-- 
1.8.1.4


