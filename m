Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RGDVO-0002Lq-8s
	for mharc-qemu-trivial@gnu.org; Tue, 18 Oct 2011 13:31:10 -0400
Received: from eggs.gnu.org ([140.186.70.92]:34230)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1RGDVL-0002DR-Q3
	for qemu-trivial@nongnu.org; Tue, 18 Oct 2011 13:31:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1RGDVF-0001jr-Vx
	for qemu-trivial@nongnu.org; Tue, 18 Oct 2011 13:31:07 -0400
Received: from mail-qw0-f45.google.com ([209.85.216.45]:33295)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>)
	id 1RGDVA-0001jG-3g; Tue, 18 Oct 2011 13:30:56 -0400
Received: by qadb10 with SMTP id b10so763618qad.4
	for <multiple recipients>; Tue, 18 Oct 2011 10:30:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.65.18 with SMTP id g18mr751022qci.22.1318959054753; Tue,
	18 Oct 2011 10:30:54 -0700 (PDT)
Received: by 10.229.217.205 with HTTP; Tue, 18 Oct 2011 10:30:54 -0700 (PDT)
In-Reply-To: <1318958208-13965-1-git-send-email-pavel.borzenkov@gmail.com>
References: <1318958208-13965-1-git-send-email-pavel.borzenkov@gmail.com>
Date: Tue, 18 Oct 2011 18:30:54 +0100
Message-ID: <CAFEAcA_SBfk9Rhthr6_sX-d3H1bkbUexmynucZZSmCVPVJgwpw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: Pavel Borzenkov <pavel.borzenkov@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.216.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] fw_cfg: check return value
	of fread()
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
X-List-Received-Date: Tue, 18 Oct 2011 17:31:08 -0000

On 18 October 2011 18:16, Pavel Borzenkov <pavel.borzenkov@gmail.com> wrote=
:
> Spotted by Clang Analyzer
>
> Signed-off-by: Pavel Borzenkov <pavel.borzenkov@gmail.com>
> ---
> =C2=A0hw/fw_cfg.c | =C2=A0 =C2=A07 +++++++
> =C2=A01 files changed, 7 insertions(+), 0 deletions(-)
>
> diff --git a/hw/fw_cfg.c b/hw/fw_cfg.c
> index 8df265c..1125e7d 100644
> --- a/hw/fw_cfg.c
> +++ b/hw/fw_cfg.c
> @@ -113,6 +113,13 @@ static FILE *probe_splashfile(char *filename, int *f=
ile_sizep, int *file_typep)
> =C2=A0 =C2=A0 if (file_type =3D=3D BMP_FILE) {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 fseek(fp, 28, SEEK_SET);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 fop_ret =3D fread(buf, 1, 2, fp);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0if (fop_ret !=3D 2) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_report("Could not read b=
pp value from '%s': %s",
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 filename, strerror(errno));
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fclose(fp);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fp =3D NULL;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return fp;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0}
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 bmp_bpp =3D (buf[0] + (buf[1] << 8)) & 0xffff=
;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (bmp_bpp !=3D 24) {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report("only 24bpp bmp fi=
le is supported.");

Yuck, this code again. We should just replace it with
g_file_get_contents() and looking at the resulting buffer.
That would be 10% of the code and much less bug-ridden.

FWIW, strictly speaking there isn't a need to check the result
of the fread() because if we don't read the data then buf[] will
still have the BMP_FILE signature in it and the !=3D 24 check will
fail.

Not checking the return code from that fseek(), on the other hand...

-- PMM

