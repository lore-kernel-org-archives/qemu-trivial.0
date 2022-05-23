Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nt5F1-0003n5-1M
	for mharc-qemu-trivial@gnu.org; Mon, 23 May 2022 06:24:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nt5Ew-0003lH-N5
 for qemu-trivial@nongnu.org; Mon, 23 May 2022 06:24:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nt5Et-0006yV-77
 for qemu-trivial@nongnu.org; Mon, 23 May 2022 06:24:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653301478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+r9NK6LhAy6nKZgLMvYP4RCyHHAdqvEkJZ3i/J99eR8=;
 b=bHi4Byk+wxZrazABJt+SvHdiFjHMaXMs/WSizojN1wlmUJUHgMJpbaEpT8wEFx0/CO8lTl
 ab6a6G5R4I4+qkou4z4n8pNHl/5Y5sK3GlAa+rOH0JMABIW5RP2C3zDI4YsaqUmcs3T5cv
 TzC/YZ7V6G9c18FRAoxadAVbpMkEiv8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-422-1Qz9S7eFMemBavWs3cpU-g-1; Mon, 23 May 2022 06:24:37 -0400
X-MC-Unique: 1Qz9S7eFMemBavWs3cpU-g-1
Received: by mail-wm1-f71.google.com with SMTP id
 k35-20020a05600c1ca300b003946a9764baso10366158wms.1
 for <qemu-trivial@nongnu.org>; Mon, 23 May 2022 03:24:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=+r9NK6LhAy6nKZgLMvYP4RCyHHAdqvEkJZ3i/J99eR8=;
 b=Zo5ZA/lnBmhMpibTXSQPDTKpKeYP7x5KeHmCjh8CyCfJnElRaQtVbycvdx8vUuUqLz
 VQojDNt1L+5smzFzv5ZEC2BAMGUo5gsYoXTlBnjG3hkaYdaS/9qq3fmoAwqLMi2jxlPR
 7DDZcYHRVWAIbKN+YD76kOKRViNJ3YPQvZKH4fvVwOK/nSwOKmDQdF1pu/FTZaffR76+
 x9c/ruW8jOF/wkgKMeCbr1IWze9mVlv0GVgLqn1AwUfYqG3IO3uGJmLoCsBjeBp9mo+B
 V6QSXMRjuRFVgh6lq1ABSUIgvPCj2Y4eMJbvIVavD2TyJFnAFdsZkTQDtZM+z5GN2o5p
 6XtQ==
X-Gm-Message-State: AOAM533/PuGGC6vmEXucX+7nb+PzXNTU/PX1Df+sj+j5GsdVrEY9yT0N
 /PDvZD8Voif9m3J1cAfDOc5Hl8TSQx5NdTemxE5l0C7CLiSPON3OYt8xMUw7k+d0RGHDw/L02Yd
 tvq1rH7n09cMjJX81Jg==
X-Received: by 2002:adf:d843:0:b0:20e:614b:2b37 with SMTP id
 k3-20020adfd843000000b0020e614b2b37mr18895716wrl.618.1653301475919; 
 Mon, 23 May 2022 03:24:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJziyoe4LpezWrAgIRK+UiILpyQ/JEWtiHFGY+tE0jTV69mVkYGPg4LRPngotIY1+dX+0LUisg==
X-Received: by 2002:adf:d843:0:b0:20e:614b:2b37 with SMTP id
 k3-20020adfd843000000b0020e614b2b37mr18895702wrl.618.1653301475675; 
 Mon, 23 May 2022 03:24:35 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 p27-20020a05600c1d9b00b0039751bb8c62sm1110043wms.24.2022.05.23.03.24.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 03:24:35 -0700 (PDT)
Date: Mon, 23 May 2022 11:24:33 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, laurent@vivier.eu,
 mjt@tls.msk.ru, danielhb413@gmail.com, clg@kaod.org, mst@redhat.com,
 qemu-arm@nongnu.org
Subject: Re: [PATCH] Trivial: 3 char repeat typos
Message-ID: <Yotg4WL1RYpiLfM2@work-vm>
References: <20220523095629.144441-1-dgilbert@redhat.com>
 <CAFEAcA8G0foQ0WrvknfdCTOUZHNEomJmB19xxTmjdzrS6xv18w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8G0foQ0WrvknfdCTOUZHNEomJmB19xxTmjdzrS6xv18w@mail.gmail.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Mon, 23 May 2022 10:24:42 -0000

* Peter Maydell (peter.maydell@linaro.org) wrote:
> On Mon, 23 May 2022 at 11:09, Dr. David Alan Gilbert (git)
> <dgilbert@redhat.com> wrote:
> >
> > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> >
> > Inspired by Julia Lawall's fixing of Linux
> > kernel comments, I looked at qemu, although I did it manually.
> >
> > Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> 
> Checkpatch would probably ask you to fix up some of the comment
> styles when you touch some of these. Either way:

The only one it actually moaned about was hw/pci/shpc.c's comment style.
Does this need fixing in this patch?

> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Thanks,

Dave

> > diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> > index 04427e073f..2467c5bf76 100644
> > --- a/target/arm/cpu64.c
> > +++ b/target/arm/cpu64.c
> > @@ -997,7 +997,7 @@ static void aarch64_a64fx_initfn(Object *obj)
> >      cpu->gic_vpribits = 5;
> >      cpu->gic_vprebits = 5;
> >
> > -    /* Suppport of A64FX's vector length are 128,256 and 512bit only */
> > +    /* Support of A64FX's vector length are 128,256 and 512bit only */
> 
> This one came up in review of a different patch that happened to touch
> this function. We should ideally rephrase it to fix all of the typo, the
> missing space after comma and the unnatural grammar:
> 
> /* The A64FX supports only 128, 256 and 512 bit vector lengths */


> thanks
> -- PMM
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


