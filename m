Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Sckbk-0004DY-V2
	for mharc-qemu-trivial@gnu.org; Thu, 07 Jun 2012 17:51:08 -0400
Received: from eggs.gnu.org ([208.118.235.92]:55720)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <harsh@linux.vnet.ibm.com>) id 1Sckbe-00042Y-C5
	for qemu-trivial@nongnu.org; Thu, 07 Jun 2012 17:51:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <harsh@linux.vnet.ibm.com>) id 1Sckbc-0008AC-5c
	for qemu-trivial@nongnu.org; Thu, 07 Jun 2012 17:51:01 -0400
Received: from e28smtp08.in.ibm.com ([122.248.162.8]:37761)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <harsh@linux.vnet.ibm.com>) id 1Sckbb-00084n-Hx
	for qemu-trivial@nongnu.org; Thu, 07 Jun 2012 17:51:00 -0400
Received: from /spool/local
	by e28smtp08.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <harsh@linux.vnet.ibm.com>;
	Fri, 8 Jun 2012 03:20:52 +0530
Received: from d28relay01.in.ibm.com (9.184.220.58)
	by e28smtp08.in.ibm.com (192.168.1.138) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Fri, 8 Jun 2012 03:20:50 +0530
Received: from d28av02.in.ibm.com (d28av02.in.ibm.com [9.184.220.64])
	by d28relay01.in.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	q57LonJg12517734; Fri, 8 Jun 2012 03:20:49 +0530
Received: from d28av02.in.ibm.com (loopback [127.0.0.1])
	by d28av02.in.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
	q583LRj9007606; Fri, 8 Jun 2012 13:21:27 +1000
Received: from harshbora.in.ibm.com ([9.77.121.234])
	by d28av02.in.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	q583LRIP007597; Fri, 8 Jun 2012 13:21:27 +1000
From: Harsh Prateek Bora <harsh@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Fri,  8 Jun 2012 03:20:41 +0530
Message-Id: <1339105843-30064-1-git-send-email-harsh@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.10.2
x-cbid: 12060721-2000-0000-0000-000007D7D37C
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 122.248.162.8
Cc: Harsh Prateek Bora <harsh@linux.vnet.ibm.com>, stefanha@linux.vnet.ibm.com,
	aneesh.kumar@linux.vnet.ibm.com
Subject: [Qemu-trivial] [PATCH 0/2] Configure and build fix for VirtFS
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
X-List-Received-Date: Thu, 07 Jun 2012 21:51:07 -0000

Minor fixes:
============

1) glib2 deprecated g_atomic_int_exchange_and_add in favour of g_atomic_int_add
   since ver 2.30 and therefore build breaks with newer glib2 library.
2) Configure needs to report appropriate error on missing libraries for VirtFS.

Harsh Prateek Bora (2):
  trace/simple.c: fix deprecated glib2 interface
  configure: report appropriate error on missing library

 configure      |    3 ++-
 trace/simple.c |    5 ++++-
 2 files changed, 6 insertions(+), 2 deletions(-)

-- 
1.7.10.2


