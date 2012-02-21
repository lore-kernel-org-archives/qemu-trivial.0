Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Rzmih-0007Y6-6w
	for mharc-qemu-trivial@gnu.org; Tue, 21 Feb 2012 05:13:15 -0500
Received: from eggs.gnu.org ([140.186.70.92]:37420)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1RzmiZ-0007Vw-8u
	for qemu-trivial@nongnu.org; Tue, 21 Feb 2012 05:13:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1RzmiT-0008Df-LJ
	for qemu-trivial@nongnu.org; Tue, 21 Feb 2012 05:13:07 -0500
Received: from csmailer.cs.nctu.edu.tw ([140.113.235.130]:22519)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>)
	id 1RzmiF-0008Am-9Y; Tue, 21 Feb 2012 05:12:48 -0500
Received: from csmailer.cs.nctu.edu.tw (localhost [127.0.0.1])
	by csmailer.cs.nctu.edu.tw (Postfix) with ESMTP id 2957B769;
	Tue, 21 Feb 2012 18:18:04 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=cs.nctu.edu.tw; h=date
	:from:to:cc:subject:message-id:mime-version:content-type; s=
	rsa1024; bh=Jh5xleVwv1WssMo2AUmQyzYV1ak=; b=LCcUnncfnPXhOZwlsNvR
	8hZVE7EWXe54+GtwaDKPJQ1xvVvpLTLENPtz48yONPx2Mgv5LGmGTPtG0noKSnVV
	r7KNP9dL6acRdG8kRLPH65ffypwzEPCeyhlI/Ey3dHxKDGe1h86OrWyY0/xIDXCc
	hDRrY0lV1ueTlOtTtuznNpo=
Received: from alumni.cs.nctu.edu.tw (alumni.cs.nctu.edu.tw [140.113.235.116])
	by csmailer.cs.nctu.edu.tw (Postfix) with ESMTP id 096FB768;
	Tue, 21 Feb 2012 18:18:04 +0800 (CST)
Received: (from chenwj@localhost)
	by alumni.cs.nctu.edu.tw (8.14.4/8.14.4/Submit) id q1LACdRq095544;
	Tue, 21 Feb 2012 18:12:39 +0800 (CST) (envelope-from chenwj)
Date: Tue, 21 Feb 2012 18:12:39 +0800
From: =?utf-8?B?6Zmz6Z+L5Lu7?= <chenwj@iis.sinica.edu.tw>
To: qemu-devel@nongnu.org
Message-ID: <20120221101239.GA95445@cs.nctu.edu.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 140.113.235.130
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] Fix dependency issue introduced by commit
 7b93fadf3a38d1ed65ea5536a52efc2772c6e3b8
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
X-List-Received-Date: Tue, 21 Feb 2012 10:13:12 -0000

  Commit 7b93fadf3a38d1ed65ea5536a52efc2772c6e3b8 adds basic version of bridge
helper, but introduces dependency issue at the same time. While building target
xxx-linux-user, qemu-bridge-helper.c needs config-host.h which is not generated
at the moment. Building recurse-all target first fixes the problem.  

Signed-off-by: Chen Wei-Ren <chenwj@iis.sinica.edu.tw>
---
 Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index e66e885..618b306 100644
--- a/Makefile
+++ b/Makefile
@@ -79,7 +79,7 @@ defconfig:
 
 -include config-all-devices.mak
 
-build-all: $(DOCS) $(TOOLS) $(HELPERS-y) recurse-all
+build-all: $(DOCS) $(TOOLS) recurse-all $(HELPERS-y)
 
 config-host.h: config-host.h-timestamp
 config-host.h-timestamp: config-host.mak
-- 
1.7.3.4

