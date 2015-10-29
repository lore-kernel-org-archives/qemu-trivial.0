Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zrhv8-0006do-8k
	for mharc-qemu-trivial@gnu.org; Thu, 29 Oct 2015 03:46:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38816)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Zrhv5-0006ad-MI
	for qemu-trivial@nongnu.org; Thu, 29 Oct 2015 03:46:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Zrhv4-0006Rv-Ub
	for qemu-trivial@nongnu.org; Thu, 29 Oct 2015 03:46:47 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:40801)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Zrhuz-0006O7-0A; Thu, 29 Oct 2015 03:46:41 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 60FEF4211B;
	Thu, 29 Oct 2015 10:46:40 +0300 (MSK)
Message-ID: <5631CEE0.90200@msgid.tls.msk.ru>
Date: Thu, 29 Oct 2015 10:46:40 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
References: <1445370093-21670-1-git-send-email-eblake@redhat.com>
In-Reply-To: <1445370093-21670-1-git-send-email-eblake@redhat.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, marcandre.lureau@redhat.com
Subject: Re: [Qemu-trivial] [PATCH] tests: ignore test-qga
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
X-List-Received-Date: Thu, 29 Oct 2015 07:46:48 -0000

20.10.2015 22:41, Eric Blake wrote:
> Commit 62c39b30 added a new test, but did not mark it for
> exclusion in .gitignore.

Applied to -trivial, thank you!

/mjt

