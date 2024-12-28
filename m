Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tRVea-0007V1-4Z
	for mharc-qemu-trivial@gnu.org; Sat, 28 Dec 2024 07:10:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1tRVeE-0007TN-6w; Sat, 28 Dec 2024 07:10:30 -0500
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1tRVeC-0001oF-Ib; Sat, 28 Dec 2024 07:10:25 -0500
Received: from localhost.tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by isrv.corpit.ru (Postfix) with ESMTP id EE458CC84F;
 Sat, 28 Dec 2024 15:09:39 +0300 (MSK)
Received: by localhost.tls.msk.ru (Postfix, from userid 1000)
 id 544DF4616C; Sat, 28 Dec 2024 14:54:46 +0300 (MSK)
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Han Han <hhan@redhat.com>, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>
Subject: [PULL 08/11] target/i386/cpu: Fix notes for CPU models
Date: Sat, 28 Dec 2024 14:54:43 +0300
Message-Id: <20241228115446.2478706-9-mjt@tls.msk.ru>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241228115446.2478706-1-mjt@tls.msk.ru>
References: <20241228115446.2478706-1-mjt@tls.msk.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-List-Received-Date: Sat, 28 Dec 2024 12:10:36 -0000

From: Han Han <hhan@redhat.com>

Fixes: 644e3c5d812 ("missing vmx features for Skylake-Server and Cascadelake-Server")
Signed-off-by: Han Han <hhan@redhat.com>
Reviewed-by: Chenyi Qiang <chenyi.qiang@intel.com>
Reviewed-by: Michael Tokarev <mjt@tls.msk.ru>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 target/i386/cpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 660ddafc28..0b639848cd 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -3692,6 +3692,7 @@ static const X86CPUDefinition builtin_x86_defs[] = {
             },
             {
                 .version = 4,
+                .note = "IBRS, EPT switching, no TSX",
                 .props = (PropValue[]) {
                     { "vmx-eptp-switching", "on" },
                     { /* end of list */ }
@@ -3826,7 +3827,7 @@ static const X86CPUDefinition builtin_x86_defs[] = {
               },
             },
             { .version = 4,
-              .note = "ARCH_CAPABILITIES, no TSX",
+              .note = "ARCH_CAPABILITIES, EPT switching, no TSX",
               .props = (PropValue[]) {
                   { "vmx-eptp-switching", "on" },
                   { /* end of list */ }
-- 
2.39.5


