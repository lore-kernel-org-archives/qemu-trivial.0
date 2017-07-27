Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dal4H-0008UL-VG
	for mharc-qemu-trivial@gnu.org; Thu, 27 Jul 2017 11:51:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59232)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1dal4F-0008Rv-KG
	for qemu-trivial@nongnu.org; Thu, 27 Jul 2017 11:51:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1dal4E-0006ew-Op
	for qemu-trivial@nongnu.org; Thu, 27 Jul 2017 11:51:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33364)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
	id 1dal4A-0006bx-0E; Thu, 27 Jul 2017 11:51:10 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9ECC6D9967;
	Thu, 27 Jul 2017 15:45:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 9ECC6D9967
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=marcandre.lureau@redhat.com
Received: from localhost (ovpn-112-42.ams2.redhat.com [10.36.112.42])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9C6125C323;
	Thu, 27 Jul 2017 15:45:41 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Date: Thu, 27 Jul 2017 17:45:37 +0200
Message-Id: <20170727154537.15303-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Thu, 27 Jul 2017 15:45:43 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] tests: test-netfilter && pxe-test require
 slirp
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
X-List-Received-Date: Thu, 27 Jul 2017 15:51:16 -0000

If slirp is disabled, it will fail with:

qemu-system-x86_64: -netdev user,id=3Dqtest-bn0: Parameter 'type' expects=
 a netdev backend type

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 tests/Makefile.include | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index 7af278db55..98387d3a51 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -219,7 +219,7 @@ gcov-files-i386-y +=3D hw/block/hd-geometry.c
 check-qtest-i386-y +=3D tests/boot-order-test$(EXESUF)
 check-qtest-i386-y +=3D tests/bios-tables-test$(EXESUF)
 check-qtest-i386-y +=3D tests/boot-serial-test$(EXESUF)
-check-qtest-i386-y +=3D tests/pxe-test$(EXESUF)
+check-qtest-i386-$(CONFIG_SLIRP) +=3D tests/pxe-test$(EXESUF)
 check-qtest-i386-y +=3D tests/rtc-test$(EXESUF)
 check-qtest-i386-y +=3D tests/ipmi-kcs-test$(EXESUF)
 check-qtest-i386-y +=3D tests/ipmi-bt-test$(EXESUF)
@@ -259,7 +259,7 @@ check-qtest-i386-$(CONFIG_VHOST_NET_TEST_i386) +=3D t=
ests/vhost-user-test$(EXESUF)
 ifeq ($(CONFIG_VHOST_NET_TEST_i386),)
 check-qtest-x86_64-$(CONFIG_VHOST_NET_TEST_x86_64) +=3D tests/vhost-user=
-test$(EXESUF)
 endif
-check-qtest-i386-y +=3D tests/test-netfilter$(EXESUF)
+check-qtest-i386-$(CONFIG_SLIRP) +=3D tests/test-netfilter$(EXESUF)
 check-qtest-i386-y +=3D tests/test-filter-mirror$(EXESUF)
 check-qtest-i386-y +=3D tests/test-filter-redirector$(EXESUF)
 check-qtest-i386-y +=3D tests/postcopy-test$(EXESUF)
@@ -293,7 +293,7 @@ check-qtest-ppc64-y +=3D tests/drive_del-test$(EXESUF=
)
 check-qtest-ppc64-y +=3D tests/postcopy-test$(EXESUF)
 check-qtest-ppc64-y +=3D tests/boot-serial-test$(EXESUF)
 check-qtest-ppc64-y +=3D tests/rtas-test$(EXESUF)
-check-qtest-ppc64-y +=3D tests/pxe-test$(EXESUF)
+check-qtest-ppc64-$(CONFIG_SLIRP) +=3D tests/pxe-test$(EXESUF)
 check-qtest-ppc64-y +=3D tests/usb-hcd-ohci-test$(EXESUF)
 gcov-files-ppc64-y +=3D hw/usb/hcd-ohci.c
 check-qtest-ppc64-y +=3D tests/usb-hcd-uhci-test$(EXESUF)
@@ -301,7 +301,7 @@ gcov-files-ppc64-y +=3D hw/usb/hcd-uhci.c
 check-qtest-ppc64-y +=3D tests/usb-hcd-xhci-test$(EXESUF)
 gcov-files-ppc64-y +=3D hw/usb/hcd-xhci.c
 check-qtest-ppc64-y +=3D $(check-qtest-virtio-y)
-check-qtest-ppc64-y +=3D tests/test-netfilter$(EXESUF)
+check-qtest-ppc64-$(CONFIG_SLIRP) +=3D tests/test-netfilter$(EXESUF)
 check-qtest-ppc64-y +=3D tests/test-filter-mirror$(EXESUF)
 check-qtest-ppc64-y +=3D tests/test-filter-redirector$(EXESUF)
 check-qtest-ppc64-y +=3D tests/display-vga-test$(EXESUF)
--=20
2.14.0.rc0.1.g40ca67566


