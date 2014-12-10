Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xyd5x-00006W-Cv
	for mharc-qemu-trivial@gnu.org; Wed, 10 Dec 2014 03:58:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42780)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xyd5p-0008Px-E7
	for qemu-trivial@nongnu.org; Wed, 10 Dec 2014 03:58:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xyd5j-00085M-2d
	for qemu-trivial@nongnu.org; Wed, 10 Dec 2014 03:57:57 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:37594)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Xyd5W-00080d-CY; Wed, 10 Dec 2014 03:57:38 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id EFFB8419BC;
	Wed, 10 Dec 2014 11:57:36 +0300 (MSK)
Message-ID: <54880B00.3030108@msgid.tls.msk.ru>
Date: Wed, 10 Dec 2014 11:57:36 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.2.0
MIME-Version: 1.0
To: zhanghailiang <zhang.zhanghailiang@huawei.com>, 
 qemu-trivial@nongnu.org
References: <1418109359-2364-1-git-send-email-zhang.zhanghailiang@huawei.com>
In-Reply-To: <1418109359-2364-1-git-send-email-zhang.zhanghailiang@huawei.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: sw@weilnetz.de, armbru@redhat.com, qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, peter.huangpeng@huawei.com,
	afaerber@suse.de
Subject: Re: [Qemu-trivial] [PATCH v2] vt82c686: fix coverity warning about
 out-of-bounds write
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
X-List-Received-Date: Wed, 10 Dec 2014 08:58:03 -0000

09.12.2014 10:15, zhanghailiang wrote:
> Refactor superio_ioport_writeb to fix the out of bounds write warning.

Is it just a warning, or real oob write?
From the code it looks like it's just a warning...

[]
> +
> +        }
> +        if (can_write == true) {

09.12.2014 17:08, Paolo Bonzini wrote:
> Michael, can you remove "== true" when applying this patch?

Sure, just did.  Does it mean I can add your R-b too? ;)

Thanks,

/mjt

