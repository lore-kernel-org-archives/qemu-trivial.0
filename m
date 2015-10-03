Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zk67z-00082B-6o
	for mharc-qemu-trivial@gnu.org; Thu, 08 Oct 2015 04:00:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55187)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZiQ9z-00020O-Ng
	for qemu-trivial@nongnu.org; Sat, 03 Oct 2015 12:59:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZiQ9z-0007TS-1R
	for qemu-trivial@nongnu.org; Sat, 03 Oct 2015 12:59:47 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:40770)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZiQ9u-0007Oq-Ur; Sat, 03 Oct 2015 12:59:43 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 392074035C;
	Sat,  3 Oct 2015 19:59:42 +0300 (MSK)
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 1EA03A66;
	Sat,  3 Oct 2015 19:59:42 +0300 (MSK)
Message-ID: <5610097E.5090306@msgid.tls.msk.ru>
Date: Sat, 03 Oct 2015 19:59:42 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: Shraddha Barke <shraddha.6596@gmail.com>, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-trivial@nongnu.org
References: <1443191763-3445-1-git-send-email-shraddha.6596@gmail.com>
	<1443191763-3445-2-git-send-email-shraddha.6596@gmail.com>
In-Reply-To: <1443191763-3445-2-git-send-email-shraddha.6596@gmail.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH 2/2] Hw: timer: Remove unnecessary
	variable
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
X-List-Received-Date: Sat, 03 Oct 2015 16:59:48 -0000

25.09.2015 17:36, Shraddha Barke wrote:
> Compress lines and remove the variable.

Applied to -trivial, removing the Coccinelle script
from the commit message.

Thanks,

/mjt

