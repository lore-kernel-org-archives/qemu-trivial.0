Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mjN4T-0002eO-9I
	for mharc-qemu-trivial@gnu.org; Sat, 06 Nov 2021 10:53:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mjN4R-0002dL-Jr
 for qemu-trivial@nongnu.org; Sat, 06 Nov 2021 10:53:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mjN4O-0004aK-4K
 for qemu-trivial@nongnu.org; Sat, 06 Nov 2021 10:53:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636210402;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gqX//TN5efMN1JRLZhCjZB6XWxeQAeaXjPU+B/aR9L8=;
 b=PbusboJwedoWmTAkydSIIGZvH9Vubkg8KeTCkbJbliiYDX6iq1Z55B9nuQoj0+9zmDhVUL
 n7PdxAPyVR/vXbZ1UHHFO2If/HRBnRj+5SMIxh4NaAky4rsKF/aosErG3329rB0/paG5F3
 2b6+YdWvxyUbresoVBQxjvBUcVbZ1G0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-fKv0S6gXOm2YFrzuHiTDag-1; Sat, 06 Nov 2021 10:53:18 -0400
X-MC-Unique: fKv0S6gXOm2YFrzuHiTDag-1
Received: by mail-ed1-f70.google.com with SMTP id
 f20-20020a0564021e9400b003e2ad3eae74so11322310edf.5
 for <qemu-trivial@nongnu.org>; Sat, 06 Nov 2021 07:53:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gqX//TN5efMN1JRLZhCjZB6XWxeQAeaXjPU+B/aR9L8=;
 b=arzLfo9bAWbiInqbo3x4xwD+syBfZc5rerGWT2mHWB+Z/T2zjrmv8FkAcNY5YiluQm
 InzYX4/4uOF0gY84mzVEUvjbBpgUB9gch5y9VQTiRLGH3Faag4gDPe2QpkkjpUCL9Bhy
 7S1iZt9bJ0zvH/PUo5t1V8skbrvzbD/FPUTx4Rz1v0bZA/ZqcyenJA5Ysm4nINTMjiPk
 mwaSR4TdxsDtqeZkxKq4LHvP0nKiWfP/B1GqmqvEMjpytlVcncGihSvIsnVet9v41a8K
 NJGKkezO3R/pKGhvzI433vvcMKCV4jY2ud9d37JZEXEGHkrOWSLOoZSynhW4rlERUTS3
 Xocg==
X-Gm-Message-State: AOAM532x6iPq+aL7vs5mT3X2BdtJiCTkoPoTqkzpk7tg+upqgiS6PJs7
 NcTytZxwT8ZM2jcBPRdo67rdxyjnApcYZNF1F+4RYrqhreJH00NQVWBCaQjJgMymokeCryr5AQJ
 VG3axmdcWBRki04hq1NYPN60YaPM4/9LRuQ==
X-Received: by 2002:a17:906:8cd:: with SMTP id
 o13mr83762817eje.341.1636210397518; 
 Sat, 06 Nov 2021 07:53:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx3H4rLYh/SNZ85zvqKx4m+ggrL4n6mavgyBguKBT9EyPQLefbFa3bWOjBvWpLlTSaGw+8Rj3oygp9rHB/n8Xo=
X-Received: by 2002:a17:906:8cd:: with SMTP id
 o13mr83762792eje.341.1636210397340; 
 Sat, 06 Nov 2021 07:53:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210521103423.2780345-1-philmd@redhat.com>
 <7d9abdeb-575d-3ec5-904b-bc676313ca14@vivier.eu>
In-Reply-To: <7d9abdeb-575d-3ec5-904b-bc676313ca14@vivier.eu>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Date: Sat, 6 Nov 2021 15:53:06 +0100
Message-ID: <CAP+75-U0wK7BKxFywWr8tWUbZ-nc5W8cdcOWM=gPp162gPAtiQ@mail.gmail.com>
Subject: Re: [PATCH] meson: Fix 'interpretor' typo
To: Laurent Vivier <laurent@vivier.eu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, 
 Peter Maydell <peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.735,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Sat, 06 Nov 2021 14:53:27 -0000

ping...

https://lore.kernel.org/qemu-devel/20210521103423.2780345-1-philmd@redhat.c=
om/

On Sat, Jun 5, 2021 at 9:03 PM Laurent Vivier <laurent@vivier.eu> wrote:
>
> Le 21/05/2021 =C3=A0 12:34, Philippe Mathieu-Daud=C3=A9 a =C3=A9crit :
> > Fix a typo from commit fa2f7b0b9b7 ("meson: Warn when TCI is
> > selected but TCG backend is available").
> >
> > Reported-by: Peter Maydell <peter.maydell@linaro.org>
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> > ---
> >  meson.build | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meson.build b/meson.build
> > index 1559e8d873a..230a0e4b558 100644
> > --- a/meson.build
> > +++ b/meson.build
> > @@ -247,7 +247,7 @@
> >        error('Unsupported CPU @0@, try --enable-tcg-interpreter'.format=
(cpu))
> >      endif
> >    elif get_option('tcg_interpreter')
> > -    warning('Use of the TCG interpretor is not recommended on this hos=
t')
> > +    warning('Use of the TCG interpreter is not recommended on this hos=
t')
> >      warning('architecture. There is a native TCG execution backend ava=
ilable')
> >      warning('which provides substantially better performance and relia=
bility.')
> >      warning('It is strongly recommended to remove the --enable-tcg-int=
erpreter')
> >
>
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
>


