Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZMbN6-0007Ls-6Q
	for mharc-qemu-trivial@gnu.org; Tue, 04 Aug 2015 08:31:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53262)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1ZMbN2-0007Gu-Rh
	for qemu-trivial@nongnu.org; Tue, 04 Aug 2015 08:31:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1ZMbN1-0004Gs-Oc
	for qemu-trivial@nongnu.org; Tue, 04 Aug 2015 08:31:04 -0400
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1]:40921)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>)
	id 1ZMbMm-0004B9-5x; Tue, 04 Aug 2015 08:30:48 -0400
Received: from weber.rr44.fr ([2001:bc8:30d7:120:7e05:7ff:fe0d:f152])
	by hall.aurel32.net with esmtps
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84)
	(envelope-from <aurelien@aurel32.net>)
	id 1ZMbMi-0007xz-Cs; Tue, 04 Aug 2015 14:30:44 +0200
Received: from aurel32 by weber.rr44.fr with local (Exim 4.85)
	(envelope-from <aurelien@aurel32.net>)
	id 1ZMbMh-0002T0-IM; Tue, 04 Aug 2015 14:30:43 +0200
Date: Tue, 4 Aug 2015 14:30:43 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Alex =?iso-8859-15?Q?Benn=E9e?= <alex.bennee@linaro.org>
Message-ID: <20150804123043.GA8960@aurel32.net>
References: <1438593291-27109-1-git-send-email-alex.bennee@linaro.org>
	<1438593291-27109-11-git-send-email-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1438593291-27109-11-git-send-email-alex.bennee@linaro.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:bc8:30d7:100::1
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, crosthwaitepeter@gmail.com,
	qemu-devel@nongnu.org, rth@twiddle.net
Subject: Re: [Qemu-trivial] [PATCH v4 10/11] vl.c: log system invocation
	when enabled
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
X-List-Received-Date: Tue, 04 Aug 2015 12:31:06 -0000

On 2015-08-03 10:14, Alex Benn=E9e wrote:
> This makes it a little easier to remember how you generated that 100Mb
> trace log you saved for a future date.
>=20
> Signed-off-by: Alex Benn=E9e <alex.bennee@linaro.org>
> ---
>  configure |  2 +-
>  vl.c      | 18 ++++++++++++++++++
>  2 files changed, 19 insertions(+), 1 deletion(-)
>=20
> diff --git a/configure b/configure
> index 704b34c..9cc6a48 100755
> --- a/configure
> +++ b/configure
> @@ -1445,7 +1445,7 @@ else
>  fi
> =20
>  gcc_flags=3D"-Wold-style-declaration -Wold-style-definition -Wtype-limit=
s"
> -gcc_flags=3D"-Wformat-security -Wformat-y2k -Winit-self -Wignored-qualif=
iers $gcc_flags"
> +gcc_flags=3D"-Wformat-security -Wno-format-y2k -Winit-self -Wignored-qua=
lifiers $gcc_flags"
>  gcc_flags=3D"-Wmissing-include-dirs -Wempty-body -Wnested-externs $gcc_f=
lags"
>  gcc_flags=3D"-Wendif-labels $gcc_flags"
>  gcc_flags=3D"-Wno-initializer-overrides $gcc_flags"
> diff --git a/vl.c b/vl.c
> index 05211cf..6f0ae74 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -4094,12 +4094,30 @@ int main(int argc, char **argv, char **envp)
> =20
>      if (log_mask) {
>          int mask;
> +        char fmt_time[512];
> +        time_t start_time =3D time(NULL);
> +        struct tm *local_start =3D localtime(&start_time);
> +
> +
> +        if (log_file) {
> +            qemu_set_log_filename(log_file);
> +        }
> +
>          mask =3D qemu_str_to_log_mask(log_mask);
>          if (!mask) {
>              qemu_print_log_usage(stdout);
>              exit(1);
>          }
>          qemu_set_log(mask);
> +
> +        if (strftime(fmt_time, sizeof(fmt_time), "%c", local_start) > 0)=
 {

Given we don't allow translation in qemu_log, shouldn't we just use a
fixed date/time format? It looks like other parts of QEMU has more or
less standardized to %Y-%m-%d %H:%M:%S, with some changes at the
separator level.

> +            qemu_log("System Emulation started at %s\n", fmt_time);
> +            qemu_log("Invocation:");
> +            for (i =3D 0; i < argc; i++) {
> +                qemu_log("%s ", argv[i]);
> +            }
> +            qemu_log("\n");
> +        }
>      }
> =20
>      if (!is_daemonized()) {

Otherwise:

Reviewed-by: Aurelien Jarno <aurelien@aurel32.net>


--=20
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                 http://www.aurel32.net

