Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZOsTE-0004Kw-BM
	for mharc-qemu-trivial@gnu.org; Mon, 10 Aug 2015 15:10:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44092)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cov@codeaurora.org>) id 1ZOqPw-0004dD-3y
	for qemu-trivial@nongnu.org; Mon, 10 Aug 2015 12:59:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cov@codeaurora.org>) id 1ZOqPr-0005Xn-T8
	for qemu-trivial@nongnu.org; Mon, 10 Aug 2015 12:59:20 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:35816)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cov@codeaurora.org>)
	id 1ZOqPl-0005VK-NW; Mon, 10 Aug 2015 12:59:09 -0400
Received: from smtp.codeaurora.org (localhost [127.0.0.1])
	by smtp.codeaurora.org (Postfix) with ESMTP id 8F955140539;
	Mon, 10 Aug 2015 16:59:06 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 486)
	id 7647114053E; Mon, 10 Aug 2015 16:59:06 +0000 (UTC)
Received: from [10.228.68.87] (rrcs-67-52-130-30.west.biz.rr.com
	[67.52.130.30])
	(using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: cov@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id A1445140539;
	Mon, 10 Aug 2015 16:59:04 +0000 (UTC)
Message-ID: <55C8D855.9060205@codeaurora.org>
Date: Mon, 10 Aug 2015 12:59:01 -0400
From: Christopher Covington <cov@codeaurora.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:36.0) Gecko/20100101 Thunderbird/36.0
MIME-Version: 1.0
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
	qemu-devel@nongnu.org
References: <1438593291-27109-1-git-send-email-alex.bennee@linaro.org>
	<1438593291-27109-8-git-send-email-alex.bennee@linaro.org>
In-Reply-To: <1438593291-27109-8-git-send-email-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
X-Virus-Scanned: ClamAV using ClamSMTP
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 198.145.29.96
X-Mailman-Approved-At: Mon, 10 Aug 2015 15:10:51 -0400
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, crosthwaitepeter@gmail.com,
	rth@twiddle.net
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v4 07/11] qemu-log: new
 option -dfilter to limit output
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
X-List-Received-Date: Mon, 10 Aug 2015 16:59:23 -0000

Hi Alex,

On 08/03/2015 05:14 AM, Alex Benn=C3=A9e wrote:
> When debugging big programs or system emulation sometimes you want both
> the verbosity of cpu,exec et all but don't want to generate lots of log=
s
> for unneeded stuff. This patch adds a new option -dfilter which allows
> you to specify interesting address ranges in the form:
>=20
>   -dfilter 0x8000-0x9000,0xffffffc000080000+0x200,...
>=20
> Then logging code can use the new qemu_log_in_addr_range() function to
> decide if it will output logging information for the given range.
>=20
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

My usual flow is to filter based on mode (CurrentEL on AArch64) and PID
(CONTEXTIDR on AArch64). Do you foresee any problems with adding such fil=
ters?

Thanks,
Christopher Covington

