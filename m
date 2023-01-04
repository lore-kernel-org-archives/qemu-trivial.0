Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pD560-00027f-68
	for mharc-qemu-trivial@gnu.org; Wed, 04 Jan 2023 09:50:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <casantos@redhat.com>)
 id 1pD55n-0001yP-8R
 for qemu-trivial@nongnu.org; Wed, 04 Jan 2023 09:50:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <casantos@redhat.com>)
 id 1pD55l-0005ag-Dr
 for qemu-trivial@nongnu.org; Wed, 04 Jan 2023 09:50:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672843807;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wl5J0kvuLH8aBUCriSM5kEzfMBD+WGe38HAuKXgNWGE=;
 b=E/2PR87N3YhSwPub2bUrYrjk2wX+PiILJ23iVBRvRhEQcTStJRpQqici2HA0OScb9TNvHa
 eJMduF+v8JNnehGji2BI1CNMVAd7ddFjTBC/o7CAJtAWWz2/DaNTvS4oG8g4Sy1GNYb1Bp
 fuXbvyTA6fAspMvlnEqNrZ1rTFmcPjs=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-271-vIkb68yLMuKaQq-6HGZyfg-1; Wed, 04 Jan 2023 09:50:06 -0500
X-MC-Unique: vIkb68yLMuKaQq-6HGZyfg-1
Received: by mail-ot1-f70.google.com with SMTP id
 x26-20020a9d6d9a000000b00672c2f06716so18070798otp.21
 for <qemu-trivial@nongnu.org>; Wed, 04 Jan 2023 06:50:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wl5J0kvuLH8aBUCriSM5kEzfMBD+WGe38HAuKXgNWGE=;
 b=JWKDqw4mqS6YDNDvygcDUua2EASwR3J3urAnZHqoXDpdueEgYjU/GEiXG2+psn4kpN
 yz8CzhuyWdnEe6o5p4Ezk1CE2ylZuJpBYbGyJ8VYdp2ZYEKUjfoKjAbpDzGkNxvLFAmb
 kSFjESQQSJDmeUQ0dGJ2eMVWswY1ghp9AkbDR4nbZWfFq7kYeWpq7570mDPWqqs9aFco
 iItvu0K1wYf+Cgy0CKTOfOTHVcml75swgLavDwoOLAsOt3fn8deVfalFQmdajN6emryk
 x34hPxPfmyJN0BwU++t9X/k0CzBbOy+3QO9GH7gACDv95WDSi9MMwpiYFUx+5l7F800I
 fnnw==
X-Gm-Message-State: AFqh2kryLzv26jJgAwP3tirExWayRyVrUc1ZZarwh/u/fhGuLAkHrDDK
 u3vgSf80b5w9MQh4B9uzB1z02KJcm+0t1tYF1nDc2P0hdJzntrQxuJjfar8ucGJjO29CwTfkUoK
 0CTnKBIMc7wvhpg5KmxwsGs64gUBV8ZeYAg==
X-Received: by 2002:a05:6830:103:b0:678:2666:2441 with SMTP id
 i3-20020a056830010300b0067826662441mr3196520otp.94.1672843805428; 
 Wed, 04 Jan 2023 06:50:05 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvBXze/utDGH3+DaXrDomMHqHl33lF8zql3U9aPxspUKGtZyVgn7Jr7J9B8EfuJ5Vj7d2sjU+mjnjmv5eEx+HY=
X-Received: by 2002:a05:6830:103:b0:678:2666:2441 with SMTP id
 i3-20020a056830010300b0067826662441mr3196518otp.94.1672843805147; Wed, 04 Jan
 2023 06:50:05 -0800 (PST)
MIME-Version: 1.0
References: <20230102161903.3857354-1-casantos@redhat.com>
In-Reply-To: <20230102161903.3857354-1-casantos@redhat.com>
From: Carlos Santos <casantos@redhat.com>
Date: Wed, 4 Jan 2023 11:49:50 -0300
Message-ID: <CAC1VKkOzUsh-EZfwSRbGRC13auykBL5jmszpStw=GHcgx9G6Vw@mail.gmail.com>
Subject: Re: [PATCH] meson: allow disablind the installation of keymaps
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=casantos@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
X-List-Received-Date: Wed, 04 Jan 2023 14:50:13 -0000

