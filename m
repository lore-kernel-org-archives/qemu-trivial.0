Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aIXVW-0005iG-5u
	for mharc-qemu-trivial@gnu.org; Mon, 11 Jan 2016 03:07:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42631)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aIXVU-0005f4-A6
	for qemu-trivial@nongnu.org; Mon, 11 Jan 2016 03:07:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aIXVT-0000od-C0
	for qemu-trivial@nongnu.org; Mon, 11 Jan 2016 03:07:16 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:58609)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1aIXVL-0000nX-AY; Mon, 11 Jan 2016 03:07:07 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 20E4D403D2;
	Mon, 11 Jan 2016 11:07:07 +0300 (MSK)
To: Sitsofe Wheeler <sitsofe@yahoo.com>, qemu-devel@nongnu.org
References: <20151230195338.GA25149@sucs.org>
From: Michael Tokarev <mjt@tls.msk.ru>
Openpgp: id=6EE195D1886E8FFB810D4324457CE0A0804465C5
Organization: Telecom Service, JSC
Message-ID: <569362AA.7060309@msgid.tls.msk.ru>
Date: Mon, 11 Jan 2016 11:07:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.5.0
MIME-Version: 1.0
In-Reply-To: <20151230195338.GA25149@sucs.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH 1/2] qemu-nbd: Fix unintended texi
	verbatim formatting
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
X-List-Received-Date: Mon, 11 Jan 2016 08:07:17 -0000

30.12.2015 22:54, Sitsofe Wheeler wrote:
> Indented lines in the texi meant the perlpod produced interpreted the
> paragraph as being verbatim (thus formatting codes were not
> interpreted). Fix this by un-indenting problem lines.

Applied to -trivial, thank you!

/mjt

