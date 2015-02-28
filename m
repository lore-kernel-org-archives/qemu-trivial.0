Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YRe6I-0003Tz-7K
	for mharc-qemu-trivial@gnu.org; Sat, 28 Feb 2015 04:54:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47558)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YRe6E-0003Lz-P3
	for qemu-trivial@nongnu.org; Sat, 28 Feb 2015 04:54:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YRe6E-00036n-0R
	for qemu-trivial@nongnu.org; Sat, 28 Feb 2015 04:54:18 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:44698)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YRe65-00036H-Ey; Sat, 28 Feb 2015 04:54:09 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 8843143EE1;
	Sat, 28 Feb 2015 12:54:08 +0300 (MSK)
Message-ID: <54F19040.7000408@msgid.tls.msk.ru>
Date: Sat, 28 Feb 2015 12:54:08 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.4.0
MIME-Version: 1.0
To: arei.gonglei@huawei.com, qemu-devel@nongnu.org
References: <1425023419-12244-1-git-send-email-arei.gonglei@huawei.com>
In-Reply-To: <1425023419-12244-1-git-send-email-arei.gonglei@huawei.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, peter.huangpeng@huawei.com,
	armbru@redhat.com
Subject: Re: [Qemu-trivial] [PATCH 0/9] Coverity defects fixes
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
X-List-Received-Date: Sat, 28 Feb 2015 09:54:19 -0000

27.02.2015 10:50, arei.gonglei@huawei.com wrote:
> From: Gonglei <arei.gonglei@huawei.com>
> 
> All those defects are spotted by Coverity, which
> classed in high impact outstanding defects.
> Reports come from scan.coverity.com for Qemu.
> 
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Markus Armbruster <armbru@redhat.com>
> Cc: qemu-trivial@nongnu.org
> 
> Gonglei (9):
>   nbd: fix resource leak
Applied.

>   arm: fix memory leak
Does not apply.

>   sparc/leon3.c: fix memory leak
Applied.

>   macio: fix possible memory leak
Applied.

>   e500: fix memory leak
The patch is wrong.

>   9pfs: fix memory leak
Applied.

>   milkymist.c: fix memory leak
Applied.

>   sysbus: fix memory leak
Applied.

>   microblaze: fix memory leak
Applied.

Thanks,

/mjt

