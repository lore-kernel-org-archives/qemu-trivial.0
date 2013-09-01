Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VG92H-00031a-Ab
	for mharc-qemu-trivial@gnu.org; Sun, 01 Sep 2013 10:53:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48644)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VG92B-0002tx-2x
	for qemu-trivial@nongnu.org; Sun, 01 Sep 2013 10:53:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VG926-0006nx-P4
	for qemu-trivial@nongnu.org; Sun, 01 Sep 2013 10:53:47 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:46641)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VG91x-0006ef-RE; Sun, 01 Sep 2013 10:53:33 -0400
Received: from gandalf.local (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id C34C2400BA;
	Sun,  1 Sep 2013 18:53:22 +0400 (MSK)
Message-ID: <522354E2.1000909@msgid.tls.msk.ru>
Date: Sun, 01 Sep 2013 18:53:22 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130827 Icedove/17.0.8
MIME-Version: 1.0
To: Taimoor <taimoor.mrza@gmail.com>
References: <1376590408-7037-1-git-send-email-tmirza@codesourcery.com>
In-Reply-To: <1376590408-7037-1-git-send-email-tmirza@codesourcery.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Taimoor Mirza <tmirza@codesourcery.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH v2] slirp: Port redirection option behave
 differently on Linux and Windows
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
X-List-Received-Date: Sun, 01 Sep 2013 14:53:51 -0000

15.08.2013 22:13, Taimoor wrote:
> From: Taimoor Mirza <tmirza@codesourcery.com>
>
> port redirection code uses SO_REUSEADDR socket option before binding to
> host port. Behavior of SO_REUSEADDR is different on Windows and Linux.
> Relaunching QEMU with same host and guest port redirection values on Linux
> throws error but on Windows it does not throw any error.
> Problem is discussed in http://lists.gnu.org/archive/html/qemu-devel/2013-04/msg03089.html

Thanks, applied to the trivial-patches queue (after fixing the diff as mentioned
by Alex Bligh).

/mjt

