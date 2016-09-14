Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bk4Lg-0006rz-GF
	for mharc-qemu-trivial@gnu.org; Wed, 14 Sep 2016 03:11:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44786)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bk4Le-0006pL-Fe
	for qemu-trivial@nongnu.org; Wed, 14 Sep 2016 03:11:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bk4Ld-0006dV-Hk
	for qemu-trivial@nongnu.org; Wed, 14 Sep 2016 03:11:10 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:43388)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bk4LV-0006Vh-1f; Wed, 14 Sep 2016 03:11:01 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id DCB19417FF;
	Wed, 14 Sep 2016 10:10:54 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 77403AAB;
	Wed, 14 Sep 2016 10:10:54 +0300 (MSK)
To: Ladi Prosek <lprosek@redhat.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
References: <1465827648-3875-1-git-send-email-lprosek@redhat.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <23f4c0d7-72a0-72e6-8acb-7db2c59f3894@msgid.tls.msk.ru>
Date: Wed, 14 Sep 2016 10:10:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.2.0
MIME-Version: 1.0
In-Reply-To: <1465827648-3875-1-git-send-email-lprosek@redhat.com>
Content-Type: text/plain; charset=windows-1251; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH trivial] Remove unused function
 declarations
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
X-List-Received-Date: Wed, 14 Sep 2016 07:11:11 -0000

13.06.2016 17:20, Ladi Prosek wrote:
> Unused function declarations were found using a simple gcc plugin and
> manually verified by grepping the sources.

Applied to -trivial, thank you!

Verified it all, too.

/mjt

