Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dX7iW-0002hT-B0
	for mharc-qemu-trivial@gnu.org; Mon, 17 Jul 2017 11:13:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44530)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dX7iU-0002e8-0h
	for qemu-trivial@nongnu.org; Mon, 17 Jul 2017 11:13:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dX7iT-0004qe-0G
	for qemu-trivial@nongnu.org; Mon, 17 Jul 2017 11:13:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33460)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1dX7iO-0004mM-Co; Mon, 17 Jul 2017 11:13:40 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 608C87CB96;
	Mon, 17 Jul 2017 15:13:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 608C87CB96
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 608C87CB96
Received: from red.redhat.com (ovpn-120-160.rdu2.redhat.com [10.10.120.160])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B89705C54A;
	Mon, 17 Jul 2017 15:13:36 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: dgilbert@redhat.com,
	kraxel@redhat.com,
	qemu-trivial@nongnu.org
Date: Mon, 17 Jul 2017 10:13:34 -0500
Message-Id: <20170717151334.17954-1-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Mon, 17 Jul 2017 15:13:39 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] usb: Fix build with newer gcc
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
X-List-Received-Date: Mon, 17 Jul 2017 15:13:47 -0000

gcc 7 is pickier about our sources:

hw/usb/bus.c: In function =E2=80=98usb_port_location=E2=80=99:
hw/usb/bus.c:410:66: error: =E2=80=98%d=E2=80=99 directive output may be =
truncated writing between 1 and 11 bytes into a region of size between 0 =
and 15 [-Werror=3Dformat-truncation=3D]
         snprintf(downstream->path, sizeof(downstream->path), "%s.%d",
                                                                  ^~
hw/usb/bus.c:410:9: note: =E2=80=98snprintf=E2=80=99 output between 3 and=
 28 bytes into a destination of size 16
         snprintf(downstream->path, sizeof(downstream->path), "%s.%d",
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                  upstream->path, portnr);
                  ~~~~~~~~~~~~~~~~~~~~~~~

But we know that there are at most 5 levels of USB hubs, with at
most two digits per level; that plus the separating dots means we
use at most 15 bytes (including trailing NUL) of our 16-byte field.
Adding an assertion to show gcc that we checked for truncation is
enough to shut up the false-positive warning.

Inspired by an idea by Dr. David Alan Gilbert <dgilbert@redhat.com>.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 hw/usb/bus.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/usb/bus.c b/hw/usb/bus.c
index 5939b273b9..d910f849e7 100644
--- a/hw/usb/bus.c
+++ b/hw/usb/bus.c
@@ -407,8 +407,10 @@ void usb_register_companion(const char *masterbus, U=
SBPort *ports[],
 void usb_port_location(USBPort *downstream, USBPort *upstream, int portn=
r)
 {
     if (upstream) {
-        snprintf(downstream->path, sizeof(downstream->path), "%s.%d",
-                 upstream->path, portnr);
+        int l =3D snprintf(downstream->path, sizeof(downstream->path), "=
%s.%d",
+                         upstream->path, portnr);
+        /* Max string is nn.nn.nn.nn.nn, which fits in 16 bytes */
+        assert(l < sizeof(downstream->path));
         downstream->hubcount =3D upstream->hubcount + 1;
     } else {
         snprintf(downstream->path, sizeof(downstream->path), "%d", portn=
r);
--=20
2.13.3


