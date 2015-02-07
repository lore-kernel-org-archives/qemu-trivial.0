Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YK6JL-0001q0-1e
	for mharc-qemu-trivial@gnu.org; Sat, 07 Feb 2015 09:24:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60366)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gkurz@linux.vnet.ibm.com>) id 1YK2aS-0007RR-H1
	for qemu-trivial@nongnu.org; Sat, 07 Feb 2015 05:26:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gkurz@linux.vnet.ibm.com>) id 1YK2aK-0006V7-4h
	for qemu-trivial@nongnu.org; Sat, 07 Feb 2015 05:26:04 -0500
Received: from e06smtp17.uk.ibm.com ([195.75.94.113]:57226)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gkurz@linux.vnet.ibm.com>) id 1YK2aJ-0006Um-Sr
	for qemu-trivial@nongnu.org; Sat, 07 Feb 2015 05:25:56 -0500
Received: from /spool/local
	by e06smtp17.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <gkurz@linux.vnet.ibm.com>;
	Sat, 7 Feb 2015 10:25:54 -0000
Received: from d06dlp01.portsmouth.uk.ibm.com (9.149.20.13)
	by e06smtp17.uk.ibm.com (192.168.101.147) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Sat, 7 Feb 2015 10:25:52 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com
	(d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by d06dlp01.portsmouth.uk.ibm.com (Postfix) with ESMTP id 8F6EF17D8024; 
	Sat,  7 Feb 2015 10:26:01 +0000 (GMT)
Received: from d06av04.portsmouth.uk.ibm.com (d06av04.portsmouth.uk.ibm.com
	[9.149.37.216])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id t17APqaH9568722; Sat, 7 Feb 2015 10:25:52 GMT
Received: from d06av04.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av04.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with
	ESMTP id t17APpss004064; Sat, 7 Feb 2015 03:25:52 -0700
Received: from smtp.lab.toulouse-stg.fr.ibm.com
	(srv01.lab.toulouse-stg.fr.ibm.com [9.101.4.1])
	by d06av04.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with
	ESMTP id t17APpbG004061; Sat, 7 Feb 2015 03:25:51 -0700
Received: from bahia.local (unknown [9.83.101.84])
	by smtp.lab.toulouse-stg.fr.ibm.com (Postfix) with ESMTP id 0F72422030A;
	Sat,  7 Feb 2015 11:25:50 +0100 (CET)
From: Greg Kurz <gkurz@linux.vnet.ibm.com>
To: Alexander Graf <agraf@suse.de>
Date: Sat, 07 Feb 2015 11:25:50 +0100
Message-ID: <20150207102550.4058.20649.stgit@bahia.local>
User-Agent: StGit/0.17-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15020710-0029-0000-0000-000003458C20
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.75.94.113
X-Mailman-Approved-At: Sat, 07 Feb 2015 09:24:37 -0500
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Juan Quintela <quintela@redhat.com>
Subject: [Qemu-trivial] [PATCH] QJSON: fix typo in author's email address
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
X-List-Received-Date: Sat, 07 Feb 2015 10:26:05 -0000

Signed-off-by: Greg Kurz <gkurz@linux.vnet.ibm.com>
---
 qjson.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qjson.c b/qjson.c
index b242222..0cda269 100644
--- a/qjson.c
+++ b/qjson.c
@@ -4,7 +4,7 @@
  * Copyright Alexander Graf
  *
  * Authors:
- *  Alexander Graf <agraf@suse.de
+ *  Alexander Graf <agraf@suse.de>
  *
  * This work is licensed under the terms of the GNU LGPL, version 2.1 or later.
  * See the COPYING.LIB file in the top-level directory.


