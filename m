Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ugukb-0002Zz-Pt
	for mharc-qemu-trivial@gnu.org; Mon, 27 May 2013 06:34:01 -0400
Received: from eggs.gnu.org ([208.118.235.92]:50300)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lilei@linux.vnet.ibm.com>) id 1UgukY-0002UZ-D5
	for qemu-trivial@nongnu.org; Mon, 27 May 2013 06:34:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lilei@linux.vnet.ibm.com>) id 1UgukT-0001hk-Al
	for qemu-trivial@nongnu.org; Mon, 27 May 2013 06:33:58 -0400
Received: from e28smtp01.in.ibm.com ([122.248.162.1]:48737)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lilei@linux.vnet.ibm.com>) id 1UgukS-0001f9-N5
	for qemu-trivial@nongnu.org; Mon, 27 May 2013 06:33:53 -0400
Received: from /spool/local
	by e28smtp01.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <lilei@linux.vnet.ibm.com>;
	Mon, 27 May 2013 15:57:40 +0530
Received: from d28dlp03.in.ibm.com (9.184.220.128)
	by e28smtp01.in.ibm.com (192.168.1.131) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Mon, 27 May 2013 15:57:38 +0530
Received: from d28relay03.in.ibm.com (d28relay03.in.ibm.com [9.184.220.60])
	by d28dlp03.in.ibm.com (Postfix) with ESMTP id 83CC01258053;
	Mon, 27 May 2013 16:05:38 +0530 (IST)
Received: from d28av02.in.ibm.com (d28av02.in.ibm.com [9.184.220.64])
	by d28relay03.in.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	r4RAXS9Z9634218; Mon, 27 May 2013 16:03:28 +0530
Received: from d28av02.in.ibm.com (loopback [127.0.0.1])
	by d28av02.in.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
	r4RAXacf016989; Mon, 27 May 2013 20:33:36 +1000
Received: from localhost.localdomain ([9.125.24.193])
	by d28av02.in.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	r4RAXYrb016928; Mon, 27 May 2013 20:33:34 +1000
From: Lei Li <lilei@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Date: Mon, 27 May 2013 18:33:00 +0800
Message-Id: <1369650782-14608-1-git-send-email-lilei@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.7.6
X-TM-AS-MML: No
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 13052710-4790-0000-0000-0000087D1163
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 122.248.162.1
Cc: qemu-trivial@nongnu.org, Lei Li <lilei@linux.vnet.ibm.com>,
	quintela@redhat.com
Subject: [Qemu-trivial] [PATCH 0/2] Trivial fixes for migration
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
X-List-Received-Date: Mon, 27 May 2013 10:34:01 -0000

This small series improves the document migration.txt
and remove a duplicated setting of bandwidth_limit.

Lei Li (2):
 docs: Fix typo and update file in migration
 migration: Remove duplicate bandwidth_limit set

 docs/migration.txt |   17 +++++++++--------
 migration.c        |    1 -
 2 files changed, 9 insertions(+), 9 deletions(-)


