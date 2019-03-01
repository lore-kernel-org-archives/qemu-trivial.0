Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gzXVO-0001cA-EM
	for mharc-qemu-trivial@gnu.org; Thu, 28 Feb 2019 21:02:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57000)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1gzXVM-0001b5-Ce
	for qemu-trivial@nongnu.org; Thu, 28 Feb 2019 21:02:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1gzXVL-0002tZ-NA
	for qemu-trivial@nongnu.org; Thu, 28 Feb 2019 21:02:28 -0500
Received: from mga14.intel.com ([192.55.52.115]:42252)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1gzXVH-0002rO-Os; Thu, 28 Feb 2019 21:02:25 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Feb 2019 18:02:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,425,1544515200"; d="scan'208";a="150992326"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
	by fmsmga001.fm.intel.com with ESMTP; 28 Feb 2019 18:02:20 -0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: mjt@tls.msk.ru, imammedo@redhat.com, philmd@redhat.com, eblake@redhat.com,
	peter.maydell@linaro.org, Wei Yang <richardw.yang@linux.intel.com>
Date: Fri,  1 Mar 2019 10:01:45 +0800
Message-Id: <20190301020147.18567-1-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.115
Subject: [Qemu-trivial] [PATCH v5 0/2] CODING_STYLE: trivial update
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
X-List-Received-Date: Fri, 01 Mar 2019 02:02:29 -0000

The first one is suggested by Igor Mammedov to provide rule for multiline
code.

The second is a trivial fix to make example code all indented with 4 spaces.

v5:
  * mostly address function variants
v4:
  * one exception case for function
v3:
  * fix typo in both changelog and example
v2:
  * adjust Patch 1 as suggested by Eric

Wei Yang (2):
  CODING_STYLE: specify the indent rule for multiline code
  CODING_STYLE: indent example code as all others

 CODING_STYLE | 47 +++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 43 insertions(+), 4 deletions(-)

-- 
2.19.1


