Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nv3ae-0002cq-9U
	for mharc-qemu-trivial@gnu.org; Sat, 28 May 2022 17:03:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lkujaw@member.fsf.org>)
 id 1nv3ac-0002Yr-Q9
 for qemu-trivial@nongnu.org; Sat, 28 May 2022 17:03:14 -0400
Received: from mout-u-107.mailbox.org ([91.198.250.252]:40912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <lkujaw@member.fsf.org>)
 id 1nv3ab-0006qV-5E
 for qemu-trivial@nongnu.org; Sat, 28 May 2022 17:03:14 -0400
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-u-107.mailbox.org (Postfix) with ESMTPS id 4L9Yzf1M67z9sR2;
 Sat, 28 May 2022 23:03:10 +0200 (CEST)
From: Lev Kujawski <lkujaw@member.fsf.org>
To: qemu-trivial@nongnu.org
Cc: Lev Kujawski <lkujaw@member.fsf.org>
Subject: [PATCH 1/4] hw/ide/atapi.c: Correct typos (CD-CDROM -> CD-ROM)
Date: Sat, 28 May 2022 21:02:47 +0000
Message-Id: <20220528210250.175832-1-lkujaw@member.fsf.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4L9Yzf1M67z9sR2
Received-SPF: pass client-ip=91.198.250.252;
 envelope-from=lkujaw@member.fsf.org; helo=mout-u-107.mailbox.org
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
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
X-List-Received-Date: Sat, 28 May 2022 21:03:15 -0000

Signed-off-by: Lev Kujawski <lkujaw@member.fsf.org>
---
 hw/ide/atapi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/ide/atapi.c b/hw/ide/atapi.c
index b626199e3d..88b2890faf 100644
--- a/hw/ide/atapi.c
+++ b/hw/ide/atapi.c
@@ -318,7 +318,7 @@ static void ide_atapi_cmd_reply(IDEState *s, int size, int max_size)
     }
 }
 
-/* start a CD-CDROM read command */
+/* start a CD-ROM read command */
 static void ide_atapi_cmd_read_pio(IDEState *s, int lba, int nb_sectors,
                                    int sector_size)
 {
@@ -417,7 +417,7 @@ eot:
     ide_set_inactive(s, false);
 }
 
-/* start a CD-CDROM read command with DMA */
+/* start a CD-ROM read command with DMA */
 /* XXX: test if DMA is available */
 static void ide_atapi_cmd_read_dma(IDEState *s, int lba, int nb_sectors,
                                    int sector_size)
-- 
2.34.1


