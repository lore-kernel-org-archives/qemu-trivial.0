Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56E3BCCA470
	for <qemu-trivial@archiver.kernel.org>; Tue, 30 Sep 2025 13:03:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1v3a0r-0001qd-8F; Tue, 30 Sep 2025 09:03:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <grant@cylo.net>) id 1v3XoG-0000xX-S2
 for qemu-trivial@nongnu.org; Tue, 30 Sep 2025 06:42:17 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <grant@cylo.net>) id 1v3Xo7-0006xy-As
 for qemu-trivial@nongnu.org; Tue, 30 Sep 2025 06:42:15 -0400
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-b00a9989633so1057905166b.0
 for <qemu-trivial@nongnu.org>; Tue, 30 Sep 2025 03:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cylo-net.20230601.gappssmtp.com; s=20230601; t=1759228921; x=1759833721;
 darn=nongnu.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZqZIwaLgasBz1CYhQ+UOQds+kBwM3T7vsmkVK76hqPk=;
 b=bBfyqeDUlPu7DISy+YpA5nZ9R+C9LUvBbB0enIi3UoENPL2/wMvPsm6YRDu4W/9UwL
 up1Q/AoqI0X5Igw8EGoC0KSPHgbIoRDmx4bR2dtxkfkjPVPshoBvLoV3uDTzCqPPUSSA
 OxS8xFRQTdfaG+dHSx/10R32l8qfM9+a2o/52bBwcRbqRwNieoUtd7Q6HI3cHzomxSRI
 X9njMmMBpzZstz/IU+yLN2x8jMVIbyl8F46J3+Q2m6+Ik3ywRZ0srvaK7jjuaTHA1ly3
 YAPwJZkA+HzN6/1R8lPd/h17KcgntRRBiNsyEv951K4GyIJs5V6XaOaTQz9rzT8Lkh+u
 caVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759228921; x=1759833721;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZqZIwaLgasBz1CYhQ+UOQds+kBwM3T7vsmkVK76hqPk=;
 b=ZH4cWPRJjODCTT0PUc2eYAcnkWlueqtoKwYjOIrhcjjnEaj/NNuR3SXH13i44b3gjL
 oSJjwBK/2XQzIFQ7x5fgaHt/I57YE9bjnlVfglvTSy587e5MiUPq1na1GY7aDD7eCFgq
 i0r38SYzv2BwVrrCNorGjFCmSmIp0Nyv0KxPp9NekUW88ZcNs57+89Dei87IoNc+Mttr
 uYEhzvlVLAz0KoIussub4+kfBnJPq5xgkNDDRi67RC5YhmIY/vNAYE1uTXW3ZhHs8wbW
 nREqiEP3HzOtpwkHbUMtRkJyJV3sHyy+GY3SpiA8Yw2PYn6IjQg1UVGiwyfqR79tsn/s
 chLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPcjv4VJr61Y+VNJIndOvTU3vfC+6N0ClDzQdoi7oddttMp/1t8qwJrgaj7tXmRzAuS7iSjBGwiiCTt7I=@nongnu.org
X-Gm-Message-State: AOJu0YzdvNQdHreLoC5S5MA7XjonkCQA0kqvkCGKivw+z14r5/ZjSxek
 L8sxqA9LiP3d3pExwllfQVFvPdQW0HjGR2I/1tGEpgPgebbCeprs/ewlGiOGOni8MpKQxqSGmfj
 BZ63YlMejJr2KnpjEqSKdbK5k9zOlsGSfjytqwKut65Zm2pAdsV8y4vKMcA8=
X-Gm-Gg: ASbGncsNrpAtNSEn1zInarfisIc4FQISim8nLDSY74pNL4bbM7Xy2n1/S8v8CydHran
 Ztst9aylO+qH0z/EAk/iuOdiIW2mueCb9Rp2P9BOzBIg+kjlPZ2EnfDG062H4T96gXM29Y3kqze
 r5Ba+A1R6cbAvZ6eE0fjf9Q/thcbdvPovH/DfEeVjqIwxAm9VUMqDpZ5j7JOkk839r9QBqpsPoN
 Sb1PFmsXI+KgiR0B9xPg9ifvXQ=
X-Google-Smtp-Source: AGHT+IEbomGev6qnZhCSxfoZdULg5VmLlItArsSqN9plr25P/x2MPC1EOJlJ4jCf07bZfB2xzTY7ojPbUuyRdTKJKrI=
X-Received: by 2002:a17:906:29d8:b0:b40:7305:b942 with SMTP id
 a640c23a62f3a-b413b5aa29amr302593666b.25.1759228921192; Tue, 30 Sep 2025
 03:42:01 -0700 (PDT)
MIME-Version: 1.0
References: <CANdvy3dH9bBdopj_KUqaLD0Viq7uKn0jPObjqz6H7XvMgRnPrw@mail.gmail.com>
 <CAJ+F1CJwGZ-+dder5+icmuqSvtQ=fjce1zfrGKamYuYxVxOX9w@mail.gmail.com>
