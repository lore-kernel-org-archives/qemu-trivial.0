Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aZGa8-0007Sa-Vb
	for mharc-qemu-trivial@gnu.org; Fri, 26 Feb 2016 06:29:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35640)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1aZGa2-0007Gv-TC
	for qemu-trivial@nongnu.org; Fri, 26 Feb 2016 06:29:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1aZGa2-0006Cf-20
	for qemu-trivial@nongnu.org; Fri, 26 Feb 2016 06:29:06 -0500
Received: from [59.151.112.132] (port=15227 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1aZGZu-00067f-Vy; Fri, 26 Feb 2016 06:29:00 -0500
X-IronPort-AV: E=Sophos;i="5.20,346,1444665600"; 
   d="scan'208";a="3959509"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 Feb 2016 19:28:50 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 8ABFE42B4AE4;
	Fri, 26 Feb 2016 19:28:46 +0800 (CST)
Received: from G08FNSTD140223.g08.fujitsu.local (10.167.226.69) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 26 Feb 2016 19:28:46 +0800
From: Cao jin <caoj.fnst@cn.fujitsu.com>
To: <qemu-devel@nongnu.org>
Date: Fri, 26 Feb 2016 19:29:37 +0800
Message-ID: <1456486178-8074-2-git-send-email-caoj.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1456486178-8074-1-git-send-email-caoj.fnst@cn.fujitsu.com>
References: <1456486178-8074-1-git-send-email-caoj.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.226.69]
X-yoursite-MailScanner-ID: 8ABFE42B4AE4.ACA9A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: caoj.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org
Subject: [Qemu-trivial] [PATCH v3 1/2] doc/memory: fix typo
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
X-List-Received-Date: Fri, 26 Feb 2016 11:29:11 -0000

Fix typo while also modify its description, make the text parallel to
the existing .impl.unaligned doc.

Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
---
 docs/memory.txt | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/docs/memory.txt b/docs/memory.txt
index 8745f76..306280e 100644
--- a/docs/memory.txt
+++ b/docs/memory.txt
@@ -297,8 +297,9 @@ various constraints can be supplied to control how these callbacks are called:
  - .valid.min_access_size, .valid.max_access_size define the access sizes
    (in bytes) which the device accepts; accesses outside this range will
    have device and bus specific behaviour (ignored, or machine check)
- - .valid.aligned specifies that the device only accepts naturally aligned
-   accesses.  Unaligned accesses invoke device and bus specific behaviour.
+ - .valid.unaligned specifies that the *device being modelled* supports
+   unaligned accesses. if false, unaligned accesses will invoke the appropriate
+   bus or CPU specific behaviour.
  - .impl.min_access_size, .impl.max_access_size define the access sizes
    (in bytes) supported by the *implementation*; other access sizes will be
    emulated using the ones available.  For example a 4-byte write will be
-- 
2.1.0




