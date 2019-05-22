Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hTTmz-0002Dh-8V
	for mharc-qemu-trivial@gnu.org; Wed, 22 May 2019 12:08:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57546)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hTTmw-0002Ag-Ue
	for qemu-trivial@nongnu.org; Wed, 22 May 2019 12:08:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hTTmw-0003ye-1X
	for qemu-trivial@nongnu.org; Wed, 22 May 2019 12:08:22 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:45063)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1hTTmr-0003b0-8C; Wed, 22 May 2019 12:08:17 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA
	(Nemesis)
	id 1MZTua-1h6oR11uZa-00WRq1; Wed, 22 May 2019 18:07:33 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Tony Krowiak <akrowiak@linux.ibm.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Cornelia Huck <cohuck@redhat.com>, Farhan Ali <alifm@linux.ibm.com>,
	qemu-s390x@nongnu.org, Eric Farman <farman@linux.ibm.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Halil Pasic <pasic@linux.ibm.com>, Laurent Vivier <laurent@vivier.eu>,
	qemu-trivial@nongnu.org, Juan Quintela <quintela@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Michael Tokarev <mjt@tls.msk.ru>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Pierre Morel <pmorel@linux.ibm.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Laszlo Ersek <lersek@redhat.com>
Date: Wed, 22 May 2019 18:07:16 +0200
Message-Id: <20190522160723.31484-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190522160723.31484-1-laurent@vivier.eu>
References: <20190522160723.31484-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:jljocFWONHU390H0jNzDJadl4tUZ4KnZQsilBGFp50u0xC8Xc4w
	H2zUlzVa6E5/9/OQFsK3po0aAitkWEvRGFZV8FPmsXJl4qtZrY68k+LE+HkZ4se90ETqmq4
	AOUiI4wbp4InOBH912tWnuWGQJxOTqmkCcSuK3U1HfbXMj2G+nooNjcnL2UDZMxkY6YFTm2
	P0Cf88U7/k/HQ1TVSqgNA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:U6HlSEZRSVU=:kkXsYqQMRrO15L7XkI9nyK
	KhwP0ogsHg0nmpLlI+1WJW5+2cbPFD7NT4oN/ukk4duMC1bxOogfmnSvu8k/nnImoFCtMGpwm
	bWfa1em/WuQeeSuVh/rVWvKBf//+S8rutgdBnT3ucsWbA5uRKRfPRVzGS8nW2E3VJJJ7NHMY7
	XbcdrJN5b4H/q3d47ofJcB9qQvgP1nIV7KKBrq1DRt751JklRrc2ebLbskJB+WPrgWAk3ezqV
	QYJyUwclLZvlBYiBVwCFjuy+TMwPy+xr235r5Z1lEKLFRKNPENZY1wCOPWyPaZutCJlpdN9t8
	SA+zROC/VXNVzMkJ61njtWfu2NoXAEX/xaebI2IoKP2OiRZL0PvGb2SZa34ibBw5khSEzVymS
	PX++Zum+Fv7yQ34xaGCacvF2CAIMnpXeuaWhoM66cByoqYvI47aqSJ3e8Yfd/VPfwL287q5Lw
	JnM6h4qqonBe9UnUqct5J1A5Hod9hCoQdxdTrYK0b38acqFdEctYW/kQoHhjkgo5klvQsQU1Q
	VenIOFbk0oUP9M/eLRVDmLtV3xEywNin+yurJzo/YjGNJyd+Jh+6UIPGmThqbypGJTIXwqcB1
	ttdNYX6tDFCHs3YYDp2+Jf3OWTmaYLZdic5Gq7AjZcWub4Pd8rQpbYEgJcVAIa2pbjMDaUSx/
	qHMSKz0l1TBRFC12HLtLKM4W4ObQ5o8blNSihcW/StD2IF9nogw5bZ7hUyshoHkVUQnQ0/Vfs
	LtVe3m2SxQiTrkAJ/R0OXVzqaxJgUB3cj8uCxD1HPj3H2w0CcKrhgyqEHD0=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.24
Subject: [Qemu-trivial] [PULL 2/9] roms: Correct the EDK2_BASETOOLS_OPTFLAGS
 variable description
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
X-List-Received-Date: Wed, 22 May 2019 16:08:24 -0000

From: Philippe Mathieu-Daudé <philmd@redhat.com>

In commit 1cab464136b4 we incorrectly described the
EDK2_BASETOOLS_OPTFLAGS can pass CPPFLAGS and CFLAGS
options to the EDK2 build tools, but it only expands
the CFLAGS (not to the CPPFLAGS).
Update the description to be more accurate.

Reported-by: Laszlo Ersek <lersek@redhat.com>
Reviewed-by: Laszlo Ersek <lersek@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20190506141923.12183-2-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 roms/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/roms/Makefile b/roms/Makefile
index 0ce84a45ad57..ea6aec56abdd 100644
--- a/roms/Makefile
+++ b/roms/Makefile
@@ -121,8 +121,8 @@ build-efi-roms: build-pxe-roms
 		$(patsubst %,bin-i386-efi/%.efidrv,$(pxerom_targets)) \
 		$(patsubst %,bin-x86_64-efi/%.efidrv,$(pxerom_targets))
 
-# Build scripts can pass compiler/linker flags to the EDK2 build tools
-# via the EDK2_BASETOOLS_OPTFLAGS (CPPFLAGS and CFLAGS) and
+# Build scripts can pass compiler/linker flags to the EDK2
+# build tools via the EDK2_BASETOOLS_OPTFLAGS (CFLAGS) and
 # EDK2_BASETOOLS_LDFLAGS (LDFLAGS) environment variables.
 #
 # Example:
-- 
2.20.1


