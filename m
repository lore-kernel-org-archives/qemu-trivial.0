Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aZG6V-0004QT-87
	for mharc-qemu-trivial@gnu.org; Fri, 26 Feb 2016 05:58:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55557)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1aZG6S-0004MH-3P
	for qemu-trivial@nongnu.org; Fri, 26 Feb 2016 05:58:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1aZG6R-0004Pl-32
	for qemu-trivial@nongnu.org; Fri, 26 Feb 2016 05:58:32 -0500
Received: from [59.151.112.132] (port=51710 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1aZG6L-0004Mh-TP; Fri, 26 Feb 2016 05:58:26 -0500
X-IronPort-AV: E=Sophos;i="5.20,346,1444665600"; 
   d="scan'208";a="3958476"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 Feb 2016 18:58:06 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id C3A0242B4AE6;
	Fri, 26 Feb 2016 18:58:03 +0800 (CST)
Received: from G08FNSTD140223.g08.fujitsu.local (10.167.226.69) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 26 Feb 2016 18:58:03 +0800
From: Cao jin <caoj.fnst@cn.fujitsu.com>
To: <qemu-devel@nongnu.org>
Date: Fri, 26 Feb 2016 18:59:03 +0800
Message-ID: <1456484343-7445-1-git-send-email-caoj.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.226.69]
X-yoursite-MailScanner-ID: C3A0242B4AE6.AAD3D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: caoj.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org
Subject: [Qemu-trivial] [PATCH v2] doc/memory.txt: fix typo
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
X-List-Received-Date: Fri, 26 Feb 2016 10:58:33 -0000

and also modify its description, make the text parallel to the existing
.impl.unaligned doc.

bonus: slightly modified the diagram, make it prettier.
Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
---
 docs/memory.txt | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/docs/memory.txt b/docs/memory.txt
index 8745f76..8aee3d6 100644
--- a/docs/memory.txt
+++ b/docs/memory.txt
@@ -186,15 +186,15 @@ of its own subregions: D of size 0x1000 at offset 0 and E of size 0x1000 at
 offset 0x2000. As a diagram:
 
         0      1000   2000   3000   4000   5000   6000   7000    8000
-        |------|------|------|------|------|------|------|-------|
+        |------|------|------|------|------|------|------|------|
   A:    [                                                       ]
-  C:    [CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC]
-  B:                  [                          ]
-  D:                  [DDDDD]
-  E:                                [EEEEE]
+  C:    [CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC]
+  B:                  [                           ]
+  D:                  [DDDDDD]
+  E:                                [EEEEEE]
 
 The regions that will be seen within this address range then are:
-        [CCCCCCCCCCCC][DDDDD][CCCCC][EEEEE][CCCCC]
+        [CCCCCCCCCCCCC[DDDDDD]CCCCCC[EEEEEE]CCCCCC]
 
 Since B has higher priority than C, its subregions appear in the flat map
 even where they overlap with C. In ranges where B has not mapped anything
@@ -203,7 +203,7 @@ C's region appears.
 If B had provided its own MMIO operations (ie it was not a pure container)
 then these would be used for any addresses in its range not handled by
 D or E, and the result would be:
-        [CCCCCCCCCCCC][DDDDD][BBBBB][EEEEE][BBBBB]
+        [CCCCCCCCCCCCC[DDDDDD]BBBBBB[EEEEEE]BBBBBB]
 
 Priority values are local to a container, because the priorities of two
 regions are only compared when they are both children of the same container.
@@ -297,8 +297,9 @@ various constraints can be supplied to control how these callbacks are called:
  - .valid.min_access_size, .valid.max_access_size define the access sizes
    (in bytes) which the device accepts; accesses outside this range will
    have device and bus specific behaviour (ignored, or machine check)
- - .valid.aligned specifies that the device only accepts naturally aligned
-   accesses.  Unaligned accesses invoke device and bus specific behaviour.
+ - .valid.unaligned specifies that the *device being modelled* supports
+   unaligned accesses; If false, unaligned accesses will invoke the appropriate
+   bus or CPU specific behaviour.
  - .impl.min_access_size, .impl.max_access_size define the access sizes
    (in bytes) supported by the *implementation*; other access sizes will be
    emulated using the ones available.  For example a 4-byte write will be
-- 
2.1.0




