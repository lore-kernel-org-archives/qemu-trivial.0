Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sCJka-0000w6-Df
	for mharc-qemu-trivial@gnu.org; Wed, 29 May 2024 09:53:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sCJkY-0000vV-SD
 for qemu-trivial@nongnu.org; Wed, 29 May 2024 09:53:54 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sCJkW-0003Kd-B7
 for qemu-trivial@nongnu.org; Wed, 29 May 2024 09:53:54 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-57a1059dc4fso532402a12.0
 for <qemu-trivial@nongnu.org>; Wed, 29 May 2024 06:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716990831; x=1717595631; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T6rxSYbOuRPYsLDE6IcK50CGkiJo2ipEvMUNZXh/dz4=;
 b=LPhsjdvZWFcNvqmeL9tiQbVJ2gkyklIhYn4Q5LrAolBk/gFqGeWAiDyDqw6lE52Ix/
 yJDx+xTQn9OlDbf22Gas9DQPj9WzGQmOYjLFzNcom0RiflW3/Yy5XujiO70A5krFE2Ah
 S1pwk1x8+kLDeUvgKF9LaC8f2GwGW4jCl7kOKByhcaUI3mbIDJURQtBlqf6O68YbxLKD
 CnFR8wbHO7Yox5vWbaWCxjpG/3NoaufeK/1CsVtKmrP2zX3wNT9vrpG4ifiT0dX69Wtc
 jHG/NqgEx2MH1yJ3UtaMsHTo5UA00PweCUWVRuBKWMCn6ec49xQLHD8r5LflnA+5AYRa
 HU/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716990831; x=1717595631;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T6rxSYbOuRPYsLDE6IcK50CGkiJo2ipEvMUNZXh/dz4=;
 b=aS8ayyr/lSKXRIg5nNsU2+xpuNm4u6iIQcZK9GDde4C4AYAOOSuAQh/0lfNgI7EiP0
 ZHpEcSa44DeGqLF40IEzatf6Ano++W758BdX0uA9XZIG46fAOgEFbuMrl0AsyzNs3KLP
 betoUahqo4K0UW6F23ZOxD4P0/GUme0zBjPJ/L6IaE+2JW5tGcyiMAEGSB8HkKVVlFxO
 R48uOxt7tm14AOzRDgUZvY4cDIVNdWh8ddub+796x381pTpB5P2F39qbAWwiuJ8Jr7E9
 QOzwLu5sB+FEO4WUsKrcizcPIb4Nh6OQB8szot8BwO6+KS4nR+Zh29MqaA5DNdlRcMYw
 ZeRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnDk+YxY6a7KofZkmRArNj1S7sdy02OuYDTMiZIrSWd5T/eZ0fzAOxdF2n63HTOQadVcBtyXgQzSbGqC0827R8eePdrj55Uw==
X-Gm-Message-State: AOJu0YyhrAiSDCO9pi2B+jYR6gTANa6UiA9RJ7OImxuXqTPjsGov7uR0
 IFlhDVKgdTaxPvkhfwPS8njWAYBmtDlflv0ZwdG+dIYJ7zAtzty7EmRhKNkxDPywxJKjRefC3tI
 c6BC2qd1OvdV3b4rnaaBtR1pcmBLGI9ztnPtj1csCeWO6lWJ8Ca4=
X-Google-Smtp-Source: AGHT+IELuPxbzO0NfU0o1tOKNLw0BDamd8UNpohwneH/0t6JciS2bWzEgKO0yLlLFJkCnz1FxEg63yWyF03ZxTmLVpU=
X-Received: by 2002:a50:cccb:0:b0:572:6249:96bc with SMTP id
 4fb4d7f45d1cf-578519bdc7amr10368855a12.32.1716990830773; Wed, 29 May 2024
 06:53:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240529133106.1224866-1-thuth@redhat.com>
In-Reply-To: <20240529133106.1224866-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 29 May 2024 14:53:37 +0100
Message-ID: <CAFEAcA8yOgGS8VdFRmJJKaUZe9Q=jDDh7itK6Q7vUH4TtEbFnw@mail.gmail.com>
Subject: Re: [PATCH] io/channel-socket: Fix -fsanitize=undefined problem with
 latest Clang
To: Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 qemu-devel@nongnu.org, qemu-trivial@nongnu.org, 
 Akihiko Odaki <akihiko.odaki@daynix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 29 May 2024 13:53:55 -0000

On Wed, 29 May 2024 at 14:32, Thomas Huth <thuth@redhat.com> wrote:
>
> Casting function pointers from one type to another causes undefined
> behavior errors when compiling with -fsanitize=3Dundefined with Clang v18=
:
>
>  $ QTEST_QEMU_BINARY=3D./qemu-system-mips64 tests/qtest/netdev-socket
>  TAP version 13
>  # random seed: R02S4424f4f460de783fdd3d72c5571d3adc
>  1..10
>  # Start of mips64 tests
>  # Start of netdev tests
>  # Start of stream tests
>  # starting QEMU: exec ./qemu-system-mips64 -qtest unix:/tmp/qtest-121319=
6.sock -qtest-log /dev/null -chardev socket,path=3D/tmp/qtest-1213196.qmp,i=
d=3Dchar0 -mon chardev=3Dchar0,mode=3Dcontrol -display none -audio none -no=
defaults -M none -netdev stream,id=3Dst0,addr.type=3Dfd,addr.str=3D3 -accel=
 qtest
>  ../io/task.c:78:13: runtime error: call to function qapi_free_SocketAddr=
ess through pointer to incorrect function type 'void (*)(void *)'
>  /tmp/qemu-sanitize/qapi/qapi-types-sockets.c:170: note: qapi_free_Socket=
Address defined here
>  SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior ../io/task.c:78:=
13

It's a pity the sanitizer error doesn't tell you the actual
function type as well as the incorrect one it got cast to
(especially since in this case the function and its declaration
are both in generated code in the build tree not conveniently
findable with 'git grep'.)

In this case the function being called is:
 void qapi_free_SocketAddress(SocketAddress *obj)
and it's cast to a GDestroyNotify, which is
 typedef void            (*GDestroyNotify)       (gpointer       data);
(and gpointer is void*)

and although you can pass a foo* to a function expecting void*,
you can't treat a pointer to a function taking foo* as if it was
a pointer to a function taking void*, just in case the compiler
needs to do some clever trickery with the pointer value.

So the wrapper function looks like it doesn't do anything,
but it's doing the permitted implicit-cast of the argument.

> Add a wrapper function to avoid the problem.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  io/channel-socket.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/io/channel-socket.c b/io/channel-socket.c
> index 3a899b0608..aa2a1c8586 100644
> --- a/io/channel-socket.c
> +++ b/io/channel-socket.c
> @@ -193,6 +193,10 @@ static void qio_channel_socket_connect_worker(QIOTas=
k *task,
>      qio_task_set_error(task, err);
>  }
>
> +static void qio_qapi_free_SocketAddress(gpointer sa)
> +{
> +    qapi_free_SocketAddress(sa);
> +}
>
>  void qio_channel_socket_connect_async(QIOChannelSocket *ioc,
>                                        SocketAddress *addr,
> @@ -213,7 +217,7 @@ void qio_channel_socket_connect_async(QIOChannelSocke=
t *ioc,
>      qio_task_run_in_thread(task,
>                             qio_channel_socket_connect_worker,
>                             addrCopy,
> -                           (GDestroyNotify)qapi_free_SocketAddress,
> +                           qio_qapi_free_SocketAddress,
>                             context);
>  }

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

