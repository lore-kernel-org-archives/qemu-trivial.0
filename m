Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b818a-0004mm-BC
	for mharc-qemu-trivial@gnu.org; Wed, 01 Jun 2016 04:04:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33783)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b818Y-0004lK-0u
	for qemu-trivial@nongnu.org; Wed, 01 Jun 2016 04:04:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b818X-0003gR-9d
	for qemu-trivial@nongnu.org; Wed, 01 Jun 2016 04:04:21 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:51740)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1b818P-0003f4-V8; Wed, 01 Jun 2016 04:04:14 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 662B3402B2;
	Wed,  1 Jun 2016 11:04:10 +0300 (MSK)
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
References: <1464719611-17268-1-git-send-email-eblake@redhat.com>
Cc: qemu-trivial@nongnu.org
From: Michael Tokarev <mjt@tls.msk.ru>
Openpgp: id=6EE195D1886E8FFB810D4324457CE0A0804465C5
Organization: Telecom Service, JSC
Message-ID: <574E96F9.3070205@msgid.tls.msk.ru>
Date: Wed, 1 Jun 2016 11:04:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.8.0
MIME-Version: 1.0
In-Reply-To: <1464719611-17268-1-git-send-email-eblake@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] host-utils: Prefer 'false' for bool type
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
X-List-Received-Date: Wed, 01 Jun 2016 08:04:22 -0000

31.05.2016 21:33, Eric Blake wrote:
> Mixing '0' and 'bool' looks stupid.

Applied to -trivial, thanks!

/mjt

