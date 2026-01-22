Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 308FFC44500
	for <qemu-trivial@archiver.kernel.org>; Thu, 22 Jan 2026 10:12:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1virfl-00069o-SA; Thu, 22 Jan 2026 05:12:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1virfj-00069e-R9
 for qemu-trivial@nongnu.org; Thu, 22 Jan 2026 05:12:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1virfg-0007Wl-Hb
 for qemu-trivial@nongnu.org; Thu, 22 Jan 2026 05:12:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1769076731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RSoYsSxmV6NW/W4JTETo9GWsrA5GKc523TA77g8X2kA=;
 b=WJ5CBINsOTZCkiAb/HgAxRvAN9ykDVXHObgzQVtDYDME9+JPeFPP2HMRTTLmYwO1O25lVu
 psAgmwzN//8o80046YNq4V9I9pqXgVEMCaoSNDoEo6uE8acZJdexGfgEkxUATOekLckSwk
 AFEOzwEGmDaSkjuPgbWZafaZFqcknRE=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-49-21l35F5TNYy4DKcBPia57w-1; Thu, 22 Jan 2026 05:12:09 -0500
X-MC-Unique: 21l35F5TNYy4DKcBPia57w-1
X-Mimecast-MFC-AGG-ID: 21l35F5TNYy4DKcBPia57w_1769076728
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-34c38781efcso911597a91.2
 for <qemu-trivial@nongnu.org>; Thu, 22 Jan 2026 02:12:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769076728; x=1769681528;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=RSoYsSxmV6NW/W4JTETo9GWsrA5GKc523TA77g8X2kA=;
 b=UQbuSyvtljRg2lAnQQ50CcW+4nUO2WjRlKdxDnsN6jjexkzJRDlQRUUhaKpJUQ+wXk
 6x5CYtW4igUgSpNicUDg8YlT7RaOwpmoq7zm9Y2Wnr8XSJpX7izrDnjK6XaN3bLFNzmI
 tjcFNh0X7L+HMVaFEZZ2WAVStLK20FshQp+ZhhegdB072KOrv7UPjoaZPRikkWGnwbVW
 z0OBA4fQZHW5wXL9iyT9hBRBIuGUZ3bbYqyQJUK9d8heKy/zRNkDoUCqBWETwpzx54gQ
 4cJb1LXASBVDv4qt9aKD0rgjvzTuUMbCPh/TrMczSCfxfCatkMxrTq1nq/rY6ttKP8rF
 AWdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSW2LhksqIAkvDuxyfgQS3TsVEzqca6pFawFXo/2CKIsl8srjLE57iPFHk/QK1elUQsPm0KBMU7yJnhEo=@nongnu.org
X-Gm-Message-State: AOJu0YxOuB0Br51jNoWsYJ58B/UESAto4hQ+or79T/Ys7ZAuGzQ9kk2K
 kqiciYD20nrQXZZpk7eGgnB3VA9AaYOAKsLGlVunvezufUyOOm5pUfPCwvJsI+f+UrwWJQAU7iT
 R7FTw6ITwCtd+F4ZqiI5I7Nhtlu7OvHFDZcFOKkP0QRS61OAH2gU1EvGIJXkq7SVuEWO14ECfdr
 sZUcz3UKnU+N6s2DuQbvlUtHfN4Y25ID8S/Q==
X-Gm-Gg: AZuq6aJjoftayOeu53LqWxnQDmcAV9lt1sqvBz4ptc5tl4+V15ymRCvqHmPhpgqon+5
 4gSRv8vLgjWP+KrMOlhxj9EuXyY4y+ZlPIjrgFM0YsIk/ZEkLGmLUsGeh7brzR0FOf+U/e/aNSj
 bDqqe/qrSZfHkXd6AFSKg/ydfVDnyCcbdtt927OR0/pxgHQ11NPe/oSAc2i1PxVgWSyWbOo0X2+
 mfZlzfvZxNYzEM8bixw3FvwOA==
X-Received: by 2002:a17:90a:c2c6:b0:341:8bda:d0ae with SMTP id
 98e67ed59e1d1-35272f97198mr17809982a91.20.1769076727987; 
 Thu, 22 Jan 2026 02:12:07 -0800 (PST)
X-Received: by 2002:a17:90a:c2c6:b0:341:8bda:d0ae with SMTP id
 98e67ed59e1d1-35272f97198mr17809966a91.20.1769076727638; Thu, 22 Jan 2026
 02:12:07 -0800 (PST)
MIME-Version: 1.0
References: <20260122090352.9901-1-thuth@redhat.com>
 <aXHtxBfuIRsJ3P_M@redhat.com>
