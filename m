Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hMWEv-0000Vv-D9
	for mharc-qemu-trivial@gnu.org; Fri, 03 May 2019 07:20:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59793)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hMWEs-0000T4-Jh
	for qemu-trivial@nongnu.org; Fri, 03 May 2019 07:20:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hMWEr-0002Ga-GH
	for qemu-trivial@nongnu.org; Fri, 03 May 2019 07:20:26 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:40119)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1hMWEr-0002FS-8H; Fri, 03 May 2019 07:20:25 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA
	(Nemesis)
	id 1M42b8-1hMWEd42PA-0007cI; Fri, 03 May 2019 13:20:12 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
	Fabien Chouteau <chouteau@adacore.com>, qemu-trivial@nongnu.org,
	Richard Henderson <rth@twiddle.net>, Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Michael Tokarev <mjt@tls.msk.ru>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
	Michael Roth <mdroth@linux.vnet.ibm.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Date: Fri,  3 May 2019 13:19:50 +0200
Message-Id: <20190503111958.30825-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190503111958.30825-1-laurent@vivier.eu>
References: <20190503111958.30825-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:0z/K3wjAdqIK5oWiNca7+Fj70jexOIzVi0yIWQsEPFFIvbBx7xV
	+TYQ7Uu6yk81BL12vuMS4CmpXoEsU4gK/nSkjjWB9ojbdwg/p+tFJaVWCZ4x2+m/NY8eAVg
	7D9HAVJombX08pAayR+mnMk+8bfxgB/l7O7OhbH9Y1ry2B/11+UV5Ng1gAmpySjNHC8r9VF
	laQS/mFYCMbMassaqLlyw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:mu24ZYJjzy0=:LoByJxiSy4M1VYp2f9joZk
	eZaOcLxQR+00eVw5TIKKXO3GjEtHnLf0abe+hy7VqvRIvQl1PjhO8EfkILTiFJgtRq4UIGmz1
	1e9M/q1URWkt/muEKEPYPiHaRFqTwiNE9RNADQQq7osjOo2twKEg0FyWeaXZIlSDZYnP7gvSv
	osWJaiuyD6OdtZ4CVqp4Cgq8l7x34/NOVCaj7fA/KZWCdK51Jtcg9mfxPNtkaR8aKXLldCkhS
	MJRvQ/vkpbAQ/h5j2LkHG4j0zrwfPbcYviEC4ekJ9FWxZy+4uoc20/yOr9Q3HSlp3t0SAvDV5
	ySjCIdhDn4x1n8Vw/8+3CYjwkctANnR7O0bMStxDRhYmN+j6Jjey4UNAt/cPABzDffdCgd2ep
	tV+nL6Gxtzc9xjFwAkUdLvoc/shAbseB74RVwB7fnxD8k0bol93ILylfAEw5JFBLkt2+AaaJs
	gEfkHWAA/zo9l7evXjgK363NdkX/K+a9dK9GT1oWdWHljAlxMKHovx0mT4dHLv2A0cT0scTji
	ljiGH2oVPSRlVTjHiM3Qu5XzUwBOZ6LKK1Z0e6T4hqr/J1rkvSBmoTbiLLmEIyTuvBECU5x4B
	5PaNrARFWhcpzXyXCbIkB46LBTnCDd91XRIuEPsxdJWdkeNmyoE+ZUi7HMnR5mQOIEx1IIxXf
	UegS7VIU8w4ogeV4l4v9t1+UQuqqzgQFi9UyC6SuJbvZtOOEUJ+Lge+qqJuC1a4NdkSfsIXxA
	DrqhOh1df7SxOkAr2Dz3C0eQ35pjLpAmszHGuG2CYpdI+wA1L/UI+Wff+GQ=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.74
Subject: [Qemu-trivial] [PULL v2 04/12] doc: fix the configuration path
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
X-List-Received-Date: Fri, 03 May 2019 11:20:27 -0000

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Use a CONFDIR variable to show the configured sysconf path in the
generated documentations (html, man pages etc).

Related to:
https://bugzilla.redhat.com/show_bug.cgi?id=1644985

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20181126105125.30973-1-marcandre.lureau@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 qemu-ga.texi | 4 ++--
 Makefile     | 9 ++++++---
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/qemu-ga.texi b/qemu-ga.texi
index 4c7a8fd16329..f00ad830f283 100644
--- a/qemu-ga.texi
+++ b/qemu-ga.texi
@@ -30,7 +30,7 @@ set user's password
 @end itemize
 
 qemu-ga will read a system configuration file on startup (located at
-@file{/etc/qemu/qemu-ga.conf} by default), then parse remaining
+@file{@value{CONFDIR}/qemu-ga.conf} by default), then parse remaining
 configuration options on the command line. For the same key, the last
 option wins, but the lists accumulate (see below for configuration
 file format).
@@ -58,7 +58,7 @@ file format).
   Enable fsfreeze hook. Accepts an optional argument that specifies
   script to run on freeze/thaw. Script will be called with
   'freeze'/'thaw' arguments accordingly (default is
-  @samp{/etc/qemu/fsfreeze-hook}). If using -F with an argument, do
+  @samp{@value{CONFDIR}/fsfreeze-hook}). If using -F with an argument, do
   not follow -F with a space (for example:
   @samp{-F/var/run/fsfreezehook.sh}).
 
diff --git a/Makefile b/Makefile
index 1211e78c91ed..43a7a047b452 100644
--- a/Makefile
+++ b/Makefile
@@ -899,11 +899,14 @@ ui/shader.o: $(SRC_PATH)/ui/shader.c \
 MAKEINFO=makeinfo
 MAKEINFOINCLUDES= -I docs -I $(<D) -I $(@D)
 MAKEINFOFLAGS=--no-split --number-sections $(MAKEINFOINCLUDES)
-TEXI2PODFLAGS=$(MAKEINFOINCLUDES) "-DVERSION=$(VERSION)"
+TEXI2PODFLAGS=$(MAKEINFOINCLUDES) -DVERSION="$(VERSION)" -DCONFDIR="$(qemu_confdir)"
 TEXI2PDFFLAGS=$(if $(V),,--quiet) -I $(SRC_PATH) $(MAKEINFOINCLUDES)
 
-docs/version.texi: $(SRC_PATH)/VERSION
-	$(call quiet-command,echo "@set VERSION $(VERSION)" > $@,"GEN","$@")
+docs/version.texi: $(SRC_PATH)/VERSION config-host.mak
+	$(call quiet-command,(\
+		echo "@set VERSION $(VERSION)" && \
+		echo "@set CONFDIR $(qemu_confdir)" \
+	)> $@,"GEN","$@")
 
 %.html: %.texi docs/version.texi
 	$(call quiet-command,LC_ALL=C $(MAKEINFO) $(MAKEINFOFLAGS) --no-headers \
-- 
2.20.1


