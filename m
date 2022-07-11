Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oB04q-000584-Az
	for mharc-qemu-trivial@gnu.org; Mon, 11 Jul 2022 16:32:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1oB04p-00055J-33
 for qemu-trivial@nongnu.org; Mon, 11 Jul 2022 16:32:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1oB04n-00033V-FV
 for qemu-trivial@nongnu.org; Mon, 11 Jul 2022 16:32:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657571537;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7HG9eHXoE/+meVQfmCQ1igxAVZE16X/PlscuL2I1tNE=;
 b=i8sXkr8kxrYwjKWhSSlA2C4iUzw2pjO7ggf+mIwA45grJh87J8VrjkTq+ZPfuIR7rYQvVA
 791IR7k3KLRMOOCvkv5Ur0FMl2B/8ySDhMaCexg+JTwegm4EjzKQXF85VAGB0EJ+kcM2qP
 QcZvp4nFyZhAyQPksyYfaFFqTnlRHto=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-548-drEVPYwKOgOr_yaD2rLPnQ-1; Mon, 11 Jul 2022 16:32:10 -0400
X-MC-Unique: drEVPYwKOgOr_yaD2rLPnQ-1
Received: by mail-ua1-f72.google.com with SMTP id
 u43-20020a9f35ee000000b00383589e193aso561905uad.14
 for <qemu-trivial@nongnu.org>; Mon, 11 Jul 2022 13:32:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7HG9eHXoE/+meVQfmCQ1igxAVZE16X/PlscuL2I1tNE=;
 b=zdWWxXm7K12o2TG5Te6slW9EdgflY5Waa7O/1qOktUcbjA521gI0gMCdFwZYaq8gJg
 9g3/qXVgETBMxli6RwMFVGgA/gJD62bVx52ObXwkgNG2Plf0TiIRKTB0UOpRXbK45EUo
 yGfEZ7QmQRe1rioQO2Lwi7pqmTlYrAulvDTg8N3wsocIEh9Fve/8RrbWiid/tPiW0FAg
 9uqyRa9fHVj2CnrjB2IVq6KzDGjlY1X81My8Cz//uIzPCAlL7fZdaJPERbS63ofNDnzP
 z9NyG/oYH9EBdcoKvFEO+vu0d0ZxI5JvPZzeJPHJo6DhUSCUJ97V9dw8gFBGUyF+0y6g
 tm0w==
X-Gm-Message-State: AJIora9xzN6+8xrn3urZkA7i7WZVi2lDngIsOuAJ0neURjDOUJ21x5mO
 bLFGryll0GoTMrHpdvKcqW9TixPL0MNOpOarHi5pvvXhf1auMhU6Ur84+juod24qGnfF6ETdnIs
 fQiJQlE0LgbEBDPIUFLncg4FQh25R95WZyg==
X-Received: by 2002:a05:6102:31ac:b0:357:530e:6496 with SMTP id
 d12-20020a05610231ac00b00357530e6496mr3150888vsh.38.1657571529227; 
 Mon, 11 Jul 2022 13:32:09 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1stgBxUAHkbS5fDRwhEP/3w1TJQkxoV5MFg6TBiwXcxIEHRtukQo6/lqbrMk0mwYahHwBOytH2X7adcCfbYUAM=
X-Received: by 2002:a05:6102:31ac:b0:357:530e:6496 with SMTP id
 d12-20020a05610231ac00b00357530e6496mr3150880vsh.38.1657571528925; Mon, 11
 Jul 2022 13:32:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220711095721.61280-1-thuth@redhat.com>
 <CAFn=p-ZKR-1W-4yuXSEh10mu5M-PEZdf693vpWsEtEAOHL2gaw@mail.gmail.com>
In-Reply-To: <CAFn=p-ZKR-1W-4yuXSEh10mu5M-PEZdf693vpWsEtEAOHL2gaw@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Date: Mon, 11 Jul 2022 16:31:58 -0400
Message-ID: <CAFn=p-Y3FPBnDOxs38SAaPnorPsgdWz_77iC5da-dtUAapZq-g@mail.gmail.com>
Subject: Re: [PATCH] python/qemu/qmp/legacy: Replace 'returns-whitelist' with
 the correct type
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 qemu-trivial@nongnu.org
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Mon, 11 Jul 2022 20:32:19 -0000

On Mon, Jul 11, 2022 at 4:30 PM John Snow <jsnow@redhat.com> wrote:
>
> On Mon, Jul 11, 2022 at 5:57 AM Thomas Huth <thuth@redhat.com> wrote:
> >
> > 'returns-whitelist' has been renamed to 'command-returns-exceptions' in
> > commit b86df3747848 ("qapi: Rename pragma *-whitelist to *-exceptions").
> >
> > Signed-off-by: Thomas Huth <thuth@redhat.com>
> > ---
> >  python/qemu/qmp/legacy.py | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/python/qemu/qmp/legacy.py b/python/qemu/qmp/legacy.py
> > index 03b5574618..1951754455 100644
> > --- a/python/qemu/qmp/legacy.py
> > +++ b/python/qemu/qmp/legacy.py
> > @@ -50,7 +50,7 @@
> >
> >  # QMPMessage can be outgoing commands or incoming events/returns.
> >  # QMPReturnValue is usually a dict/json object, but due to QAPI's
> > -# 'returns-whitelist', it can actually be anything.
> > +# 'command-returns-exceptions', it can actually be anything.
> >  #
> >  # {'return': {}} is a QMPMessage,
> >  # {} is the QMPReturnValue.
> > --
> > 2.31.1
> >
>
> May I cajole you to send a MR to
> https://gitlab.com/qemu-project/python-qemu-qmp ?
>
> (Sorry for the duplicated effort while the library isn't 100% split
> out of the tree yet.)
>
> In this case, for qemu.git:
>
> Reviewed-by: John Snow <jsnow@redhat.com>

Queued.

--js


