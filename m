Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c07pw-0001LG-Mw
	for mharc-qemu-trivial@gnu.org; Fri, 28 Oct 2016 10:08:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32965)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1c07pp-0001HW-FI
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2016 10:08:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1c07po-0008S0-Kt
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2016 10:08:41 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:33236)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1c07pj-0008Pj-LH; Fri, 28 Oct 2016 10:08:35 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 754C94370B;
	Fri, 28 Oct 2016 17:08:27 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 70A23B49;
	Fri, 28 Oct 2016 17:08:26 +0300 (MSK)
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org
References: <20161011174121.815-1-marcandre.lureau@redhat.com>
Cc: armbru@redhat.com, QEMU Trivial <qemu-trivial@nongnu.org>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <9be24ac9-60f0-421b-2ae2-3a979760d78c@msgid.tls.msk.ru>
Date: Fri, 28 Oct 2016 17:08:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <20161011174121.815-1-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCHv2] monitor: deprecate 'default' option
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
X-List-Received-Date: Fri, 28 Oct 2016 14:08:47 -0000

11.10.2016 20:41, Marc-Andr=C3=A9 Lureau wrote:
> This option does nothing since commit 06ac27f.  Deprecate it.

Applied to -trivial, together with additional hunk from Marcus,
thanks!

/mjt

