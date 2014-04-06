Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WWgjj-00021B-N5
	for mharc-qemu-trivial@gnu.org; Sun, 06 Apr 2014 02:39:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38196)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WWgjc-0001rd-U4
	for qemu-trivial@nongnu.org; Sun, 06 Apr 2014 02:39:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WWgjW-0002BU-Px
	for qemu-trivial@nongnu.org; Sun, 06 Apr 2014 02:39:16 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:53556)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WWgjK-0002AE-1I; Sun, 06 Apr 2014 02:38:58 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 4D2C740AFB;
	Sun,  6 Apr 2014 10:38:57 +0400 (MSK)
Message-ID: <5340F680.2060108@msgid.tls.msk.ru>
Date: Sun, 06 Apr 2014 10:38:56 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20131103 Icedove/17.0.10
MIME-Version: 1.0
To: Hani Benhabiles <kroosec@gmail.com>
References: <1396307114-4123-1-git-send-email-kroosec@gmail.com>
In-Reply-To: <1396307114-4123-1-git-send-email-kroosec@gmail.com>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, stefanha@redhat.com,
	aliguori@amazon.com
Subject: Re: [Qemu-trivial] [PATCH] net: Report error when device / hub
 combo is not found.
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
X-List-Received-Date: Sun, 06 Apr 2014 06:39:23 -0000

01.04.2014 03:05, Hani Benhabiles wrote:
> Also convert nearby monitor_printf() call to error_report().

Applied to -trivial, thank you!

/mjt

