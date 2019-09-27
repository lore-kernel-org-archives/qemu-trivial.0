Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iDpqL-0001ig-TE
	for mharc-qemu-trivial@gnu.org; Fri, 27 Sep 2019 08:59:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54732)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fziglio@redhat.com>) id 1iDpqI-0001c5-2N
 for qemu-trivial@nongnu.org; Fri, 27 Sep 2019 08:59:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <fziglio@redhat.com>) id 1iDpqG-0002pD-Qd
 for qemu-trivial@nongnu.org; Fri, 27 Sep 2019 08:59:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55024)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <fziglio@redhat.com>) id 1iDpqG-0002oX-Ku
 for qemu-trivial@nongnu.org; Fri, 27 Sep 2019 08:59:24 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 960317FDCA;
 Fri, 27 Sep 2019 10:32:53 +0000 (UTC)
Received: from fziglio.remote.csb (unknown [10.33.32.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6CFE360BF3;
 Fri, 27 Sep 2019 10:32:51 +0000 (UTC)
From: Frediano Ziglio <fziglio@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>,
	Laurent Vivier <laurent@vivier.eu>
Cc: qemu-trivial@nongnu.org,
	Frediano Ziglio <fziglio@redhat.com>
Subject: [PATCH 2/3] event_notifier: avoid dandling file descriptor in
 event_notifier_cleanup
Date: Fri, 27 Sep 2019 11:32:32 +0100
Message-Id: <20190927103233.20901-2-fziglio@redhat.com>
In-Reply-To: <20190927103233.20901-1-fziglio@redhat.com>
References: <20190927103233.20901-1-fziglio@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Fri, 27 Sep 2019 10:32:53 +0000 (UTC)
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
X-List-Received-Date: Fri, 27 Sep 2019 12:59:28 -0000

If rfd is equal to wfd the file descriptor is closed but
rfd will still have the closed value.
The EventNotifier structure should not be used again after calling
event_notifier_cleanup or should be initialized again but make
sure to not have dandling file descriptors around.

Signed-off-by: Frediano Ziglio <fziglio@redhat.com>
---
 util/event_notifier-posix.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/util/event_notifier-posix.c b/util/event_notifier-posix.c
index 73c4046b58..00d93204f9 100644
--- a/util/event_notifier-posix.c
+++ b/util/event_notifier-posix.c
@@ -80,8 +80,8 @@ void event_notifier_cleanup(EventNotifier *e)
 {
     if (e->rfd !=3D e->wfd) {
         close(e->rfd);
-        e->rfd =3D -1;
     }
+    e->rfd =3D -1;
     close(e->wfd);
     e->wfd =3D -1;
 }
--=20
2.21.0


