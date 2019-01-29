Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1goHBD-0003cP-8f
	for mharc-qemu-trivial@gnu.org; Mon, 28 Jan 2019 19:23:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40213)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1goHB9-0003TM-CL
	for qemu-trivial@nongnu.org; Mon, 28 Jan 2019 19:23:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1goGxq-00008v-K9
	for qemu-trivial@nongnu.org; Mon, 28 Jan 2019 19:09:19 -0500
Received: from mga03.intel.com ([134.134.136.65]:3979)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1goGxq-00008S-Ci; Mon, 28 Jan 2019 19:09:18 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Jan 2019 16:09:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,535,1539673200"; d="scan'208";a="110542221"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.37])
	by orsmga007.jf.intel.com with ESMTP; 28 Jan 2019 16:09:15 -0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Cc: mst@redhat.com, laurent@vivier.eu, imammedo@redhat.com,
	Wei Yang <richardw.yang@linux.intel.com>
Date: Tue, 29 Jan 2019 08:08:17 +0800
Message-Id: <20190129000820.31190-1-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190125060157.29935-1-richardw.yang@linux.intel.com>
References: <20190125060157.29935-1-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.65
Subject: [Qemu-trivial] [PATCH v2 0/3] Trivial cleanup in hw/acpi
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
X-List-Received-Date: Tue, 29 Jan 2019 00:23:04 -0000

There are several functions/variable which are not used anymore.

This serials just remove those without functional change.

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


