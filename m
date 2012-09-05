Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T9AxA-0005WH-94
	for mharc-qemu-trivial@gnu.org; Wed, 05 Sep 2012 04:27:16 -0400
Received: from eggs.gnu.org ([208.118.235.92]:39164)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <riegamaths@gmail.com>) id 1T9Ax1-0005AL-Cl
	for qemu-trivial@nongnu.org; Wed, 05 Sep 2012 04:27:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <riegamaths@gmail.com>) id 1T9Awx-00056l-Gc
	for qemu-trivial@nongnu.org; Wed, 05 Sep 2012 04:27:07 -0400
Received: from mail-pb0-f45.google.com ([209.85.160.45]:48671)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <riegamaths@gmail.com>)
	id 1T9Awv-000560-Aj; Wed, 05 Sep 2012 04:27:01 -0400
Received: by pbbjt11 with SMTP id jt11so578998pbb.4
	for <multiple recipients>; Wed, 05 Sep 2012 01:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=mBwhJTZRnFsmd2Mn1EZTxaFtlUV2a/6Zx2HtWcTYoxc=;
	b=OmY06uLGaNluWQmyxdteAyti8HPSnJ57Qr352bJ9iB8mGfo6/Ll+2k7WLuoLnBmggg
	MUUrSnjC9QpMYhOO4AXAhwWRbEDzf/ohVGigL65uFAAzSeuOaE/HHDH0c0pkxZCB206V
	jOZeXJVv5XeqdfkMr403UmUoQHo4/ZM03xo5wuKPLTEc+63CpxJpCR11nLBrMjBuYbMu
	LQb16x+bLfl6B8YmFKXp0/6bL+jgviDB38QiVlRfeP01A3KnoED74yzw2P8ca/+Q5zWM
	qu9nOICCkXZ/qe0CblKfUwhKks7jd42xRAPKvjIv11XVSdhwYN1bLPb7VWF+EusCoN1W
	ovPg==
Received: by 10.68.223.133 with SMTP id qu5mr15060068pbc.104.1346833620482;
	Wed, 05 Sep 2012 01:27:00 -0700 (PDT)
Received: from localhost.localdomain ([221.122.32.18])
	by mx.google.com with ESMTPS id ty1sm918277pbc.76.2012.09.05.01.26.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Sep 2012 01:26:59 -0700 (PDT)
From: riegamaths@gmail.com
To: qemu-devel <qemu-devel@nongnu.org>
Date: Wed,  5 Sep 2012 16:26:14 +0800
Message-Id: <1346833574-26193-1-git-send-email-riegamaths@gmail.com>
X-Mailer: git-send-email 1.7.12
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.160.45
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	Dunrong Huang <riegamaths@gmail.com>
Subject: [Qemu-trivial] =?utf-8?q?=5BPATCH=5D_block=3A_output_more_error_m?=
	=?utf-8?q?essages_if_failed_to_create_temporary_snapshot?=
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
X-List-Received-Date: Wed, 05 Sep 2012 08:27:14 -0000

From: Dunrong Huang <riegamaths@gmail.com>

If we failed to create temporary snapshot, the error message did not match
with the error, for example:

$ TMPDIR=/tmp/bad_path qemu-system-x86_64 -enable-kvm debian.qcow2 -snapshot
qemu-system-x86_64: -enable-kvm: could not open disk image /home/mathslinux/Images/debian.qcow2: No such file or directory

Indeed, the file which cant be created is /tmp/bad_path/vl.xxxxxx,  not
debian.qcow2. so the error message makes users feel confused.

Signed-off-by: Dunrong Huang <riegamaths@gmail.com>
---
 block.c | 2 ++
 1 个文件被修改，插入 2 行(+)

diff --git a/block.c b/block.c
index 470bdcc..c9e5140 100644
--- a/block.c
+++ b/block.c
@@ -434,6 +434,8 @@ int get_tmp_filename(char *filename, int size)
     }
     fd = mkstemp(filename);
     if (fd < 0 || close(fd)) {
+        fprintf(stderr, "Could not create temporary snapshot in %s directory: "
+                "%s\n", tmpdir, strerror(errno));
         return -errno;
     }
     return 0;
-- 
1.7.12


