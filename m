Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XXZBl-0006Uv-Sd
	for mharc-qemu-trivial@gnu.org; Fri, 26 Sep 2014 13:20:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60408)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XXZBe-0006JY-Ka
	for qemu-trivial@nongnu.org; Fri, 26 Sep 2014 13:20:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XXZBY-0007cu-HD
	for qemu-trivial@nongnu.org; Fri, 26 Sep 2014 13:20:06 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:36430)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XXZBL-0007Yi-Oj; Fri, 26 Sep 2014 13:19:48 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id AB82C46F3D;
	Fri, 26 Sep 2014 21:19:40 +0400 (MSK)
Message-ID: <5425A02C.60004@msgid.tls.msk.ru>
Date: Fri, 26 Sep 2014 21:19:40 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.7.0
MIME-Version: 1.0
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
References: <1411744833-20699-1-git-send-email-eblake@redhat.com>
In-Reply-To: <1411744833-20699-1-git-send-email-eblake@redhat.com>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Fam Zheng <famz@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, wenchaoqemu@gmail.com,
	Luiz Capitulino <lcapitulino@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH v5a 0/3] trivial qapi cleanups
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
X-List-Received-Date: Fri, 26 Sep 2014 17:20:13 -0000

26.09.2014 19:20, Eric Blake wrote:
> This is split out from [PATCH v4 00/19]: drop qapi nested structs
> in order to get the trivial stuff in now, rather than holding it
> up for what may be another month while I address the larger findings
> against the rest of that series.

Applied all 3 to -trivial.

>   qapi: Consistent whitespace in tests/Makefile

For this one I had to edit context a bit since the previous line
changed identation meanwhile.  Which is quite hilarious in this
context... ;)

Thanks,

/mjt

