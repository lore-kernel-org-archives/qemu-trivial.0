Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XhC66-000880-JB
	for mharc-qemu-trivial@gnu.org; Thu, 23 Oct 2014 02:42:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33084)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XhC5z-0007y5-Hu
	for qemu-trivial@nongnu.org; Thu, 23 Oct 2014 02:42:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XhC5t-0002Ci-DA
	for qemu-trivial@nongnu.org; Thu, 23 Oct 2014 02:42:03 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:44268)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XhC5g-0002Bf-SN; Thu, 23 Oct 2014 02:41:45 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 207DA45AC0;
	Thu, 23 Oct 2014 10:41:44 +0400 (MSK)
Message-ID: <5448A326.1070608@msgid.tls.msk.ru>
Date: Thu, 23 Oct 2014 10:41:42 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.8.1
MIME-Version: 1.0
To: Michal Privoznik <mprivozn@redhat.com>, qemu-devel@nongnu.org
References: <26626bbd0b1652d964c39937c378bb53089260f6.1413465100.git.mprivozn@redhat.com>
In-Reply-To: <26626bbd0b1652d964c39937c378bb53089260f6.1413465100.git.mprivozn@redhat.com>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, kwolf@redhat.com
Subject: Re: [Qemu-trivial] [PATCH] util: Improve os_mem_prealloc error
	message
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
X-List-Received-Date: Thu, 23 Oct 2014 06:42:09 -0000

On 10/16/2014 05:13 PM, Michal Privoznik wrote:
> Currently, when the preallocating guest memory process fails, an not
> so helpful error message is printed out:
[..]

Applied to -trivial finally, with small commit message corrections
from Eric.  Thanks!

/mjt

