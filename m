Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gvuHQ-0007N1-AO
	for mharc-qemu-trivial@gnu.org; Mon, 18 Feb 2019 20:33:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37337)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1gvuHL-0007LE-Bg
	for qemu-trivial@nongnu.org; Mon, 18 Feb 2019 20:33:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1gvuHJ-0002YS-Fd
	for qemu-trivial@nongnu.org; Mon, 18 Feb 2019 20:32:59 -0500
Received: from mga07.intel.com ([134.134.136.100]:53677)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1gvuH3-00022j-Ec; Mon, 18 Feb 2019 20:32:43 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Feb 2019 17:31:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,385,1544515200"; d="scan'208";a="145336672"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
	by fmsmga004.fm.intel.com with ESMTP; 18 Feb 2019 17:31:37 -0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: mjt@tls.msk.ru, imammedo@redhat.com,
	Wei Yang <richardw.yang@linux.intel.com>
Date: Tue, 19 Feb 2019 09:31:04 +0800
Message-Id: <20190219013106.17538-1-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.100
Subject: [Qemu-trivial] [PATCH 0/2] CODING_STYLE: trivial update
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
X-List-Received-Date: Tue, 19 Feb 2019 01:33:00 -0000

The first one is suggested by Igor Mammedov to provide rule for multiline
code.

The second is a trivial fix to make example code all indented with 4 spaces.

Wei Yang (2):
  CODING_STYLE: specify the indent rule for multiline code
  CODING_STYLE: indent example code as all others

 CODING_STYLE | 34 ++++++++++++++++++++++++++++++----
 1 file changed, 30 insertions(+), 4 deletions(-)

-- 
2.19.1


