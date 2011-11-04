Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RMNLy-0005kX-1i
	for mharc-qemu-trivial@gnu.org; Fri, 04 Nov 2011 13:14:54 -0400
Received: from eggs.gnu.org ([140.186.70.92]:56203)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1RMNLv-0005k7-Ez
	for qemu-trivial@nongnu.org; Fri, 04 Nov 2011 13:14:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1RMNLt-0007x2-Ls
	for qemu-trivial@nongnu.org; Fri, 04 Nov 2011 13:14:51 -0400
Received: from csmailer.cs.nctu.edu.tw ([140.113.235.130]:59014)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1RMNLs-0007wZ-Ve
	for qemu-trivial@nongnu.org; Fri, 04 Nov 2011 13:14:49 -0400
Received: from csmailer.cs.nctu.edu.tw (localhost [127.0.0.1])
	by csmailer.cs.nctu.edu.tw (Postfix) with ESMTP id 5404C557
	for <qemu-trivial@nongnu.org>; Sat,  5 Nov 2011 01:12:59 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=cs.nctu.edu.tw; h=date
	:from:to:subject:message-id:mime-version:content-type; s=
	rsa1024; bh=RTRVBaNVfBpQmowOuyWOvuRYzug=; b=rG0ugDrNvYijmomg9e/F
	x5JXj5vB3z9JA27Cjbo9bujv0Del3HJlk1i+PJDf7zal6QEMz/vSWBlOe6Pmbk+Z
	OXANIcaMXzBPEzxxvlGrJAeUSFuDRRtSI0JQLPXePbEG7QxfL2dNQ+nEWzh/TnM7
	aqLYQ62CGKVlOxBda7VwuMI=
Received: from alumni.cs.nctu.edu.tw (alumni.cs.nctu.edu.tw [140.113.235.116])
	by csmailer.cs.nctu.edu.tw (Postfix) with ESMTP id 31E04556
	for <qemu-trivial@nongnu.org>; Sat,  5 Nov 2011 01:12:59 +0800 (CST)
Received: (from chenwj@localhost)
	by alumni.cs.nctu.edu.tw (8.14.4/8.14.4/Submit) id pA4HEiOK087494
	for qemu-trivial@nongnu.org; Sat, 5 Nov 2011 01:14:44 +0800 (CST)
	(envelope-from chenwj)
Date: Sat, 5 Nov 2011 01:14:44 +0800
From: =?utf-8?B?6Zmz6Z+L5Lu7?= <chenwj@iis.sinica.edu.tw>
To: qemu-trivial@nongnu.org
Message-ID: <20111104171444.GA85143@cs.nctu.edu.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 140.113.235.130
Subject: [Qemu-trivial] [PATCH] qemu-tech.texi: Update default code cache
	size
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
X-List-Received-Date: Fri, 04 Nov 2011 17:14:52 -0000

  Update the document since the default code cache size is 32 MB now.

Signed-off-by: chenwj <chenwj@cs.nctu.edu.tw>
---
 qemu-tech.texi |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/qemu-tech.texi b/qemu-tech.texi
index 397b070..62afe45 100644
--- a/qemu-tech.texi
+++ b/qemu-tech.texi
@@ -435,7 +435,7 @@ generate an addition for the segment base.
 @node Translation cache
 @section Translation cache
 
-A 16 MByte cache holds the most recently used translations. For
+A 32 MByte cache holds the most recently used translations. For
 simplicity, it is completely flushed when it is full. A translation unit
 contains just a single basic block (a block of x86 instructions
 terminated by a jump or by a virtual CPU state change which the
-- 
1.7.3.5

