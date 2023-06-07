Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1q6pRW-00045o-2d
	for mharc-qemu-trivial@gnu.org; Wed, 07 Jun 2023 05:27:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1q6pRU-00045f-T2
 for qemu-trivial@nongnu.org; Wed, 07 Jun 2023 05:27:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1q6pRI-0003l4-RK
 for qemu-trivial@nongnu.org; Wed, 07 Jun 2023 05:27:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686130008;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XaRFo6R3K024Gv6B8gdhMrTECP1g7P8XX+H3Ll9MpPM=;
 b=ExicqDJkE0if02GvGBTr9r+iHOHRXlSkl0On1akGuUBTCbrE9Gffnn4ZUEqng/F0iUyjPQ
 GDQrT230RR3aWXgsa7ybqt4Jx5cccSpr5h5jWj3AwhZHV/k0cRgT+YOuGSw1peOIQTmRBk
 jrzMyRruadgsQRrXLf07kyUX9qIhy6E=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-70-1BqR14_pPgW7mMsVTuqD_w-1; Wed, 07 Jun 2023 05:26:47 -0400
X-MC-Unique: 1BqR14_pPgW7mMsVTuqD_w-1
Received: by mail-ua1-f70.google.com with SMTP id
 a1e0cc1a2514c-78369c2c6d9so1757941241.1
 for <qemu-trivial@nongnu.org>; Wed, 07 Jun 2023 02:26:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686130006; x=1688722006;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XaRFo6R3K024Gv6B8gdhMrTECP1g7P8XX+H3Ll9MpPM=;
 b=E/HWBfzxgPUJk8Izl0io/fgPc3tsympXF7dk9unTNticdsSE+7ebsgoSI721FiWlA3
 n6M4SFbdRmyz0bkcEDLQ2Ze8o3P/39YlDWcChTOp0gQtkFug5aRYAsn4PmMTLcSdHSxo
 ouDNWbfTbL0qRF9lpoxWFDoAWKqFi3GH8S3oPXDRPhMoGpbnOQJTA3lEyzPfHVz/X9ob
 hbnca7UZ2T+x6NDlxS1vhIFw6l5a1cLk58IVR49qsEQPkpSfd0Mm5CAFXPkMCfg20+3c
 3AOrIYXm8bbEbGnm/e0EZPMllda4fQ4ZThudZCrGZ8W/v20oMD0siR121koEDxDcrLa0
 IFxA==
X-Gm-Message-State: AC+VfDxkIfys+JIonjQyTv6YnNBSwULC6BswjTvGnbzFJPXbTJKe+C7B
 8zEha6+vvOzHWFBzQsD9+Gqggd34cZs0e8DNWplIyIu34F7MridiDhw8NrWltdpyq0Ea84GXGns
 nw8yrr5XISluvHVwHYBYqfRb6G7Se01a3bQ==
X-Received: by 2002:a05:6102:21b:b0:439:6a84:a396 with SMTP id
 z27-20020a056102021b00b004396a84a396mr747565vsp.33.1686130006649; 
 Wed, 07 Jun 2023 02:26:46 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5EgmqMo96n1CNLDYZvyx8G2yzzNk+5wFpmTaOZZtrO066y+xaHBrz17VVLC8RUcgOHtaePcClSwTWkFkKpsAY=
X-Received: by 2002:a05:6102:21b:b0:439:6a84:a396 with SMTP id
 z27-20020a056102021b00b004396a84a396mr747562vsp.33.1686130006344; Wed, 07 Jun
 2023 02:26:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230607090336.59424-1-pbonzini@redhat.com>
 <f1c785b1-beac-55e1-7da9-d9a5f1ab77ff@linaro.org>
In-Reply-To: <f1c785b1-beac-55e1-7da9-d9a5f1ab77ff@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 7 Jun 2023 11:26:35 +0200
Message-ID: <CABgObfYJA=K0TXZP4tqaHrTG4N+nsFCOJsvLNM3-mXWsVY84cA@mail.gmail.com>
Subject: Re: [PATCH] meson: fix "static build" entry in summary
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 07 Jun 2023 09:27:01 -0000

On Wed, Jun 7, 2023 at 11:09=E2=80=AFAM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> On 7/6/23 11:03, Paolo Bonzini wrote:
> > Fixes: a0cbd2e8496 ("meson: use prefer_static option", 2023-05-18)
> > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> > ---
> >   meson.build | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meson.build b/meson.build
> > index 553c8e0b9c5..34d0444ffbb 100644
> > --- a/meson.build
> > +++ b/meson.build
> > @@ -4088,7 +4088,7 @@ summary_info +=3D {'QEMU_LDFLAGS':      ' '.join(=
qemu_ldflags)}
> >   summary_info +=3D {'profiler':          get_option('profiler')}
> >   summary_info +=3D {'link-time optimization (LTO)': get_option('b_lto'=
)}
> >   summary_info +=3D {'PIE':               get_option('b_pie')}
> > -summary_info +=3D {'static build':      config_host.has_key('CONFIG_ST=
ATIC')}
> > +summary_info +=3D {'static build':      get_optin('prefer_static')}
>
> Typo 'get_option'.

Yeah, sent after testing but before committing the obvious fix. :(

Paolo

> >   summary_info +=3D {'malloc trim support': has_malloc_trim}
> >   summary_info +=3D {'membarrier':        have_membarrier}
> >   summary_info +=3D {'debug graph lock':  get_option('debug_graph_lock'=
)}
>


