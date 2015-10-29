Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZriFc-00064z-Ec
	for mharc-qemu-trivial@gnu.org; Thu, 29 Oct 2015 04:08:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43525)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZriFa-000625-1A
	for qemu-trivial@nongnu.org; Thu, 29 Oct 2015 04:07:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZriFW-0002sV-Af
	for qemu-trivial@nongnu.org; Thu, 29 Oct 2015 04:07:57 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:53332)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZriFS-0002ry-3O; Thu, 29 Oct 2015 04:07:50 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 69B7241D58;
	Thu, 29 Oct 2015 11:07:49 +0300 (MSK)
Message-ID: <5631D3D5.7080105@msgid.tls.msk.ru>
Date: Thu, 29 Oct 2015 11:07:49 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: Cao jin <caoj.fnst@cn.fujitsu.com>, qemu-devel@nongnu.org
References: <1445761408-10308-1-git-send-email-caoj.fnst@cn.fujitsu.com>	<5631CE9B.5050409@msgid.tls.msk.ru>
	<5631D17A.4020101@cn.fujitsu.com>
In-Reply-To: <5631D17A.4020101@cn.fujitsu.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial <qemu-trivial@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] fix bad indentation in
	pcie_cap_slot_write_config()
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
X-List-Received-Date: Thu, 29 Oct 2015 08:07:58 -0000

29.10.2015 10:57, Cao jin wrote:
> Thanks Michael. and I am sorry if it bothered you.

There's nothing to worry about, really.

> Maybe it can be avoid to have a clear definition of "trivial" to direct the newbies like me:P

It is a general common sense maybe, I dunno.  There's lot of code which does not
comply with the coding styles, and at the very least, when you change just that
without actually changing the code, git blame stops working, showing your non-
change for everything instead of showing actual _code_ changes.  That's one of
the reasons why all qemu codebase hasn't been translated by some automatic
coding style formatting tool.

Thanks,

/mjt

