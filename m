Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hNIOc-00005n-Mu
	for mharc-qemu-trivial@gnu.org; Sun, 05 May 2019 10:45:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37969)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hNIOY-0008W9-Cm
	for qemu-trivial@nongnu.org; Sun, 05 May 2019 10:45:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hNIOX-0004vx-Dy
	for qemu-trivial@nongnu.org; Sun, 05 May 2019 10:45:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52514)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1hNIOU-0004sQ-RH; Sun, 05 May 2019 10:45:34 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DBA29308FE8F;
	Sun,  5 May 2019 14:45:31 +0000 (UTC)
Received: from thuth.com (ovpn-116-27.ams2.redhat.com [10.36.116.27])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D086860851;
	Sun,  5 May 2019 14:45:30 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Greg Kurz <groug@kaod.org>,
	qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Date: Sun,  5 May 2019 16:45:27 +0200
Message-Id: <20190505144527.27926-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Sun, 05 May 2019 14:45:32 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] virtfs: Add missing "id" parameter in
 documentation
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
X-List-Received-Date: Sun, 05 May 2019 14:45:39 -0000

... and remove the square brackets from "path" and "security_model",
since these parameters are not optional.

Buglink: https://bugs.launchpad.net/qemu/+bug/1581976
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 qemu-options.hx | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 51802cbb26..9571ddd141 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1311,7 +1311,7 @@ DEF("virtfs", HAS_ARG, QEMU_OPTION_virtfs,
=20
 STEXI
=20
-@item -virtfs @var{fsdriver}[,path=3D@var{path}],mount_tag=3D@var{mount_=
tag}[,security_model=3D@var{security_model}][,writeout=3D@var{writeout}][=
,readonly][,socket=3D@var{socket}|sock_fd=3D@var{sock_fd}][,fmode=3D@var{=
fmode}][,dmode=3D@var{dmode}]
+@item -virtfs @var{fsdriver},path=3D@var{path},mount_tag=3D@var{mount_ta=
g},security_model=3D@var{security_model}[,id=3D@var{id}][,writeout=3D@var=
{writeout}][,readonly][,socket=3D@var{socket}|sock_fd=3D@var{sock_fd}][,f=
mode=3D@var{fmode}][,dmode=3D@var{dmode}]
 @findex -virtfs
=20
 The general form of a Virtual File system pass-through options are:
--=20
2.21.0


