Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z7qFN-0000qZ-8n
	for mharc-qemu-trivial@gnu.org; Wed, 24 Jun 2015 15:22:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58908)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <th.huth@gmail.com>) id 1Z7qFK-0000km-Rt
	for qemu-trivial@nongnu.org; Wed, 24 Jun 2015 15:22:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <th.huth@gmail.com>) id 1Z7qFJ-0001IL-NC
	for qemu-trivial@nongnu.org; Wed, 24 Jun 2015 15:22:06 -0400
Received: from mail-wg0-f53.google.com ([74.125.82.53]:36058)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <th.huth@gmail.com>)
	id 1Z7qFF-0001HB-8y; Wed, 24 Jun 2015 15:22:01 -0400
Received: by wguu7 with SMTP id u7so44389043wgu.3;
	Wed, 24 Jun 2015 12:22:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=date:from:to:cc:subject:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=eDEcgm60XHo+2Vjp+v7TdejbTolzC6OfBM2Y9DvYVFA=;
	b=O4sUjX9P16iuUfQbTUriqNFjFw1QPzp3rUJT4sArXkZ2IHwYcRGLQH5ZzYEzLq+KJo
	Yt6vEo8W40r4AGomSdLKe/au+93tfyrnDNbb8ZY4whBKZVztdrCAqL+FqvV3NYEPbMEl
	5YlEQ1k11XCUvm2rxtN/mijbcDYzQLmdTfg+SGAI0TUnixmOxPFJrl8fT8qr9hMp8qSW
	ifOfVG9rrr5hOsOxr/hur3B44Gq72xZxX9Vc3Isc6WVA28hm/hW5DzWT18Q60T6fbfme
	WEe2vz7bD5dsEOZCv/9w4afbi2+eMp2ZpLrICU4/IWpXrQy9eoQHtYPNYhTriqi6AXwO
	gjNQ==
X-Received: by 10.180.101.138 with SMTP id fg10mr7657108wib.46.1435173720733; 
	Wed, 24 Jun 2015 12:22:00 -0700 (PDT)
Received: from thh440s (p57AEC007.dip0.t-ipconnect.de. [87.174.192.7])
	by mx.google.com with ESMTPSA id i5sm3973731wic.10.2015.06.24.12.21.58
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 Jun 2015 12:22:00 -0700 (PDT)
Date: Wed, 24 Jun 2015 21:21:56 +0200
From: Thomas Huth <huth@tuxfamily.org>
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Message-ID: <20150624212156.21144f8f@thh440s>
In-Reply-To: <1435107109-12500-1-git-send-email-laurent@vivier.eu>
References: <1435107109-12500-1-git-send-email-laurent@vivier.eu>
X-Mailer: Claws Mail 3.11.1 (GTK+ 2.24.22; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.82.53
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] m68k: remove useless
 parameter op_size from gen_lea_indexed()
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
X-List-Received-Date: Wed, 24 Jun 2015 19:22:08 -0000

On Wed, 24 Jun 2015 02:51:49 +0200
Laurent Vivier <laurent@vivier.eu> wrote:

> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>  target-m68k/translate.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/target-m68k/translate.c b/target-m68k/translate.c
> index d6c478f..bc83a6e 100644
> --- a/target-m68k/translate.c
> +++ b/target-m68k/translate.c
> @@ -297,8 +297,7 @@ static TCGv gen_addr_index(uint16_t ext, TCGv tmp)
>  
>  /* Handle a base + index + displacement effective addresss.
>     A NULL_QREG base means pc-relative.  */
> -static TCGv gen_lea_indexed(CPUM68KState *env, DisasContext *s, int opsize,
> -                            TCGv base)
> +static TCGv gen_lea_indexed(CPUM68KState *env, DisasContext *s, TCGv base)
>  {
>      uint32_t offset;
>      uint16_t ext;
> @@ -529,7 +528,7 @@ static TCGv gen_lea(CPUM68KState *env, DisasContext *s, uint16_t insn,
>          return tmp;
>      case 6: /* Indirect index + displacement.  */
>          reg = AREG(insn, 0);
> -        return gen_lea_indexed(env, s, opsize, reg);
> +        return gen_lea_indexed(env, s, reg);
>      case 7: /* Other */
>          switch (insn & 7) {
>          case 0: /* Absolute short.  */
> @@ -545,7 +544,7 @@ static TCGv gen_lea(CPUM68KState *env, DisasContext *s, uint16_t insn,
>              s->pc += 2;
>              return tcg_const_i32(offset);
>          case 3: /* pc index+displacement.  */
> -            return gen_lea_indexed(env, s, opsize, NULL_QREG);
> +            return gen_lea_indexed(env, s, NULL_QREG);
>          case 4: /* Immediate.  */
>          default:
>              return NULL_QREG;

Reviewed-by: Thomas Huth <huth@tuxfamily.org>

