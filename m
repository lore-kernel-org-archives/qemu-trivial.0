Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XXZZb-0004ha-Ho
	for mharc-qemu-trivial@gnu.org; Fri, 26 Sep 2014 13:44:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36806)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XXZZU-0004U8-Kj
	for qemu-trivial@nongnu.org; Fri, 26 Sep 2014 13:44:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XXZZQ-000610-5J
	for qemu-trivial@nongnu.org; Fri, 26 Sep 2014 13:44:44 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:42138)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XXZZC-0005vf-5L; Fri, 26 Sep 2014 13:44:26 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id F044446F67;
	Fri, 26 Sep 2014 21:44:19 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 3824E6C6;
	Fri, 26 Sep 2014 21:36:19 +0400 (MSK)
Received: (nullmailer pid 29116 invoked by uid 1000);
	Fri, 26 Sep 2014 17:36:18 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri, 26 Sep 2014 21:36:10 +0400
Message-Id: <1411752976-29051-7-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1411752976-29051-1-git-send-email-mjt@tls.msk.ru>
References: <1411752976-29051-1-git-send-email-mjt@tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Adrian-Ken Rueegsegger <ken@codelabs.ch>
Subject: [Qemu-trivial] [PULL 06/12] vmxcap: Update according to SDM of
	September 2014
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
X-List-Received-Date: Fri, 26 Sep 2014 17:44:49 -0000

From: Adrian-Ken Rueegsegger <ken@codelabs.ch>

This adds reporting of RDSEED exiting and XSAVES/XRSTORS #UD and fixes
the range of VMCS revision as well as some typos.

Signed-off-by: Adrian-Ken Rueegsegger <ken@codelabs.ch>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 scripts/kvm/vmxcap |   10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/scripts/kvm/vmxcap b/scripts/kvm/vmxcap
index c90eda4..8f0371f 100755
--- a/scripts/kvm/vmxcap
+++ b/scripts/kvm/vmxcap
@@ -99,7 +99,7 @@ controls = [
     Misc(
         name = 'Basic VMX Information',
         bits = {
-            (0, 31): 'Revision',
+            (0, 30): 'Revision',
             (32,44): 'VMCS size',
             48: 'VMCS restricted to 32 bit addresses',
             49: 'Dual-monitor support',
@@ -169,7 +169,9 @@ controls = [
             12: 'Enable INVPCID',
             13: 'Enable VM functions',
             14: 'VMCS shadowing',
-            18: 'EPT-violation #VE'
+            16: 'RDSEED exiting',
+            18: 'EPT-violation #VE',
+            20: 'Enable XSAVES/XRSTORS',
             },
         cap_msr = MSR_IA32_VMX_PROCBASED_CTLS2,
         ),
@@ -195,7 +197,7 @@ controls = [
         name = 'VM-Entry controls',
         bits = {
             2: 'Load debug controls',
-            9: 'IA-64 mode guest',
+            9: 'IA-32e mode guest',
             10: 'Entry to SMM',
             11: 'Deactivate dual-monitor treatment',
             13: 'Load IA32_PERF_GLOBAL_CTRL',
@@ -216,7 +218,7 @@ controls = [
             8: 'Wait-for-SIPI activity state',
             15: 'IA32_SMBASE support',
             (16,24): 'Number of CR3-target values',
-            (25,27): 'MSR-load/store count recommenation',
+            (25,27): 'MSR-load/store count recommendation',
             28: 'IA32_SMM_MONITOR_CTL[2] can be set to 1',
             29: 'VMWRITE to VM-exit information fields',
             (32,63): 'MSEG revision identifier',
-- 
1.7.10.4


