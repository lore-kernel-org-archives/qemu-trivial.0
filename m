Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bpdgV-0001yN-HA
	for mharc-qemu-trivial@gnu.org; Thu, 29 Sep 2016 11:55:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51682)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bpdgT-0001wO-GP
	for qemu-trivial@nongnu.org; Thu, 29 Sep 2016 11:55:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bpdgS-00044F-SF
	for qemu-trivial@nongnu.org; Thu, 29 Sep 2016 11:55:41 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:56968)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bpdgN-00040t-PS; Thu, 29 Sep 2016 11:55:35 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id AD93B4325E;
	Thu, 29 Sep 2016 18:55:32 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 86EFDB0F;
	Thu, 29 Sep 2016 18:55:31 +0300 (MSK)
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org
References: <20160928123720.21171-1-marcandre.lureau@redhat.com>
Cc: qemu-trivial@nongnu.org, mst@redhat.com
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <8eeabedd-f989-26aa-230f-ccd6c53dee2a@msgid.tls.msk.ru>
Date: Thu, 29 Sep 2016 18:55:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.2.0
MIME-Version: 1.0
In-Reply-To: <20160928123720.21171-1-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] exec: remove unused compacted argument
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Sep 2016 15:55:42 -0000

28.09.2016 15:37, Marc-Andr=C3=A9 Lureau wrote:
> Since commit b35ba30f8f when it was introduced, phys_page_compact()
> takes an unused compacted argument.
>
> ubsan complains about it when launching qemu-x86_64 without arguments:
> qemu/exec.c:310:5: runtime error: variable length array bound evaluates=
 to non-positive value 0

Applied to -trivial, thanks!

/mjt

