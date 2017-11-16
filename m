Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eFNAi-0003pK-6V
	for mharc-qemu-trivial@gnu.org; Thu, 16 Nov 2017 11:37:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60899)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1eFNAf-0003mK-M2
	for qemu-trivial@nongnu.org; Thu, 16 Nov 2017 11:37:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1eFNAe-0006z2-TA
	for qemu-trivial@nongnu.org; Thu, 16 Nov 2017 11:37:45 -0500
Received: from mail.weilnetz.de ([37.120.169.71]:58354
	helo=v2201612906741603.powersrv.de)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefan@weilnetz.de>)
	id 1eFNAY-0006uZ-4g; Thu, 16 Nov 2017 11:37:38 -0500
Received: from localhost (localhost [127.0.0.1])
	by v2201612906741603.powersrv.de (Postfix) with ESMTP id 6B4F4DA8ECA;
	Thu, 16 Nov 2017 17:37:36 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at v2201612906741603.powersrv.de
Received: from v2201612906741603.powersrv.de ([127.0.0.1])
	by localhost (v2201612906741603.powersrv.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 8HJ6dTZZa6Kn; Thu, 16 Nov 2017 17:37:35 +0100 (CET)
Received: from qemu.weilnetz.de (qemu.weilnetz.de [188.68.58.204])
	by v2201612906741603.powersrv.de (Postfix) with ESMTP id EF7FBDA8EC8;
	Thu, 16 Nov 2017 17:37:35 +0100 (CET)
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id AB54646162E; Thu, 16 Nov 2017 17:37:35 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: Peter Maydell <peter.maydell@linaro.org>, Fam Zheng <famz@redhat.com>,
	qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org,
	Stefan Weil <sw@weilnetz.de>
Date: Thu, 16 Nov 2017 17:37:32 +0100
Message-Id: <20171116163732.31584-1-sw@weilnetz.de>
X-Mailer: git-send-email 2.11.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 37.120.169.71
Subject: [Qemu-trivial] [PATCH for-2.11] Fix build of console and GUI
 executables for Windows
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
X-List-Received-Date: Thu, 16 Nov 2017 16:37:46 -0000

It was broken by commit 8ecc89f6e792152496eccb684d6c8c48aba8027d which
moved the SDL linker flags from macro libs_softmmu to macro SDL_LIBS.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---

Peter, can you apply this fix directly, or do you need a pull request?

Regards
Stefan

 Makefile.target | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile.target b/Makefile.target
index e4244c188a..f9a9da7e7c 100644
--- a/Makefile.target
+++ b/Makefile.target
@@ -22,7 +22,7 @@ QEMU_PROG_BUILD = $(QEMU_PROG)
 else
 # system emulator name
 QEMU_PROG=qemu-system-$(TARGET_NAME)$(EXESUF)
-ifneq (,$(findstring -mwindows,$(libs_softmmu)))
+ifneq (,$(findstring -mwindows,$(SDL_LIBS)))
 # Terminate program name with a 'w' because the linker builds a windows executable.
 QEMU_PROGW=qemu-system-$(TARGET_NAME)w$(EXESUF)
 $(QEMU_PROG): $(QEMU_PROGW)
-- 
2.11.0


