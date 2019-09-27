Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iDqRI-0001C3-74
	for mharc-qemu-trivial@gnu.org; Fri, 27 Sep 2019 09:37:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37650)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fziglio@redhat.com>) id 1iDqRC-00014w-D6
 for qemu-trivial@nongnu.org; Fri, 27 Sep 2019 09:37:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <fziglio@redhat.com>) id 1iDqR6-0002wO-E1
 for qemu-trivial@nongnu.org; Fri, 27 Sep 2019 09:37:34 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34162)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <fziglio@redhat.com>) id 1iDqR6-0002vw-7S
 for qemu-trivial@nongnu.org; Fri, 27 Sep 2019 09:37:28 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A26C53082A8D;
 Fri, 27 Sep 2019 10:32:51 +0000 (UTC)
Received: from fziglio.remote.csb (unknown [10.33.32.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B0C2660BE2;
 Fri, 27 Sep 2019 10:32:49 +0000 (UTC)
From: Frediano Ziglio <fziglio@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>,
	Laurent Vivier <laurent@vivier.eu>
Cc: qemu-trivial@nongnu.org,
	Frediano Ziglio <fziglio@redhat.com>
Subject: [PATCH 1/3] util/async: avoid useless cast
Date: Fri, 27 Sep 2019 11:32:31 +0100
Message-Id: <20190927103233.20901-1-fziglio@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Fri, 27 Sep 2019 10:32:51 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Sep 2019 13:37:38 -0000

event_notifier_dummy_cb is already compatible with EventNotifierHandler.

Signed-off-by: Frediano Ziglio <fziglio@redhat.com>
---
 util/async.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/util/async.c b/util/async.c
index 4e4c7af51e..3cdbf44503 100644
--- a/util/async.c
+++ b/util/async.c
@@ -425,7 +425,6 @@ AioContext *aio_context_new(Error **errp)
=20
     aio_set_event_notifier(ctx, &ctx->notifier,
                            false,
-                           (EventNotifierHandler *)
                            event_notifier_dummy_cb,
                            event_notifier_poll);
 #ifdef CONFIG_LINUX_AIO
--=20
2.21.0


