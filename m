Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W6VkK-0008Ts-Kw
	for mharc-qemu-trivial@gnu.org; Thu, 23 Jan 2014 20:39:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33469)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stewart@river.localdomain>) id 1W6VkA-0008PQ-5C
	for qemu-trivial@nongnu.org; Thu, 23 Jan 2014 20:39:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stewart@river.localdomain>) id 1W6Vk1-0000PB-8l
	for qemu-trivial@nongnu.org; Thu, 23 Jan 2014 20:39:38 -0500
Received: from e28smtp06.in.ibm.com ([122.248.162.6]:45326)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stewart@river.localdomain>) id 1W6Vk0-0000Of-Jv
	for qemu-trivial@nongnu.org; Thu, 23 Jan 2014 20:39:29 -0500
Received: from /spool/local
	by e28smtp06.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <stewart@river.localdomain>;
	Fri, 24 Jan 2014 07:09:25 +0530
Received: from d28dlp01.in.ibm.com (9.184.220.126)
	by e28smtp06.in.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Fri, 24 Jan 2014 07:09:22 +0530
Received: from d28relay04.in.ibm.com (d28relay04.in.ibm.com [9.184.220.61])
	by d28dlp01.in.ibm.com (Postfix) with ESMTP id 5B382E004A;
	Fri, 24 Jan 2014 07:12:23 +0530 (IST)
Received: from d28av04.in.ibm.com (d28av04.in.ibm.com [9.184.220.66])
	by d28relay04.in.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	s0O1dLfv48693472; Fri, 24 Jan 2014 07:09:21 +0530
Received: from d28av04.in.ibm.com (localhost [127.0.0.1])
	by d28av04.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
	s0O1dL9E002886; Fri, 24 Jan 2014 07:09:21 +0530
Received: from river.localdomain (river.au.ibm.com [9.185.121.78])
	by d28av04.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
	s0O1dKh2002835; Fri, 24 Jan 2014 07:09:21 +0530
Received: by river.localdomain (Postfix, from userid 1000)
	id 6406B2391FB6; Fri, 24 Jan 2014 12:39:20 +1100 (EST)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Date: Fri, 24 Jan 2014 12:39:05 +1100
Message-Id: <1390527551-22069-1-git-send-email-stewart@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <1390452896-20146-1-git-send-email-stewart@linux.vnet.ibm.com>
References: <1390452896-20146-1-git-send-email-stewart@linux.vnet.ibm.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 14012401-9574-0000-0000-00000BA0C8F6
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 122.248.162.6
Cc: qemu-trivial@nongnu.org, Stewart Smith <stewart@linux.vnet.ibm.com>
Subject: [Qemu-trivial] [PATCH v2 0/6] configure: make output and errors
	more friendly
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
X-List-Received-Date: Fri, 24 Jan 2014 01:39:47 -0000

This expands on my previous patch which was just the "configure: helpfully
output package names for some missing dependencies" patch.

Based on feedback I've added a hint to the could not find DTC error message.

There's also other changes that were suggested and the ordering of output
from configure and configure --help which I found rather useful when
attempting to find what package was needed for each configure option.

Stewart Smith (6):
  configure: add hint of libfdt to DTC dependency not found message
  configure: sort output of configure results alphabetically
  configure: alphabetize output of --help and separate into groups
  configure: add help for --disable-xfsctl and --enable-xfsctl
  configure: add hints to a remedy for feature_not_found errors
  configure: helpfully output package names for some missing
    dependencies.

 configure | 378 ++++++++++++++++++++++++++++++++------------------------------
 1 file changed, 197 insertions(+), 181 deletions(-)

-- 
1.8.4.2


