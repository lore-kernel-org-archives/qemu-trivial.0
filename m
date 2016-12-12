Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cGYvL-00056x-1F
	for mharc-qemu-trivial@gnu.org; Mon, 12 Dec 2016 17:18:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37234)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1cGYvH-00054R-So
	for qemu-trivial@nongnu.org; Mon, 12 Dec 2016 17:18:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1cGYvH-0002i4-5t
	for qemu-trivial@nongnu.org; Mon, 12 Dec 2016 17:18:15 -0500
Received: from mx1.redhat.com ([209.132.183.28]:42522)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
	id 1cGYvC-0002fe-Tr; Mon, 12 Dec 2016 17:18:11 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E9447C04B944;
	Mon, 12 Dec 2016 22:18:09 +0000 (UTC)
Received: from localhost (ovpn-116-54.ams2.redhat.com [10.36.116.54])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uBCMI7kU031452; Mon, 12 Dec 2016 17:18:08 -0500
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Date: Tue, 13 Dec 2016 01:17:59 +0300
Message-Id: <20161212221759.28949-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Mon, 12 Dec 2016 22:18:10 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] trace-events: spelling fix
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
X-List-Received-Date: Mon, 12 Dec 2016 22:18:17 -0000

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 trace-events | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/trace-events b/trace-events
index f74e1d3d22..da5bbb3a3a 100644
--- a/trace-events
+++ b/trace-events
@@ -47,7 +47,7 @@ qemu_system_shutdown_request(void) ""
 qemu_system_powerdown_request(void) ""
=20
 # spice-qemu-char.c
-spice_vmc_write(ssize_t out, int len) "spice wrottn %zd of requested %d"
+spice_vmc_write(ssize_t out, int len) "spice wrote %zd of requested %d"
 spice_vmc_read(int bytes, int len) "spice read %d of requested %d"
 spice_vmc_register_interface(void *scd) "spice vmc registered interface =
%p"
 spice_vmc_unregister_interface(void *scd) "spice vmc unregistered interf=
ace %p"
--=20
2.11.0