On Mon, Jan 2, 2023 at 1:19 PM <casantos@redhat.com> wrote:
>
> From: Carlos Santos <casantos@redhat.com>
>
> There are situatuions in which the keyboard maps are not necessary (e.g.
> when building only tools or linux-user emulator). Add an option to avoid
> installing them, as already possible to do with firmware blobs.
>
> Signed-off-by: Carlos Santos <casantos@redhat.com>
> ---
>  configure                     | 2 ++
>  meson_options.txt             | 2 ++
>  pc-bios/keymaps/meson.build   | 6 ++++--
>  scripts/meson-buildoptions.sh | 4 ++++
>  4 files changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/configure b/configure
> index 789a4f6cc9..c6ed6a23d0 100755
> --- a/configure
> +++ b/configure
> @@ -889,6 +889,8 @@ for opt do
>    ;;
>    --disable-blobs) meson_option_parse --disable-install-blobs ""
>    ;;
> +  --disable-keymaps) meson_option_parse --disable-install-keymaps ""
> +  ;;
>    --enable-vfio-user-server) vfio_user_server="enabled"
>    ;;
>    --disable-vfio-user-server) vfio_user_server="disabled"
> diff --git a/meson_options.txt b/meson_options.txt
> index 559a571b6b..be27137e98 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -48,6 +48,8 @@ option('module_upgrades', type : 'boolean', value : false,
>         description: 'try to load modules from alternate paths for upgrades')
>  option('install_blobs', type : 'boolean', value : true,
>         description: 'install provided firmware blobs')
> +option('install_keymaps', type : 'boolean', value : true,
> +       description: 'install provided keyboard maps')
>  option('sparse', type : 'feature', value : 'auto',
>         description: 'sparse checker')
>  option('guest_agent', type : 'feature', value : 'auto',
> diff --git a/pc-bios/keymaps/meson.build b/pc-bios/keymaps/meson.build
> index 06c75e646b..7d80c23005 100644
> --- a/pc-bios/keymaps/meson.build
> +++ b/pc-bios/keymaps/meson.build
> @@ -47,7 +47,7 @@ if native_qemu_keymap.found()
>                         build_by_default: true,
>                         output: km,
>                         command: [native_qemu_keymap, '-f', '@OUTPUT@', args.split()],
> -                       install: true,
> +                       install: get_option('install_keymaps'),
>                         install_dir: qemu_datadir / 'keymaps')
>    endforeach
>
> @@ -56,4 +56,6 @@ else
>    install_data(keymaps.keys(), install_dir: qemu_datadir / 'keymaps')
>  endif
>
> -install_data(['sl', 'sv'], install_dir: qemu_datadir / 'keymaps')
> +if get_option('install_keymaps')
> +  install_data(['sl', 'sv'], install_dir: qemu_datadir / 'keymaps')
> +endif
> diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
> index aa6e30ea91..f17d9c196e 100644
> --- a/scripts/meson-buildoptions.sh
> +++ b/scripts/meson-buildoptions.sh
> @@ -11,6 +11,8 @@ meson_options_help() {
>    printf "%s\n" '  --datadir=VALUE          Data file directory [share]'
>    printf "%s\n" '  --disable-coroutine-pool coroutine freelist (better performance)'
>    printf "%s\n" '  --disable-install-blobs  install provided firmware blobs'
> +  printf "%s\n" '  --disable-install-keymaps'
> +  printf "%s\n" '                           install provided keyboard maps'
>    printf "%s\n" '  --docdir=VALUE           Base directory for documentation installation'
>    printf "%s\n" '                           (can be empty) [share/doc]'
>    printf "%s\n" '  --enable-block-drv-whitelist-in-tools'
> @@ -291,6 +293,8 @@ _meson_option_parse() {
>      --includedir=*) quote_sh "-Dincludedir=$2" ;;
>      --enable-install-blobs) printf "%s" -Dinstall_blobs=true ;;
>      --disable-install-blobs) printf "%s" -Dinstall_blobs=false ;;
> +    --enable-install-keymaps) printf "%s" -Dinstall_keymaps=true ;;
> +    --disable-install-keymaps) printf "%s" -Dinstall_keymaps=false ;;
>      --interp-prefix=*) quote_sh "-Dinterp_prefix=$2" ;;
>      --enable-jack) printf "%s" -Djack=enabled ;;
>      --disable-jack) printf "%s" -Djack=disabled ;;
> --
> 2.31.1
>

Thinking a bit more about this patch, I think the correct approach
would be to install blobs and keymaps depending on have_system:

    [...]
    install: have_system,
    [...]

And use the same approach for trace-events-all, in trace/meson.build:

    [...]
    install: have_linux_user or have_bsd_user or have_system,
    [...]

This would prevent installing useless data.

-- 
Carlos Santos
Senior Software Maintenance Engineer
Red Hat
casantos@redhat.com    T: +55-11-3534-6186


