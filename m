Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VG9eU-0007fS-4y
	for mharc-qemu-trivial@gnu.org; Sun, 01 Sep 2013 11:33:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53499)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VG9eM-0007XO-Kd
	for qemu-trivial@nongnu.org; Sun, 01 Sep 2013 11:33:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VG9eG-0001nR-H5
	for qemu-trivial@nongnu.org; Sun, 01 Sep 2013 11:33:14 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:53363)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VG9eG-0001mb-AI
	for qemu-trivial@nongnu.org; Sun, 01 Sep 2013 11:33:08 -0400
Received: from gandalf.local (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 93343400BA;
	Sun,  1 Sep 2013 19:33:07 +0400 (MSK)
Message-ID: <52235E33.9050000@msgid.tls.msk.ru>
Date: Sun, 01 Sep 2013 19:33:07 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130827 Icedove/17.0.8
MIME-Version: 1.0
To: Antony Pavlov <antonynpavlov@gmail.com>
References: <1377639134-22804-1-git-send-email-antonynpavlov@gmail.com>
In-Reply-To: <1377639134-22804-1-git-send-email-antonynpavlov@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] pflash_cfi02.c: fix debug macro
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
X-List-Received-Date: Sun, 01 Sep 2013 15:33:20 -0000

28.08.2013 01:32, Antony Pavlov wrote:
> If PFLASH_DEBUG is enabled then we have some build errors:
>
> hw/block/pflash_cfi02.c: In function =E2=80=98pflash_timer=E2=80=99:
> hw/block/pflash_cfi02.c:128:5: error: expected =E2=80=98)=E2=80=99 befo=
re string constant
> hw/block/pflash_cfi02.c:128:5: error: too few arguments to function =E2=
=80=98fprintf=E2=80=99
>
> This patch fixes the problem.

Thanks, applied to the trivial-patches queue.

/mjt

