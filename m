Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TLuXR-0002oz-Dn
	for mharc-qemu-trivial@gnu.org; Wed, 10 Oct 2012 07:33:21 -0400
Received: from eggs.gnu.org ([208.118.235.92]:47617)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1TLuXI-0002Qk-El
	for qemu-trivial@nongnu.org; Wed, 10 Oct 2012 07:33:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1TLuXE-00005F-7q
	for qemu-trivial@nongnu.org; Wed, 10 Oct 2012 07:33:12 -0400
Received: from mail-pb0-f45.google.com ([209.85.160.45]:62576)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1TLuWy-0008TX-9v; Wed, 10 Oct 2012 07:32:52 -0400
Received: by mail-pb0-f45.google.com with SMTP id rp2so605877pbb.4
	for <multiple recipients>; Wed, 10 Oct 2012 04:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=EGqQqnGlRfzsHHOvTk8pZKfv4wDxNBdpyPYjglRrou0=;
	b=U6+M/U7DgS+od/m4W8BNqLm7P2S7J0x8c4vEv+D4NRvBASki+leyPOGqRqcc/Sq67N
	4wrrbhSsELIesCAECOLu1l7Q/q73NVqn3o8AtyGfVrM52D8aHlZHr2AsHdiBkGrkNhw7
	InILwSS7QFYSJYm6iHdy71GY8R6qq5LcolGMxipHUHbPiZADetil0zBbHTkgwAWKnQDL
	OrUhn3ut3zRN8Vzh4K6zfeU6tqyWpYeIHpGVrKPRFbl7aF/fOYTXYkEj5sCl1asxPEYZ
	Iwzt5VBbtEtm3hoxNMzuRFl03itzlk5Gm7fj7i7KF9QKcefTZGGm/hob0sYgYSOvh0/M
	63rQ==
Received: by 10.68.225.5 with SMTP id rg5mr72224549pbc.73.1349868771371;
	Wed, 10 Oct 2012 04:32:51 -0700 (PDT)
Received: from yakj.usersys.redhat.com (93-34-169-1.ip50.fastwebnet.it.
	[93.34.169.1])
	by mx.google.com with ESMTPS id w10sm732346paz.22.2012.10.10.04.32.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 10 Oct 2012 04:32:50 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 10 Oct 2012 13:32:42 +0200
Message-Id: <1349868762-10021-1-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.7.12.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.160.45
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] virtfs-proxy-helper: check return code of
	setfsgid/setfsuid
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
X-List-Received-Date: Wed, 10 Oct 2012 11:33:20 -0000

Fixes the following error with glibc 2.16 on Fedora 18:

virtfs-proxy-helper.c: In function ‘setfsugid’:
virtfs-proxy-helper.c:293:13: error: ignoring return value of ‘setfsgid’, declared with attribute warn_unused_result [-Werror=unused-result]
virtfs-proxy-helper.c:294:13: error: ignoring return value of ‘setfsuid’, declared with attribute warn_unused_result [-Werror=unused-result]
cc1: all warnings being treated as errors

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 fsdev/virtfs-proxy-helper.c | 8 ++++++--
 1 file modificato, 6 inserzioni(+), 2 rimozioni(-)

diff --git a/fsdev/virtfs-proxy-helper.c b/fsdev/virtfs-proxy-helper.c
index f9a8270..b34a84a 100644
--- a/fsdev/virtfs-proxy-helper.c
+++ b/fsdev/virtfs-proxy-helper.c
@@ -290,8 +290,12 @@ static int setfsugid(int uid, int gid)
         CAP_DAC_OVERRIDE,
     };
 
-    setfsgid(gid);
-    setfsuid(uid);
+    if (setfsgid(gid) != 0) {
+        return -1;
+    }
+    if (setfsuid(uid) != 0) {
+        return -1;
+    }
 
     if (uid != 0 || gid != 0) {
         return do_cap_set(cap_list, ARRAY_SIZE(cap_list), 0);
-- 
1.7.12.1


