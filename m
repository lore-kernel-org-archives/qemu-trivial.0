Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S01bx-0001No-2e
	for mharc-qemu-trivial@gnu.org; Tue, 21 Feb 2012 21:07:17 -0500
Received: from eggs.gnu.org ([140.186.70.92]:34358)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1S01bu-0001NV-Ii
	for qemu-trivial@nongnu.org; Tue, 21 Feb 2012 21:07:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1S01bt-0004xm-3g
	for qemu-trivial@nongnu.org; Tue, 21 Feb 2012 21:07:14 -0500
Received: from csmailer.cs.nctu.edu.tw ([140.113.235.130]:44197)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>)
	id 1S01bp-0004xF-9l; Tue, 21 Feb 2012 21:07:10 -0500
Received: from csmailer.cs.nctu.edu.tw (localhost [127.0.0.1])
	by csmailer.cs.nctu.edu.tw (Postfix) with ESMTP id 37BE6C6A;
	Wed, 22 Feb 2012 10:12:30 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=cs.nctu.edu.tw; h=date
	:from:to:cc:subject:message-id:mime-version:content-type; s=
	rsa1024; bh=h+NziQkBWwfGv+R3btpfqM0rfVU=; b=oSvHtNPy64thJkw562nt
	JPmlw9H6pgSc+v7rx9J+yxMxhCxt7hwlNhkO4lgzPaQ6upIwFhNQDDPMxjvC8AnK
	z8hMa2ZLvk3uNKgyhKQb9jMDtZPI/ujgnkksiaqNMNfoi//Z8uPjLgp7NCKE/7Wy
	Q4Y94E1uEcXBbZ27hIY9hQM=
Received: from alumni.cs.nctu.edu.tw (alumni.cs.nctu.edu.tw [140.113.235.116])
	by csmailer.cs.nctu.edu.tw (Postfix) with ESMTP id 317A1C69;
	Wed, 22 Feb 2012 10:12:30 +0800 (CST)
Received: (from chenwj@localhost)
	by alumni.cs.nctu.edu.tw (8.14.4/8.14.4/Submit) id q1M275VO011028;
	Wed, 22 Feb 2012 10:07:05 +0800 (CST) (envelope-from chenwj)
Date: Wed, 22 Feb 2012 10:07:05 +0800
From: =?utf-8?B?6Zmz6Z+L5Lu7?= <chenwj@iis.sinica.edu.tw>
To: qemu-devel@nongnu.org
Message-ID: <20120222020705.GA10972@cs.nctu.edu.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 140.113.235.130
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH v2] Fix dependency issue introduced by commit
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
X-List-Received-Date: Wed, 22 Feb 2012 02:07:15 -0000

  Commit 7b93fadf3a38d1ed65ea5536a52efc2772c6e3b8 adds basic version of bridge
helper, but introduces dependency issue at the same time. While building target
xxx-linux-user, qemu-bridge-helper.c needs config-host.h which is not generated
at the moment. Explicitly declaring the dependency for the helper in the
Makefile.

Signed-off-by: Chen Wei-Ren <chenwj@iis.sinica.edu.tw>
---
v2: Explicitly declaring the dependency for the helper instead of relying on
    ordering side-effects.

 Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index e66e885..1b2488c 100644
--- a/Makefile
+++ b/Makefile
@@ -36,7 +36,7 @@ $(call set-vpath, $(SRC_PATH):$(SRC_PATH)/hw)
 
 LIBS+=-lz $(LIBS_TOOLS)
 
-HELPERS-$(CONFIG_LINUX) = qemu-bridge-helper$(EXESUF)
+HELPERS-$(CONFIG_LINUX) : config-host.h qemu-bridge-helper$(EXESUF)
 
 ifdef BUILD_DOCS
 DOCS=qemu-doc.html qemu-tech.html qemu.1 qemu-img.1 qemu-nbd.8 QMP/qmp-commands.txt
-- 
1.7.3.4

