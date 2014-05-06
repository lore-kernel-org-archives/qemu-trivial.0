Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WhUln-0005Qm-Hg
	for mharc-qemu-trivial@gnu.org; Mon, 05 May 2014 22:06:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32811)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1WhUlg-0005Ha-1E
	for qemu-trivial@nongnu.org; Mon, 05 May 2014 22:06:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1WhUlZ-0003wU-Sg
	for qemu-trivial@nongnu.org; Mon, 05 May 2014 22:06:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:11901)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>)
	id 1WhUlN-0003l1-2t; Mon, 05 May 2014 22:05:45 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s4625hQG025677
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Mon, 5 May 2014 22:05:43 -0400
Received: from T430.nay.redhat.com (dhcp-14-247.nay.redhat.com [10.66.14.247])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id s4625eo8030943; Mon, 5 May 2014 22:05:41 -0400
From: Fam Zheng <famz@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue,  6 May 2014 10:05:53 +0800
Message-Id: <1399341953-14387-1-git-send-email-famz@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-trivial@nongnu.org,
	Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
	Luiz Capitulino <lcapitulino@redhat.com>
Subject: [Qemu-trivial] [PATCH v2] qapi: Document optional arguments'
	backwards compatibility
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
X-List-Received-Date: Tue, 06 May 2014 02:06:10 -0000

Signed-off-by: Fam Zheng <famz@redhat.com>

---
v2: Employ the text suggested by Eric. (Thanks!)

Signed-off-by: Fam Zheng <famz@redhat.com>
---
 docs/qapi-code-gen.txt | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/docs/qapi-code-gen.txt b/docs/qapi-code-gen.txt
index d78921f..3e5cfd5 100644
--- a/docs/qapi-code-gen.txt
+++ b/docs/qapi-code-gen.txt
@@ -49,10 +49,28 @@ example of a complex type is:
  { 'type': 'MyType',
    'data': { 'member1': 'str', 'member2': 'int', '*member3': 'str' } }
 
-The use of '*' as a prefix to the name means the member is optional.  Optional
-members should always be added to the end of the dictionary to preserve
-backwards compatibility.
-
+The use of '*' as a prefix to the name means the member is optional.
+
+The default initialization value of an optional argument should not be changed
+between versions of QEMU unless the new default maintains backward
+compatibility to the user-visible behavior of the old default.
+
+On input structures (only mentioned in the 'data' side of a command), changing
+from mandatory to optional is safe (older clients will supply the option, and
+newer clients can benefit from the default); changing from optional to
+mandatory is backwards incompatible (older clients may be omitting the option,
+and must continue to work).
+
+On output structures (only mentioned in the 'returns' side of a command),
+changing from mandatory to optional is in general unsafe (older clients may be
+expecting the field, and could crash if it is missing), although it can be done
+if the only way that the optional argument will be omitted is when it is
+triggered by the presence of a new input flag to the command that older clients
+don't know to send.  Changing from optional to mandatory is safe.
+
+A structure that is used in both input and output of various commands
+must consider the backwards compatibility constraints of both directions
+of use.
 
 A complex type definition can specify another complex type as its base.
 In this case, the fields of the base type are included as top-level fields
-- 
1.9.2


