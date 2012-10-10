Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TLz0m-0000Ur-9E
	for mharc-qemu-trivial@gnu.org; Wed, 10 Oct 2012 12:19:56 -0400
Received: from eggs.gnu.org ([208.118.235.92]:53426)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1TLz0f-00009V-3M
	for qemu-trivial@nongnu.org; Wed, 10 Oct 2012 12:19:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1TLz0d-0005HE-U7
	for qemu-trivial@nongnu.org; Wed, 10 Oct 2012 12:19:49 -0400
Received: from mail-pa0-f45.google.com ([209.85.220.45]:51410)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1TLz0X-0005Ft-M9; Wed, 10 Oct 2012 12:19:41 -0400
Received: by mail-pa0-f45.google.com with SMTP id fb10so762966pad.4
	for <multiple recipients>; Wed, 10 Oct 2012 09:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=aRhsw0RTixLKsqTd7azzFcduNASk6bo/AKLXScXTzOY=;
	b=eJ1Gs0UvVjpX96A9uDsu/koJ+nSshLAqQIfpOU4aZRpVk//1NJwsSzTkZI/owmxpcv
	/WylWglfeG9dZQLezZkwI4EL5+3Q1aTY3nJmwZKZKCFBTesJzy6QvNdu/vbVfrmxj/Dn
	Xoh0omQ0h10wgt0uynF/4kglIpWTjTPzKTzJH9HvOsrjJMq+96LErptpG2uD2E0bCXVk
	3C+Q9B/Et5I4fyGNgMnv/eR0TQL/P3Fy7GpFZ9seaq91DnbeXB5cwaSAKuBJ5tah+bwt
	lcNLothfXaWwmDTyMtwPC5Z2eZzvBToI1q6/KjNSmwkpSeP7kSBTVg9/KAGlfEp9AB7X
	Owtw==
Received: by 10.68.203.38 with SMTP id kn6mr55632173pbc.30.1349885980639;
	Wed, 10 Oct 2012 09:19:40 -0700 (PDT)
Received: from yakj.usersys.redhat.com (93-34-169-1.ip50.fastwebnet.it.
	[93.34.169.1])
	by mx.google.com with ESMTPS id gk5sm1237574pbc.21.2012.10.10.09.19.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 10 Oct 2012 09:19:38 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 10 Oct 2012 18:19:29 +0200
Message-Id: <1349885969-25866-1-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.7.12.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.220.45
Cc: qemu-trivial@nongnu.org, sw@weilnetz.de
Subject: [Qemu-trivial] [PATCH v2] virtfs-proxy-helper: check return code of
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
X-List-Received-Date: Wed, 10 Oct 2012 16:19:55 -0000

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
index f9a8270..9060743 100644
--- a/fsdev/virtfs-proxy-helper.c
+++ b/fsdev/virtfs-proxy-helper.c
@@ -290,8 +290,12 @@ static int setfsugid(int uid, int gid)
         CAP_DAC_OVERRIDE,
     };
 
-    setfsgid(gid);
-    setfsuid(uid);
+    if (setfsgid(gid) < 0) {
+        return -1;
+    }
+    if (setfsuid(uid) < 0) {
+        return -1;
+    }
 
     if (uid != 0 || gid != 0) {
         return do_cap_set(cap_list, ARRAY_SIZE(cap_list), 0);
-- 
1.7.12.1


