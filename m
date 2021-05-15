Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lhr9b-0006WZ-Nw
	for mharc-qemu-trivial@gnu.org; Sat, 15 May 2021 06:04:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lhr9Z-0006Lh-G0; Sat, 15 May 2021 06:04:13 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:40411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lhr9X-0006e6-MC; Sat, 15 May 2021 06:04:13 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue109
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MG9c2-1lixce3Seq-00GXiv; Sat, 15
 May 2021 12:03:49 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Michael Tokarev <mjt@tls.msk.ru>, Jagannathan Raman <jag.raman@oracle.com>,
 Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PULL 13/16] multi-process: Avoid logical AND of mutually exclusive
 tests
Date: Sat, 15 May 2021 12:03:32 +0200
Message-Id: <20210515100335.1245468-14-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210515100335.1245468-1-laurent@vivier.eu>
References: <20210515100335.1245468-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:wKEFFUEYjwLqI1sDGGQuygA6f1s9SMR6o6KI2F8NAe0dR40ZXa2
 R6+UGU4t2/7AJMktHz29hZNyUJKx1TBrdviZUHAxGNY/z+ZrJdDqcPG8gG9B/Pdlb4bh6x2
 v9pd8RwDIEogyh46TjhX7zlG1HWW1AIfSGsouK69X4QwSGu6mu9R/+/tb3fIAk+8ukHtPnm
 UJXH9sPrcmze11Yiq8L1A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:JCNeap1k60U=:rJMlMSshkDr7FmJ/UPA/oX
 PpP7Ce4eQSoP+J46PEHnsaZJSCIEzSGcm3T4p5VZufGOVjOrQr5gUx/W4dyEaVEWqVz+nMjOi
 dGkkkw6aDsXJKcA3Ioz2Odomc9g4jFQTncDOX4uytQ1PQSc2uayH3y4K3f0bi1vqqE2WL7ECP
 AzpVdsSdVk96vDLbLFJHz2acScP4tA5Fqq+cazW9q3SzZZ4levFy+TTB+Hf2h1agjx7fdItuI
 Y6HyH4ECHpbRwWGtZpxq2jfDKWYMSkWOdSVx4Tu1JwAFelRGzCsynlyk301tQWfVyMfShAcjZ
 vv/lmtOshYqIvQKGxZeofMgzlrTRduGV6V9c6x5xj+vR0rH2h01m2R+7BvsTHy57sweE6j4wG
 EF9xSgmUCxOaApjZUwvhY6A0Nun85m1l5vbTVkEnKNcCSxXK348fZZpGyuwDE1Ou0Tj+2HyvM
 qiiMigixp5jSBLSw1UNDR0D8VBq0SB7SxpIpCFMOWaZGLUVZzqnYRnHaPCA35C9h0s9+L3GEE
 pYTkLkktuCuQz0IlbftNuI=
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 15 May 2021 10:04:14 -0000

From: Jagannathan Raman <jag.raman@oracle.com>

Fixes an if statement that performs a logical AND of mutually exclusive
tests

Buglink: https://bugs.launchpad.net/qemu/+bug/1926995
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <1620402803-9237-1-git-send-email-jag.raman@oracle.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/remote/mpqemu-link.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/remote/mpqemu-link.c b/hw/remote/mpqemu-link.c
index 9ce31526e8f2..e67a5de72ca7 100644
--- a/hw/remote/mpqemu-link.c
+++ b/hw/remote/mpqemu-link.c
@@ -218,7 +218,7 @@ uint64_t mpqemu_msg_send_and_await_reply(MPQemuMsg *msg, PCIProxyDev *pdev,
 
 bool mpqemu_msg_valid(MPQemuMsg *msg)
 {
-    if (msg->cmd >= MPQEMU_CMD_MAX && msg->cmd < 0) {
+    if (msg->cmd >= MPQEMU_CMD_MAX || msg->cmd < 0) {
         return false;
     }
 
-- 
2.31.1


