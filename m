Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oq7PG-0000bo-Dn
	for mharc-qemu-trivial@gnu.org; Wed, 02 Nov 2022 02:39:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oq7PF-0000bP-0k
 for qemu-trivial@nongnu.org; Wed, 02 Nov 2022 02:39:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oq7PD-0004nM-84
 for qemu-trivial@nongnu.org; Wed, 02 Nov 2022 02:39:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667371158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ce2t+0yYV3pcjAcrsWEpXa6Y2hhhM9N2LHwkoHtyzwo=;
 b=eiGMne0YUDuWaOo2DQ5OQ6tt0A/j4UpVe/J1NvRc7fQPPHB+EK8QqWou42qjBZlS4srKG9
 0PMcz4tOWKxiO1bQbUboCvOM5UTVJS3BiIuE1ngSn+/WjNlOXo74SnSfynwbyQG0EBD9lM
 FpWZmmklWQOLvPeWbvgW5x61KePECeE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-396-Pd3NA7yVNEuYkcMWRsAIyA-1; Wed, 02 Nov 2022 02:39:16 -0400
X-MC-Unique: Pd3NA7yVNEuYkcMWRsAIyA-1
Received: by mail-wr1-f71.google.com with SMTP id
 j20-20020adfb314000000b002366d9f67aaso4476092wrd.3
 for <qemu-trivial@nongnu.org>; Tue, 01 Nov 2022 23:39:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ce2t+0yYV3pcjAcrsWEpXa6Y2hhhM9N2LHwkoHtyzwo=;
 b=DNTikVI6KBFD+XZwYwMbh+d0/nJp1fUa7kCeaF8hVf3RXj8XPRdNQAFOGtjPD9FECT
 ZnAXXWlOAWECsOWkyr1wv4vdET5cswIXASXVihFFs1jYadCB7SLqIgzhYG4OdJ6JTqwq
 nA+s7lvvxejnSXgeZ5Eld3CLMDt5NMv9PCl+C4tZlGgMYcOPdXTq9f1vxaPIuUSAiBrt
 aHhEvlhtI9NUiyAqIffFxP2D1FsdaGYJbK3IrKHhK7eueIJD/bmZ8Qj39DuNzN5HcacT
 c+/3SxLqW7PaaB+qohgYVewPSpIV0vhMTsmQG6Vz5FPbBQMp4sbzPIdtcbJTr1jsBCRG
 Ldfw==
X-Gm-Message-State: ACrzQf3L0D1IjxgJkg65gPLyFA+RRvFf2IFzYp58F1d3mpfKfCMhgNW8
 nGinEARFM5St3JP8/9GdnrtzYo4IKSGcN9aMgJK4isqMukLQo77j+/GpPAb4Y7lOqzJq4guZ9oy
 xYGKoRFelY4RukV6kGA==
X-Received: by 2002:a05:6000:1566:b0:236:6a6f:6c27 with SMTP id
 6-20020a056000156600b002366a6f6c27mr13968507wrz.553.1667371155597; 
 Tue, 01 Nov 2022 23:39:15 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5KwFA+UC/wG9Ng91+0qOS96GYbjY3rmWcKk48fNECDZ11+N9qLzwp97gD5qdzwWkcVG7aWfw==
X-Received: by 2002:a05:6000:1566:b0:236:6a6f:6c27 with SMTP id
 6-20020a056000156600b002366a6f6c27mr13968498wrz.553.1667371155366; 
 Tue, 01 Nov 2022 23:39:15 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 t9-20020a05600c198900b003c701c12a17sm996528wmq.12.2022.11.01.23.39.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Nov 2022 23:39:14 -0700 (PDT)
Date: Wed, 2 Nov 2022 02:39:11 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-trivial@nongnu.org
Subject: Re: [PATCH] tests/unit/test-io-channel-command: Silence GCC error
 "maybe-uninitialized"
Message-ID: <20221102023826-mutt-send-email-mst@kernel.org>
References: <20221101213937.21149-1-shentey@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20221101213937.21149-1-shentey@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.051,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 02 Nov 2022 06:39:21 -0000

On Tue, Nov 01, 2022 at 10:39:36PM +0100, Bernhard Beschow wrote:
> GCC issues a false positive warning, resulting in build failure with -Werror:
> 
>   In file included from /usr/lib/glib-2.0/include/glibconfig.h:9,
>                    from /usr/include/glib-2.0/glib/gtypes.h:34,
>                    from /usr/include/glib-2.0/glib/galloca.h:34,
>                    from /usr/include/glib-2.0/glib.h:32,
>                    from ../src/include/glib-compat.h:32,
>                    from ../src/include/qemu/osdep.h:144,
>                    from ../src/tests/unit/test-io-channel-command.c:21:
>   /usr/include/glib-2.0/glib/gmacros.h: In function ‘test_io_channel_command_fifo’:
>   /usr/include/glib-2.0/glib/gmacros.h:1333:105: error: ‘dstargv’ may be used uninitialized [-Werror=maybe-uninitialized]
>    1333 |   static G_GNUC_UNUSED inline void _GLIB_AUTO_FUNC_NAME(TypeName) (TypeName *_ptr) { if (*_ptr != none) (func) (*_ptr); }     \
>         |                                                                                                         ^
>   ../src/tests/unit/test-io-channel-command.c:39:19: note: ‘dstargv’ was declared here
>      39 |     g_auto(GStrv) dstargv;
>         |                   ^~~~~~~
>   /usr/include/glib-2.0/glib/gmacros.h:1333:105: error: ‘srcargv’ may be used uninitialized [-Werror=maybe-uninitialized]
>    1333 |   static G_GNUC_UNUSED inline void _GLIB_AUTO_FUNC_NAME(TypeName) (TypeName *_ptr) { if (*_ptr != none) (func) (*_ptr); }     \
>         |                                                                                                         ^
>   ../src/tests/unit/test-io-channel-command.c:38:19: note: ‘srcargv’ was declared here
>      38 |     g_auto(GStrv) srcargv;
>         |                   ^~~~~~~
>   cc1: all warnings being treated as errors
> 
> GCC version:
> 
>   $ gcc --version
>   gcc (GCC) 12.2.0
> 
> Fixes: 68406d10859385c88da73d0106254a7f47e6652e ('tests/unit: cleanups for test-io-channel-command')
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>

It's a game of whac-a-mole for sure but what are you gonnu do.

Acked-by: Michael S. Tsirkin <mst@redhat.com>

> ---
>  tests/unit/test-io-channel-command.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/unit/test-io-channel-command.c b/tests/unit/test-io-channel-command.c
> index 43e29c8cfb..ba0717d3c3 100644
> --- a/tests/unit/test-io-channel-command.c
> +++ b/tests/unit/test-io-channel-command.c
> @@ -35,8 +35,8 @@ static void test_io_channel_command_fifo(bool async)
>      g_autofree gchar *fifo = g_strdup_printf("%s/%s", tmpdir, TEST_FIFO);
>      g_autoptr(GString) srcargs = g_string_new(socat);
>      g_autoptr(GString) dstargs = g_string_new(socat);
> -    g_auto(GStrv) srcargv;
> -    g_auto(GStrv) dstargv;
> +    g_auto(GStrv) srcargv = NULL;
> +    g_auto(GStrv) dstargv = NULL;
>      QIOChannel *src, *dst;
>      QIOChannelTest *test;
>  
> -- 
> 2.38.1


