Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pD6wB-0006TN-4H
	for mharc-qemu-trivial@gnu.org; Wed, 04 Jan 2023 11:48:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <casantos@redhat.com>)
 id 1pD6w9-0006Sw-Mg
 for qemu-trivial@nongnu.org; Wed, 04 Jan 2023 11:48:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <casantos@redhat.com>)
 id 1pD6w6-0001yk-EN
 for qemu-trivial@nongnu.org; Wed, 04 Jan 2023 11:48:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672850897;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v1Fk3+3TCIGEv94YACVWImh/c4q2TJs7f2t1FTOZE8M=;
 b=RxLpHaPzMoDP6j7/MiQqU6wEoWBCQZ4/GUhWADggei+91jXBBphXz3o7UaJYFtycKjpTpR
 LZNegdeOwcR7/koD9p8OqDsdrc1q7j3rfoq4GEWqGV3WhZP54IfJ0nyxA7mNNSYlwn+BfJ
 x1nMmBMExFObXpeq1z0QokeitSUDeLY=
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-591-B1YZjO8WOcSTsQvLU--AFw-1; Wed, 04 Jan 2023 11:48:14 -0500
X-MC-Unique: B1YZjO8WOcSTsQvLU--AFw-1
Received: by mail-oa1-f72.google.com with SMTP id
 586e51a60fabf-1515cee658eso544393fac.20
 for <qemu-trivial@nongnu.org>; Wed, 04 Jan 2023 08:48:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v1Fk3+3TCIGEv94YACVWImh/c4q2TJs7f2t1FTOZE8M=;
 b=1RJO3PXXeNsmPt/sF9ULLuDh5chJkdi+X9Xv9mqmdUHwHQ8bZuUqmGzhvpHfFMz6jn
 hNf4A3cSMbb7LXuSjs1+5JfX4Yo3VOB2ZpGSPsS8T8gQl+mIyGg2B6fv1l0d2tXSob8J
 5kZYM7m6NTLTt/Q62+oOuTaRMXfStv1kwH1nHrkW/snGhtwrCk1YOJ551I+ip9SNBoy/
 S1e9cAJDfWtDadQ6Ht/wyJbs8Cys7ouiGK0KJwaD2J3XX+lT3CdWr+IeA3ZejRqjRhPc
 lm2GNLbZFonYXsqH1r8DV9JRA66V6g17Ve1TIMR65h0DDPqLcOh5px+L74VUxuehFooI
 x1TQ==
X-Gm-Message-State: AFqh2kpn/1IIvE8JhTXLf4vrhs8f2y8GOKJT4aOr00amY9T7tfY7Q3Bg
 m72i80Gm/aWfbVV6C9udBgYpn9mjgsBPzjJ6YA4hcnnt5yEZQIohQQNwkkG3CQv9repjHfzljql
 eKlrN/X5C3oNmDfqkX8Iha4bESlIc5cFIoA==
X-Received: by 2002:a05:6870:468d:b0:144:1ba:d778 with SMTP id
 a13-20020a056870468d00b0014401bad778mr3004280oap.170.1672850893463; 
 Wed, 04 Jan 2023 08:48:13 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt00h9Vw1F7xjxJhrEVOeliX8j4n6mEVBPWCnLaFrbVfGxH6M9Bkw81Sjn7AP5DqVLd/Fnpj9BH5xzPZX2+MZY=
X-Received: by 2002:a05:6870:468d:b0:144:1ba:d778 with SMTP id
 a13-20020a056870468d00b0014401bad778mr3004279oap.170.1672850893198; Wed, 04
 Jan 2023 08:48:13 -0800 (PST)
MIME-Version: 1.0
References: <20230102161903.3857354-1-casantos@redhat.com>
 <CAC1VKkOzUsh-EZfwSRbGRC13auykBL5jmszpStw=GHcgx9G6Vw@mail.gmail.com>
 <4c891001-4744-c174-7459-d13903037990@linaro.org>
In-Reply-To: <4c891001-4744-c174-7459-d13903037990@linaro.org>
From: Carlos Santos <casantos@redhat.com>
Date: Wed, 4 Jan 2023 13:48:02 -0300
Message-ID: <CAC1VKkO6XWNOFHPM+tFHu-3caAzjYp2kxhPLNp7q1e43SRXoLQ@mail.gmail.com>
Subject: Re: [PATCH] meson: allow disablind the installation of keymaps
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=casantos@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 04 Jan 2023 16:48:22 -0000

