Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SJgRE-0007Kq-PE
	for mharc-qemu-trivial@gnu.org; Mon, 16 Apr 2012 03:33:28 -0400
Received: from eggs.gnu.org ([208.118.235.92]:39366)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <akong@redhat.com>) id 1SJgR3-0006rw-KY
	for qemu-trivial@nongnu.org; Mon, 16 Apr 2012 03:33:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <akong@redhat.com>) id 1SJgQb-0007wE-Hu
	for qemu-trivial@nongnu.org; Mon, 16 Apr 2012 03:33:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51301)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <akong@redhat.com>)
	id 1SJgQb-0007vV-9x; Mon, 16 Apr 2012 03:32:49 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q3G7WjlL021655
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 16 Apr 2012 03:32:45 -0400
Received: from dhcp-8-167.nay.redhat.com (dhcp-8-167.nay.redhat.com
	[10.66.8.167])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q3G7WgZK021381; Mon, 16 Apr 2012 03:32:43 -0400
To: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, stefanha@linux.vnet.ibm.com
From: Amos Kong <akong@redhat.com>
Date: Mon, 16 Apr 2012 15:32:49 +0800
Message-ID: <20120416073249.13295.65065.stgit@dhcp-8-167.nay.redhat.com>
User-Agent: StGit/0.15
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] error.c: don't return value for void function
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
X-List-Received-Date: Mon, 16 Apr 2012 07:33:28 -0000

It is invalid to return a value from a function
returning void.

Signed-off-by: Amos Kong <akong@redhat.com>
---
 error.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/error.c b/error.c
index d3455ab..a52b771 100644
--- a/error.c
+++ b/error.c
@@ -93,7 +93,7 @@ QDict *error_get_data(Error *err)
 void error_set_field(Error *err, const char *field, const char *value)
 {
     QDict *dict = qdict_get_qdict(err->obj, "data");
-    return qdict_put(dict, field, qstring_from_str(value));
+    qdict_put(dict, field, qstring_from_str(value));
 }
 
 void error_free(Error *err)


