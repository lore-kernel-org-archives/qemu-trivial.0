Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QFT1m-0001Si-H3
	for mharc-qemu-trivial@gnu.org; Thu, 28 Apr 2011 11:21:14 -0400
Received: from eggs.gnu.org ([140.186.70.92]:48581)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1QFT1g-0001HE-L4
	for qemu-trivial@nongnu.org; Thu, 28 Apr 2011 11:21:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1QFT1b-0006lD-Rd
	for qemu-trivial@nongnu.org; Thu, 28 Apr 2011 11:21:08 -0400
Received: from moutng.kundenserver.de ([212.227.17.9]:57522)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1QFT1U-0006ek-Cu; Thu, 28 Apr 2011 11:20:56 -0400
Received: from flocke.fritz.box (p5086FD13.dip.t-dialin.net [80.134.253.19])
	by mrelayeu.kundenserver.de (node=mrbap2) with ESMTP (Nemesis)
	id 0MIxJ3-1QD0373BSj-003EVu; Thu, 28 Apr 2011 17:20:49 +0200
Received: from stefan by flocke.fritz.box with local (Exim 4.72)
	(envelope-from <stefan@weilnetz.de>)
	id 1QFT1L-0002Bh-VE; Thu, 28 Apr 2011 17:20:47 +0200
From: Stefan Weil <weil@mail.berlios.de>
To: QEMU Developers <qemu-devel@nongnu.org>
Date: Thu, 28 Apr 2011 17:20:36 +0200
Message-Id: <1304004042-8334-12-git-send-email-weil@mail.berlios.de>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1304004042-8334-1-git-send-email-weil@mail.berlios.de>
References: <1304004042-8334-1-git-send-email-weil@mail.berlios.de>
X-Provags-ID: V02:K0:PUkT8rmYisf3G3U/v0SAAf2maYKfbgKLConwpb6dYoL
	1cFFYGs2IvOIPalu6bxH0w3CzFP2fI9zraZvIQT4xb07fYEYPN
	2O8WoREoPBpSZTKYWCtjMfl/y9V28bu65Ep8yq/ReP7/6ByfMt
	BNhEMMbecDbRRbtV90h5lNrcgrbaW3GbNGHntPKxU+kwY/unNc
	KM75k5O3kImw/F11frSPwBzU9pOpH6jecAr/Ygb1bcgUu6ctOe QxAYMcIe4XqkV
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 212.227.17.9
Cc: qemu-trivial@nongnu.org, Stefan Weil <weil@mail.berlios.de>
Subject: [Qemu-trivial] [PATCH 12/18] Fix typos in comments (instanciation
	-> instantiation)
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Apr 2011 15:21:09 -0000

Signed-off-by: Stefan Weil <weil@mail.berlios.de>
---
 hw/ppc4xx_devs.c            |    2 +-
 target-ppc/translate_init.c |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/ppc4xx_devs.c b/hw/ppc4xx_devs.c
index 7f9ed17..68bdfaa 100644
--- a/hw/ppc4xx_devs.c
+++ b/hw/ppc4xx_devs.c
@@ -38,7 +38,7 @@
 #endif
 
 /*****************************************************************************/
-/* Generic PowerPC 4xx processor instanciation */
+/* Generic PowerPC 4xx processor instantiation */
 CPUState *ppc4xx_init (const char *cpu_model,
                        clk_setup_t *cpu_clk, clk_setup_t *tb_clk,
                        uint32_t sysclk)
diff --git a/target-ppc/translate_init.c b/target-ppc/translate_init.c
index e2a83c5..ed291c3 100644
--- a/target-ppc/translate_init.c
+++ b/target-ppc/translate_init.c
@@ -9049,7 +9049,7 @@ static const ppc_def_t ppc_defs[] = {
 };
 
 /*****************************************************************************/
-/* Generic CPU instanciation routine                                         */
+/* Generic CPU instantiation routine                                         */
 static void init_ppc_proc (CPUPPCState *env, const ppc_def_t *def)
 {
 #if !defined(CONFIG_USER_ONLY)
-- 
1.7.2.5


