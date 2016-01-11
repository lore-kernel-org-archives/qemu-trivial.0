Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aIXX4-0006rf-TC
	for mharc-qemu-trivial@gnu.org; Mon, 11 Jan 2016 03:08:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43051)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aIXX3-0006pD-7Z
	for qemu-trivial@nongnu.org; Mon, 11 Jan 2016 03:08:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aIXX2-0001Gj-E6
	for qemu-trivial@nongnu.org; Mon, 11 Jan 2016 03:08:53 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:57542)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1aIXWx-0001GD-Fi; Mon, 11 Jan 2016 03:08:47 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 542D0403D2;
	Mon, 11 Jan 2016 11:08:47 +0300 (MSK)
To: Sitsofe Wheeler <sitsofe@yahoo.com>, qemu-devel@nongnu.org
References: <20151230195338.GA25149@sucs.org>
	<569362AA.7060309@msgid.tls.msk.ru>
From: Michael Tokarev <mjt@tls.msk.ru>
Openpgp: id=6EE195D1886E8FFB810D4324457CE0A0804465C5
Organization: Telecom Service, JSC
Message-ID: <5693630E.90705@msgid.tls.msk.ru>
Date: Mon, 11 Jan 2016 11:08:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.5.0
MIME-Version: 1.0
In-Reply-To: <569362AA.7060309@msgid.tls.msk.ru>
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
X-List-Received-Date: Mon, 11 Jan 2016 08:08:54 -0000

11.01.2016 11:07, Michael Tokarev wrote:
> 30.12.2015 22:54, Sitsofe Wheeler wrote:
>> Indented lines in the texi meant the perlpod produced interpreted the
>> paragraph as being verbatim (thus formatting codes were not
>> interpreted). Fix this by un-indenting problem lines.
> 
> Applied to -trivial, thank you!

Sorry, un-applied.  Because another patchset has already been
posted and because Paolo picked it already.

Thanks,

/mjt

