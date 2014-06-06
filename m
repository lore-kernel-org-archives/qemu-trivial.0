Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wsu67-000778-S6
	for mharc-qemu-trivial@gnu.org; Fri, 06 Jun 2014 09:22:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54862)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1Wsu5w-0006nN-JE
	for qemu-trivial@nongnu.org; Fri, 06 Jun 2014 09:22:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1Wsu5n-0000gg-JJ
	for qemu-trivial@nongnu.org; Fri, 06 Jun 2014 09:22:08 -0400
Received: from mail-qg0-x22d.google.com ([2607:f8b0:400d:c04::22d]:58047)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1Wsu5V-0000PA-4N; Fri, 06 Jun 2014 09:21:41 -0400
Received: by mail-qg0-f45.google.com with SMTP id z60so4260259qgd.4
	for <multiple recipients>; Fri, 06 Jun 2014 06:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=ku3Ex+/iRDDWkQryiSJemfl4MZiFfFLdAlbC8ibl9s8=;
	b=avlb/Kl+Hi/uRoOHqurGI6nTL0/xy2I+vbrBKZrnCGSReHiHCgV8A3TLsgKq2uOkdj
	p4RsY7o07e6RL+kDKH3oKq+GHgaxM9ao9Le1WAROrCIutSqD0PCaoAkm/AbANayoaT53
	MDxEmUwK9k1ZTLCZvR4da85RX7gspv6B9zaEbyceAv1/m2INEUtaqvTHp6XWMsAOQrCP
	I/XB2MxxgvTeamIb48Arp7zVkZempxnE2rew1gh08/51FVnNDCgXqYrHiX7M6ADA4i4R
	DoAX//NMr6ARM6S3q3AwDyzOrBAJnUw4GpyB6ghXuxVUlb+P9dGdz7lTFEpCXlCmQ+jV
	JyFA==
X-Received: by 10.140.26.196 with SMTP id 62mr8012736qgv.37.1402060900622;
	Fri, 06 Jun 2014 06:21:40 -0700 (PDT)
Received: from yakj.usersys.redhat.com (net-37-117-132-7.cust.vodafonedsl.it.
	[37.117.132.7])
	by mx.google.com with ESMTPSA id j97sm5782033qgd.37.2014.06.06.06.21.39
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Jun 2014 06:21:40 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri,  6 Jun 2014 15:21:25 +0200
Message-Id: <1402060885-18332-1-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.9.3
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c04::22d
Cc: qemu-trivial@nongnu.org, armbru@redhat.com
Subject: [Qemu-trivial] [PATCH] cpu/x86: correctly set errors in
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
X-List-Received-Date: Fri, 06 Jun 2014 13:22:17 -0000

Because of the "goto out", the contents of local_err are leaked
and lost.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target-i386/cpu.c | 17 +++++++----------
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
1.9.3


