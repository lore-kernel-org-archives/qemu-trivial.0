Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1guEYw-0002P8-GT
	for mharc-qemu-trivial@gnu.org; Thu, 14 Feb 2019 05:48:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50257)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1guEYl-0002IK-V7
	for qemu-trivial@nongnu.org; Thu, 14 Feb 2019 05:48:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1guEYj-0002k2-Mw
	for qemu-trivial@nongnu.org; Thu, 14 Feb 2019 05:48:03 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:59765)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1guEYj-0002Y3-1c; Thu, 14 Feb 2019 05:48:01 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MuUza-1hCRvj0XPm-00rU5U; Thu, 14 Feb 2019 11:47:49 +0100
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
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Date: Thu, 14 Feb 2019 11:47:16 +0100
Message-Id: <20190214104717.3543-14-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190214104717.3543-1-laurent@vivier.eu>
References: <20190214104717.3543-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:clkzpb0kf5OkOTkDePAWmbK+LGoWFoOkSqYIO+AEwTedXnBh+68
	Sal3EDlWvFtfve9SmjgAGQvgMVwHw8fAb3FpYqzisB2GFZMPLfyy8RKV4bU5qietBq4rmvh
	tb3QMnL9T96G8nRZ26ZvRDpIjjIfx2feGKXUoB9sR5wz6jokCOiBm0vjF2gccWuPpOlnW7y
	mh/uwoGqWk9OausF/Mn9A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:tizVtLKisjk=:6MMMqO4MJ4LmETSx67nExd
	ITqZGG6+fshWRL8DbJ0QDBrL2Lo/2fT8qwV4+rek1wZthWXol9rxr/I7hwg8y8EkSZtq4HT17
	8G//GkZkrOIwWR2s0aXQrrpeLpsfxSHBRtasVwhjQlVOOz6pXkVXhWJII+YSXiG6pxe1k5azy
	BG0DzLFbEamq+A6fTrTeVGH/phS3sicdN85O/SFqMb7UGmeoQxEZWd6SGzyJ/5Z0VVgcZYTpE
	owsE5VfdmMB2q+9qBNKed4kUQnegU+9uymaykBCreXi/000gSfFQw1hkcc/szwsh4IBIL/03A
	krfJRGoC3enDsrWlNefLZG27eucZn5znWWX/6Lplc+jK6RhLE20Bi1L5XyoQLjTQJQnhg95aj
	0pEAqsfq2L3lYs9otP6LOe3bippeOKko/3nK8WFrRFghBoTHkNTuTSf+f8j1AtIxTCdirTDH2
	1GaKRWh0CXpmUsc/Fmk+eZ2Uh+Jxm9tIaIo7IxAkB+wtnEbYVnuPd+lBEouhuHuLCvgPg+vAf
	bu1y8lL1hwtcT5iFXb9xZiML+nBz0tBimOvAVZRjrvzCDPorg9Ni38q1IwJ58kVAOM4805/UO
	SqnRMOoUIicGPe407cLEnokOeiMGHVHVwOHRRLXr6+w2Wwoj8A2uYFjGVsw4aDGqwehEV2aZy
	d0qxAGWtvzKGbKlAbZhA968b7pp69qr2irgI202Rn1b9JunRw3qojeMGrnrKRDUqJ8hWnVxSy
	hFe9WC1HFH+w8aRM1ACAiQ7dNT2ZEG/k7vTlOrBlj1dx2xsbPTMxs+aIwrY=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.135
Subject: [Qemu-trivial] [PULL 13/14] hw/sparc64: Explicitly set
 default_display = "std"
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
X-List-Received-Date: Thu, 14 Feb 2019 10:48:11 -0000

From: Thomas Huth <thuth@redhat.com>

The sun4uv_init() function expects vga_interface_type to be either
VGA_STD or VGA_NONE and sets up a stdvga device or no vga card
accordingly.
However, the code in vl.c prefers the Cirrus VGA card to stdvga if
it is available and the user and the machine did not specify anything
else.
So far this has not been a problem, since the Cirrus VGA was not linked
into the sparc64 target. But with the upcoming Kconfig build system,
all theoretically possible PCI cards will be enabled by default, so the
Cirrus VGA card might become available on the sparc64 target, too. vl.c
then picks the wrong card, causing sun4uv_init() to abort.
Thus let's make it explicit that we always want stdvga for sparc64 and
so set default_display = "std" for these machines.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <1550041639-10232-1-git-send-email-thuth@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/sparc64/sun4u.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
index ff24d9b35016..399f2d73c814 100644
--- a/hw/sparc64/sun4u.c
+++ b/hw/sparc64/sun4u.c
@@ -797,6 +797,7 @@ static void sun4u_class_init(ObjectClass *oc, void *data)
     mc->default_boot_order = "c";
     mc->default_cpu_type = SPARC_CPU_TYPE_NAME("TI-UltraSparc-IIi");
     mc->ignore_boot_device_suffixes = true;
+    mc->default_display = "std";
     fwc->get_dev_path = sun4u_fw_dev_path;
 }
 
@@ -820,6 +821,7 @@ static void sun4v_class_init(ObjectClass *oc, void *data)
     mc->max_cpus = 1; /* XXX for now */
     mc->default_boot_order = "c";
     mc->default_cpu_type = SPARC_CPU_TYPE_NAME("Sun-UltraSparc-T1");
+    mc->default_display = "std";
 }
 
 static const TypeInfo sun4v_type = {
-- 
2.20.1


