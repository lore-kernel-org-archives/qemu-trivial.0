Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aWJnI-00034j-4J
	for mharc-qemu-trivial@gnu.org; Thu, 18 Feb 2016 03:18:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54968)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1aWJnF-000315-0K
	for qemu-trivial@nongnu.org; Thu, 18 Feb 2016 03:18:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1aWJnE-00025R-5J
	for qemu-trivial@nongnu.org; Thu, 18 Feb 2016 03:18:32 -0500
Received: from [59.151.112.132] (port=46740 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1aWJn7-00024m-RD; Thu, 18 Feb 2016 03:18:26 -0500
X-IronPort-AV: E=Sophos;i="5.20,346,1444665600"; 
   d="scan'208";a="3671026"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 Feb 2016 16:18:22 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id E4C6942AC844;
	Thu, 18 Feb 2016 16:16:41 +0800 (CST)
Received: from G08FNSTD140223.g08.fujitsu.local (10.167.226.69) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Thu, 18 Feb 2016 16:18:20 +0800
From: Cao jin <caoj.fnst@cn.fujitsu.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 18 Feb 2016 16:18:56 +0800
Message-ID: <1455783536-27909-1-git-send-email-caoj.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.226.69]
X-yoursite-MailScanner-ID: E4C6942AC844.A8C2C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: caoj.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Cc: qemu-trivial@nongnu.org, imammedo@redhat.com
Subject: [Qemu-trivial] [PATCH] remove comment for nonexistent structure
	member
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
X-List-Received-Date: Thu, 18 Feb 2016 08:18:33 -0000

Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
---
 include/sysemu/hostmem.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/sysemu/hostmem.h b/include/sysemu/hostmem.h
index 1ce4394..82cc6c5 100644
--- a/include/sysemu/hostmem.h
+++ b/include/sysemu/hostmem.h
@@ -45,7 +45,6 @@ struct HostMemoryBackendClass {
  *
  * @parent: opaque parent object container
  * @size: amount of memory backend provides
- * @id: unique identification string in memdev namespace
  * @mr: MemoryRegion representing host memory belonging to backend
  */
 struct HostMemoryBackend {
-- 
2.1.0




