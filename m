Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WhFFx-0000NM-Mt
	for mharc-qemu-trivial@gnu.org; Mon, 05 May 2014 05:32:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54228)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WhFFq-0000E5-5i
	for qemu-trivial@nongnu.org; Mon, 05 May 2014 05:32:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WhFFj-0002Lm-PV
	for qemu-trivial@nongnu.org; Mon, 05 May 2014 05:32:10 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:43229)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WhFFX-0002G4-A1; Mon, 05 May 2014 05:31:51 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 5A69C4068E;
	Mon,  5 May 2014 13:31:50 +0400 (MSK)
Message-ID: <53675A86.1080505@msgid.tls.msk.ru>
Date: Mon, 05 May 2014 13:31:50 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.4.0
MIME-Version: 1.0
To: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>, 
	Hani Benhabiles <kroosec@gmail.com>, qemu-devel@nongnu.org
References: <1398725186-8202-1-git-send-email-kroosec@gmail.com>
	<5364AAEE.7000500@msgid.tls.msk.ru>
	<5367560A.8010000@msgid.tls.msk.ru> <53675935.7010105@suse.de>
In-Reply-To: <53675935.7010105@suse.de>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, lcapitulino@redhat.com
Subject: Re: [Qemu-trivial] [PATCH] qmp: Report path ambiguity error.
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
X-List-Received-Date: Mon, 05 May 2014 09:32:16 -0000

05.05.2014 13:26, Andreas F=C3=A4rber =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> 03.05.2014 12:38, Michael Tokarev wrote:

>>> +        error_set(errp,
>>> +                  ambiguous ? "Path '%s' is ambiguous" : QERR_DEVICE=
_NOT_FOUND,
>>> +                  path);

>> I've applied this version.
>=20
> Please undo. error_set() unlike error_setg() expects an ErrorClass
> argument before the string. QERR_* macro contains *two* comma-separated
> values, so it is on top filling in the device-not-found message as path
> in the ambiguous case.

Heh, I havent tried to compile it yet ;)  Ofcourse I'd find this out befo=
re
sending the pull request.  Actually this is a classic ENOCOFFEE, twice.

I'll fix this for real.  This makes way too many iterations.

/mjt


