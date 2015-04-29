Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YnVcb-0008Jg-A3
	for mharc-qemu-trivial@gnu.org; Wed, 29 Apr 2015 13:18:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41815)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YnVcY-0008Dz-0L
	for qemu-trivial@nongnu.org; Wed, 29 Apr 2015 13:18:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YnVcW-0006tw-RT
	for qemu-trivial@nongnu.org; Wed, 29 Apr 2015 13:18:01 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:51604)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YnVcR-0006rj-IB; Wed, 29 Apr 2015 13:17:55 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 5ADA04237A;
	Wed, 29 Apr 2015 20:17:54 +0300 (MSK)
Message-ID: <55411242.3090301@msgid.tls.msk.ru>
Date: Wed, 29 Apr 2015 20:17:54 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.6.0
MIME-Version: 1.0
To: arei.gonglei@huawei.com, qemu-devel@nongnu.org
References: <1425524720-11376-1-git-send-email-arei.gonglei@huawei.com>
In-Reply-To: <1425524720-11376-1-git-send-email-arei.gonglei@huawei.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: Re: [Qemu-trivial] [PATCH v2] microblaze: fix memory leak
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
X-List-Received-Date: Wed, 29 Apr 2015 17:18:03 -0000

05.03.2015 06:05, arei.gonglei@huawei.com wrote:
> From: Gonglei <arei.gonglei@huawei.com>
> 
> When not assign a -dtb argument, the variable dtb_filename
> storage returned from qemu_find_file(), which should be freed
> after use. Alternatively we define a local variable filename,
> with 'char *' type, free after use.

Actually now when I look at it all again I think this is the
solution I was thinking about when saying about a "better fix".
I dunno why I haven't seen this before.

I just applied this patch to -trivial. Thank you very much for
your patience!

/mjt

