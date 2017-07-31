Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dc7uw-0007ul-Ce
	for mharc-qemu-trivial@gnu.org; Mon, 31 Jul 2017 06:27:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53214)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dc7ut-0007rm-HV
	for qemu-trivial@nongnu.org; Mon, 31 Jul 2017 06:27:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dc7us-00023v-HN
	for qemu-trivial@nongnu.org; Mon, 31 Jul 2017 06:27:15 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:53867)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dc7uo-0001yh-6d; Mon, 31 Jul 2017 06:27:10 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 7EC8842ABD;
	Mon, 31 Jul 2017 13:27:09 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id A567CB7D;
	Mon, 31 Jul 2017 13:21:44 +0300 (MSK)
Received: (nullmailer pid 5546 invoked by uid 1000);
	Mon, 31 Jul 2017 10:21:45 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Date: Mon, 31 Jul 2017 13:21:23 +0300
Message-Id: <d616c12b7dbcd9d682782d6bdf59a29f80e4d923.1501496349.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1501496349.git.mjt@msgid.tls.msk.ru>
References: <cover.1501496349.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1501496349.git.mjt@msgid.tls.msk.ru>
References: <cover.1501496349.git.mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 04/25] tests: test-netfilter && pxe-test
 require slirp
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
X-List-Received-Date: Mon, 31 Jul 2017 10:27:16 -0000

From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

If slirp is disabled, it will fail with:

qemu-system-x86_64: -netdev user,id=3Dqtest-bn0: Parameter 'type' expects=
 a netdev backend type

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
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
2.11.0