> v2
>   - More clean-ups to the documentation
>=20
> v3
>   - re-base
>   - use GArray instead of GList to avoid cache bouncing
>   - checkpatch fixes
> ---
>  include/qemu/log.h |  2 ++
>  qemu-log.c         | 57 ++++++++++++++++++++++++++++++++++++++++++++++=
++++++++
>  qemu-options.hx    | 16 +++++++++++++++
>  vl.c               |  3 +++
>  4 files changed, 78 insertions(+)
>=20
> diff --git a/include/qemu/log.h b/include/qemu/log.h
> index b80f8f5..ade1f76 100644
> --- a/include/qemu/log.h
> +++ b/include/qemu/log.h
> @@ -182,6 +182,8 @@ static inline void qemu_set_log(int log_flags)
>  }
> =20
>  void qemu_set_log_filename(const char *filename);
> +void qemu_set_dfilter_ranges(const char *ranges);
> +bool qemu_log_in_addr_range(uint64_t addr);
>  int qemu_str_to_log_mask(const char *str);
> =20
>  /* Print a usage message listing all the valid logging categories
> diff --git a/qemu-log.c b/qemu-log.c
> index 77ed7bc..b3ebd3c 100644
> --- a/qemu-log.c
> +++ b/qemu-log.c
> @@ -19,11 +19,13 @@
> =20
>  #include "qemu-common.h"
>  #include "qemu/log.h"
> +#include "qemu/range.h"
> =20
>  static char *logfilename;
>  FILE *qemu_logfile;
>  int qemu_loglevel;
>  static int log_append =3D 0;
> +static GArray *debug_regions;
> =20
>  void qemu_log(const char *fmt, ...)
>  {
> @@ -92,6 +94,61 @@ void qemu_set_log_filename(const char *filename)
>      qemu_set_log(qemu_loglevel);
>  }
> =20
> +/* Returns true if addr is in our debug filter or no filter defined
> + */
> +bool qemu_log_in_addr_range(uint64_t addr)
> +{
> +    if (debug_regions) {
> +        int i =3D 0;
> +        for (i =3D 0; i < debug_regions->len; i++) {
> +            struct Range *range =3D &g_array_index(debug_regions, Rang=
e, i);
> +            if (addr >=3D range->begin && addr <=3D range->end) {
> +                return true;
> +            }
> +        }
> +        return false;
> +    } else {
> +        return true;
> +    }
> +}
> +
> +
> +void qemu_set_dfilter_ranges(const char *filter_spec)
> +{
> +    gchar **ranges =3D g_strsplit(filter_spec, ",", 0);
> +    if (ranges) {
> +        gchar **next =3D ranges;
> +        gchar *r =3D *next++;
> +        debug_regions =3D g_array_sized_new(FALSE, FALSE,
> +                                          sizeof(Range), g_strv_length=
(ranges));
> +        while (r) {
> +            gchar *delim =3D g_strrstr(r, "-");
> +            if (!delim) {
> +                delim =3D g_strrstr(r, "+");
> +            }
> +            if (delim) {
> +                struct Range range;
> +                range.begin =3D strtoul(r, NULL, 0);
> +                switch (*delim) {
> +                case '+':
> +                    range.end =3D range.begin + strtoul(delim+1, NULL,=
 0);
> +                    break;
> +                case '-':
> +                    range.end =3D strtoul(delim+1, NULL, 0);
> +                    break;
> +                default:
> +                    g_assert_not_reached();
> +                }
> +                g_array_append_val(debug_regions, range);
> +            } else {
> +                g_error("Bad range specifier in: %s", r);
> +            }
> +            r =3D *next++;
> +        }
> +        g_strfreev(ranges);
> +    }
> +}
> +
>  const QEMULogItem qemu_log_items[] =3D {
>      { CPU_LOG_TB_OUT_ASM, "out_asm",
>        "show generated host assembly code for each compiled TB" },
> diff --git a/qemu-options.hx b/qemu-options.hx
> index ae53346..90f0df9 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -2987,6 +2987,22 @@ STEXI
>  Output log in @var{logfile} instead of to stderr
>  ETEXI
> =20
> +DEF("dfilter", HAS_ARG, QEMU_OPTION_DFILTER, \
> +    "-dfilter range,..  filter debug output to range of addresses (use=
ful for -d cpu,exec,etc..)\n",
> +    QEMU_ARCH_ALL)
> +STEXI
> +@item -dfilter @var{range1}[,...]
> +@findex -dfilter
> +Filter debug output to that relevant to a range of target addresses. T=
he filter
> +spec can be either @var{start}-@var{end} or @var{start}+@var{size} whe=
re @var{start}
> +@var{end} and @var{size} are the addresses and sizes required. For exa=
mple:
> +@example
> +    -dfilter 0x8000-0x9000,0xffffffc000080000+0x200
> +@end example
> +Will dump output for any code in the 0x1000 sized block starting at 0x=
8000 and
> +the 0x200 sized block starting at 0xffffffc000080000.
> +ETEXI
> +
>  DEF("L", HAS_ARG, QEMU_OPTION_L, \
>      "-L path         set the directory for the BIOS, VGA BIOS and keym=
aps\n",
>      QEMU_ARCH_ALL)
> diff --git a/vl.c b/vl.c
> index 1d2de4f..05211cf 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -3349,6 +3349,9 @@ int main(int argc, char **argv, char **envp)
>              case QEMU_OPTION_D:
>                  log_file =3D optarg;
>                  break;
> +            case QEMU_OPTION_DFILTER:
> +                qemu_set_dfilter_ranges(optarg);
> +                break;
>              case QEMU_OPTION_PERFMAP:
>                  tb_enable_perfmap();
>                  break;
>=20


--=20
Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum=
,
a Linux Foundation Collaborative Project

