Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xycl1-00015Z-FR
	for mharc-qemu-trivial@gnu.org; Wed, 10 Dec 2014 03:36:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35017)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xyckt-0000w6-Sm
	for qemu-trivial@nongnu.org; Wed, 10 Dec 2014 03:36:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xyckn-0000E7-Od
	for qemu-trivial@nongnu.org; Wed, 10 Dec 2014 03:36:19 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:35727)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Xyckb-0000D1-5t; Wed, 10 Dec 2014 03:36:01 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 73A37419AF;
	Wed, 10 Dec 2014 11:36:00 +0300 (MSK)
Message-ID: <548805F0.10100@msgid.tls.msk.ru>
Date: Wed, 10 Dec 2014 11:36:00 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.2.0
MIME-Version: 1.0
To: Fam Zheng <famz@redhat.com>, qemu-devel@nongnu.org
References: <1417673896-14832-1-git-send-email-famz@redhat.com>
In-Reply-To: <1417673896-14832-1-git-send-email-famz@redhat.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [Qemu-trivial] [PATCH for-2.3] configure: Replace which(1) with
 "has"
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
X-List-Received-Date: Wed, 10 Dec 2014 08:36:26 -0000

04.12.2014 09:18, Fam Zheng wrote:
> Using "has" is more slick because which(1) is not always there.

Applied to -trivial, thank you!

/mjt

