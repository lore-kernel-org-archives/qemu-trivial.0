Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aYsHD-0007Up-1a
	for mharc-qemu-trivial@gnu.org; Thu, 25 Feb 2016 04:32:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56093)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1aYsHB-0007S2-3V
	for qemu-trivial@nongnu.org; Thu, 25 Feb 2016 04:32:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1aYsHA-0001Lb-26
	for qemu-trivial@nongnu.org; Thu, 25 Feb 2016 04:32:01 -0500
Received: from [59.151.112.132] (port=9463 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1aYsH2-00018g-CT; Thu, 25 Feb 2016 04:31:53 -0500
X-IronPort-AV: E=Sophos;i="5.20,346,1444665600"; 
   d="scan'208";a="3913651"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 25 Feb 2016 17:31:28 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 1C1F442AC85B;
	Thu, 25 Feb 2016 17:31:23 +0800 (CST)
Received: from G08FNSTD140223.g08.fujitsu.local (10.167.226.69) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Thu, 25 Feb 2016 17:31:22 +0800
From: Cao jin <caoj.fnst@cn.fujitsu.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 25 Feb 2016 17:32:19 +0800
Message-ID: <1456392739-30336-1-git-send-email-caoj.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.226.69]
X-yoursite-MailScanner-ID: 1C1F442AC85B.A9E4C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: caoj.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, peter.maydell@linaro.org
Subject: [Qemu-trivial] [PATCH] doc/memory.txt: fix typo
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
X-List-Received-Date: Thu, 25 Feb 2016 09:32:02 -0000

to match structure MemoryRegionOps definition

Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
---
And there seems are some out of date content in this file, like
"cpu_register_io_memory()" mentioned in the last line, which is removed several
years ago in commit 97161e177. I am sure how to modify it, So I take the
liberty to CC the guys in the cc-list(get list from get_maintainer.pl).

 docs/memory.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/memory.txt b/docs/memory.txt
index 8745f76..1a3ad622 100644
--- a/docs/memory.txt
+++ b/docs/memory.txt
@@ -297,7 +297,7 @@ various constraints can be supplied to control how these callbacks are called:
  - .valid.min_access_size, .valid.max_access_size define the access sizes
    (in bytes) which the device accepts; accesses outside this range will
    have device and bus specific behaviour (ignored, or machine check)
- - .valid.aligned specifies that the device only accepts naturally aligned
+ - .valid.unaligned specifies that the device only accepts naturally aligned
    accesses.  Unaligned accesses invoke device and bus specific behaviour.
  - .impl.min_access_size, .impl.max_access_size define the access sizes
    (in bytes) supported by the *implementation*; other access sizes will be
-- 
2.1.0




