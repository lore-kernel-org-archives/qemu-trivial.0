Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1guEZ6-0002bB-TP
	for mharc-qemu-trivial@gnu.org; Thu, 14 Feb 2019 05:48:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50538)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1guEYw-0002P9-Gu
	for qemu-trivial@nongnu.org; Thu, 14 Feb 2019 05:48:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1guEYs-0002wI-V4
	for qemu-trivial@nongnu.org; Thu, 14 Feb 2019 05:48:14 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:60613)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1guEYj-0002bS-JM; Thu, 14 Feb 2019 05:48:01 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1Mk0a0-1hN0sI1cTI-00kRt0; Thu, 14 Feb 2019 11:47:50 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org, libvir-list@redhat.com,
	"Michael S. Tsirkin" <mst@redhat.com>, Eric Blake <eblake@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-trivial@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
	Kamil Rytarowski <kamil@netbsd.org>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Thomas Huth <thuth@redhat.com>
Date: Thu, 14 Feb 2019 11:47:17 +0100
Message-Id: <20190214104717.3543-15-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190214104717.3543-1-laurent@vivier.eu>
References: <20190214104717.3543-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:oEJO8vGs3P/U5J3a0d60Q6qpUGstg5SafroEl9jicDD4f7bYeme
	VPeirvNOb8XH4PEm4hROIBVH4YfiF2jJQkAPLIk9amm2l9daSMhqCSfiRf+WCzmB1Yg3ixs
	Nzh8PS2boU8SgpuEuw7SO+r+GS04dO+JvRJIwZWJYGOGgnr2143cY576KETkHxviicW3KeJ
	uQNg5hA5RB3kGJzlENE/g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:jZ25PKVJrfk=:bHMGy/muyHN+uH7VJOLnYa
	pv1GWHEZAtyiC84Hp4LfGzh1rh20yCw2+L3p03Fq8DJcSLtSoa8jQfysNq2azSKVLJ/B4V5Dm
	RinX/O+xTx08s7S6wqV8tdecS/qAjufNrWgd9Glwtf1+BF3SHCRqj9It6jKPmU7z4MTbZprbe
	KLE4tDXGIn3fG83vgvnXHa9tMfu8fsUR5jQL4TeYVjFcGvEx1KZEW+Qfm03h1Rgiqa+X0Dj91
	13kkj+Skffq7G1I0O5Ht+B06dPuKm0Oj8T7IBVSShOzOBLmB4iurnlG5LbXJv9TI62wiGcSVn
	C/WII6eBdKcXx84cMt7SAF6AvnrpG4Tl6/z5p5bnYd0H9CFSynGkkgpMPQqY3DZCWjwPfsBzn
	bj3s25lr6pnxdRuIh3X1vYhqmQRW1FtPku7S3nDl0XO84pzPP3y3YqNv7FvjcC+d9x+SGixsX
	Kl9EFzBBMFKnv6jzsWI7nX9tFn3M79PbMWADwmm/ej9c8JN5888WcTMSmN5wcn4fkJTgELqz6
	l631OJ7VfUXWprTO0jEPC9viWx2QJ4Vlg1BExzCkZrcfLwjcmGrBpIPL+9lQb+EoAYHIwzEua
	HTNL3poD+Ou6ImDLrY/ovkPVCTMoCLIX+cltMQmpubZ2CNk0/c1HOflOnvz9Y6Ctwl81zjqSj
	Oa3qQGm8uTXAzsxnssnSNjG0CNr5ETfFjzWCGZJITL3VA7lJMQBOU6q1nhWujlMl/eu1Xi4ug
	HQwWdWVYHHFgb0jDoiHPP/DR1EEdfZU+f6UrIQ==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.130
Subject: [Qemu-trivial] [PULL 14/14] configure: improve usbfs check
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
X-List-Received-Date: Thu, 14 Feb 2019 10:48:17 -0000

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

The current check to test if usbfs support should be compiled or not
solely relies on the presence of <linux/usbdevice_fs.h>, without
actually checking that all definition used by Qemu are provided by
this header file.

With sufficiently old kernel headers, <linux/usbdevice_fs.h> may be
present, but some of the definitions needed by Qemu may not be
available.

This commit improves the check by building a small program that
actually tests whether the necessary definitions are available.

In addition, it fixes a bug where have_usbfs was set to "yes"
regardless of the result of the test.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20190213211827.20300-1-thomas.petazzoni@bootlin.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 configure | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index c0f278141823..90b9e2fa3c05 100755
--- a/configure
+++ b/configure
@@ -4262,10 +4262,25 @@ fi
 # check for usbfs
 have_usbfs=no
 if test "$linux_user" = "yes"; then
-  if check_include linux/usbdevice_fs.h; then
+  cat > $TMPC << EOF
+#include <linux/usbdevice_fs.h>
+
+#ifndef USBDEVFS_GET_CAPABILITIES
+#error "USBDEVFS_GET_CAPABILITIES undefined"
+#endif
+
+#ifndef USBDEVFS_DISCONNECT_CLAIM
+#error "USBDEVFS_DISCONNECT_CLAIM undefined"
+#endif
+
+int main(void)
+{
+    return 0;
+}
+EOF
+  if compile_prog "" ""; then
     have_usbfs=yes
   fi
-  have_usbfs=yes
 fi
 
 # check for fallocate
-- 
2.20.1


