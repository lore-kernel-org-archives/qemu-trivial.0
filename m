Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gZGNM-00011Z-BR
	for mharc-qemu-trivial@gnu.org; Tue, 18 Dec 2018 09:29:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35920)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gZGNE-0000ue-Kt
	for qemu-trivial@nongnu.org; Tue, 18 Dec 2018 09:29:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gZGN8-0000ym-T0
	for qemu-trivial@nongnu.org; Tue, 18 Dec 2018 09:29:28 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:46705)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gZGN2-0000tL-4b; Tue, 18 Dec 2018 09:29:16 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MMXYN-1gsIxL0LKR-00JY3a; Tue, 18 Dec 2018 15:29:04 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Halil Pasic <pasic@linux.ibm.com>, Laurent Vivier <laurent@vivier.eu>,
	qemu-block@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Michael Tokarev <mjt@tls.msk.ru>, Richard Henderson <rth@twiddle.net>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Michael Roth <mdroth@linux.vnet.ibm.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-s390x@nongnu.org,
	Collin Walling <walling@linux.ibm.com>,
	Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	David Hildenbrand <david@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
	Max Reitz <mreitz@redhat.com>, qemu-trivial@nongnu.org
Date: Tue, 18 Dec 2018 15:28:51 +0100
Message-Id: <20181218142851.9477-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181218142851.9477-1-laurent@vivier.eu>
References: <20181218142851.9477-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:vWgRSiuAdicdIsVonsksGCVB9bBEgulCYydaPpv2yQm6LEcSb2A
	mVBdDJfogi9Ow4fphflifx+pEb6Kpc/5bFx+wwcck/5s3tIlHsUhTL/jjiniMK4wxfFr+j3
	Iem+BDEhhAD55Z+0rU/omO+uMeva20yVKWEtTzniidErVcZQuLlW+iyco0bSLts/U5tFo6T
	sr4wqribvT2/I2qsB1UIg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:K8/xurr9AlQ=:KWh3A7Z47p4u61OQj4nv+h
	Iy9X4rj7Ab7SHj5XT13nNkBl2odL1WdETSRu8hqGVsx5RUuDaQvqDHnpaF4Wgw6kG7AUWctVt
	LIF18w9JspjwVbwIplDFsroFzTHtJkt8rlSYixPI6zxwNqsojkNko0Ld91SUQm0/YlE5fbycc
	PYHzm1qKIuBlQBC6OFd/J0e72OiyXSMZEnZCjl8QYG5gfRGMJELLR3X+YGJlK9xli2fxhJhpz
	FPnXq5afRnQmidErkA4RC+2M0JhgZ2fEliL0yK2lB5+MwMnwGVjnuaPn4vIQnPGKbgCpGXoA/
	tEdinUnnQIuomqOpzM3VhtfM34wXSi1ez5dyg7SV8Sb9XSdrIiPVBVCY7J5aSn3oE/G7Z1sU8
	cLt6a8iE/gdhFGpu7l7ZGCW+a3Q/MgfYGvQR/sGTcru+UhWTCaA87ux9jfur6orMlcrQ32PaN
	y1GUpMHphP5E48iqli8ev8xdwqdf9XeYPePgw7VVw6PV1vBHQ2zKkuzfpAly2jvGFPYE9K6C+
	QOwzz3qqjqG0EN0peMTRF5nCLWatMSLTU5R25t8egc+nEq7SiQIY61BUK3Xd6eKn93nFqO+fq
	ihGGAyRmq3EewcfBpiajRo8qD1nzu2qmSgEFNVsM5fA/tRNgX8mlMRJMbrFwNO5/SuJziVMCL
	sSImA2RuC5o+TTVfjuqpVDBcgw7LCFSfNSs1inelA2c2YiAUT4fJ44883Up72z5pXZw0yqaZJ
	H3N7mJpgPWFUdwRHFGwlXJx1O75NHPpRMZN0JR6wnXH6auqNeN1LwVbYED4=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.135
Subject: [Qemu-trivial] [PULL 4/4] error: Remove NULL checks on
 error_propagate() calls
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
X-List-Received-Date: Tue, 18 Dec 2018 14:29:33 -0000

From: Markus Armbruster <armbru@redhat.com>

Patch created mechanically by rerunning:

  $  spatch --sp-file scripts/coccinelle/error_propagate_null.cocci \
            --macro-file scripts/cocci-macro-file.h \
            --dir . --in-place

Whitespace tidied up manually.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20181213173113.11211-1-armbru@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 blockdev.c              | 4 +---
 hw/s390x/s390-pci-bus.c | 4 +---
 qga/commands-posix.c    | 7 ++-----
 3 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/blockdev.c b/blockdev.c
index e6c8349409..a6f71f9d83 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -992,9 +992,7 @@ DriveInfo *drive_new(QemuOpts *all_opts, BlockInterfaceType block_default_type,
     blk = blockdev_init(filename, bs_opts, &local_err);
     bs_opts = NULL;
     if (!blk) {
-        if (local_err) {
-            error_propagate(errp, local_err);
-        }
+        error_propagate(errp, local_err);
         goto fail;
     } else {
         assert(!local_err);
diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c
index 99d0368868..f7458445c0 100644
--- a/hw/s390x/s390-pci-bus.c
+++ b/hw/s390x/s390-pci-bus.c
@@ -731,9 +731,7 @@ static void s390_pcihost_realize(DeviceState *dev, Error **errp)
 
     css_register_io_adapters(CSS_IO_ADAPTER_PCI, true, false,
                              S390_ADAPTER_SUPPRESSIBLE, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
-    }
+    error_propagate(errp, local_err);
 }
 
 static int s390_pci_msix_init(S390PCIBusDevice *pbdev)
diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index 1877976522..2e719d9b6b 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -1573,10 +1573,7 @@ static bool systemd_supports_mode(SuspendMode mode, Error **errp)
         return true;
     }
 
-    if (local_err) {
-        error_propagate(errp, local_err);
-    }
-
+    error_propagate(errp, local_err);
     return false;
 }
 
@@ -1782,7 +1779,7 @@ static void guest_suspend(SuspendMode mode, Error **errp)
     if (!mode_supported) {
         error_setg(errp,
                    "the requested suspend mode is not supported by the guest");
-    } else if (local_err) {
+    } else {
         error_propagate(errp, local_err);
     }
 }
-- 
2.19.2


