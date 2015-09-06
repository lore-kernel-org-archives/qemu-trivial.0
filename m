Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZYXhb-0004Gm-43
	for mharc-qemu-trivial@gnu.org; Sun, 06 Sep 2015 07:01:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49031)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZYXhY-0004Di-Hh
	for qemu-trivial@nongnu.org; Sun, 06 Sep 2015 07:01:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZYXhX-0001Mx-NH
	for qemu-trivial@nongnu.org; Sun, 06 Sep 2015 07:01:36 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:40923)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZYXhQ-0001Kh-QD; Sun, 06 Sep 2015 07:01:28 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 258CA409B9;
	Sun,  6 Sep 2015 14:01:28 +0300 (MSK)
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 0EB54A76;
	Sun,  6 Sep 2015 14:01:28 +0300 (MSK)
Message-ID: <55EC1D08.3090502@msgid.tls.msk.ru>
Date: Sun, 06 Sep 2015 14:01:28 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: =?UTF-8?B?IkvFkXbDoWfDsywgWm9sdMOhbiI=?= <dirty.ice.hu@gmail.com>, 
	qemu-devel@nongnu.org
References: <cff8241a8e30f0d39e0f50a435965cdd130cd5d5.1436279924.git.DirtY.iCE.hu@gmail.com>
In-Reply-To: <cff8241a8e30f0d39e0f50a435965cdd130cd5d5.1436279924.git.DirtY.iCE.hu@gmail.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Qemu Block layer core <qemu-block@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH v3] opts: produce valid command line in
	qemu_opts_print
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
X-List-Received-Date: Sun, 06 Sep 2015 11:01:37 -0000

07.07.2015 17:42, K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n wrote:
> This will let us print options in a format that the user would actually
> write it on the command line (foo=3Dbar,baz=3Dasd,etc=3Ddef), without
> prepending a spurious comma at the beginning of the list, or quoting
> values unnecessarily.  This patch provides the following changes:
> * write and id=3D, if the option has an id
> * do not print separator before the first element
> * do not quote string arguments
> * properly escape commas (,) for QEMU

Applied to -trivial, thank you!

/mjt

