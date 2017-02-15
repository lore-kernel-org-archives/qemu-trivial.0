Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cdwhz-0004ob-H7
	for mharc-qemu-trivial@gnu.org; Wed, 15 Feb 2017 05:21:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58387)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cdwhw-0004ly-Oe
	for qemu-trivial@nongnu.org; Wed, 15 Feb 2017 05:21:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cdwhv-0007tc-U8
	for qemu-trivial@nongnu.org; Wed, 15 Feb 2017 05:21:08 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:52180)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1cdwho-0007qn-NT; Wed, 15 Feb 2017 05:21:00 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 9DDD5421C1;
	Wed, 15 Feb 2017 13:21:00 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id E7442264;
	Wed, 15 Feb 2017 13:20:59 +0300 (MSK)
To: Thomas Huth <thuth@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <1486750977-15211-1-git-send-email-thuth@redhat.com>
Cc: qemu-trivial@nongnu.org, Artyom Tarasenko <atar4qemu@gmail.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <e4f8a86d-11bf-200d-7c75-97a763e81477@msgid.tls.msk.ru>
Date: Wed, 15 Feb 2017 13:20:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <1486750977-15211-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=windows-1251
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] tests/prom-env: Enable the test for the
 sun4u machine, too
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
X-List-Received-Date: Wed, 15 Feb 2017 10:21:09 -0000

10.02.2017 21:22, Thomas Huth wrote:
> The 32-bit TCG bug has been fixed a while ago, so we can enable
> this test for sparc64 now, too. Unfortunately, OpenBIOS does not
> work with the sun4v machine anymore (it needs to catch up with the
> improved emulation), so we can only enable this test for the sun4u
> machine right now.

Applied to -trivial, thanks!

/mjt

