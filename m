Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gaL3b-0002Gl-MY
	for mharc-qemu-trivial@gnu.org; Fri, 21 Dec 2018 08:41:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33183)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1gaL3X-0002FG-I6
	for qemu-trivial@nongnu.org; Fri, 21 Dec 2018 08:41:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1gaL3W-0000VI-UO
	for qemu-trivial@nongnu.org; Fri, 21 Dec 2018 08:41:35 -0500
Received: from mx1.redhat.com ([209.132.183.28]:50814)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1gaL3Q-0000O5-Vv; Fri, 21 Dec 2018 08:41:29 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 084F2811C0;
	Fri, 21 Dec 2018 13:41:26 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-61.ams2.redhat.com
	[10.36.112.61])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5A2335D737;
	Fri, 21 Dec 2018 13:41:23 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-stable@nongnu.org,
	qemu-trivial@nongnu.org,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Date: Fri, 21 Dec 2018 13:41:15 +0000
Message-Id: <20181221134115.27973-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Fri, 21 Dec 2018 13:41:26 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] hw/usb: fix mistaken de-initialization of
 CCID state
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
X-List-Received-Date: Fri, 21 Dec 2018 13:41:38 -0000

In previous commit:

  commit 7dea29e4af17fc1d27478de9f8ea38144deac54a
  Author: Li Qiang <liq3ea@gmail.com>
  Date:   Fri Oct 19 03:50:36 2018 -0700

    hw: ccid-card-emulated: cleanup resource when realize in error path

The emulated_realize method was changed so that it jumps to a cleanup
label to de-initialize state upon error. This change failed to ensure
the success path exited the method before this point though. So the
mutexes are always destroyed even in normal operation. The result is
as crashtastic as expected:

$ qemu-system-x86_64 -usb -device usb-ccid,id=3Dccid0 -device ccid-card-e=
mulated,backend=3Dnss-emulated,id=3Dsmartcard0,bus=3Dccid0.0
qemu-system-x86_64: util/qemu-thread-posix.c:64: qemu_mutex_lock_impl: As=
sertion `mutex->initialized' failed.
Aborted (core dumped)

Reported-by: Michael Tokarev <mjt@tls.msk.ru>
Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
---
 hw/usb/ccid-card-emulated.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/usb/ccid-card-emulated.c b/hw/usb/ccid-card-emulated.c
index 25976ed84f..e0457d305b 100644
--- a/hw/usb/ccid-card-emulated.c
+++ b/hw/usb/ccid-card-emulated.c
@@ -549,6 +549,8 @@ static void emulated_realize(CCIDCardState *base, Err=
or **errp)
     qemu_thread_create(&card->apdu_thread_id, "ccid/apdu", handle_apdu_t=
hread,
                        card, QEMU_THREAD_JOINABLE);
=20
+    return;
+
 out2:
     clean_event_notifier(card);
 out1:
--=20
2.19.2


