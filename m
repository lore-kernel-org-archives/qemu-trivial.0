Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZaIZr-0006fZ-D4
	for mharc-qemu-trivial@gnu.org; Fri, 11 Sep 2015 03:16:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35470)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZaIZo-0006cM-T0
	for qemu-trivial@nongnu.org; Fri, 11 Sep 2015 03:16:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZaIZo-00056p-6c
	for qemu-trivial@nongnu.org; Fri, 11 Sep 2015 03:16:52 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:39400)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZaIZi-00050U-8N; Fri, 11 Sep 2015 03:16:46 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 872BB413F3;
	Fri, 11 Sep 2015 10:16:45 +0300 (MSK)
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 77FEEA52;
	Fri, 11 Sep 2015 10:16:45 +0300 (MSK)
Message-ID: <55F27FDD.6010002@msgid.tls.msk.ru>
Date: Fri, 11 Sep 2015 10:16:45 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <1441395661-22447-1-git-send-email-marcandre.lureau@redhat.com>
In-Reply-To: <1441395661-22447-1-git-send-email-marcandre.lureau@redhat.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] qapi-schema: remove legacy<> from doc
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
X-List-Received-Date: Fri, 11 Sep 2015 07:16:53 -0000

04.09.2015 22:41, marcandre.lureau@redhat.com wrote:
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>=20
> The legacy<> type is no longer used since 7ce7ffe02.

Applied to -trivial, with the typo fix suggested by Eric.

Thanks,

/mjt

