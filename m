Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T9CKZ-00016o-JM
	for mharc-qemu-trivial@gnu.org; Wed, 05 Sep 2012 05:55:31 -0400
Received: from eggs.gnu.org ([208.118.235.92]:60430)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <riegamaths@gmail.com>) id 1T9CKR-0000lb-HN
	for qemu-trivial@nongnu.org; Wed, 05 Sep 2012 05:55:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <riegamaths@gmail.com>) id 1T9CKQ-0000lD-K0
	for qemu-trivial@nongnu.org; Wed, 05 Sep 2012 05:55:23 -0400
Received: from mail-pb0-f45.google.com ([209.85.160.45]:43599)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <riegamaths@gmail.com>)
	id 1T9CKJ-0000dq-PC; Wed, 05 Sep 2012 05:55:15 -0400
Received: by pbbjt11 with SMTP id jt11so689540pbb.4
	for <multiple recipients>; Wed, 05 Sep 2012 02:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=G3pMZbsHa3ObcEqKK7SxdQdvxSyWLRR8aF6n1Ny5emw=;
	b=Vr1pfWRqEjH7pMX2d7nOh9R1YdZzxzH5a3srkyfJFFg15wD7k9PjryR4R04pjfZCuz
	tR5Sl73U7Rb0gR2Lz+nrjTYxYXFUtvW3zPWGTqp0JHkemK17Y0dUjuFDPxUleDOltoR2
	UwQy7tSzDFQMjhZsFB8Oqs5qmMpwwPj03at7xkVDJ1WzTm2U1XZZMJxichouV/R1qAGq
	G96URKdmMy4Zs4KCF925Nuw8lqwfDGu1MxV5Jw7RaaU68bbGeNkdOCv5HjgBYa92z+/J
	jxcAIystY/yYSbiuon8KoPYlG3+NQGpTToTJ0ZI87WodZ6ucR4+tcob08x+Je7Sj8pmR
	nveA==
Received: by 10.68.240.7 with SMTP id vw7mr52910696pbc.152.1346838914662;
	Wed, 05 Sep 2012 02:55:14 -0700 (PDT)
Received: from localhost.localdomain ([221.122.32.18])
	by mx.google.com with ESMTPS id th6sm1100985pbc.0.2012.09.05.02.55.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Sep 2012 02:55:13 -0700 (PDT)
From: riegamaths@gmail.com
To: qemu-devel <qemu-devel@nongnu.org>
Date: Wed,  5 Sep 2012 17:55:32 +0800
Message-Id: <1346838932-29658-1-git-send-email-riegamaths@gmail.com>
X-Mailer: git-send-email 1.7.12
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.160.45
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	Dunrong Huang <riegamaths@gmail.com>
Subject: [Qemu-trivial] =?utf-8?q?=5BPATCH_v2=5D_block=3A_output_more_erro?=
	=?utf-8?q?r_messages_if_failed_to_create_temporary_snapshot?=
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
X-List-Received-Date: Wed, 05 Sep 2012 09:55:29 -0000

From: Dunrong Huang <riegamaths@gmail.com>

If we failed to create temporary snapshot, the error message did not match
with the error, for example:

$ TMPDIR=/tmp/bad_path qemu-system-x86_64 -enable-kvm debian.qcow2 -snapshot
qemu-system-x86_64: -enable-kvm: could not open disk image /home/mathslinux/Images/debian.qcow2: No such file or directory

Indeed, the file which cant be created is /tmp/bad_path/vl.xxxxxx,  not
debian.qcow2. so the error message makes users feel confused.

Signed-off-by: Dunrong Huang <riegamaths@gmail.com>
---
v1 -> v2:
   Output error message only if fd < 0
 block.c | 7 ++++++-
 1 个文件被修改，插入 6 行(+)，删除 1 行(-)

diff --git a/block.c b/block.c
index 470bdcc..2dd0c5b 100644
--- a/block.c
+++ b/block.c
@@ -433,7 +433,12 @@ int get_tmp_filename(char *filename, int size)
         return -EOVERFLOW;
     }
     fd = mkstemp(filename);
-    if (fd < 0 || close(fd)) {
+    if (fd < 0) {
+        fprintf(stderr, "Could not create temporary snapshot in %s directory: "
+                "%s\n", tmpdir, strerror(errno));
+        return -errno;
+    }
+    if (close(fd) != 0) {
         return -errno;
     }
     return 0;
-- 
1.7.12


