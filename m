Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bDDTZ-0005rs-0D
	for mharc-qemu-trivial@gnu.org; Wed, 15 Jun 2016 12:15:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33617)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1bDDTU-0005mH-5f
	for qemu-trivial@nongnu.org; Wed, 15 Jun 2016 12:15:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1bDDTP-0003p5-6Y
	for qemu-trivial@nongnu.org; Wed, 15 Jun 2016 12:15:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:63159)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>)
	id 1bDDTE-0003mf-Fl; Wed, 15 Jun 2016 12:15:12 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EE9B580F6B;
	Wed, 15 Jun 2016 16:15:11 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-112-40.ams2.redhat.com [10.36.112.40])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5FGElUp011275; Wed, 15 Jun 2016 12:15:09 -0400
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
	Alexander Graf <agraf@suse.de>
Date: Wed, 15 Jun 2016 18:14:32 +0200
Message-Id: <1466007277-17525-3-git-send-email-lvivier@redhat.com>
In-Reply-To: <1466007277-17525-1-git-send-email-lvivier@redhat.com>
References: <1466007277-17525-1-git-send-email-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Wed, 15 Jun 2016 16:15:12 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 2/7] linux-user,s390x: remove useless cast
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
X-List-Received-Date: Wed, 15 Jun 2016 16:15:32 -0000

This patch is the result of coccinelle script
scripts/coccinelle/typecast.cocci

CC: Riku Voipio <riku.voipio@iki.fi>
CC: Alexander Graf <agraf@suse.de>
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 linux-user/signal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/signal.c b/linux-user/signal.c
index 61c1145..df3d584 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -4232,7 +4232,7 @@ static void setup_frame(int sig, struct target_sigaction *ka,
     env->regs[5] = 0; // FIXME: no clue... current->thread.prot_addr;
 
     /* Place signal number on stack to allow backtrace from handler.  */
-    __put_user(env->regs[2], (int *) &frame->signo);
+    __put_user(env->regs[2], &frame->signo);
     unlock_user_struct(frame, frame_addr, 1);
     return;
 
-- 
2.5.5


