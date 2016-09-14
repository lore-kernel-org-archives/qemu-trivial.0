Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bk5ea-0008U3-Sg
	for mharc-qemu-trivial@gnu.org; Wed, 14 Sep 2016 04:34:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40439)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bk5eX-0008OW-35
	for qemu-trivial@nongnu.org; Wed, 14 Sep 2016 04:34:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bk5eV-0006uu-6f
	for qemu-trivial@nongnu.org; Wed, 14 Sep 2016 04:34:44 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:39250)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bk5eS-0006ss-N7; Wed, 14 Sep 2016 04:34:40 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id CBDDD4184F;
	Wed, 14 Sep 2016 11:34:32 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 2732CB0E;
	Wed, 14 Sep 2016 10:59:00 +0300 (MSK)
Received: (nullmailer pid 17352 invoked by uid 1000);
	Wed, 14 Sep 2016 07:58:57 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, qemu-trivial@nongnu.org,
	Riku Voipio <riku.voipio@iki.fi>, Alexander Graf <agraf@suse.de>,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Wed, 14 Sep 2016 10:58:46 +0300
Message-Id: <18ffb8dd5b9a9a0c0026eb595eb1ff71d1b4a413.1473839869.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
References: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
References: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 20/27] linux-user,s390x: remove useless cast
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Sep 2016 08:34:48 -0000

From: Laurent Vivier <lvivier@redhat.com>

This patch is the result of coccinelle script
scripts/coccinelle/typecast.cocci

CC: Riku Voipio <riku.voipio@iki.fi>
CC: Alexander Graf <agraf@suse.de>
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 linux-user/signal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/signal.c b/linux-user/signal.c
index 9a4d894..d3ac0e2 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -4244,7 +4244,7 @@ static void setup_frame(int sig, struct target_sigaction *ka,
     env->regs[5] = 0; // FIXME: no clue... current->thread.prot_addr;
 
     /* Place signal number on stack to allow backtrace from handler.  */
-    __put_user(env->regs[2], (int *) &frame->signo);
+    __put_user(env->regs[2], &frame->signo);
     unlock_user_struct(frame, frame_addr, 1);
     return;
 
-- 
2.1.4


