Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RMPWJ-0004iI-KB
	for mharc-qemu-trivial@gnu.org; Fri, 04 Nov 2011 15:33:43 -0400
Received: from eggs.gnu.org ([140.186.70.92]:44992)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1RMPWH-0004iA-HJ
	for qemu-trivial@nongnu.org; Fri, 04 Nov 2011 15:33:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1RMPWF-0007If-RM
	for qemu-trivial@nongnu.org; Fri, 04 Nov 2011 15:33:41 -0400
Received: from csmailer.cs.nctu.edu.tw ([140.113.235.130]:63916)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1RMPWF-000784-8S
	for qemu-trivial@nongnu.org; Fri, 04 Nov 2011 15:33:39 -0400
Received: from csmailer.cs.nctu.edu.tw (localhost [127.0.0.1])
	by csmailer.cs.nctu.edu.tw (Postfix) with ESMTP id 3EC9564A
	for <qemu-trivial@nongnu.org>; Sat,  5 Nov 2011 03:31:46 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=cs.nctu.edu.tw; h=date
	:from:to:subject:message-id:mime-version:content-type; s=
	rsa1024; bh=DUTPrjsRV0eVg4CbxnniNOifIbM=; b=fS9gyJRMPZzn51rT2IhM
	HRj5JRJ5+D9XbDZjjoFf23N4mY5aD3kf9uUfWjcgGW+w0OZSeeaMUFRZb4lmRXq2
	nySk9t6IW+G7AuSmwVBPTBnoYSwXU+x0qYZO3IE1x6MZDnmOZxm29e24I4CQ3HB+
	LVqKrpi8YhluC0IzZyQQEAg=
Received: from alumni.cs.nctu.edu.tw (alumni.cs.nctu.edu.tw [140.113.235.116])
	by csmailer.cs.nctu.edu.tw (Postfix) with ESMTP id 331FA649
	for <qemu-trivial@nongnu.org>; Sat,  5 Nov 2011 03:31:46 +0800 (CST)
Received: (from chenwj@localhost)
	by alumni.cs.nctu.edu.tw (8.14.4/8.14.4/Submit) id pA4JXVBn039061
	for qemu-trivial@nongnu.org; Sat, 5 Nov 2011 03:33:31 +0800 (CST)
	(envelope-from chenwj)
Date: Sat, 5 Nov 2011 03:33:31 +0800
From: =?utf-8?B?6Zmz6Z+L5Lu7?= <chenwj@iis.sinica.edu.tw>
To: qemu-trivial@nongnu.org
Message-ID: <20111104193331.GA37125@cs.nctu.edu.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 140.113.235.130
Subject: [Qemu-trivial] [PATCH] configure: Show --cpu option on the help list
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
X-List-Received-Date: Fri, 04 Nov 2011 19:33:42 -0000

  Although there is a "--cpu" option, it doesn't show up on the --help
list. Add "--cpu=CPU" option and its default value on the help list.

Signed-off-by: chenwj <chenwj@cs.nctu.edu.tw>
---
 configure |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/configure b/configure
index 9e5da44..aa44f09 100755
--- a/configure
+++ b/configure
@@ -1036,6 +1036,7 @@ echo "  --fmod-lib               path to FMOD library"
 echo "  --fmod-inc               path to FMOD includes"
 echo "  --oss-lib                path to OSS library"
 echo "  --enable-uname-release=R Return R for uname -r in usermode emulation"
+echo "  --cpu=CPU                Build qemu for CPU [$cpu]"
 echo "  --sparc_cpu=V            Build qemu for Sparc architecture v7, v8, v8plus, v8plusa, v9"
 echo "  --disable-uuid           disable uuid support"
 echo "  --enable-uuid            enable uuid support"
-- 
1.7.3.5

