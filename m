Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RJntM-00016r-E5
	for mharc-qemu-trivial@gnu.org; Fri, 28 Oct 2011 10:58:44 -0400
Received: from eggs.gnu.org ([140.186.70.92]:38513)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@linux.vnet.ibm.com>) id 1RJntJ-0000vY-F1
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2011 10:58:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@linux.vnet.ibm.com>) id 1RJntI-0003KN-C3
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2011 10:58:41 -0400
Received: from mtagate7.uk.ibm.com ([194.196.100.167]:37109)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@linux.vnet.ibm.com>)
	id 1RJntG-0003Jq-61; Fri, 28 Oct 2011 10:58:38 -0400
Received: from d06nrmr1307.portsmouth.uk.ibm.com
	(d06nrmr1307.portsmouth.uk.ibm.com [9.149.38.129])
	by mtagate7.uk.ibm.com (8.13.1/8.13.1) with ESMTP id p9SEwams019790;
	Fri, 28 Oct 2011 14:58:36 GMT
Received: from d06av09.portsmouth.uk.ibm.com (d06av09.portsmouth.uk.ibm.com
	[9.149.37.250])
	by d06nrmr1307.portsmouth.uk.ibm.com (8.13.8/8.13.8/NCO v10.0) with
	ESMTP id p9SEwaYE2400326; Fri, 28 Oct 2011 15:58:36 +0100
Received: from d06av09.portsmouth.uk.ibm.com (loopback [127.0.0.1])
	by d06av09.portsmouth.uk.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with
	ESMTP id p9SEwZ77018400; Fri, 28 Oct 2011 08:58:35 -0600
Received: from localhost (stefanha-thinkpad.manchester-maybrook.uk.ibm.com
	[9.174.219.31])
	by d06av09.portsmouth.uk.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with
	ESMTP id p9SEwZOB018391; Fri, 28 Oct 2011 08:58:35 -0600
From: Stefan Hajnoczi <stefanha@linux.vnet.ibm.com>
To: <qemu-devel@nongnu.org>
Date: Fri, 28 Oct 2011 15:58:26 +0100
Message-Id: <1319813906-21196-1-git-send-email-stefanha@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.7
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6, seldom 2.4 (older,
	4)
X-Received-From: 194.196.100.167
Cc: qemu-trivial@nongnu.org, Stefan Hajnoczi <stefanha@linux.vnet.ibm.com>
Subject: [Qemu-trivial] [PATCH] qapi: fix typos in documentation JSON
	examples
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
X-List-Received-Date: Fri, 28 Oct 2011 14:58:42 -0000

Signed-off-by: Stefan Hajnoczi <stefanha@linux.vnet.ibm.com>
---
 docs/qapi-code-gen.txt |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/qapi-code-gen.txt b/docs/qapi-code-gen.txt
index f345866..c0a9325 100644
--- a/docs/qapi-code-gen.txt
+++ b/docs/qapi-code-gen.txt
@@ -41,7 +41,7 @@ dictionary.  This corresponds to a struct in C or an Object in JSON.  An
 example of a complex type is:
 
  { 'type': 'MyType',
-   'data' { 'member1': 'str', 'member2': 'int', '*member3': 'str } }
+   'data': { 'member1': 'str', 'member2': 'int', '*member3': 'str' } }
 
 The use of '*' as a prefix to the name means the member is optional.  Optional
 members should always be added to the end of the dictionary to preserve
@@ -63,7 +63,7 @@ An example command is:
 
  { 'command': 'my-command',
    'data': { 'arg1': 'str', '*arg2': 'str' },
-   'returns': 'str' ]
+   'returns': 'str' }
 
 Command names should be all lower case with words separated by a hyphen.
 
-- 
1.7.7


