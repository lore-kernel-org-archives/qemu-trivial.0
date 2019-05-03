Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hMWLr-0007wf-T3
	for mharc-qemu-trivial@gnu.org; Fri, 03 May 2019 07:27:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33991)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hMWLo-0007to-TP
	for qemu-trivial@nongnu.org; Fri, 03 May 2019 07:27:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hMWLn-0003WH-Qv
	for qemu-trivial@nongnu.org; Fri, 03 May 2019 07:27:36 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:48721)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1hMWLl-0003Te-11; Fri, 03 May 2019 07:27:33 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1N14xe-1gd3XG0BiM-012UBm; Fri, 03 May 2019 13:27:04 +0200
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
Date: Fri,  3 May 2019 13:26:46 +0200
Message-Id: <20190503112654.4393-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190503112654.4393-1-laurent@vivier.eu>
References: <20190503112654.4393-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:/exoKr2G8amIMJOf8rY8yNH4VKXqwLNcO4mlaKtG33M69xL87BX
	6G7CQnal/Hv4gaAajGW3fQTfFA3z4r1FwPuLkyeKNiixwp73yANVwUMFuF9fD9slE16QZyT
	2F0fuzvvrm0P7I97AO8vvVBmJgXIxyZaL3jmE62cDIaaN5K1LV6Z/TK5ViYvmJWOcVcsDr3
	EtEuVmO4ABblJP5dfXkMg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:cvr4RbMvxyU=:+opHoDA9oED1oZIISzlzOR
	Z4x9mHeowNmjzNGLvffRLYF21eq8lFnt8YJh2G0aVCCRvdKaFyWUdi171xdKqbrvkNMZwT8/R
	g6VkSOGIKDxlToPAX3lUNSXDHocJyxgWB3rRMTVXIF2YsAONQxlz6Xv6wNiscNGwiCEvxm6BY
	dZYv8pPSjrBm4p8sqDfpbR75NH7NVwLQmFoe55bCceLA33YiwdNlRurCXa7sBK2GkagSsQwHJ
	w1adFjod8dUqRufS3Z/7oppN4n0KJNjH8+SN9vXa1jvPzTeFM4MDlUbCKqSZ1i5xdcJtv0Jp0
	HsmSkYrZkGug7GmfyPWUxJJU+CnR93t0zuuHCKZQQQdb2SKpZ/VsXqPr7zwQ3SeVDuxRMRYCB
	W949pJcqcg8/eWt+SWql+8sJys6ZPUGUAoutEGpBgxhwtT7PiSb9lKT8k0kaIdHpmtMKWF0JQ
	5s/RxEmjR0yYm/O5F/Ni/l1lC4dAb6wKaCm5WQJTrDYJeOazlr7c8EFavS9CAjkG4s1MQR0Rn
	Jgy85G4HHHEP4tqGZFbZ9x2dKs2EYqLwOOJmMG2ed3T5u/yKUcJ1+yCntDokkGMsSthlBdbjc
	edsd/6xqCReOkNpD33JGrCK4ndOL90fi4lhN5sEENSwMC0fmghVK/QqOFuLxsW/QAzKId9vQl
	wC7GoRPm9g+q3jJqy88hm/8gDkpOQ6+fl/FTudEHIkDiIErvvanVHVc+7Jux+oNroiKfLjxKa
	l0yC6+ZGh8/6Rnt+pd4KauO6nU/GLo664L5PP3HZPLf+MYfirgJ/pASROWI=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.133
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
X-List-Received-Date: Fri, 03 May 2019 11:27:38 -0000

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


