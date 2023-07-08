Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qI0GC-0006MT-9D
	for mharc-qemu-trivial@gnu.org; Sat, 08 Jul 2023 01:13:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1qI0Fs-0006FI-Sc; Sat, 08 Jul 2023 01:13:16 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1qI0Fr-0001il-6I; Sat, 08 Jul 2023 01:13:12 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id F2D6412680;
 Sat,  8 Jul 2023 08:13:06 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id 3AC17139CE;
 Sat,  8 Jul 2023 08:13:03 +0300 (MSK)
Received: (nullmailer pid 3229977 invoked by uid 1000);
 Sat, 08 Jul 2023 05:13:03 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Weiwei Li <liweiwei@iscas.ac.cn>, Michael Tokarev <mjt@tls.msk.ru>
Subject: [PULL 01/10] hw/riscv/virt.c: fix typo in 'aia' description
Date: Sat,  8 Jul 2023 08:12:41 +0300
Message-Id: <c92ac07c4a4991c1e1e3d0c8c9b2516b2592c7da.1688793073.git.mjt@tls.msk.ru>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1688793073.git.mjt@tls.msk.ru>
References: <cover.1688793073.git.mjt@tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sat, 08 Jul 2023 05:13:21 -0000

From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Cc: qemu-trivial@nongnu.org
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/riscv/virt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index ed4c27487e..68ccd0bde1 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1692,7 +1692,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
                                   virt_set_aia);
     object_class_property_set_description(oc, "aia",
                                           "Set type of AIA interrupt "
-                                          "conttoller. Valid values are "
+                                          "controller. Valid values are "
                                           "none, aplic, and aplic-imsic.");
 
     object_class_property_add_str(oc, "aia-guests",
-- 
2.39.2