In-Reply-To: <CAJ+F1CJwGZ-+dder5+icmuqSvtQ=fjce1zfrGKamYuYxVxOX9w@mail.gmail.com>
From: "Grant Millar | Cylo" <rid@cylo.io>
Date: Tue, 30 Sep 2025 11:41:50 +0100
X-Gm-Features: AS18NWBkKuzAAfWq5Y8gNyj3jWGFhBBCSuLjYtjZOihxFQ7pXPF5fbBY2POIduo
Message-ID: <CANdvy3c3bCN1km-oa3TY1it1H5qvNXMeM2zY18K1fM9gC5DPRA@mail.gmail.com>
Subject: Re: [PATCH] ui/vnc: Fix NULL pointer dereference in
 vnc_disconnect_start
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=grant@cylo.net; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 30 Sep 2025 09:03:16 -0400
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

Sure, no problem. This is on 10.0.3 (Debian 1:10.0.3+ds-0+deb13u1).

Sometimes I have to run the reproducer a few times for the race
condition to occur.

#0  object_get_class (obj=3Dobj@entry=3D0x0) at qom/object.c:1043
#1  0x0000556a3b671655 in QIO_CHANNEL_GET_CLASS (obj=3D0x0) at
./include/io/channel.h:29
#2  qio_channel_close (ioc=3D0x0, errp=3D0x0) at io/channel.c:380
#3  0x0000556a3b2036d9 in vnc_disconnect_start (vs=3D0x556a463d96a0) at
ui/vnc.c:1310
#4  0x0000556a3b2063d5 in vnc_disconnect_start (vs=3D0x556a463d96a0) at
ui/vnc.c:1398
#5  0x0000556a3b21b096 in vncws_handshake_done (task=3D<optimized out>,
user_data=3D0x556a463d96a0) at ui/vnc-ws.c:105
#6  0x0000556a3b673f54 in qio_task_complete (task=3D0x556a469a7fc0) at
io/task.c:197
#7  0x0000556a3b670a50 in qio_channel_websock_handshake_io
(ioc=3D0x556a45ec60e0, condition=3D<optimized out>,
user_data=3D0x556a469a7fc0) at io/channel-websock.c:588
#8  0x00007f4f6dca9385 in ??? () at /lib/x86_64-linux-gnu/libglib-2.0.so.0
#9  0x00007f4f6dcabc78 in g_main_context_dispatch () at
/lib/x86_64-linux-gnu/libglib-2.0.so.0
#10 0x0000556a3b8015b8 in glib_pollfds_poll () at util/main-loop.c:287
#11 os_host_main_loop_wait (timeout=3D0) at util/main-loop.c:310
#12 main_loop_wait (nonblocking=3Dnonblocking@entry=3D0) at util/main-loop.=
c:589
#13 0x0000556a3b44b360 in qemu_main_loop () at system/runstate.c:835
#14 0x0000556a3b746cb0 in qemu_default_main (opaque=3Dopaque@entry=3D0x0)
at system/main.c:50
#15 0x0000556a3b1b4319 in main (argc=3D<optimized out>, argv=3D<optimized
out>) at system/main.c:80

On Tue, 30 Sept 2025 at 11:38, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
>
> Hi
>
> On Tue, Sep 30, 2025 at 1:59=E2=80=AFPM Grant Millar | Cylo <rid@cylo.io>=
 wrote:
> >
> > From 0d1c4ac000a66ef22b4a0cd0c4bedd840192096a Mon Sep 17 00:00:00 2001
> > From: Rid <rid@cylo.io>
> > Date: Tue, 30 Sep 2025 10:23:58 +0100
> > Subject: [PATCH] ui/vnc: Fix NULL pointer dereference in vnc_disconnect=
_start
> >
> > When a WebSocket connection fails during the handshake, vs->ioc can be
> > NULL when vnc_disconnect_start() is called, leading to a segmentation
> > fault when qio_channel_close() tries to dereference it.
> >
> > This can be reproduced by sending incomplete HTTP requests to the
> > WebSocket port:
> >
> >   for i in {1..100}; do
> >     (echo -n "GET / HTTP/1.1" && sleep 0.05) | nc -w 1 <IP> <PORT> &
> >   done
> >
>
> I tried to reproduce without success.
>
> Could you provide a backtrace?
>
> > Add a NULL check before calling qio_channel_close() to prevent the cras=
h.
> >
> > Signed-off-by: Rid <rid@cylo.io>
>
> Your mail is not properly formatted. git am fails.
> https://www.qemu.org/docs/master/devel/submitting-a-patch.html
>
>
> thanks
>
> > ---
> >  ui/vnc.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/ui/vnc.c b/ui/vnc.c
> > index 77c823bf2e..1669ed1b80 100644
> > --- a/ui/vnc.c
> > +++ b/ui/vnc.c
> > @@ -1301,7 +1301,9 @@ static void vnc_disconnect_start(VncState *vs)
> >          g_source_remove(vs->ioc_tag);
> >          vs->ioc_tag =3D 0;
> >      }
> > -    qio_channel_close(vs->ioc, NULL);
> > +    if (vs->ioc) {
> > +        qio_channel_close(vs->ioc, NULL);
> > +    }
> >      vs->disconnecting =3D TRUE;
> >  }
> >
> > --
> > 2.39.5
> >
>
>
> --
> Marc-Andr=C3=A9 Lureau

