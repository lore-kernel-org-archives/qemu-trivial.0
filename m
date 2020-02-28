Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j7USz-0002du-LS
	for mharc-qemu-trivial@gnu.org; Thu, 27 Feb 2020 20:29:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47094)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <colin.xu@intel.com>) id 1j7UKn-0008Pa-6N
 for qemu-trivial@nongnu.org; Thu, 27 Feb 2020 20:20:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <colin.xu@intel.com>) id 1j7UKl-0000SY-Pl
 for qemu-trivial@nongnu.org; Thu, 27 Feb 2020 20:20:56 -0500
Received: from mga04.intel.com ([192.55.52.120]:46102)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <colin.xu@intel.com>)
 id 1j7UKl-0000QY-IM; Thu, 27 Feb 2020 20:20:55 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Feb 2020 17:20:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,493,1574150400"; d="scan'208";a="232074795"
Received: from unknown (HELO coxu-arch-shz.sh.intel.com) ([10.239.160.37])
 by orsmga008.jf.intel.com with ESMTP; 27 Feb 2020 17:20:48 -0800
From: Colin Xu <colin.xu@intel.com>
To: qemu-devel@nongnu.org,
	philmd@redhat.com,
	pbonzini@redhat.com
Cc: colin.xu@intel.com, wenchao.wang@intel.com, hang.yuan@intel.com,
 qemu-trivial@nongnu.org
Subject: [PATCH V2] MAINTAINERS: Add entry for Guest X86 HAXM CPUs
Date: Fri, 28 Feb 2020 09:20:46 +0800
Message-Id: <20200228012046.6629-1-colin.xu@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.120
X-Mailman-Approved-At: Thu, 27 Feb 2020 20:29:24 -0500
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 28 Feb 2020 01:20:58 -0000

HAXM covers below files:
include/sysemu/hax.h
target/i386/hax-*

V2: Add HAXM github page for wiki and issue tracking.

Cc: Wenchao Wang <wenchao.wang@intel.com>
Cc: Hang Yuan <hang.yuan@intel.com>
Reviewed-by: Hang Yuan <hang.yuan@intel.com>
Signed-off-by: Colin Xu <colin.xu@intel.com>
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index df1786db3207..c45f1421eab5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -435,6 +435,17 @@ F: include/hw/block/dataplane/xen*
 F: include/hw/xen/
 F: include/sysemu/xen-mapcache.h
 
+Guest CPU Cores (HAXM)
+---------------------
+X86 HAXM CPUs
+M: Wenchao Wang <wenchao.wang@intel.com>
+M: Colin Xu <colin.xu@intel.com>
+L: haxm-team@intel.com
+W: https://github.com/intel/haxm/issues
+S: Maintained
+F: include/sysemu/hax.h
+F: target/i386/hax-*
+
 Hosts
 -----
 LINUX
-- 
2.25.1


