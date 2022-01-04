Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n4jTn-0000r8-WF
	for mharc-qemu-trivial@gnu.org; Tue, 04 Jan 2022 08:03:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n4jTm-0000o2-C7; Tue, 04 Jan 2022 08:03:54 -0500
Received: from mail-yb1-f172.google.com ([209.85.219.172]:45801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n4jTk-000592-Sr; Tue, 04 Jan 2022 08:03:54 -0500
Received: by mail-yb1-f172.google.com with SMTP id o185so80759764ybo.12;
 Tue, 04 Jan 2022 05:03:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0/W5Z5riZoYHp0BfQ3oB2M2jREYBWOf9zf2FFBq6Q/8=;
 b=tK/whM1Huo0PB+FaIu8yDQxpTNztWQtoDOY4DnRAdtkkg3t6xg2JEvM3hOlLntsFXS
 4sjli/1aBuM67FbUDDUYfja7+38NYf0cAutQzECOE1s1R8WV+9IAdKTR7Boq1qcrpiXW
 SuQqkGLK7W+gZ9N2Zz72raOMWwe1y/1YznPsL8BYFqgt/OUwmvih7t5ElzH1LBvQly4x
 bWnVrdO/+4OUyKx8qHe/W7KsErqAV2pgE79ZNgm6n+EAZ6n1A122MEM5c6lIzG8wJ3Du
 XMG8WzSqarxsacqoAQS8edH3+uagxcPT8t+tRKVL6So97o3KZW8DltMTUTcRODmK9Hte
 9t6g==
X-Gm-Message-State: AOAM5308VwQexknDuQY4UT65vJw6tQ8zgq48QQvvsTHmk0efe4xp836t
 ienooibRopVFL/fa9m2BJG/V6AOKiwadRkkoRQuNxXoepEs=
X-Google-Smtp-Source: ABdhPJx2Mtmt8yQNTJfmlg/qdjGfd5g/vw/4Bf4ZXiD1E6IIHsjDwLAwDUzkGWGMH9wKwYOXjI/mefKaO417nIN1uKE=
X-Received: by 2002:a25:d24a:: with SMTP id j71mr49852992ybg.393.1641301431541; 
 Tue, 04 Jan 2022 05:03:51 -0800 (PST)
MIME-Version: 1.0
References: <20220104130217.2144929-1-f4bug@amsat.org>
In-Reply-To: <20220104130217.2144929-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Tue, 4 Jan 2022 14:03:40 +0100
Message-ID: <CAAdtpL772y=cGWWPSEYk6u+NSVdYVkiVtgkrVGq2h+ifaFXQPA@mail.gmail.com>
Subject: Re: [PATCH] linux-user: Fix trivial build error on loongarch64
To: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Cc: Laurent Vivier <laurent@vivier.eu>, WANG Xuerui <git@xen0n.name>, 
 QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
 Song Gao <gaosong@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.219.172;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-yb1-f172.google.com
X-Spam_score_int: 5
X-Spam_score: 0.5
X-Spam_bar: /
X-Spam_report: (0.5 / 5.0 requ) FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Jan 2022 13:03:54 -0000

I forgot to add trailing "hosts" in the subject line.

On Tue, Jan 4, 2022 at 2:02 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> When building using GCC 8.3.0 on loongarch64 (Loongnix) we get:
>
>   In file included from ../linux-user/signal.c:33:
>   ../linux-user/host/loongarch64/host-signal.h: In function =E2=80=98host=
_signal_write=E2=80=99:
>   ../linux-user/host/loongarch64/host-signal.h:57:9: error: a label can o=
nly be part of a statement and a declaration is not a statement
>          uint32_t sel =3D (insn >> 15) & 0b11111111111;
>          ^~~~~~~~
>
> We don't use the 'sel' variable more than once, so drop it.
>
> Meson output for the record:
>
>   Host machine cpu family: loongarch64
>   Host machine cpu: loongarch64
>   C compiler for the host machine: cc (gcc 8.3.0 "cc (Loongnix 8.3.0-6.ln=
d.vec.27) 8.3.0")
>   C linker for the host machine: cc ld.bfd 2.31.1-system
>
> Fixes: ad812c3bd65 ("linux-user: Implement CPU-specific signal handler fo=
r loongarch64 hosts")
> Reported-by: Song Gao <gaosong@loongson.cn>
> Suggested-by: Song Gao <gaosong@loongson.cn>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  linux-user/host/loongarch64/host-signal.h | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/linux-user/host/loongarch64/host-signal.h b/linux-user/host/=
loongarch64/host-signal.h
> index 05e2c823717..7effa242515 100644
> --- a/linux-user/host/loongarch64/host-signal.h
> +++ b/linux-user/host/loongarch64/host-signal.h
> @@ -54,9 +54,7 @@ static inline bool host_signal_write(siginfo_t *info, u=
context_t *uc)
>          }
>          break;
>      case 0b001110: /* indexed, atomic, bounds-checking memory operations=
 */
> -        uint32_t sel =3D (insn >> 15) & 0b11111111111;
> -
> -        switch (sel) {
> +        switch ((insn >> 15) & 0b11111111111) {
>          case 0b00000100000: /* stx.b */
>          case 0b00000101000: /* stx.h */
>          case 0b00000110000: /* stx.w */
> --
> 2.33.1
>

