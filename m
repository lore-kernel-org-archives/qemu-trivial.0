Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZMb9q-0005oG-Eg
	for mharc-qemu-trivial@gnu.org; Tue, 04 Aug 2015 08:17:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49571)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1ZMb9n-0005kE-Us
	for qemu-trivial@nongnu.org; Tue, 04 Aug 2015 08:17:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1ZMb9k-0006M6-Ny
	for qemu-trivial@nongnu.org; Tue, 04 Aug 2015 08:17:23 -0400
Received: from hall.aurel32.net ([195.154.112.97]:39116)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1ZMb9k-0006Lr-I4
	for qemu-trivial@nongnu.org; Tue, 04 Aug 2015 08:17:20 -0400
Received: from weber.rr44.fr ([2001:bc8:30d7:120:7e05:7ff:fe0d:f152])
	by hall.aurel32.net with esmtps
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84)
	(envelope-from <aurelien@aurel32.net>)
	id 1ZMb9h-0007Ss-EN; Tue, 04 Aug 2015 14:17:17 +0200
Received: from aurel32 by weber.rr44.fr with local (Exim 4.85)
	(envelope-from <aurelien@aurel32.net>)
	id 1ZMb9g-0002Hp-Nw; Tue, 04 Aug 2015 14:17:16 +0200
Date: Tue, 4 Aug 2015 14:17:16 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Alex =?iso-8859-15?Q?Benn=E9e?= <alex.bennee@linaro.org>
Message-ID: <20150804121716.GA8303@aurel32.net>
References: <1438593291-27109-1-git-send-email-alex.bennee@linaro.org>
	<1438593291-27109-5-git-send-email-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1438593291-27109-5-git-send-email-alex.bennee@linaro.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 195.154.112.97
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, crosthwaitepeter@gmail.com,
	pbonzini@redhat.com, rth@twiddle.net
Subject: Re: [Qemu-trivial] [PATCH v4 04/11] qemu-log: Avoid function call
 for disabled qemu_log_mask logging
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
X-List-Received-Date: Tue, 04 Aug 2015 12:17:25 -0000

On 2015-08-03 10:14, Alex Benn=E9e wrote:
> From: Peter Maydell <peter.maydell@linaro.org>
>=20
> Make qemu_log_mask() a macro which only calls the function to
> do the actual work if the logging is enabled. This avoids making
> a function call in possible fast paths where logging is disabled.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Alex Benn=E9e <alex.bennee@linaro.org>
> Reviewed-by: Andreas F=E4rber <afaerber@suse.de>
>=20
> ---
> v4
>   - fix s-o-b tags, add r-b tag
> ---
>  include/qemu/log.h | 13 ++++++++++---
>  qemu-log.c         | 11 -----------
>  2 files changed, 10 insertions(+), 14 deletions(-)
>=20
> diff --git a/include/qemu/log.h b/include/qemu/log.h
> index f880e66..b80f8f5 100644
> --- a/include/qemu/log.h
> +++ b/include/qemu/log.h
> @@ -65,10 +65,17 @@ qemu_log_vprintf(const char *fmt, va_list va)
>      }
>  }
> =20
> -/* log only if a bit is set on the current loglevel mask
> +/* log only if a bit is set on the current loglevel mask:
> + * @mask: bit to check in the mask
> + * @fmt: printf-style format string
> + * @args: optional arguments for format string
>   */
> -void GCC_FMT_ATTR(2, 3) qemu_log_mask(int mask, const char *fmt, ...);
> -
> +#define qemu_log_mask(MASK, FMT, ...)                   \
> +    do {                                                \
> +        if (unlikely(qemu_loglevel_mask(MASK))) {       \
> +            qemu_log(FMT, ## __VA_ARGS__);              \
> +        }                                               \
> +    } while (0)
> =20
>  /* Special cases: */
> =20
> diff --git a/qemu-log.c b/qemu-log.c
> index be8405e..7036076 100644
> --- a/qemu-log.c
> +++ b/qemu-log.c
> @@ -36,17 +36,6 @@ void qemu_log(const char *fmt, ...)
>      va_end(ap);
>  }
> =20
> -void qemu_log_mask(int mask, const char *fmt, ...)
> -{
> -    va_list ap;
> -
> -    va_start(ap, fmt);
> -    if ((qemu_loglevel & mask) && qemu_logfile) {
> -        vfprintf(qemu_logfile, fmt, ap);
> -    }
> -    va_end(ap);
> -}
> -
>  /* enable or disable low levels log */
>  void do_qemu_set_log(int log_flags, bool use_own_buffers)
>  {

Good idea.

Reviewed-by: Aurelien Jarno <aurelien@aurel32.net>


--=20
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                 http://www.aurel32.net

