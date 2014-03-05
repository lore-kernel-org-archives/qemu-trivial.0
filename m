Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WLFFT-0001Sw-Qc
	for mharc-qemu-trivial@gnu.org; Wed, 05 Mar 2014 12:04:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36520)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1WLFFM-0001J8-4T
	for qemu-trivial@nongnu.org; Wed, 05 Mar 2014 12:04:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1WLFFG-0007Ni-2u
	for qemu-trivial@nongnu.org; Wed, 05 Mar 2014 12:04:44 -0500
Received: from cantor2.suse.de ([195.135.220.15]:56321 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1WLFF3-0007JB-8w; Wed, 05 Mar 2014 12:04:25 -0500
Received: from relay1.suse.de (charybdis-ext.suse.de [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 7F82BACC0;
	Wed,  5 Mar 2014 17:04:24 +0000 (UTC)
Message-ID: <53175917.9040208@suse.de>
Date: Wed, 05 Mar 2014 18:04:23 +0100
From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <1394035840-1584-1-git-send-email-imammedo@redhat.com>
	<1394035840-1584-3-git-send-email-imammedo@redhat.com>
In-Reply-To: <1394035840-1584-3-git-send-email-imammedo@redhat.com>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.135.220.15
Cc: kwolf@redhat.com, aliguori@amazon.com, qemu-trivial@nongnu.org,
	eblake@redhat.com, coreyb@linux.vnet.ibm.com, mjt@tls.msk.ru,
	mreitz@redhat.com, stefanha@redhat.com, lcapitulino@redhat.com,
	pbonzini@redhat.com, lersek@redhat.com
Subject: Re: [Qemu-trivial] [PATCH v3 2/2] vl: convert -m to QemuOpts
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
X-List-Received-Date: Wed, 05 Mar 2014 17:04:50 -0000

Am 05.03.2014 17:10, schrieb Igor Mammedov:
> Adds option to -m
>  "size" - startup memory amount
>=20
> For compatibility with legacy CLI if suffix-less number is passed,
> it assumes amount in Mb.
>=20
> Otherwise user is free to use suffixed number using suffixes b,k/K,M,G
>=20
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
> v2:
>  - suggested by Andreas F=C3=A4rber <afaerber@suse.de>
>     * s/fprintf/error_report/
>     * rename 'mem' option to 'size'
>  - fix conflict with missing numa QemuOpts
> ---
>  qemu-options.hx |    9 ++++--
>  vl.c            |   71 ++++++++++++++++++++++++++++++++++++++++++++---=
--------
>  2 files changed, 63 insertions(+), 17 deletions(-)
>=20
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 56e5fdf..5e89e0d 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -210,10 +210,13 @@ use is discouraged as it may be removed from futu=
re versions.
>  ETEXI
> =20
>  DEF("m", HAS_ARG, QEMU_OPTION_m,
> -    "-m megs         set virtual RAM size to megs MB [default=3D"
> -    stringify(DEFAULT_RAM_SIZE) "]\n", QEMU_ARCH_ALL)
> +    "-m [size=3D]megs\n"
> +    "                configure guest RAM\n"
> +    "                size: initial amount of guest memory (default: "
> +    stringify(DEFAULT_RAM_SIZE) "MiB)\n",
> +    QEMU_ARCH_ALL)
>  STEXI
> -@item -m @var{megs}
> +@item -m [size=3D]@var{megs}
>  @findex -m
>  Set virtual RAM size to @var{megs} megabytes. Default is 128 MiB.  Opt=
ionally,
>  a suffix of ``M'' or ``G'' can be used to signify a value in megabytes=
 or
> diff --git a/vl.c b/vl.c
> index 7eb3b73..72235c5 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -475,6 +475,20 @@ static QemuOptsList qemu_msg_opts =3D {
>      },
>  };
> =20
> +static QemuOptsList qemu_mem_opts =3D {
> +    .name =3D "memory",
> +    .implied_opt_name =3D "mem",

"size"

> +    .head =3D QTAILQ_HEAD_INITIALIZER(qemu_mem_opts.head),
> +    .merge_lists =3D true,
> +    .desc =3D {
> +        {
> +            .name =3D "mem",

"size"

> +            .type =3D QEMU_OPT_SIZE,
> +        },
> +        { /* end of list */ }
> +    },
> +};
> +
>  /**
>   * Get machine options
>   *
> @@ -2835,6 +2849,8 @@ int main(int argc, char **argv, char **envp)
>      };
>      const char *trace_events =3D NULL;
>      const char *trace_file =3D NULL;
> +    const ram_addr_t default_ram_size =3D (ram_addr_t)DEFAULT_RAM_SIZE=
 *
> +                                        1024 * 1024;
> =20
>      atexit(qemu_run_exit_notifiers);
>      error_set_progname(argv[0]);
> @@ -2866,6 +2882,7 @@ int main(int argc, char **argv, char **envp)
>      qemu_add_opts(&qemu_trace_opts);
>      qemu_add_opts(&qemu_option_rom_opts);
>      qemu_add_opts(&qemu_machine_opts);
> +    qemu_add_opts(&qemu_mem_opts);
>      qemu_add_opts(&qemu_smp_opts);
>      qemu_add_opts(&qemu_boot_opts);
>      qemu_add_opts(&qemu_sandbox_opts);
> @@ -2889,7 +2906,7 @@ int main(int argc, char **argv, char **envp)
>      module_call_init(MODULE_INIT_MACHINE);
>      machine =3D find_default_machine();
>      cpu_model =3D NULL;
> -    ram_size =3D 0;
> +    ram_size =3D default_ram_size;
>      snapshot =3D 0;
>      cyls =3D heads =3D secs =3D 0;
>      translation =3D BIOS_ATA_TRANSLATION_AUTO;
> @@ -3176,20 +3193,48 @@ int main(int argc, char **argv, char **envp)
>                  exit(0);
>                  break;
>              case QEMU_OPTION_m: {
> -                int64_t value;
>                  uint64_t sz;
> -                char *end;
> +                const char *mem_str;
> =20
> -                value =3D strtosz(optarg, &end);
> -                if (value < 0 || *end) {
> -                    fprintf(stderr, "qemu: invalid ram size: %s\n", op=
targ);
> -                    exit(1);
> +                opts =3D qemu_opts_parse(qemu_find_opts("memory"),
> +                                       optarg, 1);
> +                if (!opts) {
> +                    exit(EXIT_FAILURE);
> +                }
> +
> +                mem_str =3D qemu_opt_get(opts, "mem");

"size"

> +                if (!mem_str) {
> +                    error_report("invalid -m option, missing 'size' op=
tion");
> +                    exit(EXIT_FAILURE);
> +                }
> +                if (!*mem_str) {
> +                    error_report("missing 'size' option value");
> +                    exit(EXIT_FAILURE);
> +                }
> +
> +                sz =3D qemu_opt_get_size(opts, "mem", ram_size);

"size"

> +
> +                /* Fix up legacy suffix-less format */
> +                if (g_ascii_isdigit(mem_str[strlen(mem_str) - 1])) {
> +                    uint64_t overflow_check =3D sz;
> +
> +                    sz <<=3D 20;
> +                    if ((sz >> 20) !=3D overflow_check) {
> +                        error_report("too large 'size' option value");
> +                        exit(EXIT_FAILURE);
> +                    }
> +                }
> +
> +                /* backward compatibility behaviour for case "-m 0" */
> +                if (sz =3D=3D 0) {
> +                    sz =3D default_ram_size;
>                  }
> -                sz =3D QEMU_ALIGN_UP((uint64_t)value, 8192);
> +
> +                sz =3D QEMU_ALIGN_UP(sz, 8192);
>                  ram_size =3D sz;
>                  if (ram_size !=3D sz) {
> -                    fprintf(stderr, "qemu: ram size too large\n");
> -                    exit(1);
> +                    error_report("ram size too large");
> +                    exit(EXIT_FAILURE);
>                  }
>                  break;
>              }
> @@ -4034,10 +4079,8 @@ int main(int argc, char **argv, char **envp)
>          exit(1);
>      }
> =20
> -    /* init the memory */
> -    if (ram_size =3D=3D 0) {
> -        ram_size =3D DEFAULT_RAM_SIZE * 1024 * 1024;
> -    }
> +    /* store value for the future use */
> +    qemu_opt_set_number(qemu_find_opts_singleton("memory"), "mem", ram=
_size);

"size"

> =20
>      if (qemu_opts_foreach(qemu_find_opts("device"), device_help_func, =
NULL, 0)
>          !=3D 0) {

Regards,
Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=BC=
rnberg

