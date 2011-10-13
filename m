Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1REBg7-0000hx-At
	for mharc-qemu-trivial@gnu.org; Wed, 12 Oct 2011 23:09:51 -0400
Received: from eggs.gnu.org ([140.186.70.92]:51073)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wdongxu@linux.vnet.ibm.com>) id 1REBg4-0000Xs-Do
	for qemu-trivial@nongnu.org; Wed, 12 Oct 2011 23:09:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wdongxu@linux.vnet.ibm.com>) id 1REBg3-0000Zf-9n
	for qemu-trivial@nongnu.org; Wed, 12 Oct 2011 23:09:48 -0400
Received: from e28smtp03.in.ibm.com ([122.248.162.3]:45508)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wdongxu@linux.vnet.ibm.com>)
	id 1REBg0-0000Z3-OZ; Wed, 12 Oct 2011 23:09:45 -0400
Received: from d28relay01.in.ibm.com (d28relay01.in.ibm.com [9.184.220.58])
	by e28smtp03.in.ibm.com (8.14.4/8.13.1) with ESMTP id p9D39boN010006;
	Thu, 13 Oct 2011 08:39:37 +0530
Received: from d28av05.in.ibm.com (d28av05.in.ibm.com [9.184.220.67])
	by d28relay01.in.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	p9D39ab03227760; Thu, 13 Oct 2011 08:39:37 +0530
Received: from d28av05.in.ibm.com (loopback [127.0.0.1])
	by d28av05.in.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
	p9D39a98021669; Thu, 13 Oct 2011 14:09:36 +1100
Received: from [9.115.124.195] ([9.115.124.195])
	by d28av05.in.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	p9D39Zwj021014; Thu, 13 Oct 2011 14:09:36 +1100
Message-ID: <4E965650.90807@linux.vnet.ibm.com>
Date: Thu, 13 Oct 2011 11:09:04 +0800
From: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:7.0) Gecko/20110822 Thunderbird/7.0
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1317965926-1696-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1317965926-1696-1-git-send-email-sw@weilnetz.de>
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by e28smtp03.in.ibm.com id
	p9D39boN010006
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6, seldom 2.4 (older,
	4)
X-Received-From: 122.248.162.3
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-char: Fix use of
 free() instead of g_free()
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
X-List-Received-Date: Thu, 13 Oct 2011 03:09:49 -0000

=D3=DA 10/07/2011 01:38 PM, Stefan Weil =D0=B4=B5=C0:
> cppcheck reported these errors:
>=20
> qemu-char.c:1667: error: Mismatching allocation and deallocation: s
> qemu-char.c:1668: error: Mismatching allocation and deallocation: chr
> qemu-char.c:1769: error: Mismatching allocation and deallocation: s
> qemu-char.c:1770: error: Mismatching allocation and deallocation: chr
>=20
> Signed-off-by: Stefan Weil<sw@weilnetz.de>
> ---
>   qemu-char.c |    8 ++++----
>   1 files changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/qemu-char.c b/qemu-char.c
> index 09d2309..e1b2b87 100644
> --- a/qemu-char.c
> +++ b/qemu-char.c
> @@ -1664,8 +1664,8 @@ static int qemu_chr_open_win(QemuOpts *opts, Char=
DriverState **_chr)
>       chr->chr_close =3D win_chr_close;
>=20
>       if (win_chr_init(chr, filename)<  0) {
> -        free(s);
> -        free(chr);
> +        g_free(s);
> +        g_free(chr);
>           return -EIO;
>       }
>       qemu_chr_generic_open(chr);
> @@ -1766,8 +1766,8 @@ static int qemu_chr_open_win_pipe(QemuOpts *opts,=
 CharDriverState **_chr)
>       chr->chr_close =3D win_chr_close;
>=20
>       if (win_chr_pipe_init(chr, filename)<  0) {
> -        free(s);
> -        free(chr);
> +        g_free(s);
> +        g_free(chr);
>           return -EIO;
>       }
>       qemu_chr_generic_open(chr);
Tested-by: Dongxu Wang <wdongxu@linux.vnet.ibm.com>

