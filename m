Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aykqw-0007OB-PL
	for mharc-qemu-trivial@gnu.org; Fri, 06 May 2016 14:51:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46719)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aykqp-00075U-Gl
	for qemu-trivial@nongnu.org; Fri, 06 May 2016 14:51:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aykqd-0006o1-Qz
	for qemu-trivial@nongnu.org; Fri, 06 May 2016 14:51:42 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:55683)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1aykqL-0006ed-UD; Fri, 06 May 2016 14:51:18 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 4782240619;
	Fri,  6 May 2016 21:51:03 +0300 (MSK)
To: Stefan Weil <sw@weilnetz.de>, QEMU Developer <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
References: <1460131873-8571-1-git-send-email-sw@weilnetz.de>
From: Michael Tokarev <mjt@tls.msk.ru>
Openpgp: id=6EE195D1886E8FFB810D4324457CE0A0804465C5
Organization: Telecom Service, JSC
Message-ID: <572CE796.9060104@msgid.tls.msk.ru>
Date: Fri, 6 May 2016 21:51:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.7.0
MIME-Version: 1.0
In-Reply-To: <1460131873-8571-1-git-send-email-sw@weilnetz.de>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] configure: Use uniform description for
 devel packages
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
X-List-Received-Date: Fri, 06 May 2016 18:51:53 -0000

08.04.2016 19:11, Stefan Weil wrote:
> As all other devel packages are written in the form "name devel",
> use this form for libcap devel and libattr devel, too.

(Finally) applied to -trivial, thanks!

/mjt

