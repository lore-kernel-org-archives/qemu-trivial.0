Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d2Els-0006Pg-FC
	for mharc-qemu-trivial@gnu.org; Sun, 23 Apr 2017 06:29:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58354)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1d2Elq-0006OL-Ba
	for qemu-trivial@nongnu.org; Sun, 23 Apr 2017 06:29:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1d2Elp-0002Ge-Ot
	for qemu-trivial@nongnu.org; Sun, 23 Apr 2017 06:29:34 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:60579)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1d2Ell-0002Ey-GB; Sun, 23 Apr 2017 06:29:29 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id A38EE41F10;
	Sun, 23 Apr 2017 13:29:27 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 8DC903F8;
	Sun, 23 Apr 2017 13:29:27 +0300 (MSK)
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org
References: <20170323113156.9277-1-marcandre.lureau@redhat.com>
Cc: samuel.thibault@ens-lyon.org, jan.kiszka@siemens.com,
	QEMU Trivial <qemu-trivial@nongnu.org>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <504762ea-025a-3c12-6674-93d074407de5@msgid.tls.msk.ru>
Date: Sun, 23 Apr 2017 13:29:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170323113156.9277-1-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] slirp: tftp, copy sockaddr_size
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
X-List-Received-Date: Sun, 23 Apr 2017 10:29:35 -0000

23.03.2017 14:31, Marc-Andr=C3=A9 Lureau wrote:
..
> The sockaddr_storage pointer is the sockaddr_in6 lhost on the
> stack. Copy only the source addr size.

Applied to -trivial, thanks!

/mjt