In-Reply-To: <aXHtxBfuIRsJ3P_M@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Thu, 22 Jan 2026 14:11:56 +0400
X-Gm-Features: AZwV_QgVz5uh-JRUzNeRMk49kFEeyLXxxpBcj5yngyQr5YvkB0bBnZN0oFHFVcU
Message-ID: <CAMxuvaygPAOJiZcRCZ=W+Ly=b8Nq9L1y2sRtraz_+hfiXwLVvQ@mail.gmail.com>
Subject: Re: [PATCH] Replace CONFIG_WIN32 with CONFIG_WIN64
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>, 
 Michael Roth <michael.roth@amd.com>, Kostiantyn Kostiuk <kkostiuk@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EbkBm2jg-BdPWY3-6xSzKLFCBcdKlZJDpm0wGDUvirI_1769076728
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.069,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org
Sender: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org

Hi

On Thu, Jan 22, 2026 at 1:28=E2=80=AFPM Daniel P. Berrang=C3=A9 <berrange@r=
edhat.com> wrote:
>
> On Thu, Jan 22, 2026 at 10:03:52AM +0100, Thomas Huth wrote:
> > From: Thomas Huth <thuth@redhat.com>
> >
> > We stopped supported 32-bit Windows hosts a while ago already, so
> > let's rename CONFIG_WIN32 to CONFIG_WIN64 now to make it clear
> > that this switch is not about 32-bit Windows anymore.
> >
> > The patch has been created with a simple sed statement:
> >
> >  sed -i s/CONFIG_WIN32/CONFIG_WIN64/g $(grep -rl CONFIG_WIN32 *)
> >
> > Signed-off-by: Thomas Huth <thuth@redhat.com>
> > ---
> >  meson.build           |  2 +-
> >  qapi/char.json        |  4 +--
> >  qapi/misc.json        |  2 +-
> >  qga/qapi-schema.json  | 76 +++++++++++++++++++++----------------------
> >  include/qemu/futex.h  |  2 +-
> >  include/qemu/xattr.h  |  2 +-
> >  hw/usb/host-libusb.c  | 18 +++++-----
> >  io/channel-watch.c    | 10 +++---
> >  ui/gtk.c              |  2 +-
> >  util/cacheflush.c     |  4 +--
> >  util/sys_membarrier.c |  2 +-
> >  scripts/checkpatch.pl |  2 +-
> >  12 files changed, 63 insertions(+), 63 deletions(-)
> >
> > diff --git a/meson.build b/meson.build
> > index a84f14258b0..01b9a5c22ce 100644
> > --- a/meson.build
> > +++ b/meson.build
> > @@ -2422,7 +2422,7 @@ config_host_data.set('CONFIG_GCOV', get_option('b=
_coverage'))
> >  config_host_data.set('CONFIG_LIBUDEV', libudev.found())
> >  config_host_data.set('CONFIG_LINUX', host_os =3D=3D 'linux')
> >  config_host_data.set('CONFIG_POSIX', host_os !=3D 'windows')
> > -config_host_data.set('CONFIG_WIN32', host_os =3D=3D 'windows')
> > +config_host_data.set('CONFIG_WIN64', host_os =3D=3D 'windows')
>
> While relevant to qapi file conditions, from a C code pov all of these
> are redundant as the compiler has all these facts built-in
>
>   #ifdef CONFIG_LINUX =3D>    #ifdef __linux__
>   #ifdef CONFIG_POSIX =3D>    #if !defined(_WIN32)
>   #ifdef CONFIG_WIN32 =3D>    #ifdef _WIN32
>
> NB,  _WIN32 *is* set on 64-bit Windows platforms too, so using
> _WIN64 is only needed if you have a code path that is exclusively
> 64-bit only, so there's little need for us to use _WIN64.
>
> And of course we are horribly inconsistent in what we use:
>
> $ git grep -E '#if.*_WIN32' | wc -l
> 284
>
> $ git grep -E '#if.*__linux__' | wc -l
> 90
>
> $ git grep -E '#if.*CONFIG_LINUX' | wc -l
> 142
> $ git grep -E '#if.*CONFIG_WIN' | wc -l
> 16
>

There is also G_OS_*
$ git grep G_OS_UNIX | wc -l
15
$ git grep G_OS_WIN32 | wc -l
23

Replacing WIN32 with WIN64 doesn't make much sense. It should be
either WINDOWS or WIN32.

The Windows API is still called that way, even on 64-bit systems:
https://learn.microsoft.com/en-us/windows/win32/

> I'm inclined to posion all these from the C source though, and only
> these them from non-C locations.
>
> Also IMHO  CONFIG_WIN  or CONFIG_WINDOWS is preferrable - we don't
> add '32' or '64' suffixes to CONFIG_LINUX or CONFIG_POSIX, so I don't
> see a reason to keep doing it for Windows.
>
> With regards,
> Daniel
> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
>


