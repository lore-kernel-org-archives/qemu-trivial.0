Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nv3ao-0002x8-FP
	for mharc-qemu-trivial@gnu.org; Sat, 28 May 2022 17:03:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lkujaw@member.fsf.org>)
 id 1nv3an-0002wU-K8
 for qemu-trivial@nongnu.org; Sat, 28 May 2022 17:03:25 -0400
Received: from mout-u-107.mailbox.org ([2001:67c:2050:101:465::107]:35142)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <lkujaw@member.fsf.org>)
 id 1nv3al-0006s2-U4
 for qemu-trivial@nongnu.org; Sat, 28 May 2022 17:03:25 -0400
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-u-107.mailbox.org (Postfix) with ESMTPS id 4L9Yzs5Kjxz9sR2;
 Sat, 28 May 2022 23:03:21 +0200 (CEST)
From: Lev Kujawski <lkujaw@member.fsf.org>
To: qemu-trivial@nongnu.org
Cc: Lev Kujawski <lkujaw@member.fsf.org>
Subject: [PATCH 2/4] hw/ide/core: Clear LBA and drive bits for EXECUTE DEVICE
 DIAGNOSTIC
Date: Sat, 28 May 2022 21:02:48 +0000
Message-Id: <20220528210250.175832-2-lkujaw@member.fsf.org>
In-Reply-To: <20220528210250.175832-1-lkujaw@member.fsf.org>
References: <20220528210250.175832-1-lkujaw@member.fsf.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4L9Yzs5Kjxz9sR2
Received-SPF: pass client-ip=2001:67c:2050:101:465::107;
 envelope-from=lkujaw@member.fsf.org; helo=mout-u-107.mailbox.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Sat, 28 May 2022 21:03:25 -0000

Prior to this patch, cmd_exec_dev_diagnostic relied upon
ide_set_signature to clear the device register.  While the
preservation of the drive bit by ide_set_signature is necessary for
the DEVICE RESET, IDENTIFY DEVICE, and READ SECTOR commands,
ATA/ATAPI-6 specifies that "DEV shall be cleared to zero" for EXECUTE
DEVICE DIAGNOSTIC.

This deviation was uncovered by the ATACT Device Testing Program
written by Hale Landis.

Signed-off-by: Lev Kujawski <lkujaw@member.fsf.org>
---
 hw/ide/core.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/ide/core.c b/hw/ide/core.c
index c2caa54285..5a24547e49 100644
--- a/hw/ide/core.c
+++ b/hw/ide/core.c
@@ -1704,8 +1704,14 @@ static bool cmd_identify_packet(IDEState *s, uint8_t cmd)
     return false;
 }
 
+/* EXECUTE DEVICE DIAGNOSTIC */
 static bool cmd_exec_dev_diagnostic(IDEState *s, uint8_t cmd)
 {
+    /*
+     * Clear the device register per the ATA (v6) specification,
+     * because ide_set_signature does not clear LBA or drive bits.
+     */
+    s->select = (ATA_DEV_ALWAYS_ON);
     ide_set_signature(s);
 
     if (s->drive_kind == IDE_CD) {
-- 
2.34.1


