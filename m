Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SdKI4-0004jf-F5
	for mharc-qemu-trivial@gnu.org; Sat, 09 Jun 2012 07:57:12 -0400
Received: from eggs.gnu.org ([208.118.235.92]:58025)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1SdKI1-0004ZE-En
	for qemu-trivial@nongnu.org; Sat, 09 Jun 2012 07:57:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1SdKHz-0007Zy-Pi
	for qemu-trivial@nongnu.org; Sat, 09 Jun 2012 07:57:09 -0400
Received: from cantor2.suse.de ([195.135.220.15]:51990 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1SdKHu-0007Yd-Oc; Sat, 09 Jun 2012 07:57:02 -0400
Received: from relay1.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id 96BCD8FA97;
	Sat,  9 Jun 2012 13:57:00 +0200 (CEST)
From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
To: qemu-devel@nongnu.org
Date: Sat,  9 Jun 2012 13:56:42 +0200
Message-Id: <1339243002-13760-1-git-send-email-afaerber@suse.de>
X-Mailer: git-send-email 1.7.7
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [Qemu-trivial] [PATCH] Makefile.user: Define CONFIG_USER_ONLY for
	libuser/
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
X-List-Received-Date: Sat, 09 Jun 2012 11:57:11 -0000

In *-*-user/ build dirs CONFIG_USER_ONLY is defined via config-target.h.
In libuser/ it is not defined.

Add it via QEMU_CFLAGS.

Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
---
 Soon needed for cpu.c.

 Makefile.user |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/Makefile.user b/Makefile.user
index b717820..ab70eb3 100644
--- a/Makefile.user
+++ b/Makefile.user
@@ -10,6 +10,7 @@ $(call set-vpath, $(SRC_PATH))
=20
 QEMU_CFLAGS+=3D-I..
 QEMU_CFLAGS +=3D -I$(SRC_PATH)/include
+QEMU_CFLAGS +=3D -DCONFIG_USER_ONLY
=20
 include $(SRC_PATH)/Makefile.objs
=20
--=20
1.7.7


