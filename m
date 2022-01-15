Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nBe10-0008M8-CP
	for mharc-qemu-trivial@gnu.org; Sun, 23 Jan 2022 09:38:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <belyshev@depni.sinp.msu.ru>)
 id 1nBZto-0002wG-4U; Sun, 23 Jan 2022 05:15:04 -0500
Received: from depni-mx.sinp.msu.ru ([213.131.7.21]:39483)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <belyshev@depni.sinp.msu.ru>)
 id 1nBZtm-0003q9-9A; Sun, 23 Jan 2022 05:15:03 -0500
Received: from spider (unknown [176.195.59.180])
 by depni-mx.sinp.msu.ru (Postfix) with ESMTPSA id 392321BF45A;
 Sun, 23 Jan 2022 13:15:14 +0300 (MSK)
From: Serge Belyshev <belyshev@depni.sinp.msu.ru>
To: qemu-devel@nongnu.org
Subject: [PATCH] linux-user/alpha: Fix target rlimits for alpha and
 rearrange for clarity
Date: Sat, 15 Jan 2022 14:32:35 +0300
CC: Laurent Vivier <laurent@vivier.eu>, qemu-trivial@nongnu.org
Message-ID: <87y236lpwb.fsf@depni.sinp.msu.ru>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/29.0.50 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: none client-ip=213.131.7.21;
 envelope-from=belyshev@depni.sinp.msu.ru; helo=depni-mx.sinp.msu.ru
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_96_XX=3.405,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 23 Jan 2022 09:38:45 -0500
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
X-List-Received-Date: Sun, 23 Jan 2022 10:15:04 -0000

Alpha uses different values of some TARGET_RLIMIT_* constants, which were
missing and caused bugs like #577, fixed thus.  Also rearranged all three
(alpha, mips and sparc) that differ from everyone else for clarity.

Signed-off-by: Serge Belyshev <belyshev@depni.sinp.msu.ru>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/577
---
 linux-user/syscall_defs.h | 31 ++++++++++++++-----------------
 1 file changed, 14 insertions(+), 17 deletions(-)

diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index f23f0a2178..3fcabaeae3 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -730,44 +730,41 @@ struct target_rlimit {
 #define TARGET_RLIM_INFINITY	((abi_ulong)-1)
 #endif
 
-#if defined(TARGET_MIPS)
 #define TARGET_RLIMIT_CPU		0
 #define TARGET_RLIMIT_FSIZE		1
 #define TARGET_RLIMIT_DATA		2
 #define TARGET_RLIMIT_STACK		3
 #define TARGET_RLIMIT_CORE		4
+#if defined(TARGET_MIPS)
+#define TARGET_RLIMIT_NOFILE		5
+#define TARGET_RLIMIT_AS		6
 #define TARGET_RLIMIT_RSS		7
 #define TARGET_RLIMIT_NPROC		8
-#define TARGET_RLIMIT_NOFILE		5
 #define TARGET_RLIMIT_MEMLOCK		9
-#define TARGET_RLIMIT_AS		6
-#define TARGET_RLIMIT_LOCKS		10
-#define TARGET_RLIMIT_SIGPENDING	11
-#define TARGET_RLIMIT_MSGQUEUE		12
-#define TARGET_RLIMIT_NICE		13
-#define TARGET_RLIMIT_RTPRIO		14
-#else
-#define TARGET_RLIMIT_CPU		0
-#define TARGET_RLIMIT_FSIZE		1
-#define TARGET_RLIMIT_DATA		2
-#define TARGET_RLIMIT_STACK		3
-#define TARGET_RLIMIT_CORE		4
+#elif defined(TARGET_ALPHA)
+#define TARGET_RLIMIT_RSS		5
+#define TARGET_RLIMIT_NOFILE		6
+#define TARGET_RLIMIT_AS		7
+#define TARGET_RLIMIT_NPROC		8
+#define TARGET_RLIMIT_MEMLOCK		9
+#elif defined(TARGET_SPARC)
 #define TARGET_RLIMIT_RSS		5
-#if defined(TARGET_SPARC)
 #define TARGET_RLIMIT_NOFILE		6
 #define TARGET_RLIMIT_NPROC		7
+#define TARGET_RLIMIT_MEMLOCK		8
+#define TARGET_RLIMIT_AS		9
 #else
+#define TARGET_RLIMIT_RSS		5
 #define TARGET_RLIMIT_NPROC		6
 #define TARGET_RLIMIT_NOFILE		7
-#endif
 #define TARGET_RLIMIT_MEMLOCK		8
 #define TARGET_RLIMIT_AS		9
+#endif
 #define TARGET_RLIMIT_LOCKS		10
 #define TARGET_RLIMIT_SIGPENDING	11
 #define TARGET_RLIMIT_MSGQUEUE		12
 #define TARGET_RLIMIT_NICE		13
 #define TARGET_RLIMIT_RTPRIO		14
-#endif
 
 struct target_pollfd {
     int fd;           /* file descriptor */
-- 
2.34.1


