Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZMbA3-00064V-36
	for mharc-qemu-trivial@gnu.org; Tue, 04 Aug 2015 08:17:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49626)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1ZMb9w-0005wv-6y
	for qemu-trivial@nongnu.org; Tue, 04 Aug 2015 08:17:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1ZMb9s-0006QN-CR
	for qemu-trivial@nongnu.org; Tue, 04 Aug 2015 08:17:32 -0400
Received: from hall.aurel32.net ([195.154.112.97]:39132)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1ZMb9s-0006QD-7H
	for qemu-trivial@nongnu.org; Tue, 04 Aug 2015 08:17:28 -0400
Received: from weber.rr44.fr ([2001:bc8:30d7:120:7e05:7ff:fe0d:f152])
	by hall.aurel32.net with esmtps
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84)
	(envelope-from <aurelien@aurel32.net>)
	id 1ZMb9p-0007T7-A1; Tue, 04 Aug 2015 14:17:25 +0200
Received: from aurel32 by weber.rr44.fr with local (Exim 4.85)
	(envelope-from <aurelien@aurel32.net>)
	id 1ZMb9o-0002I8-Kk; Tue, 04 Aug 2015 14:17:24 +0200
Date: Tue, 4 Aug 2015 14:17:24 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Alex =?iso-8859-15?Q?Benn=E9e?= <alex.bennee@linaro.org>
Message-ID: <20150804121724.GA8421@aurel32.net>
References: <1438593291-27109-1-git-send-email-alex.bennee@linaro.org>
	<1438593291-27109-7-git-send-email-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1438593291-27109-7-git-send-email-alex.bennee@linaro.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 195.154.112.97
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, crosthwaitepeter@gmail.com,
	qemu-devel@nongnu.org, rth@twiddle.net
Subject: Re: [Qemu-trivial] [PATCH v4 06/11] qemu-log: support simple pid
 substitution in logfile
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
X-List-Received-Date: Tue, 04 Aug 2015 12:17:37 -0000

On 2015-08-03 10:14, Alex Benn=E9e wrote:
> When debugging stuff that occurs over several forks it would be useful
> not to keep overwriting the one logfile you've set-up. This allows a
> simple %d to be included once in the logfile parameter which is
> substituted with getpid().
>=20
> Signed-off-by: Alex Benn=E9e <alex.bennee@linaro.org>
> Reviewed-by: Leandro Dorileo <l@dorileo.org>
> ---
>  qemu-log.c | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
>=20
> diff --git a/qemu-log.c b/qemu-log.c
> index 7036076..77ed7bc 100644
> --- a/qemu-log.c
> +++ b/qemu-log.c
> @@ -70,11 +70,24 @@ void do_qemu_set_log(int log_flags, bool use_own_buff=
ers)
>          qemu_log_close();
>      }
>  }
> -
> +/*
> + * Allow the user to include %d in their logfile which will be
> + * substituted with the current PID. This is useful for debugging many
> + * nested linux-user tasks but will result in lots of logs.
> + */
>  void qemu_set_log_filename(const char *filename)
>  {
>      g_free(logfilename);
> -    logfilename =3D g_strdup(filename);
> +    if (g_strrstr(filename, "%d")) {
> +        /* if we are going to format this we'd better validate first */
> +        if (g_regex_match_simple("^[^%]+%d[^%]+$", filename, 0, 0)) {
> +            logfilename =3D g_strdup_printf(filename, getpid());
> +        } else {
> +            g_error("Bad logfile format: %s", filename);
> +        }
> +    } else {
> +        logfilename =3D g_strdup(filename);
> +    }
>      qemu_log_close();
>      qemu_set_log(qemu_loglevel);
>  }

Reviewed-by: Aurelien Jarno <aurelien@aurel32.net>


--=20
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                 http://www.aurel32.net

