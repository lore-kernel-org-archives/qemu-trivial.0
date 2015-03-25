Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yan1x-0007uk-0U
	for mharc-qemu-trivial@gnu.org; Wed, 25 Mar 2015 11:15:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43108)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Yan1t-0007oq-ON
	for qemu-trivial@nongnu.org; Wed, 25 Mar 2015 11:15:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Yan1p-0005vY-L0
	for qemu-trivial@nongnu.org; Wed, 25 Mar 2015 11:15:37 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:47904)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Yan1f-0005pQ-Lg; Wed, 25 Mar 2015 11:15:24 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 5882242654;
	Wed, 25 Mar 2015 18:15:15 +0300 (MSK)
Message-ID: <5512D104.7080402@msgid.tls.msk.ru>
Date: Wed, 25 Mar 2015 18:15:16 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.5.0
MIME-Version: 1.0
To: Jan Kiszka <jan.kiszka@siemens.com>, 
	qemu-trivial <qemu-trivial@nongnu.org>
References: <550ABC48.5060602@siemens.com>
In-Reply-To: <550ABC48.5060602@siemens.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] pcspk: Fix I/O port name
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
X-List-Received-Date: Wed, 25 Mar 2015 15:15:38 -0000

19.03.2015 15:08, Jan Kiszka wrote:
> Probably a copy&paste bug. Fixing it helps identifying the device model
> behind port 0x61.

Applied to -trivial, thank you!

/mjt

