Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XhCN9-0006A5-Ff
	for mharc-qemu-trivial@gnu.org; Thu, 23 Oct 2014 02:59:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35811)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XhCN1-0005ym-L8
	for qemu-trivial@nongnu.org; Thu, 23 Oct 2014 02:59:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XhCMv-0007rg-BB
	for qemu-trivial@nongnu.org; Thu, 23 Oct 2014 02:59:39 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:40808)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XhCMi-0007pa-Ql; Thu, 23 Oct 2014 02:59:20 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id BC50345ABF;
	Thu, 23 Oct 2014 10:59:19 +0400 (MSK)
Message-ID: <5448A747.30208@msgid.tls.msk.ru>
Date: Thu, 23 Oct 2014 10:59:19 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.8.1
MIME-Version: 1.0
To: Zhang Haoyu <zhanghy@sangfor.com>, qemu-devel <qemu-devel@nongnu.org>
References: <201410222039495960337@sangfor.com>
In-Reply-To: <201410222039495960337@sangfor.com>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Kevin Wolf <kwolf@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, Max Reitz <mreitz@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH v5] snapshot: use local variable to
 bdrv_pwrite_sync L1 table
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
X-List-Received-Date: Thu, 23 Oct 2014 06:59:45 -0000

On 10/22/2014 04:39 PM, Zhang Haoyu wrote:
> Use local variable to bdrv_pwrite_sync L1 table,
> needless to make conversion of cached L1 table between
> big-endian and host style.
...

Okay, so, why do you think that a patch which prompted such a hot
discussion and is at v5 already is applicable to -trivial to start
with?  Yes I know Max already took it, this is a rhetorical
question ;)

Thanks,

/mjt

