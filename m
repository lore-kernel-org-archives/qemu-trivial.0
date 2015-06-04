Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z0VDx-000529-Mo
	for mharc-qemu-trivial@gnu.org; Thu, 04 Jun 2015 09:30:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34106)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1Z0VDv-0004zW-Kq
	for qemu-trivial@nongnu.org; Thu, 04 Jun 2015 09:30:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1Z0VDu-00070U-TY
	for qemu-trivial@nongnu.org; Thu, 04 Jun 2015 09:30:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56367)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>)
	id 1Z0VDq-0006xQ-1l; Thu, 04 Jun 2015 09:30:14 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 80D4B2D450A;
	Thu,  4 Jun 2015 13:30:13 +0000 (UTC)
Received: from wlan-5-24.fab.redhat.com (wlan-5-24.fab.redhat.com [10.33.5.24])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t54DUBqG018688; Thu, 4 Jun 2015 09:30:12 -0400
From: "Daniel P. Berrange" <berrange@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu,  4 Jun 2015 14:30:07 +0100
Message-Id: <1433424607-3429-1-git-send-email-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Eric Blake <eblake@redhat.com>,
	"Daniel P. Berrange" <berrange@redhat.com>, John Snow <jsnow@redhat.com>,
	Markus Armbruster <armbru@redhat.com>
Subject: [Qemu-trivial] [PATCH v2] Add .dir-locals.el file to configure
	emacs coding style
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
X-List-Received-Date: Thu, 04 Jun 2015 13:30:20 -0000

Some default emacs setups indent by 2 spaces and uses tabs
which is counter to the QEMU coding style rules. Adding a
.dir-locals.el file in the top level of the GIT repo will
inform emacs about the QEMU coding style, and so assist
contributors in avoiding common style mistakes before
they submit patches.

Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
---
 .dir-locals.el | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 .dir-locals.el

diff --git a/.dir-locals.el b/.dir-locals.el
new file mode 100644
index 0000000..3ac0cfc
--- /dev/null
+++ b/.dir-locals.el
@@ -0,0 +1,2 @@
+((c-mode . ((c-file-style . "stroustrup")
+	    (indent-tabs-mode . nil))))
-- 
2.4.1


