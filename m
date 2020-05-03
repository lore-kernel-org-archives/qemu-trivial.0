Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jVE4W-0001Kv-UR
	for mharc-qemu-trivial@gnu.org; Sun, 03 May 2020 08:50:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aleksandar.qemu.devel@gmail.com>)
 id 1jVE4U-0001Ez-Bf; Sun, 03 May 2020 08:50:14 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:54562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aleksandar.qemu.devel@gmail.com>)
 id 1jVE4R-0002Fi-Oy; Sun, 03 May 2020 08:50:13 -0400
Received: by mail-wm1-x343.google.com with SMTP id h4so5257755wmb.4;
 Sun, 03 May 2020 05:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=36WPum1UXgV5QvAwhgGkNVs4SP6Rc3/jhhvLiqsaenI=;
 b=eWyWxhuoDkllkh76W23ZE/IKIE4v7hvHR/VWv/kjItb8Qj1FQOjjMWBLauLEH0eYQt
 uwHFHl6JEBKUvxE8hobP2Eq1Wb/M7xaBi8AYDyENd2o1/g8S61pYwlDwZcuuFFed4t1F
 BE+qcXqQ225L2GtCPtAWZOUlIstMP7A4eoTfjaunRj+ZxG4MwmJX/Z0pM0aKZ5jDhoiX
 jgZVp1KJby5EplRWrxkJGWD/9AE5dXGTMURByWOGuiUgVMdzQkQpEdDKJAzRx7keF4bs
 i0Vyx/sqvz+vqRiDm9KjnDS6p6CdJh7esBXUSJ7GBCTCynjIly7W6HmMK57TPGWYtJxf
 XOzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=36WPum1UXgV5QvAwhgGkNVs4SP6Rc3/jhhvLiqsaenI=;
 b=N6aVVNQegajgzUkoBVi7DZJUjHw2vaRlz8mPVUePp5GP9LjX9zzyu9VqJb9/gZacqG
 JDkctSoY8vrJP9J8jTNld4qY4FLmLYgjFwUdJfUo4o7AcqXz2D7M1qMGzDP5qUo5oz87
 HSGzh/sCAzqU8EgHR4ZRb8Xgc6LlBxfamqTre8og2IehUus0UcbHa79W+b2UkmEVJXpk
 u9svT98lEtYv1N4IeO+MExFsx4DAhVWG4eY8JxBKXzzv01esrAnrUUeY0gp2IvG593l3
 1e8NEgVIqzG7i0v1GlZ73+hWUQXXfWV0MsK2xV730JTU89VLrdc/3R3g0ARKzkWe+/lH
 ZL/Q==
X-Gm-Message-State: AGi0PuaOgsOlpbM6vvhUBfLnfNv9ok9vpGWLEu/TRx22bssq5X2DpDrO
 zPq4kB2kDRXQ7Bq/Mi7eRyg+e0k7G15RPt6VafE=
X-Google-Smtp-Source: APiQypISmUC00SY+g2c87pNIyvdRJ0F+q2g3lBX+lklwwbAN1+OqAInuZiwVcdfIjwdxPrZN10LjpXjZ0KkoWjXq0Z4=
X-Received: by 2002:a7b:c74d:: with SMTP id w13mr9018181wmk.36.1588510209896; 
 Sun, 03 May 2020 05:50:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200503113220.30808-1-f4bug@amsat.org>
 <20200503113220.30808-3-f4bug@amsat.org>
In-Reply-To: <20200503113220.30808-3-f4bug@amsat.org>
From: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Date: Sun, 3 May 2020 14:49:57 +0200
Message-ID: <CAHiYmc61KAjFHuYCMyRunkfMdf4DD83TFTo4DJF-58KZ5YQ+Jg@mail.gmail.com>
Subject: Re: [RFC PATCH 2/2] linux-user/mmap: Fix Clang 'type-limit-compare'
 warning
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-trivial@nongnu.org, 
 Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>, 
 Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=aleksandar.qemu.devel@gmail.com; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 03 May 2020 12:50:14 -0000

=D0=BD=D0=B5=D0=B4, 3. =D0=BC=D0=B0=D1=98 2020. =D1=83 13:33 Philippe Mathi=
eu-Daud=C3=A9 <f4bug@amsat.org> =D1=98=D0=B5
=D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BE/=D0=BB=D0=B0:
>
> When building with Clang 10 on Fedora 32, we get:
>
>     CC      linux-user/mmap.o
>   linux-user/mmap.c:720:49: error: result of comparison 'unsigned long' >=
 18446744073709551615 is always false [-Werror,-Wtautological-type-limit-co=
mpare]
>           if ((unsigned long)host_addr + new_size > (abi_ulong)-1) {
>               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~
>
> Fix by restricting the check for when target sizeof(abi_ulong) is
> smaller than target sizeof(unsigned long).
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  linux-user/mmap.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/linux-user/mmap.c b/linux-user/mmap.c
> index e378033797..b14652d894 100644
> --- a/linux-user/mmap.c
> +++ b/linux-user/mmap.c
> @@ -714,6 +714,7 @@ abi_long target_mremap(abi_ulong old_addr, abi_ulong =
old_size,
>              errno =3D ENOMEM;
>              host_addr =3D MAP_FAILED;
>          }
> +#if TARGET_ABI_BITS < TARGET_LONG_BITS
>          /* Check if address fits target address space */
>          if ((unsigned long)host_addr + new_size > (abi_ulong)-1) {
>              /* Revert mremap() changes */
> @@ -721,6 +722,7 @@ abi_long target_mremap(abi_ulong old_addr, abi_ulong =
old_size,
>              errno =3D ENOMEM;
>              host_addr =3D MAP_FAILED;
>          }
> +#endif /* TARGET_ABI_BITS < TARGET_LONG_BITS */

Hm, Philippe, this will silence the clang error, but is this the right
thing to do?

Why do you think the case:

TARGET_ABI_BITS < TARGET_LONG_BITS

doesn't need this check? In any case, for clarity, the reason should
be mentioned in the commit message.

Regards,
Aleksandar


>      }
>
>      if (host_addr =3D=3D MAP_FAILED) {
> --
> 2.21.3
>
>

