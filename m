Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZYXCi-0002YU-Oh
	for mharc-qemu-trivial@gnu.org; Sun, 06 Sep 2015 06:29:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44673)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZYXCg-0002Vy-LV
	for qemu-trivial@nongnu.org; Sun, 06 Sep 2015 06:29:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZYXCf-0004gP-Tb
	for qemu-trivial@nongnu.org; Sun, 06 Sep 2015 06:29:42 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:38152)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZYXCb-0004eC-IO; Sun, 06 Sep 2015 06:29:37 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 0628D409B9;
	Sun,  6 Sep 2015 13:29:37 +0300 (MSK)
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id E49B7A76;
	Sun,  6 Sep 2015 13:29:36 +0300 (MSK)
Message-ID: <55EC1590.4000102@msgid.tls.msk.ru>
Date: Sun, 06 Sep 2015 13:29:36 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org, 
	qemu-trivial@nongnu.org
References: <1438609948-3744-1-git-send-email-lvivier@redhat.com>
	<1438676851-10684-1-git-send-email-lvivier@redhat.com>
In-Reply-To: <1438676851-10684-1-git-send-email-lvivier@redhat.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [Qemu-trivial] [PATCH][TRIVIAL] i6300esb: fix timer overflow
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
X-List-Received-Date: Sun, 06 Sep 2015 10:29:43 -0000

04.08.2015 11:27, Laurent Vivier wrote:
> We use muldiv64() to compute the time to wait:
> 
>     timeout = muldiv64(get_ticks_per_sec(), timeout, 33000000);
...

Applied to -trivial, thank you!

/mjt

