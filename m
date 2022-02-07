Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nH44E-0003nJ-09
	for mharc-qemu-trivial@gnu.org; Mon, 07 Feb 2022 08:28:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ysato@users.sourceforge.jp>)
 id 1nH442-0003lG-Fi; Mon, 07 Feb 2022 08:28:21 -0500
Received: from mail10.asahi-net.or.jp ([202.224.55.50]:36438)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ysato@users.sourceforge.jp>)
 id 1nH43x-0003Kv-IA; Mon, 07 Feb 2022 08:28:16 -0500
Received: from sakura.ysato.name (ik1-413-38519.vs.sakura.ne.jp
 [153.127.30.23]) (Authenticated sender: PQ4Y-STU)
 by mail10.asahi-net.or.jp (Postfix) with ESMTPA id DBF25C288B;
 Mon,  7 Feb 2022 22:28:08 +0900 (JST)
Received: from SIOS1075.ysato.name (ZM005235.ppp.dion.ne.jp [222.8.5.235])
 by sakura.ysato.name (Postfix) with ESMTPSA id 459D61C01E7;
 Mon,  7 Feb 2022 22:28:08 +0900 (JST)
From: Yoshinori Sato <ysato@users.sourceforge.jp>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v3] hw/rx: rx-gdbsim DTB load address aligned of 16byte.
Date: Mon,  7 Feb 2022 22:27:58 +0900
Message-Id: <20220207132758.84403-1-ysato@users.sourceforge.jp>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=202.224.55.50;
 envelope-from=ysato@users.sourceforge.jp; helo=mail10.asahi-net.or.jp
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 07 Feb 2022 13:28:24 -0000

Linux kernel required alined address of DTB.
But missing align in dtb load function.
Fixed to load to the correct address.

v3 changes.
Fix round value.

v2 changes.
Use ROUND_DOWN macro.

Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/rx/rx-gdbsim.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/rx/rx-gdbsim.c b/hw/rx/rx-gdbsim.c
index 75d1fec6ca..887083737b 100644
--- a/hw/rx/rx-gdbsim.c
+++ b/hw/rx/rx-gdbsim.c
@@ -142,7 +142,7 @@ static void rx_gdbsim_init(MachineState *machine)
                 exit(1);
             }
             /* DTB is located at the end of SDRAM space. */
-            dtb_offset = machine->ram_size - dtb_size;
+            dtb_offset = ROUND_DOWN(machine->ram_size - dtb_size, 16);
             rom_add_blob_fixed("dtb", dtb, dtb_size,
                                SDRAM_BASE + dtb_offset);
             /* Set dtb address to R1 */
-- 
2.30.2


