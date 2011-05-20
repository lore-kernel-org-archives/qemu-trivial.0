Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QNLkY-0000MP-2a
	for mharc-qemu-trivial@gnu.org; Fri, 20 May 2011 05:12:02 -0400
Received: from eggs.gnu.org ([140.186.70.92]:37199)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1QNLkV-0000Ga-CH
	for qemu-trivial@nongnu.org; Fri, 20 May 2011 05:12:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1QNLkU-0007Vl-Fc
	for qemu-trivial@nongnu.org; Fri, 20 May 2011 05:11:59 -0400
Received: from mnementh.archaic.org.uk ([81.2.115.146]:55082)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1QNLkR-0007VR-TK; Fri, 20 May 2011 05:11:56 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.72)
	(envelope-from <pm215@archaic.org.uk>)
	id 1QNLkP-0006Vc-Gk; Fri, 20 May 2011 10:11:53 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri, 20 May 2011 10:11:53 +0100
Message-Id: <1305882713-24997-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 81.2.115.146
Cc: qemu-trivial@nongnu.org, patches@linaro.org
Subject: [Qemu-trivial] [PATCH] hw/sd.c: Don't complain about SDIO commands
	CMD52/CMD53
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
X-List-Received-Date: Fri, 20 May 2011 09:12:00 -0000

The SDIO specification introduces new commands 52 and 53.
Handle as illegal command but do not complain on stderr,
as SDIO-aware OSes (including Linux) may legitimately use
these in their probing for presence of an SDIO card.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/sd.c |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/hw/sd.c b/hw/sd.c
index f44a970..cedfb20 100644
--- a/hw/sd.c
+++ b/hw/sd.c
@@ -1104,6 +1104,17 @@ static sd_rsp_type_t sd_normal_command(SDState *sd,
         }
         break;
 
+    case 52:
+    case 53:
+        /* CMD52, CMD53: reserved for SDIO cards
+         * (see the SDIO Simplified Specification V2.0)
+         * Handle as illegal command but do not complain
+         * on stderr, as some OSes may use these in their
+         * probing for presence of an SDIO card.
+         */
+        sd->card_status |= ILLEGAL_COMMAND;
+        return sd_r0;
+
     /* Application specific commands (Class 8) */
     case 55:	/* CMD55:  APP_CMD */
         if (sd->rca != rca)
-- 
1.7.1


