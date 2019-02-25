Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gy51z-0008EI-VO
	for mharc-qemu-trivial@gnu.org; Sun, 24 Feb 2019 20:26:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53228)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1gy51x-0008Bx-Va
	for qemu-trivial@nongnu.org; Sun, 24 Feb 2019 20:26:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1gy51x-0006Qr-8E
	for qemu-trivial@nongnu.org; Sun, 24 Feb 2019 20:26:05 -0500
Received: from mga02.intel.com ([134.134.136.20]:17645)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1gy51v-0006PA-1R; Sun, 24 Feb 2019 20:26:03 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Feb 2019 17:26:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,409,1544515200"; d="scan'208";a="146205282"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
	by fmsmga002.fm.intel.com with ESMTP; 24 Feb 2019 17:26:00 -0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: mjt@tls.msk.ru, imammedo@redhat.com, philmd@redhat.com, eblake@redhat.com,
	peter.maydell@linaro.org, Wei Yang <richardw.yang@linux.intel.com>
Date: Mon, 25 Feb 2019 09:25:29 +0800
Message-Id: <20190225012530.28225-2-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190225012530.28225-1-richardw.yang@linux.intel.com>
References: <20190225012530.28225-1-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.20
Subject: [Qemu-trivial] [PATCH v4 1/2] CODING_STYLE: specify the indent rule
 for multiline code
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 25 Feb 2019 01:26:06 -0000

We didn't specify the indent rule for multiline code here, which may
mislead users. And in current code, the code use different rules.

Add this rule in CODING_STYLE to make sure this is clear to every one.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
Suggested-by: Igor Mammedov <imammedo@redhat.com>

---
v4:
   * widths -> width
   * add an exception example for function
v3:
   * misleading -> mislead
   * add comma after arg2 in example
v2:
   * rephrase changelog suggested by Eric Blake
     - remove one redundant line
     - fix some awkward grammar
     - add { ; at the end of example
---
 CODING_STYLE | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/CODING_STYLE b/CODING_STYLE
index ec075dedc4..1bccf4f865 100644
--- a/CODING_STYLE
+++ b/CODING_STYLE
@@ -29,6 +29,35 @@ Spaces of course are superior to tabs because:
 
 Do not leave whitespace dangling off the ends of lines.
 
+1.1 Multiline Indent
+
+There are several places where indent is necessary:
+
+ - struct definition
+ - if/else
+ - while/for
+ - function definition & call
+
+When breaking up a long line to fit within line width, align the secondary
+lines just after the opening parenthesis of the first.
+
+For example:
+
+    if (a == 1 &&
+        b == 2) {
+
+    while (a == 1 &&
+           b == 2) {
+
+    do_something(arg1, arg2,
+                 arg3);
+
+One exception for function is indenting following lines relative to function
+name start:
+
+    do_something(arg1, arg2,
+        arg3);
+
 2. Line width
 
 Lines should be 80 characters; try not to make them longer.
-- 
2.19.1


