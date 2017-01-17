Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cTWSw-0002h9-4q
	for mharc-qemu-trivial@gnu.org; Tue, 17 Jan 2017 11:18:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35930)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <skiver.cloud.yzy@gmail.com>) id 1cTVZd-0004tT-Cp
	for qemu-trivial@nongnu.org; Tue, 17 Jan 2017 10:21:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <skiver.cloud.yzy@gmail.com>) id 1cTVZc-00023Y-Kx
	for qemu-trivial@nongnu.org; Tue, 17 Jan 2017 10:21:25 -0500
Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241]:34004)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <skiver.cloud.yzy@gmail.com>)
	id 1cTVZY-00022u-A1; Tue, 17 Jan 2017 10:21:20 -0500
Received: by mail-pg0-x241.google.com with SMTP id t6so4169784pgt.1;
	Tue, 17 Jan 2017 07:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=15BTLyooM3RYAkPMprvrSB+V57TnnRjxUd8mdNCtZVQ=;
	b=CGmvqnC1+hqsxiJirl3BaP1E/N7iL5BEh5r/nQy9MsRmnPqPZBlTF+sq1Mwo6yt6r2
	TodP7CLkbK56h3hWj63y+6RXXWZIhNxyajjkM9POt4bX++4wIpBm81wqe/0+FP8X26ts
	Fn5naqJ611+P0wjrCDCh+7JW5yiuXY76RVVlmt+0vyooT2QmCDQiHpJT53yXeThndXT3
	Ub4ofw9WlEoVEIrhE6VRUkgRU6DciC4tT9sXzZGHurXBJR+hcnxNhCmtjb6dLyOXuAOq
	5l8k0CruTl7jgnT/R1KI5KuE8WqDyGCjN0sziyEhgNNhbc9O3wSXuBZ6SBKQuj2ixBAp
	pxFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=15BTLyooM3RYAkPMprvrSB+V57TnnRjxUd8mdNCtZVQ=;
	b=A5827SHU8s2aaN+N2KSNTMrDvCJjEmZGkL0ZyTgqUiO8EaeeIQQyKOaff8Ibji4Mqr
	93l5TPUOTrmqt7IObQrJFRnJISe21WhHhVEbNaVQEzpZi1z7Z+3Gd475bC7t7qLCmvoq
	LgCur6LokT4aNGILvUc4y42ZeNMe3ubfe0Bb0LiSMEh4E/MVuiBhCMVNQjw0fRQIWU4E
	/e9t1Oi6CHK53ocVr9hJ2Dfva8k+tXQVniGY5NjrEhXxz9sXwcyv6qDVOohvefaHFaaL
	aOWBPxoBZKsDUFYdVkm6aAthvs8Xw+riBA4Z4COhvjKtUvyLlj/HkCkZXgfpp0YzXuX7
	pwlQ==
X-Gm-Message-State: AIkVDXILsyMKnOTLv5G9PhnoC9uM4ajNyqlWoHJMASAtJTvCaCa08al6xcT3MbKhZJpNAA==
X-Received: by 10.98.71.7 with SMTP id u7mr6418833pfa.76.1484666477873;
	Tue, 17 Jan 2017 07:21:17 -0800 (PST)
Received: from yzy-ge62-2qd.DHCP (v133-130-103-189.a02c.g.tyo1.static.cnode.io.
	[133.130.103.189]) by smtp.gmail.com with ESMTPSA id
	b69sm47449584pfd.90.2017.01.17.07.21.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 17 Jan 2017 07:21:17 -0800 (PST)
From: Ziyue Yang <skiver.cloud.yzy@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Anthony Liguori <aliguori@us.ibm.com>,
	Ziyue Yang <yzylivezh@hotmail.com>, Ziyue Yang <skiver.cloud.yzy@gmail.com>
Date: Tue, 17 Jan 2017 23:19:51 +0800
Message-Id: <1484666391-15089-1-git-send-email-skiver.cloud.yzy@gmail.com>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c05::241
X-Mailman-Approved-At: Tue, 17 Jan 2017 11:18:33 -0500
Subject: [Qemu-trivial] [PATCH] gdbstub.c: fix GDB connection segfault
 caused by empty machines
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Jan 2017 15:21:26 -0000

From: Ziyue Yang <yzylivezh@hotmail.com>

This patch is to fix the segmentation fault caused by attaching
GDB to a QEMU instance initialized with "-M none" option.

The bug can be reproduced by

> ./qemu-system-x86_64 -M none -nographic -S -s

and attach a GDB to it by

> gdb -ex 'target remote :1234

The segmentation fault was originally caused by trying to read
the information about CPU when communicating with GDB. However,
it's impossible for any control flow to exist on an empty machine,
nor can CPU's be hot plugged to an empty machine later by QOM
commands. So I think simply disabling GDB connections on empty
machines makes sense.

Signed-off-by: Ziyue Yang <skiver.cloud.yzy@gmail.com>
---
 gdbstub.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/gdbstub.c b/gdbstub.c
index de62d26..413e817 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1731,6 +1731,12 @@ int gdbserver_start(const char *device)
     CharDriverState *mon_chr;
     ChardevCommon common = { 0 };
 
+    if (!first_cpu) {
+        fprintf(stderr, "gdbstub: meaningless to attach gdb to a "
+                "machine without any CPU.\n");
+        return -1;
+    }
+
     if (!device)
         return -1;
     if (strcmp(device, "none") != 0) {
-- 
2.7.4


