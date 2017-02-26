Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1chmkk-0001or-Ae
	for mharc-qemu-trivial@gnu.org; Sat, 25 Feb 2017 19:31:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42638)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1chmkb-0001Oz-Dk
	for qemu-trivial@nongnu.org; Sat, 25 Feb 2017 19:31:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1chmka-0005yx-Dy
	for qemu-trivial@nongnu.org; Sat, 25 Feb 2017 19:31:45 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:32651)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
	id 1chmkW-0005vO-Fl; Sat, 25 Feb 2017 19:31:40 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
	by localhost (Postfix) with SMTP id 89D8F745968;
	Sun, 26 Feb 2017 01:31:31 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
	id 93A3274596C; Sun, 26 Feb 2017 01:31:29 +0100 (CET)
Message-Id: <e053f91411e4b950a32b313bba0e75e227065863.1488068248.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1488068248.git.balaton@eik.bme.hu>
References: <cover.1488068248.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
To: qemu-devel@nongnu.org,
    qemu-trivial@nongnu.org
Cc: Magnus Damm <magnus.damm@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 152.66.115.2
Subject: [Qemu-trivial] [PATCH v2 14/14] ppc: Add SM501 device in config for
 ppc and ppcemb targets
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
Date: Sun, 26 Feb 2017 00:31:46 -0000
X-Original-Date: Tue, 13 Dec 2016 22:00:56 +0100
X-List-Received-Date: Sun, 26 Feb 2017 00:31:46 -0000

This is not used by default on any emulated machine yet but it is
still useful to have it compiled so it can be added from the command
line for clients that can use it (e.g. MorphOS has no driver for any
other emulated video cards but can output via SM501)

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 default-configs/ppc-softmmu.mak    | 1 +
 default-configs/ppcemb-softmmu.mak | 1 +
 2 files changed, 2 insertions(+)

diff --git a/default-configs/ppc-softmmu.mak b/default-configs/ppc-softmmu.mak
index 09c1d45..1f1cd85 100644
--- a/default-configs/ppc-softmmu.mak
+++ b/default-configs/ppc-softmmu.mak
@@ -45,6 +45,7 @@ CONFIG_OPENPIC_KVM=$(and $(CONFIG_E500),$(CONFIG_KVM))
 CONFIG_PLATFORM_BUS=y
 CONFIG_ETSEC=y
 CONFIG_LIBDECNUMBER=y
+CONFIG_SM501=y
 # For PReP
 CONFIG_SERIAL_ISA=y
 CONFIG_MC146818RTC=y
diff --git a/default-configs/ppcemb-softmmu.mak b/default-configs/ppcemb-softmmu.mak
index 7f56004..94340de 100644
--- a/default-configs/ppcemb-softmmu.mak
+++ b/default-configs/ppcemb-softmmu.mak
@@ -15,3 +15,4 @@ CONFIG_I8259=y
 CONFIG_XILINX=y
 CONFIG_XILINX_ETHLITE=y
 CONFIG_LIBDECNUMBER=y
+CONFIG_SM501=y
-- 
2.7.4


