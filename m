Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vv4JI-0000SU-D9
	for mharc-qemu-trivial@gnu.org; Mon, 23 Dec 2013 07:08:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55351)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vv4JB-0000JS-CE
	for qemu-trivial@nongnu.org; Mon, 23 Dec 2013 07:08:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vv4J5-0008SU-ET
	for qemu-trivial@nongnu.org; Mon, 23 Dec 2013 07:08:29 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:34524)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Vv4Ir-0008Qr-Jz; Mon, 23 Dec 2013 07:08:10 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 029B642F83;
	Mon, 23 Dec 2013 16:08:09 +0400 (MSK)
Message-ID: <52B827A8.6010005@msgid.tls.msk.ru>
Date: Mon, 23 Dec 2013 16:08:08 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20131103 Icedove/17.0.10
MIME-Version: 1.0
To: Ingo van Lil <inguin@gmx.de>
References: <1387547093-14591-1-git-send-email-inguin@gmx.de>
In-Reply-To: <1387547093-14591-1-git-send-email-inguin@gmx.de>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Anthony Liguori <anthony@codemonkey.ws>,
	qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
	Markus Armbruster <armbru@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] doc: Mention chardev:id in available
 devices for -serial
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
X-List-Received-Date: Mon, 23 Dec 2013 12:08:35 -0000

20.12.2013 17:44, Ingo van Lil wrote:
> It is possible to pre-define a character device with the -chardev option
> and reference its id as serial device. The man page does not mention this
> feature.

Thanks, applied to the trivial-patches queue.

/mjt

