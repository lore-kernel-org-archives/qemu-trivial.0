Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z7NMI-0005i8-2b
	for mharc-qemu-trivial@gnu.org; Tue, 23 Jun 2015 08:31:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33222)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mprivozn@redhat.com>) id 1Z7NMD-0005Z3-2z
	for qemu-trivial@nongnu.org; Tue, 23 Jun 2015 08:31:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mprivozn@redhat.com>) id 1Z7NM7-0001O3-9N
	for qemu-trivial@nongnu.org; Tue, 23 Jun 2015 08:31:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48223)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mprivozn@redhat.com>)
	id 1Z7NM3-0001MN-2X; Tue, 23 Jun 2015 08:31:07 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id 21DAD2D44F6;
	Tue, 23 Jun 2015 12:31:06 +0000 (UTC)
Received: from lisa.brq.redhat.com (dhcp129-181.brq.redhat.com [10.34.129.181])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t5NCV4WE001475; Tue, 23 Jun 2015 08:31:05 -0400
From: Michal Privoznik <mprivozn@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 23 Jun 2015 14:30:19 +0200
Message-Id: <58e7daaa2977c903b46c3b0dde64e81ce191b5d6.1435062620.git.mprivozn@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] Makefile: Properly order build targets 'all'
	and 'check'
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
X-List-Received-Date: Tue, 23 Jun 2015 12:31:21 -0000

I'm used to run 'make -j5 all check'. However, this is not possible in
qemu because of the missing dependency in the Makefile. If I do that,
tests are usually started with build and since not everything is built
yet, they often fail too. Moreover, we should run test suite only
after every binary we want to test has been built.

Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index e7c5c3a..67eeb87 100644
--- a/Makefile
+++ b/Makefile
@@ -151,6 +151,7 @@ dummy :=3D $(call unnest-vars,, \
=20
 ifneq ($(wildcard config-host.mak),)
 include $(SRC_PATH)/tests/Makefile
+check: all
 endif
 ifeq ($(CONFIG_SMARTCARD_NSS),y)
 include $(SRC_PATH)/libcacard/Makefile
--=20
2.3.6


