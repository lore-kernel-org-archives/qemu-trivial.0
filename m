Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WK6LQ-0001lc-9f
	for mharc-qemu-trivial@gnu.org; Sun, 02 Mar 2014 08:22:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49300)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WK6LI-0001b0-Lu
	for qemu-trivial@nongnu.org; Sun, 02 Mar 2014 08:22:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WK6LC-00055w-NQ
	for qemu-trivial@nongnu.org; Sun, 02 Mar 2014 08:22:08 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:39559)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WK6L0-00052Y-HJ; Sun, 02 Mar 2014 08:21:50 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id D5AFF40460;
	Sun,  2 Mar 2014 17:21:49 +0400 (MSK)
Message-ID: <5313306D.5010200@msgid.tls.msk.ru>
Date: Sun, 02 Mar 2014 17:21:49 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20131103 Icedove/17.0.10
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1393458706-24883-1-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1393458706-24883-1-git-send-email-peter.maydell@linaro.org>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <andreas.faerber@web.de>,
	qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [PATCH] qjson.h: Remove spurious GCC_FMT_ATTR
 markup from qobject_from_json() declaration
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
X-List-Received-Date: Sun, 02 Mar 2014 13:22:14 -0000

27.02.2014 03:51, Peter Maydell =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> The function qobject_from_json() doesn't actually allow its
> argument to be a format string -- it passes a NULL va_list*
> to qobject_from_jsonv(), and the parser code will then never
> actually intepret %-escape sequences (it tests whether the
> va_list pointer is NULL and will stop with a parse error).
>=20
> The spurious attribute markup causes clang warnings in some
> of the test cases where we programmatically construct JSON
> to feed to qobject_from_json():
>=20
>  tests/test-qmp-input-visitor.c:76:35: warning: format string is not a
>  string literal (potentially insecure) [-Wformat-security]
>     data->obj =3D qobject_from_json(json_string);
>                                   ^~~~~~~~~~~
>=20
> Remove the incorrect attribute.

Applied to -trivial, thank you!

/mjt

