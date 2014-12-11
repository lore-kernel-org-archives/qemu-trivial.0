Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xz7xm-0005Vh-KM
	for mharc-qemu-trivial@gnu.org; Thu, 11 Dec 2014 12:55:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43098)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xz7xe-0005SQ-ET
	for qemu-trivial@nongnu.org; Thu, 11 Dec 2014 12:55:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xz7xX-000243-G0
	for qemu-trivial@nongnu.org; Thu, 11 Dec 2014 12:55:34 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:34256)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Xz7xJ-0001pO-Kj; Thu, 11 Dec 2014 12:55:13 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id C8A5941D2D;
	Thu, 11 Dec 2014 20:55:04 +0300 (MSK)
Message-ID: <5489DA78.9030003@msgid.tls.msk.ru>
Date: Thu, 11 Dec 2014 20:55:04 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.2.0
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <1418203056-5365-1-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1418203056-5365-1-git-send-email-pbonzini@redhat.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, zhang.zhanghailiang@huawei.com,
	peter.huangpeng@huawei.com
Subject: Re: [Qemu-trivial] [PATCH] vt82c686: avoid out-of-bounds read
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
X-List-Received-Date: Thu, 11 Dec 2014 17:55:40 -0000

10.12.2014 12:17, Paolo Bonzini wrote:
> superio_ioport_readb can read the 256th element of the array.

Is there a legitimate reason for it to access byte index 256?
What is the actual size of superio config memory, 256 or 257?
I don't know, but somehow it looks like it should be 256.
If that's the case, the fix is wrong and superio_ioport_readb()
should be fixed instead...

Thanks,

/mjt

