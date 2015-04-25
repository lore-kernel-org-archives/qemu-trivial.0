Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YltYS-0003sx-Fy
	for mharc-qemu-trivial@gnu.org; Sat, 25 Apr 2015 02:27:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47262)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YltYQ-0003qy-Mo
	for qemu-trivial@nongnu.org; Sat, 25 Apr 2015 02:27:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YltYP-0005ut-Vy
	for qemu-trivial@nongnu.org; Sat, 25 Apr 2015 02:27:06 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:44491)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YltYJ-0005uE-Mz; Sat, 25 Apr 2015 02:26:59 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 1970F4234D;
	Sat, 25 Apr 2015 09:26:59 +0300 (MSK)
Message-ID: <553B33B2.4010106@msgid.tls.msk.ru>
Date: Sat, 25 Apr 2015 09:26:58 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.6.0
MIME-Version: 1.0
To: Jan Kiszka <jan.kiszka@siemens.com>, 
	qemu-trivial <qemu-trivial@nongnu.org>
References: <553A8046.7080709@siemens.com>
In-Reply-To: <553A8046.7080709@siemens.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] hostmem: Fix mem-path property name in
	error report
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
X-List-Received-Date: Sat, 25 Apr 2015 06:27:07 -0000

24.04.2015 20:41, Jan Kiszka wrote:
> The subtle difference between "property not found" and "property not
> set" is already confusing enough.


Applied to -trivial, thanks!

/mjt

