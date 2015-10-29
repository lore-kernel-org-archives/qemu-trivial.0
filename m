Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zrhqm-0003Ei-Ou
	for mharc-qemu-trivial@gnu.org; Thu, 29 Oct 2015 03:42:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36922)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Zrhql-0003DF-7z
	for qemu-trivial@nongnu.org; Thu, 29 Oct 2015 03:42:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Zrhqk-00052M-Dc
	for qemu-trivial@nongnu.org; Thu, 29 Oct 2015 03:42:19 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:59010)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Zrhqe-00051f-CX; Thu, 29 Oct 2015 03:42:12 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 7E9494211B;
	Thu, 29 Oct 2015 10:42:11 +0300 (MSK)
Message-ID: <5631CDD3.3080704@msgid.tls.msk.ru>
Date: Thu, 29 Oct 2015 10:42:11 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
References: <1445891251-10072-1-git-send-email-eblake@redhat.com>
In-Reply-To: <1445891251-10072-1-git-send-email-eblake@redhat.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, marcandre.lureau@redhat.com
Subject: Re: [Qemu-trivial] [PATCH] maint: Ignore ivshmem binaries
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
X-List-Received-Date: Thu, 29 Oct 2015 07:42:20 -0000

26.10.2015 23:27, Eric Blake wrote:
> Commit a75eb03b added ivshmem-client and ivshmem-server binaries,
> but did not mark them for exclusion in .gitignore.

Applied to -trivial.

> Yes, I know that these only show up in 'git status' as dirty if you
> do an in-tree build, and that we prefer VPATH builds.  But we might
> as well be consistent, and we already ignore other in-tree
> binaries such as qemu-img and qemu-nbd.

I agree.

Thank you!

/mjt

