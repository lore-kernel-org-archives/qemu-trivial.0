Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1quAkG-0003Oh-Nq
	for mharc-qemu-trivial@gnu.org; Sat, 21 Oct 2023 08:06:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1quAkE-0003O3-4D; Sat, 21 Oct 2023 08:06:18 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1quAkA-00012u-0y; Sat, 21 Oct 2023 08:06:17 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 2E65C2C33A;
 Sat, 21 Oct 2023 15:05:54 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id D7C7B30688;
 Sat, 21 Oct 2023 15:05:28 +0300 (MSK)
Received: (nullmailer pid 220811 invoked by uid 1000);
 Sat, 21 Oct 2023 12:05:25 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 qemu-trivial@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Michael Tokarev <mjt@tls.msk.ru>
Subject: [PULL 12/17] MAINTAINERS: Adjust file list for PPC pseries machine
Date: Sat, 21 Oct 2023 15:05:14 +0300
Message-Id: <20231021120519.220720-13-mjt@tls.msk.ru>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231021120519.220720-1-mjt@tls.msk.ru>
References: <20231021120519.220720-1-mjt@tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 21 Oct 2023 12:06:19 -0000

From: Cédric Le Goater <clg@kaod.org>

The fdt.{c.h} files provide a helper routine used by the pseries and
pnv machines. Attached it to the list of the larger one: pseries.

Protected Execution Facility (PEF) is the confidential guest support
for PPC pseries machines.

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 MAINTAINERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index da5bff8ec0..303f4c7900 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1463,6 +1463,10 @@ F: hw/*/spapr*
 F: include/hw/*/spapr*
 F: hw/*/xics*
 F: include/hw/*/xics*
+F: include/hw/ppc/fdt.h
+F: hw/ppc/fdt.c
+F: include/hw/ppc/pef.h
+F: hw/ppc/pef.c
 F: pc-bios/slof.bin
 F: docs/system/ppc/pseries.rst
 F: docs/specs/ppc-spapr-*
-- 
2.39.2


