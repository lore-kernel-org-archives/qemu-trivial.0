Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XXXKb-00028J-Ic
	for mharc-qemu-trivial@gnu.org; Fri, 26 Sep 2014 11:21:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33917)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1XXXKS-0001sh-OH
	for qemu-trivial@nongnu.org; Fri, 26 Sep 2014 11:21:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1XXXKM-0007Rv-KM
	for qemu-trivial@nongnu.org; Fri, 26 Sep 2014 11:21:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45806)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1XXXK9-0007Nh-Mc; Fri, 26 Sep 2014 11:20:45 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s8QFKcG3012256
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Fri, 26 Sep 2014 11:20:39 -0400
Received: from red.redhat.com (ovpn-113-28.phx2.redhat.com [10.3.113.28])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s8QFKbGd028824; Fri, 26 Sep 2014 11:20:38 -0400
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 26 Sep 2014 09:20:32 -0600
Message-Id: <1411744833-20699-3-git-send-email-eblake@redhat.com>
In-Reply-To: <1411744833-20699-1-git-send-email-eblake@redhat.com>
References: <1411744833-20699-1-git-send-email-eblake@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Luiz Capitulino <lcapitulino@redhat.com>,
	Fam Zheng <famz@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, wenchaoqemu@gmail.com
Subject: [Qemu-trivial] [PATCH v5 2/3] qapi: Ignore files created during
	make check
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
X-List-Received-Date: Fri, 26 Sep 2014 15:21:11 -0000

After an in-tree build and run of 'make check-{qapi-schema,unit}',
I noticed some leftover files.

Signed-off-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Wenchao Xia <wenchaoqemu@gmail.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
---
 tests/.gitignore | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/.gitignore b/tests/.gitignore
index c71c110..e2e4957 100644
--- a/tests/.gitignore
+++ b/tests/.gitignore
@@ -14,11 +14,14 @@ test-int128
 test-iov
 test-mul64
 test-opts-visitor
+test-qapi-event.[ch]
 test-qapi-types.[ch]
 test-qapi-visit.[ch]
 test-qdev-global-props
+test-qemu-opts
 test-qmp-commands
 test-qmp-commands.h
+test-qmp-event
 test-qmp-input-strict
 test-qmp-input-visitor
 test-qmp-marshal.c
-- 
1.9.3


