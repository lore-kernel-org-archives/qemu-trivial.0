Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z7gNk-0001zD-BW
	for mharc-qemu-trivial@gnu.org; Wed, 24 Jun 2015 04:50:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46350)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1Z7gNi-0001y8-N1
	for qemu-trivial@nongnu.org; Wed, 24 Jun 2015 04:50:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1Z7gNc-0004Aw-Vt
	for qemu-trivial@nongnu.org; Wed, 24 Jun 2015 04:50:06 -0400
Received: from static.88-198-71-155.clients.your-server.de
	([88.198.71.155]:46986 helo=socrates.bennee.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>)
	id 1Z7gNc-00049M-Qz; Wed, 24 Jun 2015 04:50:00 -0400
Received: from localhost ([127.0.0.1] helo=zen.linaroharston)
	by socrates.bennee.com with esmtp (Exim 4.84)
	(envelope-from <alex.bennee@linaro.org>)
	id 1Z7gPf-0001hF-BV; Wed, 24 Jun 2015 10:52:07 +0200
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-trivial@nongnu.org
Date: Wed, 24 Jun 2015 09:50:33 +0100
Message-Id: <1435135833-20016-1-git-send-email-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.4.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 127.0.0.1
X-SA-Exim-Mail-From: alex.bennee@linaro.org
X-SA-Exim-Scanned: No (on socrates.bennee.com); SAEximRunCond expanded to false
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 88.198.71.155
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] .gitignore: ignore GNU Global tags and clang
	compiledb
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
X-List-Received-Date: Wed, 24 Jun 2015 08:50:07 -0000

Although you can't currently generate global tags via the make system
it is worth suppressing them in .gitignore so they don't get
accidentally included. Also the clang compile database can be ignored as
this should always be generated from your current make invocation.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitignore | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/.gitignore b/.gitignore
index aed0e1f..92bbcd4 100644
--- a/.gitignore
+++ b/.gitignore
@@ -102,4 +102,9 @@
 cscope.*
 tags
 TAGS
+GPATH
+GRTAGS
+GSYMS
+GTAGS
+compile_commands.json
 *~
-- 
2.4.3


