Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h0hqp-0007U1-28
	for mharc-qemu-trivial@gnu.org; Mon, 04 Mar 2019 02:17:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45545)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1h0hqn-0007Sp-JM
	for qemu-trivial@nongnu.org; Mon, 04 Mar 2019 02:17:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1h0hqm-0007sM-ON
	for qemu-trivial@nongnu.org; Mon, 04 Mar 2019 02:17:25 -0500
Received: from mga04.intel.com ([192.55.52.120]:54099)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1h0hqk-0007mQ-JK; Mon, 04 Mar 2019 02:17:22 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Mar 2019 23:17:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,439,1544515200"; d="scan'208";a="323950983"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
	by fmsmga006.fm.intel.com with ESMTP; 03 Mar 2019 23:17:20 -0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: mjt@tls.msk.ru, imammedo@redhat.com, philmd@redhat.com, eblake@redhat.com,
	peter.maydell@linaro.org, sgarzare@redhat.com,
	Wei Yang <richardw.yang@linux.intel.com>
Date: Mon,  4 Mar 2019 15:16:30 +0800
Message-Id: <20190304071631.27567-2-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190304071631.27567-1-richardw.yang@linux.intel.com>
References: <20190304071631.27567-1-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.120
Subject: [Qemu-trivial] [PATCH v6 1/2] CODING_STYLE: specify the indent rule
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
X-List-Received-Date: Mon, 04 Mar 2019 07:17:26 -0000

We didn't specify the indent rule for multiline code here, which may
mislead users. And in current code, the code use various styles.

Add this rule in CODING_STYLE to make sure this is clear to every one.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
Suggested-by: Igor Mammedov <imammedo@redhat.com>

---
v6:
   * add ) for last example of function
v5:
   * different rules -> various styles
   * describe function variants separately
   * take struct out
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
 CODING_STYLE | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/CODING_STYLE b/CODING_STYLE
index ec075dedc4..90321e9c28 100644
--- a/CODING_STYLE
+++ b/CODING_STYLE
@@ -29,6 +29,45 @@ Spaces of course are superior to tabs because:
 
 Do not leave whitespace dangling off the ends of lines.
 
+1.1 Multiline Indent
+
+There are several places where indent is necessary:
+
+ - if/else
+ - while/for
+ - function definition & call
+
+When breaking up a long line to fit within line width, we need a proper indent
+for the following lines.
+
+In case of if/else, while/for, align the secondary lines just after the
+opening parenthesis of the first.
+
+For example:
+
+    if (a == 1 &&
+        b == 2) {
+
+    while (a == 1 &&
+           b == 2) {
+
+In case of function, there are several variants:
+
+    * 4 spaces indent from the beginning
+    * align the secondary lines just after the opening parenthesis of the
+      first
+
+For example:
+
+    do_something(x, y,
+        z);
+
+    do_something(x, y,
+                 z);
+
+    do_something(x, do_another(y,
+                               z));
+
 2. Line width
 
 Lines should be 80 characters; try not to make them longer.
-- 
2.19.1


