Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZB0bT-0000hO-HN
	for mharc-qemu-trivial@gnu.org; Fri, 03 Jul 2015 09:02:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54218)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1ZB0bO-0000Zh-7D
	for qemu-trivial@nongnu.org; Fri, 03 Jul 2015 09:02:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1ZB0bN-0005m4-6t
	for qemu-trivial@nongnu.org; Fri, 03 Jul 2015 09:01:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40443)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1ZB0b9-0005fz-7q; Fri, 03 Jul 2015 09:01:43 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id B87AC36D076;
	Fri,  3 Jul 2015 13:01:42 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-44.ams2.redhat.com
	[10.36.116.44])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t63D1eO1018739
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Fri, 3 Jul 2015 09:01:42 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 3A2FD303FEAE; Fri,  3 Jul 2015 15:01:40 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: =?utf-8?B?S8WRdsOhZ8OzLCBab2x0w6Fu?= <dirty.ice.hu@gmail.com>
References: <c7aaec779e13932db2c7dd4cce2700b41f162092.1435923273.git.DirtY.iCE.hu@gmail.com>
Date: Fri, 03 Jul 2015 15:01:40 +0200
In-Reply-To: <c7aaec779e13932db2c7dd4cce2700b41f162092.1435923273.git.DirtY.iCE.hu@gmail.com>
	(=?utf-8?B?IkvFkXbDoWfDsywgWm9sdMOhbiIncw==?= message of "Fri,
	3 Jul 2015 13:40:19 +0200")
Message-ID: <87616175u3.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	qemu-devel@nongnu.org, "open list:Block layer core" <qemu-block@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] opts: produce valid command
	line in qemu_opts_print
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
X-List-Received-Date: Fri, 03 Jul 2015 13:02:02 -0000

"K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n" <dirty.ice.hu@gmail.com> writes:

> This will let us print options in a format that the user would actually
> write it on the command line (foo=3Dbar,baz=3Dasd,etc=3Ddef), without
> prepending a spurious comma at the beginning of the list, or quoting
> values unnecessarily.  This patch provides the following changes:
> * write and id=3D, if the option has an id
> * do not print separator before the first element
> * do not quote string arguments
> * properly escape commas (,) for QEMU
>
> Signed-off-by: K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n <DirtY.iCE.hu@gmail.com>
> ---
>
> Changes from patch submitted as part of `qapi flattening':
> * no longer tries to do proper escaping for the shell
>
>  block.c            |  2 +-
>  util/qemu-option.c | 30 +++++++++++++++++++++++++++---
>  2 files changed, 28 insertions(+), 4 deletions(-)
>
> diff --git a/block.c b/block.c
> index 7e130cc..78a5304 100644
> --- a/block.c
> +++ b/block.c
> @@ -3813,7 +3813,7 @@ void bdrv_img_create(const char *filename, const ch=
ar *fmt,
>      }
>=20=20
>      if (!quiet) {
> -        printf("Formatting '%s', fmt=3D%s", filename, fmt);
> +        printf("Formatting '%s', fmt=3D%s ", filename, fmt);
>          qemu_opts_print(opts, " ");
>          puts("");
>      }
> diff --git a/util/qemu-option.c b/util/qemu-option.c
> index efe9d27..55ef172 100644
> --- a/util/qemu-option.c
> +++ b/util/qemu-option.c
> @@ -730,14 +730,36 @@ void qemu_opts_del(QemuOpts *opts)
>      g_free(opts);
>  }
>=20=20
> -void qemu_opts_print(QemuOpts *opts, const char *sep)
> +/* print value, escaping any commas in value */
> +static void escaped_print(const char *value)

Have you searched the tree for existing code doing this?

> +{
> +    const char *ptr;
> +
> +    for (ptr =3D value; *ptr; ++ptr) {
> +        if (*ptr =3D=3D ',') {
> +            printf(",,");
> +        } else {
> +            putchar(*ptr);
> +        }
> +    }

Slightly simpler:

        if (*ptr =3D=3D ',') {
            putchar(',');
        }
        putchar(*ptr);

Matter of taste.

> +}
> +
> +void qemu_opts_print(QemuOpts *opts, const char *separator)
>  {
>      QemuOpt *opt;
>      QemuOptDesc *desc =3D opts->list->desc;
> +    const char *sep =3D "";
> +
> +    if (opts->id) {
> +        printf("id=3D%s", opts->id); /* passed id_wellformed -> no comma=
s */
> +        sep =3D separator;
> +    }
>=20=20
>      if (desc[0].name =3D=3D NULL) {
>          QTAILQ_FOREACH(opt, &opts->head, next) {
> -            printf("%s%s=3D\"%s\"", sep, opt->name, opt->str);
> +            printf("%s%s=3D", sep, opt->name);
> +            escaped_print(opt->str);
> +            sep =3D separator;
>          }
>          return;
>      }
> @@ -750,13 +772,15 @@ void qemu_opts_print(QemuOpts *opts, const char *se=
p)
>              continue;
>          }
>          if (desc->type =3D=3D QEMU_OPT_STRING) {
> -            printf("%s%s=3D'%s'", sep, desc->name, value);
> +            printf("%s%s=3D", sep, desc->name);
> +            escaped_print(value);
>          } else if ((desc->type =3D=3D QEMU_OPT_SIZE ||
>                      desc->type =3D=3D QEMU_OPT_NUMBER) && opt) {
>              printf("%s%s=3D%" PRId64, sep, desc->name, opt->value.uint);
>          } else {
>              printf("%s%s=3D%s", sep, desc->name, value);
>          }
> +        sep =3D separator;
>      }
>  }

Reviewed-by: Markus Armbruster <armbru@redhat.com>

