Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hYqF6-00007k-2J
	for mharc-qemu-trivial@gnu.org; Thu, 06 Jun 2019 07:07:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60213)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hYqF2-0008VZ-05
	for qemu-trivial@nongnu.org; Thu, 06 Jun 2019 07:07:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hYqF0-0002zw-SI
	for qemu-trivial@nongnu.org; Thu, 06 Jun 2019 07:07:31 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:48023)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1hYqEy-0002qn-9p; Thu, 06 Jun 2019 07:07:28 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA
	(Nemesis)
	id 1M9nAB-1hVnpS46PF-005qM5; Thu, 06 Jun 2019 13:06:48 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Aleksandar Rikalo <arikalo@wavecomp.com>,
	Juan Quintela <quintela@redhat.com>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Fam Zheng <fam@euphon.net>, Michael Walle <michael@walle.cc>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>, David Hildenbrand <david@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Yuval Shaia <yuval.shaia@oracle.com>, qemu-trivial@nongnu.org,
	Halil Pasic <pasic@linux.ibm.com>, Richard Henderson <rth@twiddle.net>,
	qemu-s390x@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>,
	Dmitry Fleytman <dmitry.fleytman@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Thomas Huth <thuth@redhat.com>
Date: Thu,  6 Jun 2019 13:06:15 +0200
Message-Id: <20190606110625.32127-7-laurent@vivier.eu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190606110625.32127-1-laurent@vivier.eu>
References: <20190606110625.32127-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:nK/Fel8Fvw4QdlnGmjvpi6hFRc+DYWG+wpknXymG0HExoDoxRW6
	JS3z1safrDIU+v90zDCq1g0DuA6sgY8naaPZC4Kdg+QYG/paus5ngUBcl8fBX9ZOQBZGHev
	G56PlFm1o0lb1Rw9l3fsjenpypm0FBR69f29zjX29Q2vrj6FpvVDprWg2GWP61juNvRtBJI
	vWYwZpi4a7jsKmJdPq0eA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:FjzVW0+XTvw=:ij1DW/g9Jjm+H2Tqx+kc40
	h9cNXbOKSs6xNcscx2nU69LmWbA5mfspAyUQ2ytl3gWBJCJwb4W2u2F6GAsJKCNMTO1IEvAtm
	pjPrx+WNe1qMCScrglUZoGi7BWcqpTD5faxZL15TVRtzwwYjKOl9N9cmh0XFsFu5s9V8Mgwta
	24POEU9jWASXcu0Yn+sV3kySbEA7zcpX41P2tQQ1BjWs/SzPy6Vh1Bs6NB91DMrOG9LxooIga
	msi2KLQt4/9fOPkGzry7mKNc5CJBX61v9ySsCqUaWE3eU6JslwL+CukShHw0WztWEfbvqEfhz
	ta82I91QBudWfa9LycIrOj1IU6OCeKOZ8t2qVW9cTnRnkmxH2MgcU942QfETyIlBfoHFw/63Q
	ID5gu2fwxre0CTxTsRVjTeC/AkDdbws2mreHh7coqzWl/WS/4vK7CLdE63MjSCPjPeE3rwAeb
	36EanCY2nPdkU2MN1+bK3Xp20jZxDWFGC3MWrU/Krb54ZUfEylwFY8Jm89Y47RiYvIVwNRlL9
	gGroEb729ceCnHCNzrHrcDlrf++EZy7pR/+RecVlpbAGlAKjApmGQ8hmB/Ic1DkgYFrP3H+i4
	5G8xxhHSIyz9dTEXeedUDK0hQfsWwgYhu3rknkFobaeolsuyiTkMaCi47kW2vtuj/tQzoSdRx
	FAnSU01oC9Rpq/Kpgs4r3DqZCJC236nBY3mm+RtBpeXtNihyeQQvQzVx3f7lMpuOmCiQZ0H+v
	IOjJiTbrPELxkPmq2UU6vEwobHDiprvUSReiRk+iXWmWYEYth9cHgREMZ2k=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.73
Subject: [Qemu-trivial] [PULL 06/16] docs/devel/build-system: Update an
 example
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
X-List-Received-Date: Thu, 06 Jun 2019 11:07:33 -0000

From: Philippe Mathieu-Daudé <philmd@redhat.com>

The default-configs/ example added in 717171bd2025 is no
more accurate since fa212a2b8b60 (and various further other
commits).

The Kconfig build system is now in place.
Use the aarch64-softmmu config as example.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20190529140504.21580-1-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 docs/devel/build-system.txt | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/docs/devel/build-system.txt b/docs/devel/build-system.txt
index addd274eebd9..41bd08ea3ab3 100644
--- a/docs/devel/build-system.txt
+++ b/docs/devel/build-system.txt
@@ -413,18 +413,13 @@ context.
 - default-configs/*.mak
 
 The files under default-configs/ control what emulated hardware is built
-into each QEMU system and userspace emulator targets. They merely
-contain a long list of config variable definitions. For example,
-default-configs/x86_64-softmmu.mak has:
-
-  include sound.mak
-  include usb.mak
-  CONFIG_QXL=$(CONFIG_SPICE)
-  CONFIG_VGA_ISA=y
-  CONFIG_VGA_CIRRUS=y
-  CONFIG_VMWARE_VGA=y
-  CONFIG_VIRTIO_VGA=y
-  ...snip...
+into each QEMU system and userspace emulator targets. They merely contain
+a list of config variable definitions like the machines that should be
+included. For example, default-configs/aarch64-softmmu.mak has:
+
+  include arm-softmmu.mak
+  CONFIG_XLNX_ZYNQMP_ARM=y
+  CONFIG_XLNX_VERSAL=y
 
 These files rarely need changing unless new devices / hardware need to
 be enabled for a particular system/userspace emulation target
-- 
2.21.0


