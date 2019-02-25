Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gy521-0008Fb-4e
	for mharc-qemu-trivial@gnu.org; Sun, 24 Feb 2019 20:26:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53243)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1gy51z-0008DS-8n
	for qemu-trivial@nongnu.org; Sun, 24 Feb 2019 20:26:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1gy51y-0006Sw-JZ
	for qemu-trivial@nongnu.org; Sun, 24 Feb 2019 20:26:07 -0500
Received: from mga02.intel.com ([134.134.136.20]:17645)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1gy51w-0006PA-TT; Sun, 24 Feb 2019 20:26:05 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Feb 2019 17:26:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,409,1544515200"; d="scan'208";a="146205292"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
	by fmsmga002.fm.intel.com with ESMTP; 24 Feb 2019 17:26:02 -0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: mjt@tls.msk.ru, imammedo@redhat.com, philmd@redhat.com, eblake@redhat.com,
	peter.maydell@linaro.org, Wei Yang <richardw.yang@linux.intel.com>
Date: Mon, 25 Feb 2019 09:25:30 +0800
Message-Id: <20190225012530.28225-3-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190225012530.28225-1-richardw.yang@linux.intel.com>
References: <20190225012530.28225-1-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.20
Subject: [Qemu-trivial] [PATCH v4 2/2] CODING_STYLE: indent example code as
 all others
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
X-List-Received-Date: Mon, 25 Feb 2019 01:26:08 -0000

All the example code are indented with four spaces except this one.

Fix this by adding four spaces here.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 CODING_STYLE | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/CODING_STYLE b/CODING_STYLE
index 1bccf4f865..e6d21dcd67 100644
--- a/CODING_STYLE
+++ b/CODING_STYLE
@@ -137,10 +137,10 @@ block to a separate function altogether.
 When comparing a variable for (in)equality with a constant, list the
 constant on the right, as in:
 
-if (a == 1) {
-    /* Reads like: "If a equals 1" */
-    do_something();
-}
+    if (a == 1) {
+        /* Reads like: "If a equals 1" */
+        do_something();
+    }
 
 Rationale: Yoda conditions (as in 'if (1 == a)') are awkward to read.
 Besides, good compilers already warn users when '==' is mis-typed as '=',
-- 
2.19.1


