Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1guCjC-0000Q1-Gf
	for mharc-qemu-trivial@gnu.org; Thu, 14 Feb 2019 03:50:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45389)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1guCjA-0000Ob-8i
	for qemu-trivial@nongnu.org; Thu, 14 Feb 2019 03:50:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1guCj5-0002Wr-1f
	for qemu-trivial@nongnu.org; Thu, 14 Feb 2019 03:50:37 -0500
Received: from mga05.intel.com ([192.55.52.43]:41876)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1guCj1-0002QD-R0; Thu, 14 Feb 2019 03:50:33 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Feb 2019 00:50:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,368,1544515200"; d="scan'208";a="126382329"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
	by orsmga003.jf.intel.com with ESMTP; 14 Feb 2019 00:50:19 -0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Cc: mst@redhat.com, laurent@vivier.eu, imammedo@redhat.com, philmd@redhat.com,
	thuth@redhat.com, Wei Yang <richardw.yang@linux.intel.com>
Date: Thu, 14 Feb 2019 16:49:36 +0800
Message-Id: <20190214084939.20640-1-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.43
Subject: [Qemu-trivial] [Patch v4 0/3] Trivial cleanup in hw/acpi
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
X-List-Received-Date: Thu, 14 Feb 2019 08:50:41 -0000

There are several functions/variable which are not used anymore.

This serials just remove those without functional change.

v4: fix reviewed-by tags
v3: add ack and repost in a new thread
v2: change commit log from "is now used in no place" to "in not used anymore"

Wei Yang (3):
  hw/i386/pc.c: remove unused function pc_acpi_init()
  hw/acpi: remove unused function acpi_table_add_builtin()
  hw/acpi: remove unnecessary variable acpi_table_builtin

 hw/acpi/core.c         | 10 +---------
 hw/i386/pc.c           | 27 ---------------------------
 include/hw/acpi/acpi.h |  1 -
 include/hw/i386/pc.h   |  1 -
 4 files changed, 1 insertion(+), 38 deletions(-)

-- 
2.19.1


