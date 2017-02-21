Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cg7Qo-0004ks-Lo
	for mharc-qemu-trivial@gnu.org; Tue, 21 Feb 2017 05:12:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41343)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cg7Qn-0004kl-FT
	for qemu-trivial@nongnu.org; Tue, 21 Feb 2017 05:12:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cg7Qi-0000z4-GM
	for qemu-trivial@nongnu.org; Tue, 21 Feb 2017 05:12:25 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:42637)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cg7Qi-0000yv-8o
	for qemu-trivial@nongnu.org; Tue, 21 Feb 2017 05:12:20 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 5DB5A42C4C;
	Tue, 21 Feb 2017 13:09:49 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 586203C8;
	Tue, 21 Feb 2017 13:09:48 +0300 (MSK)
To: Igor Pavlikevich <ipavlikevich@gmail.com>, qemu-trivial@nongnu.org
References: <CA+O_+ExjKRNyfbXWzh7RRHgTjqTBC+WscYCiBGyjLK2XOvoPmQ@mail.gmail.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <549c2ae1-db0a-34c2-f4d5-486ec2ded0f4@msgid.tls.msk.ru>
Date: Tue, 21 Feb 2017 13:09:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <CA+O_+ExjKRNyfbXWzh7RRHgTjqTBC+WscYCiBGyjLK2XOvoPmQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] hw/acpi/tco.c: fix tco timer stop
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
X-List-Received-Date: Tue, 21 Feb 2017 10:12:26 -0000

06.02.2017 17:44, Igor Pavlikevich wrote:
> TCO timer does not actually stop

Applied to -trivial, thanks!

/mjt


