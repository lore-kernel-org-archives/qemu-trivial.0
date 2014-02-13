Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WDrIm-0004lj-66
	for mharc-qemu-trivial@gnu.org; Thu, 13 Feb 2014 03:05:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53067)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WDrIf-0004gO-6W
	for qemu-trivial@nongnu.org; Thu, 13 Feb 2014 03:05:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WDrIa-00010W-52
	for qemu-trivial@nongnu.org; Thu, 13 Feb 2014 03:05:37 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:41243)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WDrIQ-0000y1-Dr; Thu, 13 Feb 2014 03:05:22 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 3214341864;
	Thu, 13 Feb 2014 12:05:21 +0400 (MSK)
Received: from [10.99.99.1] (unknown [10.99.99.1])
	by tsrv.corpit.ru (Postfix) with ESMTP id 02CC8204;
	Thu, 13 Feb 2014 12:05:21 +0400 (MSK)
User-Agent: K-9 Mail for Android
In-Reply-To: <CAFEAcA-Fc1YvgnGWA9Zkc6FXSnk4Cpwe+0MuQOspDvJ6C4ACSw@mail.gmail.com>
References: <1391669798-23577-1-git-send-email-mjt@msgid.tls.msk.ru>
	<CAFEAcA-Fc1YvgnGWA9Zkc6FXSnk4Cpwe+0MuQOspDvJ6C4ACSw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
From: Michael Tokarev <mjt@tls.msk.ru>
Date: Thu, 13 Feb 2014 12:06:34 +0400
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <2d3ad128-0ff5-42cf-9cb9-a03ff3bac205@email.android.com>
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] linux-user: simplify/refactor socketcall
	implementation
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
X-List-Received-Date: Thu, 13 Feb 2014 08:05:42 -0000

12 =D1=84=D0=B5=D0=B2=D1=80=D0=B0=D0=BB=D1=8F 2014 =D0=B3. 23:40:46 GMT+0=
4:00, Peter Maydell <peter.maydell@linaro.org>:
>I think it would be nice to have here:
>    assert(ac[num] <=3D ARRAY_SIZE(a));
>
>just as a reminder to bump the ac[] array size if anybody adds a
>7-argument
>function in future.

Yeah good point, I'll add this assert. Thank you!

>Otherwise
>Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

/mjt from android phone

