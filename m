Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UKzzx-0004Nf-Ba
	for mharc-qemu-trivial@gnu.org; Wed, 27 Mar 2013 19:43:17 -0400
Received: from eggs.gnu.org ([208.118.235.92]:43738)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1UKzzv-0004Kg-Br
	for qemu-trivial@nongnu.org; Wed, 27 Mar 2013 19:43:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1UKzzu-00073S-81
	for qemu-trivial@nongnu.org; Wed, 27 Mar 2013 19:43:15 -0400
Received: from cantor2.suse.de ([195.135.220.15]:46706 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1UKzzr-0006dw-3I; Wed, 27 Mar 2013 19:43:11 -0400
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 5E888A5399;
	Thu, 28 Mar 2013 00:42:29 +0100 (CET)
Message-ID: <515383E2.7010408@suse.de>
Date: Thu, 28 Mar 2013 00:42:26 +0100
From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130307 Thunderbird/17.0.4
MIME-Version: 1.0
To: Richard Henderson <rth@twiddle.net>
References: <1364410030-24008-1-git-send-email-rth@twiddle.net>
In-Reply-To: <1364410030-24008-1-git-send-email-rth@twiddle.net>
X-Enigmail-Version: 1.6a1pre
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] vmxnet: Don't use bswap_64
	for constants
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
X-List-Received-Date: Wed, 27 Mar 2013 23:43:16 -0000

Am 27.03.2013 19:47, schrieb Richard Henderson:
> This macro is used in the context of defining enum values.
> We can't use a function call in that case.
>=20
> Cc: qemu-trivial@nongnu.org
> Signed-off-by: Richard Henderson <rth@twiddle.net>
> ---
>  hw/vmxnet3.h | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/vmxnet3.h b/hw/vmxnet3.h
> index 7db0c8f..cd9ac85 100644
> --- a/hw/vmxnet3.h
> +++ b/hw/vmxnet3.h
> @@ -37,7 +37,15 @@
>  #define __packed QEMU_PACKED
> =20
>  #if defined(HOST_WORDS_BIGENDIAN)
> -#define const_cpu_to_le64(x) bswap_64(x)
> +#define const_cpu_to_le64(x) \
> +        (((x & 0x00000000000000ffULL) << 56) | \
> +         ((x & 0x000000000000ff00ULL) << 40) | \
> +         ((x & 0x0000000000ff0000ULL) << 24) | \
> +         ((x & 0x00000000ff000000ULL) <<  8) | \
> +         ((x & 0x000000ff00000000ULL) >>  8) | \
> +         ((x & 0x0000ff0000000000ULL) >> 24) | \
> +         ((x & 0x00ff000000000000ULL) >> 40) | \
> +         ((x & 0xff00000000000000ULL) >> 56))

Being a macro, shouldn't this better use (x) for operator precedence?

Andreas

>  #define __BIG_ENDIAN_BITFIELD
>  #else
>  #define const_cpu_to_le64(x) (x)
>=20


--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

