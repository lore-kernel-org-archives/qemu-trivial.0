Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fRAFV-0001Ro-MY
	for mharc-qemu-trivial@gnu.org; Fri, 08 Jun 2018 01:47:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38558)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fRAFS-0001Q8-JP
	for qemu-trivial@nongnu.org; Fri, 08 Jun 2018 01:47:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fRAFR-0000ge-Fp
	for qemu-trivial@nongnu.org; Fri, 08 Jun 2018 01:47:42 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:43012 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1fRAFJ-0000ce-29; Fri, 08 Jun 2018 01:47:33 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 46A8E8A6FA;
	Fri,  8 Jun 2018 05:47:32 +0000 (UTC)
Received: from [10.36.116.125] (ovpn-116-125.ams2.redhat.com [10.36.116.125])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BBE0F10EE6CA;
	Fri,  8 Jun 2018 05:47:26 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Patryk Olszewski <patryk@fala.ehost.pl>,
	BALATON Zoltan <balaton@eik.bme.hu>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	Laurent Desnogues <laurent.desnogues@gmail.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>
References: <20180607210818.12727-1-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <9abdaa17-d6d1-0c34-2a20-43078b487bef@redhat.com>
Date: Fri, 8 Jun 2018 07:47:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180607210818.12727-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Fri, 08 Jun 2018 05:47:32 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Fri, 08 Jun 2018 05:47:32 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [PATCH] chardev: Restore CR,LF on stdio
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Jun 2018 05:47:43 -0000

On 07.06.2018 23:08, Philippe Mathieu-Daud=C3=A9 wrote:
> Remove the 'stair-step output' on stdio.
>=20
> This partially reverts commit 12fb0ac05, which was correct
> on the mailing list but got corrupted by the maintainer :p
>=20
> Introduced-by: 3b876140-c035-dd39-75d0-d54c48128fac@redhat.com
> Reported-by: BALATON Zoltan <balaton@eik.bme.hu>
> Suggested-by: Thomas Huth <thuth@redhat.com>
> Tested-by: Laurent Desnogues <laurent.desnogues@gmail.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> See:
> http://lists.nongnu.org/archive/html/qemu-devel/2018-05/msg06202.html (=
bug)
> http://lists.nongnu.org/archive/html/qemu-devel/2018-06/msg01309.html (=
report)
>=20
> Peter, Can this enters directly as bug-fix?
>=20
>  chardev/char-stdio.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/chardev/char-stdio.c b/chardev/char-stdio.c
> index d83e60e787..96375f2ab8 100644
> --- a/chardev/char-stdio.c
> +++ b/chardev/char-stdio.c
> @@ -59,7 +59,7 @@ static void qemu_chr_set_echo_stdio(Chardev *chr, boo=
l echo)
>      if (!echo) {
>          tty.c_iflag &=3D ~(IGNBRK | BRKINT | PARMRK | ISTRIP
>                           | INLCR | IGNCR | ICRNL | IXON);
> -        tty.c_oflag &=3D ~OPOST;
> +        tty.c_oflag |=3D OPOST;
>          tty.c_lflag &=3D ~(ECHO | ECHONL | ICANON | IEXTEN);
>          tty.c_cflag &=3D ~(CSIZE | PARENB);
>          tty.c_cflag |=3D CS8;
>=20

I think this is the right way to go.

Reviewed-by: Thomas Huth <thuth@redhat.com>

