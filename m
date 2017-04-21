Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d1aWO-0001hD-Nw
	for mharc-qemu-trivial@gnu.org; Fri, 21 Apr 2017 11:30:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49958)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1d1aWF-0001Su-JF
	for qemu-trivial@nongnu.org; Fri, 21 Apr 2017 11:30:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1d1aWE-0007tT-LG
	for qemu-trivial@nongnu.org; Fri, 21 Apr 2017 11:30:47 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:33824)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
	id 1d1aW9-0007p9-Q5; Fri, 21 Apr 2017 11:30:41 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
	by localhost (Postfix) with SMTP id 821A77456D4;
	Fri, 21 Apr 2017 17:30:39 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
	id 3EF8A7456FD; Fri, 21 Apr 2017 17:30:38 +0200 (CEST)
Message-Id: <bf305f36dcde152668cf12438ef983cd09ed2d3f.1492787889.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1492787889.git.balaton@eik.bme.hu>
References: <cover.1492787889.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Date: Fri, 21 Apr 2017 17:18:09 +0200
To: qemu-devel@nongnu.org,
    qemu-trivial@nongnu.org
Cc: Magnus Damm <magnus.damm@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	David Gibson <david@gibson.dropbear.id.au>
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 152.66.115.2
Subject: [Qemu-trivial] [PATCH v7 13/13] ppc: Add SM501 device in ppc
 softmmu targets default configs
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
X-List-Received-Date: Fri, 21 Apr 2017 15:30:49 -0000

This is not used by default on any emulated machine yet but it is
still useful to have it compiled so it can be added from the command
line for clients that can use it (e.g. MorphOS has no driver for any
other emulated video cards but can output via SM501)

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
Tested-by: Aurelien Jarno <aurelien@aurel32.net>
---

v5: Added sm501 also to ppc64-softmmu default config

 default-configs/ppc-softmmu.mak    | 1 +
 default-configs/ppc64-softmmu.mak  | 1 +
 default-configs/ppcemb-softmmu.mak | 1 +
 3 files changed, 3 insertions(+)

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
diff --git a/default-configs/ppc64-softmmu.mak b/default-configs/ppc64-softmmu.mak
index 05c8335..f6ccb1b 100644
--- a/default-configs/ppc64-softmmu.mak
+++ b/default-configs/ppc64-softmmu.mak
@@ -47,6 +47,7 @@ CONFIG_OPENPIC_KVM=$(and $(CONFIG_E500),$(CONFIG_KVM))
 CONFIG_PLATFORM_BUS=y
 CONFIG_ETSEC=y
 CONFIG_LIBDECNUMBER=y
+CONFIG_SM501=y
 # For pSeries
 CONFIG_XICS=$(CONFIG_PSERIES)
 CONFIG_XICS_SPAPR=$(CONFIG_PSERIES)
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


