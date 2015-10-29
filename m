Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zrhu5-0005Cf-9r
	for mharc-qemu-trivial@gnu.org; Thu, 29 Oct 2015 03:45:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38271)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Zrhtz-00057g-8Q
	for qemu-trivial@nongnu.org; Thu, 29 Oct 2015 03:45:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Zrhty-00061J-7h
	for qemu-trivial@nongnu.org; Thu, 29 Oct 2015 03:45:39 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:56290)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Zrhts-00060n-0d; Thu, 29 Oct 2015 03:45:32 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 500004211B;
	Thu, 29 Oct 2015 10:45:31 +0300 (MSK)
Message-ID: <5631CE9B.5050409@msgid.tls.msk.ru>
Date: Thu, 29 Oct 2015 10:45:31 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: Cao jin <caoj.fnst@cn.fujitsu.com>, qemu-devel@nongnu.org
References: <1445761408-10308-1-git-send-email-caoj.fnst@cn.fujitsu.com>
In-Reply-To: <1445761408-10308-1-git-send-email-caoj.fnst@cn.fujitsu.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial <qemu-trivial@nongnu.org>, mst@redhat.com
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
X-List-Received-Date: Thu, 29 Oct 2015 07:45:43 -0000

25.10.2015 11:23, Cao jin wrote:
> bad indentation conflicts with CODING_STYLE doc

I don't like patches which just change coding style.
It is often agreed that when you fix some code you
can also fix indentation of surrounding code, but
just fixing coding style isn't very productive.

Yet I'm applying this one.  Maybe it is the last
case like this.. ;)

Thanks,

/mjt

