Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ss7KH-0000ne-BH
	for mharc-qemu-trivial@gnu.org; Fri, 20 Jul 2012 03:08:37 -0400
Received: from eggs.gnu.org ([208.118.235.92]:47090)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <junjie.mao@intel.com>) id 1Ss7KE-0000i9-GS
	for qemu-trivial@nongnu.org; Fri, 20 Jul 2012 03:08:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <junjie.mao@intel.com>) id 1Ss7KD-00005I-EW
	for qemu-trivial@nongnu.org; Fri, 20 Jul 2012 03:08:34 -0400
Received: from mga09.intel.com ([134.134.136.24]:48721)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <junjie.mao@intel.com>)
	id 1Ss7K6-0008WB-E1; Fri, 20 Jul 2012 03:08:26 -0400
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 20 Jul 2012 00:08:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="168813816"
Received: from fmsmsx107.amr.corp.intel.com ([10.19.9.54])
	by orsmga001.jf.intel.com with ESMTP; 20 Jul 2012 00:08:23 -0700
Received: from fmsmsx152.amr.corp.intel.com (10.19.17.221) by
	FMSMSX107.amr.corp.intel.com (10.19.9.54) with Microsoft SMTP Server
	(TLS) id 14.1.355.2; Fri, 20 Jul 2012 00:08:23 -0700
Received: from shsmsx151.ccr.corp.intel.com (10.239.6.50) by
	fmsmsx152.amr.corp.intel.com (10.19.17.221) with Microsoft SMTP Server
	(TLS) id 14.1.355.2; Fri, 20 Jul 2012 00:08:19 -0700
Received: from shsmsx101.ccr.corp.intel.com ([169.254.1.82]) by
	SHSMSX151.ccr.corp.intel.com ([169.254.3.47]) with mapi id
	14.01.0355.002; Fri, 20 Jul 2012 15:08:22 +0800
From: "Mao, Junjie" <junjie.mao@intel.com>
To: "'qemu-devel@nongnu.org'" <qemu-devel@nongnu.org>, "'kvm@vger.kernel.org'"
	<kvm@vger.kernel.org>
Thread-Topic: [PATCH RESEND] Recognize PCID feature
Thread-Index: Ac1gtA9KB3xI4dATSxiEbIlMCDg43wEjwiqw
Date: Fri, 20 Jul 2012 07:08:21 +0000
Message-ID: <EF5A1D57CFBD5A4BA5EB3ED985B6DC6E0B4633@SHSMSX101.ccr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.127.40]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.24
Cc: "'qemu-trivial@nongnu.org'" <qemu-trivial@nongnu.org>
Subject: [Qemu-trivial] [PATCH RESEND] Recognize PCID feature
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Jul 2012 07:08:35 -0000

This patch makes Qemu recognize the PCID feature specified from configurati=
on or command line options.

Signed-off-by: Junjie Mao <junjie.mao@intel.com>
---
 target-i386/cpu.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/target-i386/cpu.c b/target-i386/cpu.c index 5521709..efc6ece
100644
--- a/target-i386/cpu.c
+++ b/target-i386/cpu.c
@@ -50,7 +50,7 @@ static const char *ext_feature_name[] =3D {
     "ds_cpl", "vmx", "smx", "est",
     "tm2", "ssse3", "cid", NULL,
     "fma", "cx16", "xtpr", "pdcm",
-    NULL, NULL, "dca", "sse4.1|sse4_1",
+    NULL, "pcid", "dca", "sse4.1|sse4_1",
     "sse4.2|sse4_2", "x2apic", "movbe", "popcnt",
     "tsc-deadline", "aes", "xsave", "osxsave",
     "avx", NULL, NULL, "hypervisor",
--
1.7.1

