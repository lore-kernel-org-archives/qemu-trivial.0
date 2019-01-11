Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gi3BW-0001AL-7O
	for mharc-qemu-trivial@gnu.org; Fri, 11 Jan 2019 15:13:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49939)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1gi3BU-00018h-42
	for qemu-trivial@nongnu.org; Fri, 11 Jan 2019 15:13:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1gi3BT-0003r4-AR
	for qemu-trivial@nongnu.org; Fri, 11 Jan 2019 15:13:40 -0500
Received: from mx1.redhat.com ([209.132.183.28]:54594)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1gi3BR-0003lA-51; Fri, 11 Jan 2019 15:13:37 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9704DA08F6;
	Fri, 11 Jan 2019 20:13:34 +0000 (UTC)
Received: from blue.redhat.com (ovpn-116-216.phx2.redhat.com [10.3.116.216])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 214326A6B3;
	Fri, 11 Jan 2019 20:13:34 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
	Cleber Rosa <crosa@redhat.com>
Date: Fri, 11 Jan 2019 14:13:30 -0600
Message-Id: <20190111201330.14473-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Fri, 11 Jan 2019 20:13:34 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] qemu.py: Fix error message when qemu dies
 from signal
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
X-List-Received-Date: Fri, 11 Jan 2019 20:13:41 -0000

When qemu dies from a signal, the python code gets a negative
value for exitcode; but signal numbers are positive.  Copy the
pattern used in qemu-iotests/iotests.py for reporting a positive
value.

CC: qemu-trivial@nongnu.org
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 scripts/qemu.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/qemu.py b/scripts/qemu.py
index 6e3b0e67719..0a5e02eb56e 100644
--- a/scripts/qemu.py
+++ b/scripts/qemu.py
@@ -351,7 +351,7 @@ class QEMUMachine(object):
                 command =3D ' '.join(self._qemu_full_args)
             else:
                 command =3D ''
-            LOG.warn(msg, exitcode, command)
+            LOG.warn(msg, -exitcode, command)

         self._launched =3D False

--=20
2.20.1


