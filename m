Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZcAPe-0002Lg-Dn
	for mharc-qemu-trivial@gnu.org; Wed, 16 Sep 2015 06:58:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49473)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZcAPb-0002IY-RN
	for qemu-trivial@nongnu.org; Wed, 16 Sep 2015 06:58:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZcAPb-0000vx-0m
	for qemu-trivial@nongnu.org; Wed, 16 Sep 2015 06:58:03 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:54879)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZcAPV-0000v4-TY; Wed, 16 Sep 2015 06:57:58 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 450EA41B11;
	Wed, 16 Sep 2015 13:57:57 +0300 (MSK)
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 30E83A6E;
	Wed, 16 Sep 2015 13:57:57 +0300 (MSK)
Message-ID: <55F94B35.4060001@msgid.tls.msk.ru>
Date: Wed, 16 Sep 2015 13:57:57 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
References: <1441744192-6110-1-git-send-email-marcandre.lureau@redhat.com>	<55F281CA.4030902@msgid.tls.msk.ru>
	<CAJ+F1CLnxyXhaN1U0nvvu0WCur5fUf4owKeQGyymy4X+zN0xpg@mail.gmail.com>
In-Reply-To: <CAJ+F1CLnxyXhaN1U0nvvu0WCur5fUf4owKeQGyymy4X+zN0xpg@mail.gmail.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, QEMU <qemu-devel@nongnu.org>,
	"Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] specs/vhost-user.txt: fix name of
	messages
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
X-List-Received-Date: Wed, 16 Sep 2015 10:58:04 -0000

16.09.2015 12:13, Marc-Andr=C3=A9 Lureau wrote:
> On Fri, Sep 11, 2015 at 9:24 AM, Michael Tokarev <mjt@tls.msk.ru> wrote=
:
>> The patch doesn't apply to qemu master as vhost-user.txt does not
>> have VHOST_GET_PROTOCOL_FEATURES in here.  What treee you're basing
>> your patch on?
>=20
> It is after your pending protocol feature patches.

Are you confusing me with Michael S. Tsirkin (mst)? :)

(that's no problem ofcourse, and you're welcome :)

/mjt

