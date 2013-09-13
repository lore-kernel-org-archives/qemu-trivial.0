Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VKVWU-0006nB-Cc
	for mharc-qemu-trivial@gnu.org; Fri, 13 Sep 2013 11:43:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50008)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tobias@markus-regensburg.de>) id 1VKUJU-0002N9-A0
	for qemu-trivial@nongnu.org; Fri, 13 Sep 2013 10:25:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <tobias@markus-regensburg.de>) id 1VKUJP-0006nG-EK
	for qemu-trivial@nongnu.org; Fri, 13 Sep 2013 10:25:36 -0400
Received: from mo6-p00-ob.rzone.de ([2a01:238:20a:202:5300::1]:18416)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tobias@markus-regensburg.de>)
	id 1VKUJF-0006lu-5p; Fri, 13 Sep 2013 10:25:21 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; t=1379082318; l=2358;
	s=domk; d=markus-regensburg.de;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:
	Subject:CC:To:MIME-Version:From:Date:X-RZG-CLASS-ID:X-RZG-AUTH;
	bh=Kg2FMl1P88wHkyMwhKOAbX9lu+Q=;
	b=Uzejtln+kBi92Y3p87+DVuNjGVHicS+LUwGqg9YgEvBrewy17IGnkMBVwGuPq+rBpT7
	soIIyzauRA71LQ0P/Z/V0uM72GsWs+ivFP56O4HPN4NGHzhiY/er0Kdsu/YC7lf2Mw5TT
	fksx6hPpa1wobO5drO3UsLQ4+Z+oiIT4uqw=
X-RZG-AUTH: :OGMGfEG7W/Jia0H4RdpQ6UBM+orSOYYzpexsp56HbPjosKXQJaSMgJFcBw0GfpbxotVoKyJnbjpb
X-RZG-CLASS-ID: mo00
Received: from [192.168.6.136]
	(178-26-198-212-dynip.superkabel.de [178.26.198.212])
	by smtp.strato.de (RZmta 32.1 DYNA|AUTH)
	with (TLSv1.0:ECDHE-RSA-AES256-SHA encrypted) ESMTPSA id a0586bp8DDjRJg
	; Fri, 13 Sep 2013 16:25:12 +0200 (CEST)
Message-ID: <52331F78.5060208@markus-regensburg.de>
Date: Fri, 13 Sep 2013 16:21:44 +0200
From: Tobias Markus <tobias@markus-regensburg.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130806 Thunderbird/17.0.8
MIME-Version: 1.0
To: qemu-devel@nongnu.org
References: <5219DA56.4090702@markus-regensburg.de>
In-Reply-To: <5219DA56.4090702@markus-regensburg.de>
X-Enigmail-Version: 1.5.2
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a01:238:20a:202:5300::1
X-Mailman-Approved-At: Fri, 13 Sep 2013 11:43:05 -0400
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	=?ISO-8859-1?Q?Andreas_F=E4rbe?= =?ISO-8859-1?Q?r?= <afaerber@suse.de>,
	Richard Henderson <rth@twiddle.net>
Subject: [Qemu-trivial] [Qemu-devel] PING Re: [PATCH v3] target-i386: Fix
	segment cache dump
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
X-List-Received-Date: Fri, 13 Sep 2013 14:25:42 -0000

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

PING
(Mail resent - sorry, Thunderbird wrapped line in the first mail)

PS: Sorry for the two wrapped lines below ---, but probably not worth
resending the patch just for that.

On 08/25/2013 12:20 PM, Tobias Markus wrote:
> When in Long Mode, cpu_x86_seg_cache() logs "DS16" because the Default
> operation size bit (D/B bit) is not set for Long Mode Data Segments since
> there are only Data Segments in Long Mode and no explicit 16/32/64-bit
> Descriptors.
> This patch fixes this by checking the Long Mode Active bit of the hidden
> flags variable and logging "DS" if it is set. (I.e. in Long Mode all Data
> Segments are logged as "DS")
> 
> Signed-off-by: Tobias Markus <tobias@markus-regensburg.de>
> ---
> v3: * Manually Break Lines
>     * Again change line wrapping as suggested by Eric Blake
> v2: * Fix line wrapping as suggested in IRC
>     * Break the line
> Note that alternatively, Data Segments in Long Mode could be logged as "DS64" to avoid confusion about the missing 64 postfix. (But that would be, strictly speaking, wrong because there are only DSs and no DS16/32/64 in Long Mode.)
> PS: This is my first contribution to an Open Source Project and I would be very happy about constructive feedback, especially about possible wrong line wrapping.
>   target-i386/helper.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/target-i386/helper.c b/target-i386/helper.c
> index bf3e2ac..0edb93b 100644
> --- a/target-i386/helper.c
> +++ b/target-i386/helper.c
> @@ -147,7 +147,9 @@ cpu_x86_dump_seg_cache(CPUX86State *env, FILE *f, fprintf_function cpu_fprintf,
>              cpu_fprintf(f, " [%c%c", (sc->flags & DESC_C_MASK) ? 'C' : '-',
>                          (sc->flags & DESC_R_MASK) ? 'R' : '-');
>          } else {
> -            cpu_fprintf(f, (sc->flags & DESC_B_MASK) ? "DS  " : "DS16");
> +            cpu_fprintf(f,
> +                        (sc->flags & DESC_B_MASK || env->hflags & HF_LMA_MASK)
> +                        ? "DS  " : "DS16");
>              cpu_fprintf(f, " [%c%c", (sc->flags & DESC_E_MASK) ? 'E' : '-',
>                          (sc->flags & DESC_W_MASK) ? 'W' : '-');
>          }
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iEYEARECAAYFAlIzH3gACgkQAO6N0EYmC9ZZaACeLJZ4fJ9QARYuBHXwKCyV6uMN
X/4AnjP9gqnop9fjXQWXhFDxqEgofkw7
=BEj3
-----END PGP SIGNATURE-----

