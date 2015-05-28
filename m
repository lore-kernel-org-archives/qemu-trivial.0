Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YxvoX-0000DT-5e
	for mharc-qemu-trivial@gnu.org; Thu, 28 May 2015 07:17:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41706)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YxvoT-00006x-Gs
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 07:17:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YxvoS-0005Ez-QR
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 07:17:25 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:55806)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YxvoL-00055h-PU; Thu, 28 May 2015 07:17:17 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 0938542715;
	Thu, 28 May 2015 14:17:17 +0300 (MSK)
Message-ID: <5566F93C.9070502@msgid.tls.msk.ru>
Date: Thu, 28 May 2015 14:17:16 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.6.0
MIME-Version: 1.0
To: Fam Zheng <famz@redhat.com>, qemu-devel@nongnu.org
References: <1431522928-5292-1-git-send-email-famz@redhat.com>
In-Reply-To: <1431522928-5292-1-git-send-email-famz@redhat.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] iscsi: Remove pointless runtime check of
	macro value
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
X-List-Received-Date: Thu, 28 May 2015 11:17:26 -0000

13.05.2015 16:15, Fam Zheng wrote:
> raw_bsd already has QEMU_BUILD_BUG_ON(BDRV_SECTOR_SIZE != 512), so iscsi
> should relax.

Applied to -trivial, thank you!

/mjt

