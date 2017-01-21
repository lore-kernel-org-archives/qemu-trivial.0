Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cUyeh-00059N-4K
	for mharc-qemu-trivial@gnu.org; Sat, 21 Jan 2017 11:36:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48572)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cUyed-00053r-Sa
	for qemu-trivial@nongnu.org; Sat, 21 Jan 2017 11:36:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cUyec-0004yJ-Hj
	for qemu-trivial@nongnu.org; Sat, 21 Jan 2017 11:36:39 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:34373)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1cUyeV-0004dE-3q; Sat, 21 Jan 2017 11:36:31 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 9678141B62;
	Sat, 21 Jan 2017 19:36:19 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 44A6A520;
	Sat, 21 Jan 2017 19:36:18 +0300 (MSK)
To: Samuel Thibault <samuel.thibault@gnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>
References: <20170115203014.GA12068@var.home>
Cc: qemu-devel@nongnu.org, QEMU Trivial <qemu-trivial@nongnu.org>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <cc393a67-3c26-6155-afa7-d53809eb73ab@msgid.tls.msk.ru>
Date: Sat, 21 Jan 2017 19:36:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <20170115203014.GA12068@var.home>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] Drop duplicate display option
 documentation
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
X-List-Received-Date: Sat, 21 Jan 2017 16:36:41 -0000

15.01.2017 23:30, Samuel Thibault wrote:
> The curses and none possibilities are already documented on a separate line,
> so documenting it on the sdl line was both unneeded and confusing.

Applied to -trivial, thanks!

/mjt

