Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1X8JM2-0001BV-88
	for mharc-qemu-trivial@gnu.org; Fri, 18 Jul 2014 21:22:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46721)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1X8JLr-0000yG-Rn
	for qemu-trivial@nongnu.org; Fri, 18 Jul 2014 21:22:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1X8JLi-0007Bd-Qa
	for qemu-trivial@nongnu.org; Fri, 18 Jul 2014 21:22:15 -0400
Received: from mail-pa0-x229.google.com ([2607:f8b0:400e:c03::229]:42333)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>)
	id 1X8JLQ-0006wm-AX; Fri, 18 Jul 2014 21:21:48 -0400
Received: by mail-pa0-f41.google.com with SMTP id rd3so5882362pab.14
	for <multiple recipients>; Fri, 18 Jul 2014 18:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:content-type:content-transfer-encoding;
	bh=lcghf/G1OMUC3H0kl+vOb4Wejd7PNkQ6/T4CgajIdqI=;
	b=YH9d0zfJ2v3AMkGFKOhyBS6TEnGKQf66dg3KshJCDcwJGcwtHtsGYAx+h+oK5cJpHv
	kie1EcsgNLSwkRP4nzUoYA6hXFYHpiNUdzTeBnIkosHcVv2Tb7IrRHB434CctVgUg5Jr
	kLo8Pd9a5H5H70+E3f8O6O2Ui+6I4tq7gVk2C09kCuKHOgP2z5QNSk8a3XcGHnJsHc1u
	EvYLWj9OTY0xZAXC7rO3TQxUuonTplDplnFDevXIdNOYKyYS7pVkG/dRKEGqWEXzxqXH
	5K1m981cuBsR1p5h6PFyyVILV+dEub8dZyDTiPT/Ma6wHFyNe+ynUJm6g2VjgkjJLfi7
	s/yA==
X-Received: by 10.70.94.100 with SMTP id db4mr9402027pdb.122.1405732906544;
	Fri, 18 Jul 2014 18:21:46 -0700 (PDT)
Received: from [192.168.1.101] ([223.72.65.45])
	by mx.google.com with ESMTPSA id gu4sm6839899pbb.54.2014.07.18.18.21.44
	for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 18 Jul 2014 18:21:45 -0700 (PDT)
Message-ID: <53C9C82A.2060003@gmail.com>
Date: Sat, 19 Jul 2014 09:21:46 +0800
From: Chen Gang <gang.chen.5i5j@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130625 Thunderbird/17.0.7
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>, pbonzini@redhat.com
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c03::229
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org
Subject: [Qemu-trivial] [PATCH] kvm-all: Use 'tmpcpu' instead of 'cpu' in
 sub-looping to avoid 'cpu' be NULL
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
X-List-Received-Date: Sat, 19 Jul 2014 01:22:24 -0000

If kvm_arch_remove_sw_breakpoint() in CPU_FOREACH() always be fail, it
will let 'cpu' NULL. And the next kvm_arch_remove_sw_breakpoint() in
QTAILQ_FOREACH_SAFE() will get NULL parameter for 'cpu'.

And kvm_arch_remove_sw_breakpoint() can assumes 'cpu' must never be NULL,
so need define additional temporary variable for 'cpu' to avoid the case.


Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
---
 kvm-all.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/kvm-all.c b/kvm-all.c
index 3ae30ee..1402f4f 100644
--- a/kvm-all.c
+++ b/kvm-all.c
@@ -2077,12 +2077,13 @@ void kvm_remove_all_breakpoints(CPUState *cpu)
 {
     struct kvm_sw_breakpoint *bp, *next;
     KVMState *s = cpu->kvm_state;
+    CPUState *tmpcpu;
 
     QTAILQ_FOREACH_SAFE(bp, &s->kvm_sw_breakpoints, entry, next) {
         if (kvm_arch_remove_sw_breakpoint(cpu, bp) != 0) {
             /* Try harder to find a CPU that currently sees the breakpoint. */
-            CPU_FOREACH(cpu) {
-                if (kvm_arch_remove_sw_breakpoint(cpu, bp) == 0) {
+            CPU_FOREACH(tmpcpu) {
+                if (kvm_arch_remove_sw_breakpoint(tmpcpu, bp) == 0) {
                     break;
                 }
             }
-- 
1.7.11.7

