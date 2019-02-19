Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gvuGE-0006pp-U6
	for mharc-qemu-trivial@gnu.org; Mon, 18 Feb 2019 20:31:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37006)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1gvuGD-0006pR-9S
	for qemu-trivial@nongnu.org; Mon, 18 Feb 2019 20:31:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1gvuGC-000267-JJ
	for qemu-trivial@nongnu.org; Mon, 18 Feb 2019 20:31:49 -0500
Received: from mga18.intel.com ([134.134.136.126]:14723)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1gvuGA-00023B-Qy; Mon, 18 Feb 2019 20:31:47 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Feb 2019 17:31:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,385,1544515200"; d="scan'208";a="320097212"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
	by fmsmga006.fm.intel.com with ESMTP; 18 Feb 2019 17:31:38 -0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: mjt@tls.msk.ru, imammedo@redhat.com,
	Wei Yang <richardw.yang@linux.intel.com>
Date: Tue, 19 Feb 2019 09:31:05 +0800
Message-Id: <20190219013106.17538-2-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190219013106.17538-1-richardw.yang@linux.intel.com>
References: <20190219013106.17538-1-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.126
Subject: [Qemu-trivial] [PATCH 1/2] CODING_STYLE: specify the indent rule
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
X-List-Received-Date: Tue, 19 Feb 2019 01:31:50 -0000

We didn't specify the indent rule for multiline code here, which may
misleading users. And in current code, the code use different rules.

Add this rule in CODING_STYLE to make sure this is clear to every one.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
Suggested-by: Igor Mammedov <imammedo@redhat.com>
---
 CODING_STYLE | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/CODING_STYLE b/CODING_STYLE
index ec075dedc4..73f66ca185 100644
--- a/CODING_STYLE
+++ b/CODING_STYLE
@@ -29,6 +29,32 @@ Spaces of course are superior to tabs because:
 
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
+All the above cases apply the same rule: indent with four spaces.
+
+While the last three case may face another situation: code should spread into
+several lines. In this case the rule is align the new line with first
+parentheses.
+
+For example:
+
+    if (a == 1 &&
+        b == 2)
+
+    while (a == 1 &&
+           b == 2)
+
+    do_something(arg1, arg2
+                 arg3)
+
 2. Line width
 
 Lines should be 80 characters; try not to make them longer.
-- 
2.19.1


