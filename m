Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gy51y-0008CA-Cw
	for mharc-qemu-trivial@gnu.org; Sun, 24 Feb 2019 20:26:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53193)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1gy51w-0008BD-B4
	for qemu-trivial@nongnu.org; Sun, 24 Feb 2019 20:26:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1gy51v-0006Pp-ON
	for qemu-trivial@nongnu.org; Sun, 24 Feb 2019 20:26:04 -0500
Received: from mga06.intel.com ([134.134.136.31]:2796)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1gy51t-0006Mw-Cq; Sun, 24 Feb 2019 20:26:01 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Feb 2019 17:25:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,409,1544515200"; d="scan'208";a="124902271"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
	by fmsmga007.fm.intel.com with ESMTP; 24 Feb 2019 17:25:57 -0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: mjt@tls.msk.ru, imammedo@redhat.com, philmd@redhat.com, eblake@redhat.com,
	peter.maydell@linaro.org, Wei Yang <richardw.yang@linux.intel.com>
Date: Mon, 25 Feb 2019 09:25:28 +0800
Message-Id: <20190225012530.28225-1-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.31
Subject: [Qemu-trivial] [PATCH v4 0/2] CODING_STYLE: trivial update
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
X-List-Received-Date: Mon, 25 Feb 2019 01:26:05 -0000

The first one is suggested by Igor Mammedov to provide rule for multiline
code.

The second is a trivial fix to make example code all indented with 4 spaces.

v4:
  * one exception case for function
v3:
  * fix typo in both changelog and example
v2:
  * adjust Patch 1 as suggested by Eric


Wei Yang (2):
  CODING_STYLE: specify the indent rule for multiline code
  CODING_STYLE: indent example code as all others

 CODING_STYLE | 37 +++++++++++++++++++++++++++++++++----
 1 file changed, 33 insertions(+), 4 deletions(-)

-- 
2.19.1


