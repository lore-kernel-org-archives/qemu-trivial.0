Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ghzo3-0003Hi-W1
	for mharc-qemu-trivial@gnu.org; Fri, 11 Jan 2019 11:37:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54816)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pmathieu@redhat.com>) id 1ghzo2-0003Gf-KB
	for qemu-trivial@nongnu.org; Fri, 11 Jan 2019 11:37:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pmathieu@redhat.com>) id 1ghznz-0005bw-2L
	for qemu-trivial@nongnu.org; Fri, 11 Jan 2019 11:37:12 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:34998)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pmathieu@redhat.com>) id 1ghzny-0005a9-RO
	for qemu-trivial@nongnu.org; Fri, 11 Jan 2019 11:37:10 -0500
Received: by mail-wr1-f68.google.com with SMTP id 96so15885260wrb.2
	for <qemu-trivial@nongnu.org>; Fri, 11 Jan 2019 08:37:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=O/OVYSB7a1G5DVQEXfRUYFIGh4HUwZI/bZws7Pk7EmM=;
	b=lerBL3Sfn9NLCKmeU+QPpJKDDGVPxOKzyWU/IdU43YkYkqzwKUc8HBpAvItZC8Hy3n
	Lu1ESPWy1JMhviUP1FHXxgxwDxNkcXwToymGhhRK/qEPeb7KVg2udacqkOnqtlk6W64R
	3GTYc2574C5D9pu/iL5qIQpq9imyTkKNghA2nqYodegjhwREO6zp5w/4ZKXhq/vest2N
	qWhw5f/2+KYNIlVLHhiugV7Oa8FNJLLfzzEsdb6grqw5dj3+P4Dw17UhBRqbDyDq27yj
	T1xljSC0EduEs0xM8DfwaUUbEV5YSFcsPMVnLPfoPh4iCheVrvfulEaDhoDh35sNqWBd
	hhIA==
X-Gm-Message-State: AJcUukcI6EW4hnVZo+D3jlH9ozWE0SOdWxc83TcNxSHpsiTR6v3P4UUF
	UE3rermy7zCWQgGIJeEzB1XyywTiYNVNYAH55cYXZ2CbwT0=
X-Google-Smtp-Source: ALg8bN4a2Z1zdHXA+UcBaflzrXvok+UM2yYBiWAjlk+CxWS425e+uECx3JystZ6MBnf6NXMzZnFxEwXJ/enJRKfI844=
X-Received: by 2002:a5d:43d0:: with SMTP id v16mr15011578wrr.67.1547224627990; 
	Fri, 11 Jan 2019 08:37:07 -0800 (PST)
MIME-Version: 1.0
References: <20190111163519.11457-1-philmd@redhat.com>
In-Reply-To: <20190111163519.11457-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Date: Fri, 11 Jan 2019 17:36:56 +0100
Message-ID: <CAP+75-WPAYsMJwTsyq0cMwDiD=4CzAbh574XfVbpEXevB=RPyQ@mail.gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>, 
	Qemu-block <qemu-block@nongnu.org>, 
	Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.68
Subject: Re: [Qemu-trivial] [PATCH] qemu-nbd: Rename 'exp' variable clashing
 with math::exp() symbol
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
X-List-Received-Date: Fri, 11 Jan 2019 16:37:15 -0000

Cc'ing qemu-trivial@nongnu.org

On Fri, Jan 11, 2019 at 5:35 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> The use of a variable named 'exp' prevents includes to import <math.h>.
>
> Rename it to avoid:
>
>   qemu-nbd.c:64:19: error: =E2=80=98exp=E2=80=99 redeclared as different =
kind of symbol
>    static NBDExport *exp;
>                      ^~~
>   In file included from /usr/include/features.h:428,
>                    from /usr/include/bits/libc-header-start.h:33,
>                    from /usr/include/stdint.h:26,
>                    from /usr/lib/gcc/x86_64-redhat-linux/8/include/stdint=
.h:9,
>                    from /source/qemu/include/qemu/osdep.h:80,
>                    from /source/qemu/qemu-nbd.c:19:
>   /usr/include/bits/mathcalls.h:95:1: note: previous declaration of =E2=
=80=98exp=E2=80=99 was here
>     __MATHCALL_VEC (exp,, (_Mdouble_ __x));
>     ^~~~~~~~~~~~~~
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  qemu-nbd.c | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)
>
> diff --git a/qemu-nbd.c b/qemu-nbd.c
> index 2807e13239..6ca02b6d87 100644
> --- a/qemu-nbd.c
> +++ b/qemu-nbd.c
> @@ -61,7 +61,7 @@
>
>  #define MBR_SIZE 512
>
> -static NBDExport *exp;
> +static NBDExport *export;
>  static int verbose;
>  static char *srcpath;
>  static SocketAddress *saddr;
> @@ -335,7 +335,7 @@ static int nbd_can_accept(void)
>      return state =3D=3D RUNNING && nb_fds < shared;
>  }
>
> -static void nbd_export_closed(NBDExport *exp)
> +static void nbd_export_closed(NBDExport *export)
>  {
>      assert(state =3D=3D TERMINATING);
>      state =3D TERMINATED;
> @@ -1015,10 +1015,11 @@ int main(int argc, char **argv)
>          }
>      }
>
> -    exp =3D nbd_export_new(bs, dev_offset, fd_size, nbdflags, nbd_export=
_closed,
> -                         writethrough, NULL, &error_fatal);
> -    nbd_export_set_name(exp, export_name);
> -    nbd_export_set_description(exp, export_description);
> +    export =3D nbd_export_new(bs, dev_offset, fd_size, nbdflags,
> +                            nbd_export_closed, writethrough,
> +                            NULL, &error_fatal);
> +    nbd_export_set_name(export, export_name);
> +    nbd_export_set_description(export, export_description);
>
>      if (device) {
>  #if HAVE_NBD_DEVICE
> @@ -1055,9 +1056,9 @@ int main(int argc, char **argv)
>          main_loop_wait(false);
>          if (state =3D=3D TERMINATE) {
>              state =3D TERMINATING;
> -            nbd_export_close(exp);
> -            nbd_export_put(exp);
> -            exp =3D NULL;
> +            nbd_export_close(export);
> +            nbd_export_put(export);
> +            export =3D NULL;
>          }
>      } while (state !=3D TERMINATED);
>
> --
> 2.17.2
>