On Wed, Jan 4, 2023 at 12:15 PM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> On 4/1/23 15:49, Carlos Santos wrote:
> > On Mon, Jan 2, 2023 at 1:19 PM <casantos@redhat.com> wrote:
> >>
> >> From: Carlos Santos <casantos@redhat.com>
> >>
> >> There are situatuions in which the keyboard maps are not necessary (e.=
g.
> >> when building only tools or linux-user emulator). Add an option to avo=
id
> >> installing them, as already possible to do with firmware blobs.
> >>
> >> Signed-off-by: Carlos Santos <casantos@redhat.com>
> >> ---
> >>   configure                     | 2 ++
> >>   meson_options.txt             | 2 ++
> >>   pc-bios/keymaps/meson.build   | 6 ++++--
> >>   scripts/meson-buildoptions.sh | 4 ++++
> >>   4 files changed, 12 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/configure b/configure
> >> index 789a4f6cc9..c6ed6a23d0 100755
> >> --- a/configure
> >> +++ b/configure
> >> @@ -889,6 +889,8 @@ for opt do
> >>     ;;
> >>     --disable-blobs) meson_option_parse --disable-install-blobs ""
> >>     ;;
> >> +  --disable-keymaps) meson_option_parse --disable-install-keymaps ""
> >> +  ;;
> >>     --enable-vfio-user-server) vfio_user_server=3D"enabled"
> >>     ;;
> >>     --disable-vfio-user-server) vfio_user_server=3D"disabled"
> >> diff --git a/meson_options.txt b/meson_options.txt
> >> index 559a571b6b..be27137e98 100644
> >> --- a/meson_options.txt
> >> +++ b/meson_options.txt
> >> @@ -48,6 +48,8 @@ option('module_upgrades', type : 'boolean', value : =
false,
> >>          description: 'try to load modules from alternate paths for up=
grades')
> >>   option('install_blobs', type : 'boolean', value : true,
> >>          description: 'install provided firmware blobs')
> >> +option('install_keymaps', type : 'boolean', value : true,
> >> +       description: 'install provided keyboard maps')
> >>   option('sparse', type : 'feature', value : 'auto',
> >>          description: 'sparse checker')
> >>   option('guest_agent', type : 'feature', value : 'auto',
> >> diff --git a/pc-bios/keymaps/meson.build b/pc-bios/keymaps/meson.build
> >> index 06c75e646b..7d80c23005 100644
> >> --- a/pc-bios/keymaps/meson.build
> >> +++ b/pc-bios/keymaps/meson.build
> >> @@ -47,7 +47,7 @@ if native_qemu_keymap.found()
> >>                          build_by_default: true,
> >>                          output: km,
> >>                          command: [native_qemu_keymap, '-f', '@OUTPUT@=
', args.split()],
> >> -                       install: true,
> >> +                       install: get_option('install_keymaps'),
> >>                          install_dir: qemu_datadir / 'keymaps')
> >>     endforeach
> >>
> >> @@ -56,4 +56,6 @@ else
> >>     install_data(keymaps.keys(), install_dir: qemu_datadir / 'keymaps'=
)
> >>   endif
> >>
> >> -install_data(['sl', 'sv'], install_dir: qemu_datadir / 'keymaps')
> >> +if get_option('install_keymaps')
> >> +  install_data(['sl', 'sv'], install_dir: qemu_datadir / 'keymaps')
> >> +endif
> >> diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoption=
s.sh
> >> index aa6e30ea91..f17d9c196e 100644
> >> --- a/scripts/meson-buildoptions.sh
> >> +++ b/scripts/meson-buildoptions.sh
> >> @@ -11,6 +11,8 @@ meson_options_help() {
> >>     printf "%s\n" '  --datadir=3DVALUE          Data file directory [s=
hare]'
> >>     printf "%s\n" '  --disable-coroutine-pool coroutine freelist (bett=
er performance)'
> >>     printf "%s\n" '  --disable-install-blobs  install provided firmwar=
e blobs'
> >> +  printf "%s\n" '  --disable-install-keymaps'
> >> +  printf "%s\n" '                           install provided keyboard=
 maps'
> >>     printf "%s\n" '  --docdir=3DVALUE           Base directory for doc=
umentation installation'
> >>     printf "%s\n" '                           (can be empty) [share/do=
c]'
> >>     printf "%s\n" '  --enable-block-drv-whitelist-in-tools'
> >> @@ -291,6 +293,8 @@ _meson_option_parse() {
> >>       --includedir=3D*) quote_sh "-Dincludedir=3D$2" ;;
> >>       --enable-install-blobs) printf "%s" -Dinstall_blobs=3Dtrue ;;
> >>       --disable-install-blobs) printf "%s" -Dinstall_blobs=3Dfalse ;;
> >> +    --enable-install-keymaps) printf "%s" -Dinstall_keymaps=3Dtrue ;;
> >> +    --disable-install-keymaps) printf "%s" -Dinstall_keymaps=3Dfalse =
;;
> >>       --interp-prefix=3D*) quote_sh "-Dinterp_prefix=3D$2" ;;
> >>       --enable-jack) printf "%s" -Djack=3Denabled ;;
> >>       --disable-jack) printf "%s" -Djack=3Ddisabled ;;
> >> --
> >> 2.31.1
> >>
> >
> > Thinking a bit more about this patch, I think the correct approach
> > would be to install blobs and keymaps depending on have_system:
> >
> >      [...]
> >      install: have_system,
> >      [...]
> >
> > And use the same approach for trace-events-all, in trace/meson.build:
> >
> >      [...]
> >      install: have_linux_user or have_bsd_user or have_system,
> >      [...]
> >
> > This would prevent installing useless data.
>
> Yes, similar to:
> https://lore.kernel.org/qemu-devel/20210323155132.238193-1-f4bug@amsat.or=
g/
>

Apparently it was reviewed and ack-ed but never applied. :-(

--=20
Carlos Santos
Senior Software Maintenance Engineer
Red Hat
casantos@redhat.com    T: +55-11-3534-6186


