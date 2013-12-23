Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vv4HS-0006yF-Lf
	for mharc-qemu-trivial@gnu.org; Mon, 23 Dec 2013 07:06:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54852)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vv4HL-0006mK-AX
	for qemu-trivial@nongnu.org; Mon, 23 Dec 2013 07:06:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vv4HF-0007fd-Av
	for qemu-trivial@nongnu.org; Mon, 23 Dec 2013 07:06:35 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:53471)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Vv4H1-0007dC-SF; Mon, 23 Dec 2013 07:06:16 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 3A4B642F83;
	Mon, 23 Dec 2013 16:06:15 +0400 (MSK)
Message-ID: <52B82737.60702@msgid.tls.msk.ru>
Date: Mon, 23 Dec 2013 16:06:15 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20131103 Icedove/17.0.10
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1387400979-20435-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1387400979-20435-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel <qemu-devel@nongnu.org>,
	Anthony Liguori <aliguori@amazon.com>
Subject: Re: [Qemu-trivial] [PATCH] configure: Rewrite code for help message
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
X-List-Received-Date: Mon, 23 Dec 2013 12:06:41 -0000

19.12.2013 01:09, Stefan Weil wrote:
> In the new form most lines of the code now look like the final output:
> there is no leading echo command and the lines are shorter.
> 
> The resulting output is nearly identical: the only difference is a blank
> character which was deliberately removed:

> This patch might break other patches which are waiting for being pulled,
> so I don't know whether it can be applied via qemu-trivial.

It is be okay so far, as no one appears to be touching this area right now.
Hope for the best ;)

Thanks, applied to the trivial-patches queue.

/mjt

