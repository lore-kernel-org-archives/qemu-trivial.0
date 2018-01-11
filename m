Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eZhy9-0002Jt-Tm
	for mharc-qemu-trivial@gnu.org; Thu, 11 Jan 2018 13:52:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59330)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eZhy7-0002H8-JF
	for qemu-trivial@nongnu.org; Thu, 11 Jan 2018 13:52:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eZhy6-0004Ts-ME
	for qemu-trivial@nongnu.org; Thu, 11 Jan 2018 13:52:51 -0500
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:35769)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eZhy6-0004TW-G4
	for qemu-trivial@nongnu.org; Thu, 11 Jan 2018 13:52:50 -0500
Received: by mail-oi0-x243.google.com with SMTP id 184so2315225oii.2
	for <qemu-trivial@nongnu.org>; Thu, 11 Jan 2018 10:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=sBS070JgeXS06mGjbexbQTas/1p4tTN6vdMlqjcFxIg=;
	b=OF951R3tLyE8sc+GqcCLQrnRHX/ydeA3vawzaSWe3LVi892xIRXyVlPWDwonwClpHm
	o+82hFsEYSHw/XAbigr1oefZCEoI1Qu5m+uHXtLzFAlr1aIPazTfZCvVrm9qaLO1AS4L
	U3YJOKmmcRggKgH52pCw9chJIkesYHj4RWAfk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=sBS070JgeXS06mGjbexbQTas/1p4tTN6vdMlqjcFxIg=;
	b=gBxGzII2W0sgF4ULoc5vpccDKuqSQRbvq0gwPIH8npB5MyIDbdigwUH5P5f5WS0nBA
	73zNmOs794/qJqg/MX+y39crlIuZEfUt1ykAqWTIZ4c3F0+SvIu4/G8Aw/aryX8L7hPl
	L3laxNyCMagASlFbVBa0nIIWI7/1lq4C86LY6Qjy7MW959VRqV/P6pLxrUOKt3Zco0Ro
	mN2kuRkVSC1+7myGgff48WWb4X6NGqRyAAyVbgjUKVNxDqVf6qDOZgLB02nJFSh2vP+i
	8Xs7YZfgD9TkXyo2OFfiwGttdYHtn5WOcAxTjIiWNw3rYxBC+kvgSP3ipYd/9r6ZofXg
	KeWQ==
X-Gm-Message-State: AKwxytekgnfrxblvkH59iBClZ8AVioWSYa6hWW0yeaETVLxuun2zeSzO
	rcRetetvck7f2sv91nVE2Ai28RVpqnlkvQUsrrLbEg==
X-Google-Smtp-Source: ACJfBovP8jdEohR0GFRwHEU1TZ2DB4EkN1BXkd2emoX7MTTQun3vPEVuqTuVFsEjNSccgScVk4jm/u6onporCAnFNb0=
X-Received: by 10.202.244.131 with SMTP id s125mr5135501oih.327.1515696769729; 
	Thu, 11 Jan 2018 10:52:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.15.71 with HTTP; Thu, 11 Jan 2018 10:52:29 -0800 (PST)
In-Reply-To: <20180111183714.22834-2-malbarbo@gmail.com>
References: <20180111183714.22834-2-malbarbo@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Jan 2018 18:52:29 +0000
Message-ID: <CAFEAcA9Qo8uQ10FHP7XfuC+sgb4i8e_fxo7EvZGtVVWddqpxVA@mail.gmail.com>
To: Marco A L Barbosa <malbarbo@gmail.com>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>, 
	Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <Laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] linux-user: Add
 AT_SECURE auxval
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Jan 2018 18:52:53 -0000

On 11 January 2018 at 18:37, Marco A L Barbosa <malbarbo@gmail.com> wrote:
> ---
>  linux-user/elfload.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

This is missing your Signed-off-by: line, which we need to be
able to accept the patch.

(I've also cc'd the linux-user maintainers.)

> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> index 20f3d8c2c3..32a47674e6 100644
> --- a/linux-user/elfload.c
> +++ b/linux-user/elfload.c
> @@ -1354,7 +1354,7 @@ struct exec
>                                   ~(abi_ulong)(TARGET_ELF_EXEC_PAGESIZE-1))
>  #define TARGET_ELF_PAGEOFFSET(_v) ((_v) & (TARGET_ELF_EXEC_PAGESIZE-1))
>
> -#define DLINFO_ITEMS 14
> +#define DLINFO_ITEMS 15
>
>  static inline void memcpy_fromfs(void * to, const void * from, unsigned long n)
>  {
> @@ -1786,6 +1786,7 @@ static abi_ulong create_elf_tables(abi_ulong p, int argc, int envc,
>      NEW_AUX_ENT(AT_HWCAP, (abi_ulong) ELF_HWCAP);
>      NEW_AUX_ENT(AT_CLKTCK, (abi_ulong) sysconf(_SC_CLK_TCK));
>      NEW_AUX_ENT(AT_RANDOM, (abi_ulong) u_rand_bytes);
> +    NEW_AUX_ENT(AT_SECURE, (abi_ulong) qemu_getauxval(AT_SECURE));
>
>  #ifdef ELF_HWCAP2
>      NEW_AUX_ENT(AT_HWCAP2, (abi_ulong) ELF_HWCAP2);
> --

For the content, Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

