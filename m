Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZMb8v-00041T-DE
	for mharc-qemu-trivial@gnu.org; Tue, 04 Aug 2015 08:16:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49323)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1ZMb8p-0003r7-Cn
	for qemu-trivial@nongnu.org; Tue, 04 Aug 2015 08:16:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1ZMb8m-0005zx-7l
	for qemu-trivial@nongnu.org; Tue, 04 Aug 2015 08:16:23 -0400
Received: from hall.aurel32.net ([195.154.112.97]:39105)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1ZMb8m-0005zr-2B
	for qemu-trivial@nongnu.org; Tue, 04 Aug 2015 08:16:20 -0400
Received: from weber.rr44.fr ([2001:bc8:30d7:120:7e05:7ff:fe0d:f152])
	by hall.aurel32.net with esmtps
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84)
	(envelope-from <aurelien@aurel32.net>)
	id 1ZMb8j-0007Rr-5k; Tue, 04 Aug 2015 14:16:17 +0200
Received: from aurel32 by weber.rr44.fr with local (Exim 4.85)
	(envelope-from <aurelien@aurel32.net>)
	id 1ZMb8i-0002Db-G8; Tue, 04 Aug 2015 14:16:16 +0200
Date: Tue, 4 Aug 2015 14:16:16 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Alex =?iso-8859-15?Q?Benn=E9e?= <alex.bennee@linaro.org>
Message-ID: <20150804121616.GA8192@aurel32.net>
References: <1438593291-27109-1-git-send-email-alex.bennee@linaro.org>
	<1438593291-27109-4-git-send-email-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1438593291-27109-4-git-send-email-alex.bennee@linaro.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 195.154.112.97
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, crosthwaitepeter@gmail.com,
	qemu-devel@nongnu.org, rth@twiddle.net
Subject: Re: [Qemu-trivial] [PATCH v4 03/11] qemu-log: correct help text for
	-d cpu
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
X-List-Received-Date: Tue, 04 Aug 2015 12:16:27 -0000

On 2015-08-03 10:14, Alex Benn=E9e wrote:
> This doesn't just dump CPU state on translation but on every block
> entrance.
>=20
> Signed-off-by: Alex Benn=E9e <alex.bennee@linaro.org>
> Reviewed-by: Andreas F=E4rber <afaerber@suse.de>
>=20
> ---
> v4
>   - add r-b tag
> ---
>  qemu-log.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/qemu-log.c b/qemu-log.c
> index 13f3813..be8405e 100644
> --- a/qemu-log.c
> +++ b/qemu-log.c
> @@ -105,7 +105,7 @@ const QEMULogItem qemu_log_items[] =3D {
>      { CPU_LOG_EXEC, "exec",
>        "show trace before each executed TB (lots of logs)" },
>      { CPU_LOG_TB_CPU, "cpu",
> -      "show CPU state before block translation" },
> +      "show CPU registers before each executed TB (lots of logs)" },
>      { CPU_LOG_MMU, "mmu",
>        "log MMU-related activities" },
>      { CPU_LOG_PCALL, "pcall",

In practice this is not true for linked TB. Should we also disable TB
linking when this option is enabled?

--=20
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                 http://www.aurel32.net

