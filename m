Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QkUz5-0008RH-Ls
	for mharc-qemu-trivial@gnu.org; Sat, 23 Jul 2011 01:42:43 -0400
Received: from eggs.gnu.org ([140.186.70.92]:45505)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cerbere@gmail.com>) id 1QkUz3-0008LI-Df
	for qemu-trivial@nongnu.org; Sat, 23 Jul 2011 01:42:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cerbere@gmail.com>) id 1QkUz2-0002sQ-IP
	for qemu-trivial@nongnu.org; Sat, 23 Jul 2011 01:42:41 -0400
Received: from mail-vw0-f45.google.com ([209.85.212.45]:38271)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cerbere@gmail.com>)
	id 1QkUz0-0002sB-NI; Sat, 23 Jul 2011 01:42:38 -0400
Received: by vws17 with SMTP id 17so2387249vws.4
	for <multiple recipients>; Fri, 22 Jul 2011 22:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=zntU/tG12j9xofVzs1vyI1YCRU9gaWPMeeP1Ojpzixk=;
	b=FjuQh+Sb43gA+koOL6GU7pv92HNIQip7+LAH4YKVP4cqiIcSQrdIO9jBVj1HdLY+VG
	DRcH4FmZk5OIwiF6Vq5BX8it0MBbqOxRs18LCvFtK3HPKuEjg+vqJR2q2vhsJPnTTAiG
	vki6RughUwz0XfFeT2d7r6uYxvJLf7WyFOoX0=
Received: by 10.52.175.7 with SMTP id bw7mr2284049vdc.32.1311399757684;
	Fri, 22 Jul 2011 22:42:37 -0700 (PDT)
Received: from localhost.localdomain (modemcable055.201-23-96.mc.videotron.ca
	[96.23.201.55])
	by mx.google.com with ESMTPS id cp8sm1652614vdc.18.2011.07.22.22.42.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 22 Jul 2011 22:42:36 -0700 (PDT)
From: Alexandre Raymond <cerbere@gmail.com>
To: Qemu Developers <qemu-devel@nongnu.org>
Date: Sat, 23 Jul 2011 01:41:57 -0400
Message-Id: <1311399717-59131-1-git-send-email-cerbere@gmail.com>
X-Mailer: git-send-email 1.7.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.212.45
Cc: qemu-trivial@nongnu.org, Alexandre Raymond <cerbere@gmail.com>
Subject: [Qemu-trivial] [PATCH] .gitignore: ignore qemu-ga and qapi-generated
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
X-List-Received-Date: Sat, 23 Jul 2011 05:42:42 -0000

Add a new binary and generation directory to the gitignore file

Signed-off-by: Alexandre Raymond <cerbere@gmail.com>
---
 .gitignore |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/.gitignore b/.gitignore
index 08013fc..54835bc 100644
--- a/.gitignore
+++ b/.gitignore
@@ -15,6 +15,7 @@ libdis*
 libhw32
 libhw64
 libuser
+qapi-generated
 qemu-doc.html
 qemu-tech.html
 qemu-doc.info
@@ -32,6 +33,7 @@ qemu-options.texi
 qemu-img-cmds.texi
 qemu-img-cmds.h
 qemu-io
+qemu-ga
 qemu-monitor.texi
 QMP/qmp-commands.txt
 .gdbinit
-- 
1.7.5


