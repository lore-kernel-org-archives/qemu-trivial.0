Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WuPqU-0000iw-O3
	for mharc-qemu-trivial@gnu.org; Tue, 10 Jun 2014 13:28:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54854)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WuPqL-0000T3-Mk
	for qemu-trivial@nongnu.org; Tue, 10 Jun 2014 13:28:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WuPqC-0000V5-AS
	for qemu-trivial@nongnu.org; Tue, 10 Jun 2014 13:28:17 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:45475)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WuPpy-0000Rh-Pm; Tue, 10 Jun 2014 13:27:54 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 98687412D9;
	Tue, 10 Jun 2014 21:27:53 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 8D3F36DF;
	Tue, 10 Jun 2014 20:08:51 +0400 (MSK)
Received: (nullmailer pid 13332 invoked by uid 1000);
	Tue, 10 Jun 2014 16:08:47 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 10 Jun 2014 20:08:38 +0400
Message-Id: <1402416523-13212-21-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1402416523-13212-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1402416523-13212-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 20/25] cpu/x86: correctly set errors in
	x86_cpu_parse_featurestr
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
X-List-Received-Date: Tue, 10 Jun 2014 17:28:23 -0000

From: Paolo Bonzini <pbonzini@redhat.com>

Because of the "goto out", the contents of local_err are leaked
and lost.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 target-i386/cpu.c |   17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/target-i386/cpu.c b/target-i386/cpu.c
index dde052c..8983457 100644
--- a/target-i386/cpu.c
+++ b/target-i386/cpu.c
@@ -1688,8 +1688,8 @@ static void x86_cpu_parse_featurestr(CPUState *cs, char *features,
 
                 numvalue = strtoul(val, &err, 0);
                 if (!*val || *err) {
-                    error_setg(&local_err, "bad numerical value %s", val);
-                    goto out;
+                    error_setg(errp, "bad numerical value %s", val);
+                    return;
                 }
                 if (numvalue < 0x80000000) {
                     error_report("xlevel value shall always be >= 0x80000000"
@@ -1706,8 +1706,8 @@ static void x86_cpu_parse_featurestr(CPUState *cs, char *features,
                 tsc_freq = strtosz_suffix_unit(val, &err,
                                                STRTOSZ_DEFSUFFIX_B, 1000);
                 if (tsc_freq < 0 || *err) {
-                    error_setg(&local_err, "bad numerical value %s", val);
-                    goto out;
+                    error_setg(errp, "bad numerical value %s", val);
+                    return;
                 }
                 snprintf(num, sizeof(num), "%" PRId64, tsc_freq);
                 object_property_parse(OBJECT(cpu), num, "tsc-frequency",
@@ -1718,8 +1718,8 @@ static void x86_cpu_parse_featurestr(CPUState *cs, char *features,
                 char num[32];
                 numvalue = strtoul(val, &err, 0);
                 if (!*val || *err) {
-                    error_setg(&local_err, "bad numerical value %s", val);
-                    goto out;
+                    error_setg(errp, "bad numerical value %s", val);
+                    return;
                 }
                 if (numvalue < min) {
                     error_report("hv-spinlocks value shall always be >= 0x%x"
@@ -1738,7 +1738,7 @@ static void x86_cpu_parse_featurestr(CPUState *cs, char *features,
         }
         if (local_err) {
             error_propagate(errp, local_err);
-            goto out;
+            return;
         }
         featurestr = strtok(NULL, ",");
     }
@@ -1758,9 +1758,6 @@ static void x86_cpu_parse_featurestr(CPUState *cs, char *features,
     env->features[FEAT_KVM] &= ~minus_features[FEAT_KVM];
     env->features[FEAT_SVM] &= ~minus_features[FEAT_SVM];
     env->features[FEAT_7_0_EBX] &= ~minus_features[FEAT_7_0_EBX];
-
-out:
-    return;
 }
 
 /* generate a composite string into buf of all cpuid names in featureset
-- 
1.7.10.4


