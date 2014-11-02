Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xku6N-0005Jj-Tl
	for mharc-qemu-trivial@gnu.org; Sun, 02 Nov 2014 07:17:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54505)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xku6G-00053u-G3
	for qemu-trivial@nongnu.org; Sun, 02 Nov 2014 07:17:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xku6B-0007LQ-Hp
	for qemu-trivial@nongnu.org; Sun, 02 Nov 2014 07:17:40 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:40395)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Xku61-0007FZ-As; Sun, 02 Nov 2014 07:17:25 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 5F6E8402C6;
	Sun,  2 Nov 2014 15:17:23 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id C102F720;
	Sun,  2 Nov 2014 14:58:49 +0300 (MSK)
Received: (nullmailer pid 14991 invoked by uid 1000);
	Sun, 02 Nov 2014 11:58:47 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Sun,  2 Nov 2014 14:57:32 +0300
Message-Id: <bb019cf911ee4a152e3b31940d702d7b8a8b8114.1414929285.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
References: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
References: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Eduardo Habkost <ehabkost@redhat.com>
Subject: [Qemu-trivial] [PULL 20/23] target-i386: Remove unused
	model_features_t struct
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
X-List-Received-Date: Sun, 02 Nov 2014 12:17:45 -0000

From: Eduardo Habkost <ehabkost@redhat.com>

The struct is not used anymore and can be removed.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 target-i386/cpu.c |    8 --------
 1 file changed, 8 deletions(-)

diff --git a/target-i386/cpu.c b/target-i386/cpu.c
index e194601..e4ccee1 100644
--- a/target-i386/cpu.c
+++ b/target-i386/cpu.c
@@ -442,14 +442,6 @@ const char *get_register_name_32(unsigned int reg)
     return x86_reg_info_32[reg].name;
 }
 
-/* collects per-function cpuid data
- */
-typedef struct model_features_t {
-    uint32_t *guest_feat;
-    uint32_t *host_feat;
-    FeatureWord feat_word;
-} model_features_t;
-
 /* KVM-specific features that are automatically added to all CPU models
  * when KVM is enabled.
  */
-- 
1.7.10.4


