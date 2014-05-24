Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wo4wq-0001ef-0s
	for mharc-qemu-trivial@gnu.org; Sat, 24 May 2014 01:56:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47866)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Wo4wi-0001Ut-DT
	for qemu-trivial@nongnu.org; Sat, 24 May 2014 01:56:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Wo4wc-000712-7j
	for qemu-trivial@nongnu.org; Sat, 24 May 2014 01:56:40 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:51610)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Wo4wP-0006ss-Nl; Sat, 24 May 2014 01:56:21 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id CFA3742B94;
	Sat, 24 May 2014 09:56:18 +0400 (MSK)
Message-ID: <53803481.6060507@msgid.tls.msk.ru>
Date: Sat, 24 May 2014 09:56:17 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.5.0
MIME-Version: 1.0
To: Le Tan <tamlokveer@gmail.com>, qemu-devel <qemu-devel@nongnu.org>
References: <cover.1399641611.git.tamlokveer@gmail.com>	<148ba95b4d26522056d25fea8312b24760fe8289.1399641611.git.tamlokveer@gmail.com>
	<CACrq+iLY-=LdWui-NkV5wM75YDhodphDhBdnHdUE-whozXT=rg@mail.gmail.com>
In-Reply-To: <CACrq+iLY-=LdWui-NkV5wM75YDhodphDhBdnHdUE-whozXT=rg@mail.gmail.com>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Jan Kiszka <jan.kiszka@web.de>,
	=?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/4] arch_init: replace
 fprintf(stderr, ...) with error_report() in arch_init.c
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
X-List-Received-Date: Sat, 24 May 2014 05:56:46 -0000

24.05.2014 09:41, Le Tan wrote:
> There is a newer version of patch to fix this problem. I forgot to add
> the version number when I sent the new patch. Add this comment just to
> indicate that this patch should be dropped. :)

I've already applied your v2 to the trivial tree, and I told you
just that, replying to the v2 patch.

/mjt

