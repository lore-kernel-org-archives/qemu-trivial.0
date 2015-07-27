Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZJnp2-0001PU-Bg
	for mharc-qemu-trivial@gnu.org; Mon, 27 Jul 2015 15:12:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46352)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZJnov-0001FG-DF
	for qemu-trivial@nongnu.org; Mon, 27 Jul 2015 15:12:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZJnou-0006Ql-Jh
	for qemu-trivial@nongnu.org; Mon, 27 Jul 2015 15:12:17 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:52584)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZJnol-0006MR-7G; Mon, 27 Jul 2015 15:12:07 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 2601B425A7;
	Mon, 27 Jul 2015 22:11:56 +0300 (MSK)
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 09776A57;
	Mon, 27 Jul 2015 22:11:56 +0300 (MSK)
Message-ID: <55B6827C.7090008@msgid.tls.msk.ru>
Date: Mon, 27 Jul 2015 22:11:56 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: Laszlo Ersek <lersek@redhat.com>, qemu-devel@nongnu.org
References: <1437761762-19798-1-git-send-email-lersek@redhat.com>
In-Reply-To: <1437761762-19798-1-git-send-email-lersek@redhat.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>, Andreas Faerber <afaerber@suse.de>,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-trivial] [PATCH for-2.4-rc3 0/3] a tiny bit late SMM
	fixups
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
X-List-Received-Date: Mon, 27 Jul 2015 19:12:21 -0000

24.07.2015 21:15, Laszlo Ersek wrote:
> So, I just happened to resume my SMM-for-OVMF work today, with
> v2.4.0-rc2-2-g12e21eb, and I suddenly realized that these patches never
> made upstream. The first two are trivial and I kinda "insist" on them
> :), the last one (from Paolo) doesn't seem that trivial (to me at
> least), and I don't strictly need it for my work just yet. I'll let you
> guys decide.

Applied to -trivial, thanks!

/mjt

