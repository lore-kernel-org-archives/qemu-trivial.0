Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bS1XP-00069a-D8
	for mharc-qemu-trivial@gnu.org; Tue, 26 Jul 2016 08:32:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35014)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bS1XM-00067o-Qv
	for qemu-trivial@nongnu.org; Tue, 26 Jul 2016 08:32:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bS1XK-0006F6-Uy
	for qemu-trivial@nongnu.org; Tue, 26 Jul 2016 08:32:39 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:50332)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bS1XE-0006CH-K7; Tue, 26 Jul 2016 08:32:32 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id ED6A8426C9;
	Tue, 26 Jul 2016 15:32:28 +0300 (MSK)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <1466098418-26899-1-git-send-email-thuth@redhat.com>
Cc: Blue Swirl <blauwirbel@gmail.com>, qemu-trivial@nongnu.org,
	Artyom Tarasenko <atar4qemu@gmail.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Openpgp: id=6EE195D1886E8FFB810D4324457CE0A0804465C5
Organization: Telecom Service, JSC
Message-ID: <0f0a79a2-295d-ed9e-7324-0476e24ca6e6@msgid.tls.msk.ru>
Date: Tue, 26 Jul 2016 15:32:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <1466098418-26899-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] sparc: Use g_memdup() instead of
 g_new0() + memcpy()
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
X-List-Received-Date: Tue, 26 Jul 2016 12:32:41 -0000

16.06.2016 20:33, Thomas Huth wrote:
> There is no need to make sure that the memory is zeroed after the
> allocation if we also immediatly fill the whole buffer afterwards
> with memcpy(). Thus g_new0 should be g_new instead. But since we
> are also doing a memcpy() here, we can also simply replace both
> with g_memdup() instead.

Applied to -trivial, thanks!

/mjt

