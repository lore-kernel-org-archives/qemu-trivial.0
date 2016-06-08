Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bAk5F-0001Vx-2H
	for mharc-qemu-trivial@gnu.org; Wed, 08 Jun 2016 16:28:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37839)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1bAk5C-0001SG-Qo
	for qemu-trivial@nongnu.org; Wed, 08 Jun 2016 16:28:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1bAk57-0004bc-RB
	for qemu-trivial@nongnu.org; Wed, 08 Jun 2016 16:28:09 -0400
Received: from resqmta-po-11v.sys.comcast.net ([96.114.154.170]:41324
	helo=resqmta-ch2-11v.sys.comcast.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1bAk57-0004bI-Ld
	for qemu-trivial@nongnu.org; Wed, 08 Jun 2016 16:28:05 -0400
Received: from resomta-po-11v.sys.comcast.net ([96.114.154.235])
	by resqmta-po-11v.sys.comcast.net with SMTP
	id Ak2ebU3CamNqqAk49bpu5b; Wed, 08 Jun 2016 20:27:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=comcast.net;
	s=q20140121; t=1465417625;
	bh=OHFENRpdRp7jl8wULxs41FFn3rqcS1U4HjlzS1fK0BE=;
	h=Received:Received:From:To:Subject:Date:Message-Id;
	b=DHVcHb0X59orlfQ/NwyadS0L6dPK0vqRVlnM0NckAERj9S1eDQiE6vycOSFvB+ziV
	WmFBAhrPkfac0zkvPAhFTz5cSQkLGZKna3qkSlBG3pQl6hfdWVsChNz6tVOOJiG+ka
	a9G9K95csCJU4sj7ECKjZSoKnQuP3RGTzyD5NwQWU21hofLU0KOCoApHSR/5xclE+O
	vR6lGJ1dnOthOPK8eTzvnsswweJKOytx1P3FUHxqEhm0F/I+vP+2Vdt0vO4VBhedkW
	0yaPvq8aOWbFn7XNkJMzXmY4NtN25C7c42sU5clFotFNtI/l8HGwy+xCArqnCRYZYk
	lgB1skTA8nrpw==
Received: from red.redhat.com ([24.10.254.122])
	by resomta-po-11v.sys.comcast.net with comcast
	id 4LT11t00G2fD5rL01LT4t5; Wed, 08 Jun 2016 20:27:05 +0000
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com,
	famz@redhat.com,
	qemu-trivial@nongnu.org
Date: Wed,  8 Jun 2016 14:26:59 -0600
Message-Id: <1465417619-31639-1-git-send-email-eblake@redhat.com>
X-Mailer: git-send-email 2.5.5
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 96.114.154.170
Subject: [Qemu-trivial] [PATCH] maint: Ignore generated version file
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
X-List-Received-Date: Wed, 08 Jun 2016 20:28:11 -0000

Commit 67a1de0d created a generated version file, and, in some
circumstances, also a temporary file.  Make sure 'git add .'
won't check them into the repository.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 .gitignore | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/.gitignore b/.gitignore
index 38ee1c5..7a4ee01 100644
--- a/.gitignore
+++ b/.gitignore
@@ -52,6 +52,8 @@
 /qemu-bridge-helper
 /qemu-monitor.texi
 /qemu-monitor-info.texi
+/qemu-version.h
+/qemu-version.h.tmp
 /qmp-commands.txt
 /vscclient
 /fsdev/virtfs-proxy-helper
-- 
2.5.5


