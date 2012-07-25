Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1StzVU-0001DR-PW
	for mharc-qemu-trivial@gnu.org; Wed, 25 Jul 2012 07:11:56 -0400
Received: from eggs.gnu.org ([208.118.235.92]:41031)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <riegamaths@gmail.com>) id 1StzVR-00014C-Qj
	for qemu-trivial@nongnu.org; Wed, 25 Jul 2012 07:11:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <riegamaths@gmail.com>) id 1StzVN-0004Hb-4N
	for qemu-trivial@nongnu.org; Wed, 25 Jul 2012 07:11:53 -0400
Received: from mail-yx0-f173.google.com ([209.85.213.173]:34995)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <riegamaths@gmail.com>)
	id 1StzVH-0004GS-Bg; Wed, 25 Jul 2012 07:11:43 -0400
Received: by yenl1 with SMTP id l1so540474yen.4
	for <multiple recipients>; Wed, 25 Jul 2012 04:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=japWjcgA92m0nFyCH0sgFPb/BZDlqUZhcyUu3TDDJr0=;
	b=egc40vCu7DSayuY/5QmJJEjZ5YgL7ypVWItz3O96XOKbiZD0Es+eDHdWtPBSHosKeZ
	fnCkUqV3nB6Fc8Zr+uP2JWZ0Ql0dQx0p7VC9W5DAA9l4Zynz9k7gagpylcU5fXB1k1wH
	TQQagi9eqsjBCVltplRz02NKj+JOaBBGh9zpGrzG6cFnvATOFs8XvjQZAZYHmziITqoL
	EtwfowEHmK+t//Yw3K8p/5liLI/8u0F192NNfKMkbCKs/cXYQQwQ/Y+qGyKV+PaMzbno
	TGcU5Hvv677bmssZVHtIS1MXVHycuXenAAJjDNQfTn9OHPw7UXDa7YPpTJ/dUKLjPmoH
	uyqA==
Received: by 10.66.81.232 with SMTP id d8mr11932067pay.66.1343214702105;
	Wed, 25 Jul 2012 04:11:42 -0700 (PDT)
Received: from localhost.localdomain ([111.196.220.100])
	by mx.google.com with ESMTPS id nh8sm14184850pbc.60.2012.07.25.04.11.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 25 Jul 2012 04:11:41 -0700 (PDT)
From: riegamaths@gmail.com
To: qemu-devel <qemu-devel@nongnu.org>
Date: Wed, 25 Jul 2012 19:11:51 +0800
Message-Id: <1343214711-24336-1-git-send-email-riegamaths@gmail.com>
X-Mailer: git-send-email 1.7.8.6
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.213.173
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <andreas.faerber@web.de>,
	Anthony Liguori <aliguori@us.ibm.com>,
	Dunrong Huang <riegamaths@gmail.com>,
	Stefan Hajnoczi <stefanha@linux.vnet.ibm.com>
Subject: [Qemu-trivial] [PATCH v2] vl.c: Fix max_cpus
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
X-List-Received-Date: Wed, 25 Jul 2012 11:11:55 -0000

From: Dunrong Huang <riegamaths@gmail.com>

The VCPU count limit in kernel now is 254, defined by KVM_MAX_VCPUS
in kernel's header files. But the count limit in QEMU is 255,
so QEMU will failed to start if user passes "-enable-kvm" and "-smp 255"
to it.

Exit QEMU with an error if KVM is enabled and number of SMP cpus requested
exceeds KVM_MAX_VCPUS.

Signed-off-by: Dunrong Huang <riegamaths@gmail.com>
---
v1 -> v2:
Checking if the number of smp cpus requested exceeds KVM limit count
if and only if kvm is enabled.

 vl.c |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/vl.c b/vl.c
index 8904db1..cdd1c96 100644
--- a/vl.c
+++ b/vl.c
@@ -169,6 +169,11 @@ int main(int argc, char **argv)
 
 #define MAX_VIRTIO_CONSOLES 1
 
+/* KVM_MAX_VCPUS defined in kernel's header files */
+#ifndef KVM_MAX_VCPUS
+#define KVM_MAX_VCPUS 254
+#endif
+
 static const char *data_dir;
 const char *bios_name = NULL;
 enum vga_retrace_method vga_retrace_method = VGA_RETRACE_DUMB;
@@ -3348,6 +3353,12 @@ int main(int argc, char **argv, char **envp)
 
     configure_accelerator();
 
+    if (kvm_enabled() && smp_cpus > KVM_MAX_VCPUS) {
+        fprintf(stderr, "Number of SMP cpus requested (%d) exceeds max cpus "
+                "supported by KVM (%d)\n", smp_cpus, KVM_MAX_VCPUS);
+        exit(1);
+    }
+
     qemu_init_cpu_loop();
     if (qemu_init_main_loop()) {
         fprintf(stderr, "qemu_init_main_loop failed\n");
-- 
1.7.8.6


