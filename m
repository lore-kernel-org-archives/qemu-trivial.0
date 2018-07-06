Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fbTKl-000391-Mv
	for mharc-qemu-trivial@gnu.org; Fri, 06 Jul 2018 12:11:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37270)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fbTKj-00037Z-HT
	for qemu-trivial@nongnu.org; Fri, 06 Jul 2018 12:11:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fbTKi-000608-Iv
	for qemu-trivial@nongnu.org; Fri, 06 Jul 2018 12:11:45 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:32975)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fbTKi-0005yl-EQ
	for qemu-trivial@nongnu.org; Fri, 06 Jul 2018 12:11:44 -0400
Received: by mail-oi0-x241.google.com with SMTP id c6-v6so24470452oiy.0
	for <qemu-trivial@nongnu.org>; Fri, 06 Jul 2018 09:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=fu7v8u9TbSFUFCiP0gNNmXN4lAE4KGNMVxdSCMqsKsw=;
	b=Cwpb+CozffTe5B5Cw8SjqThZfp33EklhCxKGk/ArC11GADFwvWZUPLoo8rsclxAK0y
	QGAf+JAqfYmP4R9z9QxLGyR/zQNwOKCAP26dzJyR7/Qp4K4UIpZifRUfcTEPlGIu/5M8
	6QF1Au/d8h4Evv12eCKKcX7Nl9cz/Js2IuZSk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=fu7v8u9TbSFUFCiP0gNNmXN4lAE4KGNMVxdSCMqsKsw=;
	b=tX8ZNjSbarzrWS8e0VDj5ZejhQ46bldaYwHmrUcy1v9RdfVWIRCZQXEA+Xz4fuFQAs
	A08FGipOC93XyD658IxrrtCdzBfet5JGNjET2I+SY737XVsjczzavtf/FUGTf+HBJJ6f
	hL3m1RuMoXeg95/GoXnPyFABqDmd/7af0HbvVB4GicYjcPK2wF7VtO313lo2/VSfTg3k
	4ion0lTFgf3/d3sqGZR0uBcpRd9ONpUnxsQd2RY9fGfRMqqlVGuiBivZC0GIMUlitLu6
	6nFnxTQvk8k7zNOQlofkcgwoMi2zl3dd3Rwx7e8e0vUoxEGyu27znVt5g4ANYvjVvJvV
	XU6A==
X-Gm-Message-State: APt69E3IR8J19PWEvy41Cs51biB6ef2ypWucmxh+CTjpz13vcFaXKA14
	J4QTtnZva6X3ac6EibrSNqf6oKVenajBZae1+AvfSbag
X-Google-Smtp-Source: AAOMgpedDBrPSW81PCXjhRNxHs3I6fIAgICu5EP+z3LsZQHXzc5XHvADD+JWSxy7b/hhdZuHYZdzuHqWj2uSJ0dlLw4=
X-Received: by 2002:aca:4a49:: with SMTP id
	x70-v6mr10865960oia.11.1530893503939; 
	Fri, 06 Jul 2018 09:11:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:554d:0:0:0:0:0 with HTTP;
	Fri, 6 Jul 2018 09:11:23 -0700 (PDT)
In-Reply-To: <20180706155127.7483-2-f4bug@amsat.org>
References: <20180706155127.7483-1-f4bug@amsat.org>
	<20180706155127.7483-2-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Jul 2018 17:11:23 +0100
Message-ID: <CAFEAcA8hUPd00KJ=-Njax1UWAGQWVY_NJC1fjq7GjkdgpZPqGA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Laurent Vivier <laurent@vivier.eu>, Riku Voipio <riku.voipio@iki.fi>, 
	QEMU Developers <qemu-devel@nongnu.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-trivial] [PATCH for-3.0 1/3] linux-user: Do not report
 "Unsupported syscall" by default
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
X-List-Received-Date: Fri, 06 Jul 2018 16:11:46 -0000

On 6 July 2018 at 16:51, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrot=
e:
> This can still be reported using the "-d unimp" command line option.
>
> Fixes: https://bugs.launchpad.net/qemu/+bug/1777226
> Reported-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  linux-user/syscall.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 5822e03e28..e4b1b7d7da 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -12757,7 +12757,7 @@ abi_long do_syscall(void *cpu_env, int num, abi_l=
ong arg1,
>
>      default:
>      unimplemented:
> -        gemu_log("qemu: Unsupported syscall: %d\n", num);
> +        qemu_log_mask(LOG_UNIMP, "Unsupported syscall: %d\n", num);
>  #if defined(TARGET_NR_setxattr) || defined(TARGET_NR_get_thread_area) ||=
 defined(TARGET_NR_getdomainname) || defined(TARGET_NR_set_robust_list)
>      unimplemented_nowarn:
>  #endif
> --
> 2.18.0

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

