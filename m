Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V1g5V-0007tB-Bj
	for mharc-qemu-trivial@gnu.org; Tue, 23 Jul 2013 13:09:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56137)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1V1g5T-0007rG-Fo
	for qemu-trivial@nongnu.org; Tue, 23 Jul 2013 13:09:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1V1g5S-0007Sy-1S
	for qemu-trivial@nongnu.org; Tue, 23 Jul 2013 13:09:23 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:45831)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1V1g5O-0007S4-Gj; Tue, 23 Jul 2013 13:09:18 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 1AE73429A5;
	Tue, 23 Jul 2013 21:09:15 +0400 (MSK)
Message-ID: <51EEB8BA.7040405@msgid.tls.msk.ru>
Date: Tue, 23 Jul 2013 21:09:14 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/20130704 Icedove/17.0.7
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1371377676-18809-1-git-send-email-sw@weilnetz.de>
	<87fvvubt9s.fsf@in.ibm.com> <51E98F49.7010300@weilnetz.de>
In-Reply-To: <51E98F49.7010300@weilnetz.de>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	Anthony Liguori <aliguori@us.ibm.com>, "M. Mohan Kumar" <mohan@in.ibm.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/9pfs: Fix potential
 memory leak and avoid reuse of freed memory
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
X-List-Received-Date: Tue, 23 Jul 2013 17:09:24 -0000

19.07.2013 23:11, Stefan Weil wrote:
> Am 04.07.2013 10:53, schrieb M. Mohan Kumar:
>> Stefan Weil <sw@weilnetz.de> writes:
>>
>>> The leak was reported by cppcheck.
>>>
>>> Function proxy_init also calls g_free for ctx->fs_root.
>>> Avoid reuse of this memory by setting ctx->fs_root to NULL.
>>>
>>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>> Reviewed-by: M. Mohan Kumar <mohan@in.ibm.com>

Thanks, applied to the trivial patches queue.

/mjt

