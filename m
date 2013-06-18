Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Uolnu-0003n1-1e
	for mharc-qemu-trivial@gnu.org; Mon, 17 Jun 2013 22:37:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48787)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Uolnr-0003i4-Mf
	for qemu-trivial@nongnu.org; Mon, 17 Jun 2013 22:37:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Uolnq-00047W-VP
	for qemu-trivial@nongnu.org; Mon, 17 Jun 2013 22:37:51 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:39199)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Uolno-00046z-Md; Mon, 17 Jun 2013 22:37:48 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 85604418E5;
	Tue, 18 Jun 2013 06:37:47 +0400 (MSK)
Message-ID: <51BFC7F9.30005@msgid.tls.msk.ru>
Date: Tue, 18 Jun 2013 06:37:45 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/17.0 Icedove/17.0
MIME-Version: 1.0
To: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
References: <1371510546-28585-1-git-send-email-afaerber@suse.de>
In-Reply-To: <1371510546-28585-1-git-send-email-afaerber@suse.de>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] configure: Fix "ERROR: ERROR: " for
 missing/incompatible DTC
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
X-List-Received-Date: Tue, 18 Jun 2013 02:37:52 -0000

18.06.2013 03:09, Andreas F=C3=A4rber wrote:
> error_exit already prepends "ERROR: ", so no need to print it manually.

Thanks, applied to the trivial patches queue.

/mjt

