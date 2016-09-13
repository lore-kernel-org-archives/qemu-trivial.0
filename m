Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bjqVo-0006f5-Vw
	for mharc-qemu-trivial@gnu.org; Tue, 13 Sep 2016 12:24:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44985)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bjqVj-0006YH-VP
	for qemu-trivial@nongnu.org; Tue, 13 Sep 2016 12:24:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bjqVi-0001lS-0T
	for qemu-trivial@nongnu.org; Tue, 13 Sep 2016 12:24:38 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:56272)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bjqVa-0001QI-Ob; Tue, 13 Sep 2016 12:24:30 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 2CB8E416E4;
	Tue, 13 Sep 2016 19:24:27 +0300 (MSK)
Received: from gandalf (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id EEE8DB0A;
	Tue, 13 Sep 2016 19:07:40 +0300 (MSK)
Received: (nullmailer pid 31894 invoked by uid 1000);
	Tue, 13 Sep 2016 16:07:39 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Tue, 13 Sep 2016 19:04:44 +0300
Message-Id: <bc82585a8fd5d38e7c2402999a7ccc9a97d762c9.1473782118.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1473782118.git.mjt@tls.msk.ru>
References: <cover.1473782118.git.mjt@tls.msk.ru>
In-Reply-To: <cover.1473782118.git.mjt@tls.msk.ru>
References: <cover.1473782118.git.mjt@tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 05/16] vl: remove unnecessary duplicate call
 to tpm_cleanup
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Sep 2016 16:24:41 -0000

From: Paolo Bonzini <pbonzini@redhat.com>

tpm_cleanup is called from main() and also registered with atexit from
tpm_init.  The function only visits the tpm_backends linked list, and the
atexit registration happens right after tpm_init fills in the list from
-tpmdev options.  Therefore, the direct call is unnecessary.  Remove it.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 vl.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/vl.c b/vl.c
index ee557a1..82cf85b 100644
--- a/vl.c
+++ b/vl.c
@@ -4620,9 +4620,6 @@ int main(int argc, char **argv, char **envp)
     bdrv_close_all();
     pause_all_vcpus();
     res_free();
-#ifdef CONFIG_TPM
-    tpm_cleanup();
-#endif
 
     /* vhost-user must be cleaned up before chardevs.  */
     net_cleanup();
-- 
2.1.4


