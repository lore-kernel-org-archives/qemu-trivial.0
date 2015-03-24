Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YaDJW-0003UI-B2
	for mharc-qemu-trivial@gnu.org; Mon, 23 Mar 2015 21:07:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57280)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1YaDJT-0003Tn-V4
	for qemu-trivial@nongnu.org; Mon, 23 Mar 2015 21:07:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1YaDJR-0007Vq-89
	for qemu-trivial@nongnu.org; Mon, 23 Mar 2015 21:07:23 -0400
Received: from mail-pa0-x22e.google.com ([2607:f8b0:400e:c03::22e]:33082)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1YaDJR-0007Vm-0Z; Mon, 23 Mar 2015 21:07:21 -0400
Received: by pabxg6 with SMTP id xg6so195641379pab.0;
	Mon, 23 Mar 2015 18:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=ok65R5ddi/PWBEuH9nfpQQCdlDw4/IjdW7H+BDkGz0Q=;
	b=jCT7qTKmPbX3h0FDTTq9T7xat9lk96YELjHX6DxgQe15GG57c8FaLftyGbjnKYDiss
	YPl0wWDX/HlJi8fiA6lL5PXblEsRNX+n/VwEip0yPAuA5tI9H3Y8codZ63U6cw/4PzT0
	hrTF7+I0wnyspB7v6azoVRgHa3Mho0zT1UsQGkF05tVPUYH5R3VysMtR35uvPk6ws1JO
	mJhR2rirNPVnRYENc5ME/4ULOb+eZlsXT9jLpN0IbdEII49yaxDd9dVTZH8rKay4tA41
	X/i3y8MfwlIHgXwNQ55ZrFAQU9OrBFWrzV+QB3C4G3BU8VGK5KdkgmME0q+EFJf3D+bM
	D4nw==
X-Received: by 10.70.38.227 with SMTP id j3mr2775434pdk.149.1427159240164;
	Mon, 23 Mar 2015 18:07:20 -0700 (PDT)
Received: from pike.twiddle.home
	(50-194-63-110-static.hfc.comcastbusiness.net. [50.194.63.110])
	by mx.google.com with ESMTPSA id ms7sm2289114pdb.8.2015.03.23.18.07.18
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 Mar 2015 18:07:18 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Message-ID: <5510B8C4.1050302@twiddle.net>
Date: Mon, 23 Mar 2015 18:07:16 -0700
From: Richard Henderson <rth@twiddle.net>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>, "Emilio G. Cota" <cota@braap.org>, 
	qemu-devel@nongnu.org
References: <1426919232-20813-1-git-send-email-cota@braap.org>
	<551088CF.1050001@weilnetz.de>
In-Reply-To: <551088CF.1050001@weilnetz.de>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c03::22e
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] tcg: pack TCGTemp to reduce
	size by 8 bytes
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
X-List-Received-Date: Tue, 24 Mar 2015 01:07:24 -0000

On 03/23/2015 02:42 PM, Stefan Weil wrote:
> Further optimizations are possible. TCGTemp can be reduced to 32 bytes as the
> output
> of pahole shows:
> 
> struct TCGTemp {
>         TCGTempVal                 val_type:8; /*     0:24  4 */

Need only be 2 bits.

>         unsigned int               reg:8; /*     0:16  4 */
>         unsigned int               mem_reg:8; /*     0: 8  4 */

Need only be  6 (ia64) bits, but an aligned 8-bit slot probably performs best.

> 
>         /* Bitfield combined with next fields */
> 
>         _Bool                      fixed_reg:1; /*     3: 7  1 */
>         _Bool                      mem_coherent:1; /*     3: 6  1 */
>         _Bool                      mem_allocated:1; /*     3: 5  1 */
>         _Bool                      temp_local:1; /*     3: 4  1 */
>         _Bool                      temp_allocated:1; /*     3: 3  1 */
> 
>         /* XXX 3 bits hole, try to pack */
> 
>         TCGType                    base_type:16; /*     4:16  4 */
>         TCGType                    type:16; /*     4: 0  4 */

Need only be 1 bit, honestly, but 2 bits might be easier to arrange.  Anyway,
you're down to 23 bits from the word, or 16 bytes on a 32-bit host.  It's no
better than the 32 bytes you got for a 64-bit host though.


>         tcg_target_long            val; /*     8     8 */
>         intptr_t                   mem_offset; /*    16     8 */
>         const char  *              name; /*    24     8 */
> 
>         /* size: 32, cachelines: 1, members: 13 */
>         /* bit holes: 1, sum bit holes: 3 bits */
>         /* last cacheline: 32 bytes */
> };
> 
> Here I used a new enum type for val_type and reduced some values to 8 or 16 bit.
> I also put the two most often used values at the beginning, so they can be
> addressed without or with a small offset ("often" in the code, no runtime
> data available).
> 
> Are such optimizations useful?

Yes, I think so.  Especially because of the rather large arrays we build.


r~

