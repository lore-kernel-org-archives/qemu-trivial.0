Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rdCaR-0002Gq-1s
	for mharc-qemu-trivial@gnu.org; Thu, 22 Feb 2024 12:10:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rdCaP-0002GA-6z
 for qemu-trivial@nongnu.org; Thu, 22 Feb 2024 12:10:17 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rdCaN-0008Ke-Go
 for qemu-trivial@nongnu.org; Thu, 22 Feb 2024 12:10:16 -0500
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-56454c695e6so31590a12.0
 for <qemu-trivial@nongnu.org>; Thu, 22 Feb 2024 09:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708621813; x=1709226613; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+clhGK5CmMbUnm7X1zLQ+lroWGpJSidp8qaoKLdvM0E=;
 b=LEMu0Y7J9t1WXeUqdsE4bx6cHuHpgtWvUEEQdaa3zCu8EBj8RTT2T/bE1bWRoDQUsv
 m+8MTRnf0fSvz8FlSyngd+G/HLRQKh5oHR9VAOmFJHqSp1nGxZhhOAtcikP/VckhB0SQ
 ZFNNW8y0zyQrL+Y94kD9imOlh16txWy/6zTAgU5hAAzSJFGYgkkMer+SfI/9RKoylUOt
 cjnEag/dtAqI3WDYl+fZPOK+wKIYUoV8e4RY+EfWSjshkkDwne6umjMKPWJ1h24NfOpV
 Dx7bYz8qd3l/2PQGFNZQSMOg9zLR5RFchaBBOHS4mjoH83tMdyaau+Cvsbrmbuj7DasL
 N+dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708621813; x=1709226613;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+clhGK5CmMbUnm7X1zLQ+lroWGpJSidp8qaoKLdvM0E=;
 b=ZBcQPTU3/u3BbA8U6tMdm5lRyofqAqLXQUlr2ui0O2SzcJPF37LGvLMb6yBI6/PMNs
 zoeL2hwSdNESwR1CEVjZ6YsYq1dgDwR5TOenERwjQq/49p4uo1OBwT1MLkQ02hwMKMn5
 aBENGwG37HHhYGFUSytYjrFHRi7riTHdWpBU9nV+rqx4l+CwKL6sqIT4AfANKTkz/i56
 kHmpOkUXFCPaCG+4FQwn4UqYTOekkqxPacVArzxDBpzzIwO8Y3KyOkoAMRVWzNQkZVge
 hD1w1DaAV5iBdeiTpDsdI96a0grWNLR6XxX9MSO+c+LUK0MDKjbvndvjS7pyii8iGw3q
 yuWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJlHVyaiWJJz2HFgaXdwsscwkcslKdjeZGbJcB6XmYglb2e4itvYOHsy/FTaeWNJeCq50IqOE4Hm3+CqIcbcRqpxGtdqvDLg==
X-Gm-Message-State: AOJu0YzFvFnPLNnCj3E0xV8+MolCaJPLN6u6RsWLIhZWgDdZ3dFlz6Zu
 MYMQRT7R9caTUEjCfCPznHIs5Zgfbqpl3Yswh8Xe2c/iOESIFG6vMOzGTcJVzP1pKNpwCgZHbQK
 essTWA82X7cHB3NgutScNSYj3o4Y6CLlZyTSCkQ==
X-Google-Smtp-Source: AGHT+IEly/qy7fFCWe/A4i4RjIJfJHMb84VXxNj7chgks0xxYaMDU+46E2PahxeEW3Fe/UXXeF8B6li8k25TlkOHvjU=
X-Received: by 2002:a05:6402:43c3:b0:564:9628:2e2f with SMTP id
 p3-20020a05640243c300b0056496282e2fmr2865537edc.17.1708621812704; Thu, 22 Feb
 2024 09:10:12 -0800 (PST)
MIME-Version: 1.0
References: <DDADA9A9-DED4-4510-A532-7600C0233467@daveparsons.net>
 <fdda385d-2e18-4554-88d0-e43cb5b90e39@tls.msk.ru>
In-Reply-To: <fdda385d-2e18-4554-88d0-e43cb5b90e39@tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Feb 2024 17:10:01 +0000
Message-ID: <CAFEAcA9psJuvPz+mWYzWz0NLTcQTCNhknFrGZ2bx7Frtb3=B4A@mail.gmail.com>
Subject: Re: [PATCH] ui/cocoa: Fix incorrect window clipping on macOS Sonoma
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: David Parsons <dave@daveparsons.net>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Akihiko Odaki <akihiko.odaki@daynix.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
X-List-Received-Date: Thu, 22 Feb 2024 17:10:17 -0000

On Thu, 22 Feb 2024 at 06:08, Michael Tokarev <mjt@tls.msk.ru> wrote:
>
> [Adding a few more Ccs]
>
> 17.02.2024 18:58, David Parsons :
> > macOS Sonoma changes the NSView.clipsToBounds to false by default where=
 it was true in
> > earlier version of macOS. This causes the window contents to be obscure=
d by the window
> > frame. This fixes the issue by conditionally setting the clipping on So=
noma to true.
> >
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1994
> > Signed-off-by: David Parsons <dave@daveparsons.net>
> >
> > diff --git a/ui/cocoa.m b/ui/cocoa.m
> > index eb99064bee..c9e3b96004 100644
> > --- a/ui/cocoa.m
> > +++ b/ui/cocoa.m
> > @@ -365,6 +365,9 @@ - (id)initWithFrame:(NSRect)frameRect
> >           screen.width =3D frameRect.size.width;
> >           screen.height =3D frameRect.size.height;
> >           kbd =3D qkbd_state_init(dcl.con);
> > +        if (@available(macOS 14, *)) {
> > +            [self setClipsToBounds:YES];
> > +        }
> >
> >       }
> >       return self;
> >
>
> Hi David!
>
> While the code change is tiny, I for one know nothing about MacOS and
> its cocoa thing, so to me (with my trivial-patches hat on) this is a
> no-go.  I'd love to have a review from someone more knowlegeable in
> this area.

Mmm. Akihiko is the expert here, but I do notice that we don't
seem to be handling the "macos-version-specific" stuff in a
way we've done it before (we don't use @available elsewhere).

I did wonder if we could call the setClipsToBounds method unconditionally;
The release notes say
https://developer.apple.com/documentation/macos-release-notes/appkit-releas=
e-notes-for-macos-14#NSView
"This property is available back to macOS 10.9. This availability is
intended to allow code targeting older OSes to set this property to
true without guarding the setter in an availability check."

but I think that might only mean "you can do this building on a new
SDK that's targeting an old version", not "you can do this
when building on an older SDK" (at least judging from the
comments in the gitlab issue).

The other option would be to fix whatever it is that we're
presumably not getting right that means this default change
caused the bug. My guess is that we are in the case
"Confusing a view=E2=80=99s bounds and its dirty rect. The dirty rect
 passed to .drawRect() should be used to determine what to draw,
 not where to draw it. Use NSView.bounds when determining the
 layout of what your view draws."
But unless the fix for that is really obvious and easy I guess
that flipping the default back to its old value is the better
approach.

-- PMM

