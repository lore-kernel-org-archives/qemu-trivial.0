Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vv4FM-0005ZI-OL
	for mharc-qemu-trivial@gnu.org; Mon, 23 Dec 2013 07:04:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54436)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vv4FF-0005PI-Lt
	for qemu-trivial@nongnu.org; Mon, 23 Dec 2013 07:04:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vv4F9-000776-NI
	for qemu-trivial@nongnu.org; Mon, 23 Dec 2013 07:04:25 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:57156)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Vv4Ex-00073K-Bz; Mon, 23 Dec 2013 07:04:07 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 65D0242F83;
	Mon, 23 Dec 2013 16:03:58 +0400 (MSK)
Message-ID: <52B826AE.2090404@msgid.tls.msk.ru>
Date: Mon, 23 Dec 2013 16:03:58 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20131103 Icedove/17.0.10
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1386795641-26066-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1386795641-26066-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] target-m68k: Replace qemu_assert by
	hw_error
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
X-List-Received-Date: Mon, 23 Dec 2013 12:04:31 -0000

12.12.2013 01:00, Stefan Weil wrote:
> hw_error is already used for target-arm and target-s390x.
> Using it for target-m68k fixes this compiler warning with Darwin because
> hw_error is declared with QEMU_NORETURN:

Thanks, applied to the trivial-patches queue.

/mjt

