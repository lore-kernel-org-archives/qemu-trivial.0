Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vxn3Y-0007c0-48
	for mharc-qemu-trivial@gnu.org; Mon, 30 Dec 2013 19:19:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59179)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1Vxn3P-0007Ri-DS
	for qemu-trivial@nongnu.org; Mon, 30 Dec 2013 19:19:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1Vxn3J-0002mS-BX
	for qemu-trivial@nongnu.org; Mon, 30 Dec 2013 19:19:27 -0500
Received: from cantor2.suse.de ([195.135.220.15]:57496 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1Vxn36-0002j6-Uf; Mon, 30 Dec 2013 19:19:09 -0500
Received: from relay1.suse.de (charybdis-ext.suse.de [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id AFE0EABC7;
	Tue, 31 Dec 2013 00:19:06 +0000 (UTC)
Message-ID: <52C20D76.7060301@suse.de>
Date: Tue, 31 Dec 2013 01:19:02 +0100
From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Kewei Yu <keweihk@gmail.com>, qemu-devel@nongnu.org
References: <1388393215-27511-1-git-send-email-keweihk@gmail.com>
In-Reply-To: <1388393215-27511-1-git-send-email-keweihk@gmail.com>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
	mst@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/1] qtest:Fix the bug about
 disabling vnc causes "make check" hang
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
X-List-Received-Date: Tue, 31 Dec 2013 00:19:33 -0000

Hi,

Am 30.12.2013 09:46, schrieb Kewei Yu:
> When we disabling vnc from "./configure", the qemu can't use the vnc op=
tion.
> So qtest can't use the "vnc -none ", otherwise "make check" will hang.
>=20
> Signed-off-by: Kewei Yu <keweihk@gmail.com>
> ---
>  tests/fdc-test.c |    4 ++++
>  tests/ide-test.c |   11 ++++++++---
>  2 files changed, 12 insertions(+), 3 deletions(-)
>=20
> diff --git a/tests/fdc-test.c b/tests/fdc-test.c
> index 38b5b17..80dbdfb 100644
> --- a/tests/fdc-test.c
> +++ b/tests/fdc-test.c
> @@ -538,7 +538,11 @@ int main(int argc, char **argv)
>      /* Run the tests */
>      g_test_init(&argc, &argv, NULL);
> =20
> +#ifdef CONFIG_VNC
>      cmdline =3D g_strdup_printf("-vnc none ");
> +#else
> +    cmdline =3D NULL;
> +#endif
> =20
>      qtest_start(cmdline);
>      qtest_irq_intercept_in(global_qtest, "ioapic");

I have already made -display none a default used by all qtests.
http://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3D2ad645d2854746b55ddfd1d8=
e951f689cca5d78f

Is there a reason not to do the same for -vnc none?
That would consolidate the #ifdef'ery to one central point.

Regards,
Andreas

> diff --git a/tests/ide-test.c b/tests/ide-test.c
> index d5cec5a..da9e8dd 100644
> --- a/tests/ide-test.c
> +++ b/tests/ide-test.c
> @@ -377,10 +377,15 @@ static void test_bmdma_no_busmaster(void)
>      assert_bit_clear(inb(IDE_BASE + reg_status), DF | ERR);
>  }
> =20
> +#ifdef CONFIG_VNC
> +#define QTEST_VNC_PARAM    "-vnc none ";
> +#else
> +#define QTEST_VNC_PARAM
> +#endif
>  static void test_bmdma_setup(void)
>  {
>      ide_test_start(
> -        "-vnc none "
> +        QTEST_VNC_PARAM
>          "-drive file=3D%s,if=3Dide,serial=3D%s,cache=3Dwriteback "
>          "-global ide-hd.ver=3D%s",
>          tmp_path, "testdisk", "version");
> @@ -410,7 +415,7 @@ static void test_identify(void)
>      int ret;
> =20
>      ide_test_start(
> -        "-vnc none "
> +        QTEST_VNC_PARAM
>          "-drive file=3D%s,if=3Dide,serial=3D%s,cache=3Dwriteback "
>          "-global ide-hd.ver=3D%s",
>          tmp_path, "testdisk", "version");
> @@ -455,7 +460,7 @@ static void test_flush(void)
>      uint8_t data;
> =20
>      ide_test_start(
> -        "-vnc none "
> +        QTEST_VNC_PARAM
>          "-drive file=3Dblkdebug::%s,if=3Dide,cache=3Dwriteback",
>          tmp_path);
> =20

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

