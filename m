Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W6VkT-0000Do-RG
	for mharc-qemu-trivial@gnu.org; Thu, 23 Jan 2014 20:39:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33553)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stewart@river.localdomain>) id 1W6VkH-0008Si-SK
	for qemu-trivial@nongnu.org; Thu, 23 Jan 2014 20:39:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stewart@river.localdomain>) id 1W6Vk8-0000Rm-Uw
	for qemu-trivial@nongnu.org; Thu, 23 Jan 2014 20:39:45 -0500
Received: from e23smtp02.au.ibm.com ([202.81.31.144]:45481)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stewart@river.localdomain>) id 1W6Vk8-0000R7-4a
	for qemu-trivial@nongnu.org; Thu, 23 Jan 2014 20:39:36 -0500
Received: from /spool/local
	by e23smtp02.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <stewart@river.localdomain>;
	Fri, 24 Jan 2014 11:39:31 +1000
Received: from d23dlp03.au.ibm.com (202.81.31.214)
	by e23smtp02.au.ibm.com (202.81.31.208) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Fri, 24 Jan 2014 11:39:30 +1000
Received: from d23relay05.au.ibm.com (d23relay05.au.ibm.com [9.190.235.152])
	by d23dlp03.au.ibm.com (Postfix) with ESMTP id E44B13578050;
	Fri, 24 Jan 2014 12:39:29 +1100 (EST)
Received: from d23av01.au.ibm.com (d23av01.au.ibm.com [9.190.234.96])
	by d23relay05.au.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	s0O1KEbA56230134; Fri, 24 Jan 2014 12:20:15 +1100
Received: from d23av01.au.ibm.com (localhost [127.0.0.1])
	by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
	s0O1dRwH027013; Fri, 24 Jan 2014 12:39:27 +1100
Received: from river.localdomain (river.au.ibm.com [9.185.121.78])
	by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
	s0O1dR53027004; Fri, 24 Jan 2014 12:39:27 +1100
Received: by river.localdomain (Postfix, from userid 1000)
	id 79D662391FB9; Fri, 24 Jan 2014 12:39:27 +1100 (EST)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Date: Fri, 24 Jan 2014 12:39:09 +1100
Message-Id: <1390527551-22069-5-git-send-email-stewart@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <1390527551-22069-1-git-send-email-stewart@linux.vnet.ibm.com>
References: <1390452896-20146-1-git-send-email-stewart@linux.vnet.ibm.com>
	<1390527551-22069-1-git-send-email-stewart@linux.vnet.ibm.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 14012401-5490-0000-0000-000004D38B8C
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 202.81.31.144
Cc: qemu-trivial@nongnu.org, Stewart Smith <stewart@linux.vnet.ibm.com>
Subject: [Qemu-trivial] [PATCH v2 4/6] configure: add help for
	--disable-xfsctl and --enable-xfsctl
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
X-List-Received-Date: Fri, 24 Jan 2014 01:39:55 -0000

Previously undocumented configure options

Signed-off-by: Stewart Smith <stewart@linux.vnet.ibm.com>
---
 configure | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/configure b/configure
index c225291..e607ebf 100755
--- a/configure
+++ b/configure
@@ -1252,6 +1252,8 @@ Advanced options, features (experts only):
   --enable-xen             enable xen backend driver support
   --disable-xen-pci-passthrough
   --enable-xen-pci-passthrough
+  --disable-xfsctl         disable xfsctl calls in block/raw (posix)
+  --enable-xfsctl          enable xfsctl (ZERO_RANGE and UNRESVSP) in block/raw
 
 Advanced options, Guest Agent (experts only):
   --disable-guest-agent    disable building of the QEMU Guest Agent
-- 
1.8.4.2


