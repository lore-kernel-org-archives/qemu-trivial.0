Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WybIk-0006LZ-AF
	for mharc-qemu-trivial@gnu.org; Sun, 22 Jun 2014 02:30:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48691)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WybIc-00067O-Sz
	for qemu-trivial@nongnu.org; Sun, 22 Jun 2014 02:30:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WybIW-0008Hc-OV
	for qemu-trivial@nongnu.org; Sun, 22 Jun 2014 02:30:46 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:40159)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WybIJ-0008Dw-Pj; Sun, 22 Jun 2014 02:30:27 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 4FC5B438A0;
	Sun, 22 Jun 2014 10:30:25 +0400 (MSK)
Message-ID: <53A67800.1020203@msgid.tls.msk.ru>
Date: Sun, 22 Jun 2014 10:30:24 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.5.0
MIME-Version: 1.0
To: Sam Bobroff <sam.bobroff@au1.ibm.com>, qemu-devel@nongnu.org
References: <1513018f45cbc2dfff157d5df1dc86246cf08843.1401845262.git.sam.bobroff@au1.ibm.com>
In-Reply-To: <1513018f45cbc2dfff157d5df1dc86246cf08843.1401845262.git.sam.bobroff@au1.ibm.com>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 1/1] Makefile: Correct path in stripping
 tool binaries
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
X-List-Received-Date: Sun, 22 Jun 2014 06:30:53 -0000

04.06.2014 05:37, Sam Bobroff =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> Allow "make install" to handle tool binaries that reside in
> sub-directories.
>=20
> Without this patch "make install" will fail if it needs to strip
> a tool binary (e.g. debugging is not enabled) that is installed
> from a subdirectory. An example is fsdev/virtfs-proxy-helper.

Applied to -trivial, thank you!

/mjt

