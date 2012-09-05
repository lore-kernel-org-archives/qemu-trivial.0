Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T9FcF-0004FJ-B3
	for mharc-qemu-trivial@gnu.org; Wed, 05 Sep 2012 09:25:59 -0400
Received: from eggs.gnu.org ([208.118.235.92]:49875)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <riegamaths@gmail.com>) id 1T9FcC-00046t-Cg
	for qemu-trivial@nongnu.org; Wed, 05 Sep 2012 09:25:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <riegamaths@gmail.com>) id 1T9Fc8-0002ow-5h
	for qemu-trivial@nongnu.org; Wed, 05 Sep 2012 09:25:56 -0400
Received: from mail-pz0-f45.google.com ([209.85.210.45]:56323)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <riegamaths@gmail.com>)
	id 1T9Fby-0002oV-1P; Wed, 05 Sep 2012 09:25:42 -0400
Received: by dadn15 with SMTP id n15so378542dad.4
	for <multiple recipients>; Wed, 05 Sep 2012 06:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=uxUshLtLl4OtJvRKq4ZAmHgpEARuP1j6ykGNG0N5N5A=;
	b=povCCym2Borw7Vm73Sz4oH+kyizxQH22CqBkkb0TQKdcjPNNSrMh2OK4kiG2oBDLLK
	50U+SPUDWXMdyDtLdvJeRWW7wS1tOaneZhUxqBwwUPzSiEAM56vIbaN1h6+b5ihfCxXT
	WrrySu0n6w1I0/VniY200CljjJX05mhx03Bw5+nKOjVG97+IWCVNjrDLeiAD0ikNvQCy
	NMLDFVFh1ZggeHyHHz2R9QKl1/61dQnF5uxhfJwH5p+IR4mXXJE2WlYkEz2n84wLbxA9
	ZM+gRaLt7BnzqDMa2iJMLr/WPvbgOUf/DllTaKVpEootEbERPmLaQhN6Kr3GTHQ9EjAM
	V8gQ==
Received: by 10.68.240.66 with SMTP id vy2mr54227691pbc.73.1346851541151;
	Wed, 05 Sep 2012 06:25:41 -0700 (PDT)
Received: from localhost.localdomain ([106.3.103.158])
	by mx.google.com with ESMTPS id hf1sm1429919pbc.42.2012.09.05.06.25.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Sep 2012 06:25:39 -0700 (PDT)
From: riegamaths@gmail.com
To: qemu-devel <qemu-devel@nongnu.org>
Date: Wed,  5 Sep 2012 21:24:53 +0800
Message-Id: <1346851493-9149-1-git-send-email-riegamaths@gmail.com>
X-Mailer: git-send-email 1.7.12
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.210.45
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	Dunrong Huang <riegamaths@gmail.com>
Subject: [Qemu-trivial] =?utf-8?q?=5BPATCH_v3=5D_block=3A_output_more_erro?=
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
X-List-Received-Date: Wed, 05 Sep 2012 13:25:58 -0000

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
v2 -> v3:
   Output error message in the caller of get_tmp_filename()
 block.c | 2 ++
 1 个文件被修改，插入 2 行(+)

diff --git a/block.c b/block.c
index 470bdcc..074987e 100644
--- a/block.c
+++ b/block.c
@@ -764,6 +764,8 @@ int bdrv_open(BlockDriverState *bs, const char *filename, int flags,
 
         ret = get_tmp_filename(tmp_filename, sizeof(tmp_filename));
         if (ret < 0) {
+            fprintf(stderr, "Could not create temporary snapshot %s: %s\n",
+                    tmp_filename, strerror(errno));
             return ret;
         }
 
-- 
1.7.12


