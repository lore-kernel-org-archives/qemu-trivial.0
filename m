Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RXZO6-0001uA-DE
	for mharc-qemu-trivial@gnu.org; Mon, 05 Dec 2011 09:19:22 -0500
Received: from eggs.gnu.org ([140.186.70.92]:46726)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1RXZNz-0001fz-Vz
	for qemu-trivial@nongnu.org; Mon, 05 Dec 2011 09:19:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1RXZNv-0000bA-UB
	for qemu-trivial@nongnu.org; Mon, 05 Dec 2011 09:19:15 -0500
Received: from goliath.siemens.de ([192.35.17.28]:21716)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>)
	id 1RXZNj-0000OO-HD; Mon, 05 Dec 2011 09:18:59 -0500
Received: from mail1.siemens.de (localhost [127.0.0.1])
	by goliath.siemens.de (8.13.6/8.13.6) with ESMTP id pB5EItDe003100;
	Mon, 5 Dec 2011 15:18:55 +0100
Received: from mchn199C.mchp.siemens.de ([139.25.109.49])
	by mail1.siemens.de (8.13.6/8.13.6) with ESMTP id pB5EIsuM016170;
	Mon, 5 Dec 2011 15:18:54 +0100
Message-ID: <4EDCD2CE.9080703@siemens.com>
Date: Mon, 05 Dec 2011 15:18:54 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de;
	rv:1.8.1.12) Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12
	Mnenhy/0.7.5.666
MIME-Version: 1.0
To: qemu-devel <qemu-devel@nongnu.org>, qemu-trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6, seldom 2.4 (older,
	4)
X-Received-From: 192.35.17.28
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [Qemu-trivial] [PATCH] Rename get_tls to tls_var
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
X-List-Received-Date: Mon, 05 Dec 2011 14:19:20 -0000

get_tls() can serve as a lvalue as well, so 'get' might be confusing.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 cpu-all.h  |    2 +-
 qemu-tls.h |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/cpu-all.h b/cpu-all.h
index 5f47ab8..8888016 100644
--- a/cpu-all.h
+++ b/cpu-all.h
@@ -336,7 +336,7 @@ void QEMU_NORETURN cpu_abort(CPUState *env, const char *fmt, ...)
     GCC_FMT_ATTR(2, 3);
 extern CPUState *first_cpu;
 DECLARE_TLS(CPUState *,cpu_single_env);
-#define cpu_single_env get_tls(cpu_single_env)
+#define cpu_single_env tls_var(cpu_single_env)
 
 /* Flags for use in ENV->INTERRUPT_PENDING.
 
diff --git a/qemu-tls.h b/qemu-tls.h
index 5b70f10..b92ea9d 100644
--- a/qemu-tls.h
+++ b/qemu-tls.h
@@ -41,12 +41,12 @@
 #ifdef __linux__
 #define DECLARE_TLS(type, x) extern DEFINE_TLS(type, x)
 #define DEFINE_TLS(type, x)  __thread __typeof__(type) tls__##x
-#define get_tls(x)           tls__##x
+#define tls_var(x)           tls__##x
 #else
 /* Dummy implementations which define plain global variables */
 #define DECLARE_TLS(type, x) extern DEFINE_TLS(type, x)
 #define DEFINE_TLS(type, x)  __typeof__(type) tls__##x
-#define get_tls(x)           tls__##x
+#define tls_var(x)           tls__##x
 #endif
 
 #endif
-- 
1.7.3.4

