Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o8FnK-0000ju-ID
	for mharc-qemu-trivial@gnu.org; Mon, 04 Jul 2022 02:42:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1o8FnJ-0000jf-K1
 for qemu-trivial@nongnu.org; Mon, 04 Jul 2022 02:42:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1o8FnH-0005VO-D1
 for qemu-trivial@nongnu.org; Mon, 04 Jul 2022 02:42:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656916970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4mOBJBYMwxtUEbwjhTlLGe486IPga/g9UrtdNuliYX4=;
 b=JRmyHHywJ9yxyDKJw9hsb7BaL7iA0ntM1jlW66FfFSkgS398y5Gy1Z1+/vrFp7TkLBlqTr
 UqE1KwmdbXxV33c5PVrUco++W8HD4jcsKDjJk35ygND1p1W6N1g8uK7dxGqNZzrhyAOUGD
 Ra/kTGXA320+VYDHbpyTeVFk2mALf2w=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-590-7ztwwbCcMaGJkHi6uo9E5g-1; Mon, 04 Jul 2022 02:42:44 -0400
X-MC-Unique: 7ztwwbCcMaGJkHi6uo9E5g-1
Received: by mail-lf1-f72.google.com with SMTP id
 p36-20020a05651213a400b004779d806c13so2699025lfa.10
 for <qemu-trivial@nongnu.org>; Sun, 03 Jul 2022 23:42:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4mOBJBYMwxtUEbwjhTlLGe486IPga/g9UrtdNuliYX4=;
 b=aoxo8DxPaZZCYrgaa62lDtdlsGfllKP/tgFdQYqgv5DbImoPisW2cXguANQO3pwgb0
 8VuMf56qlDACrIn20Qgij9NKB4Rk0e7Eov3RNgd89I9o4sb9qxN/qoNbbCGsvv7NQNe1
 AJ31IftNuMCbZRB5amgK2J2XE63kpKyjSfHGJtU+T+uUao5Hb0EzkXOhif0su7jvqbsE
 iMSJbT8LAyMKb7l9DWEi8kbakiZpAWyy7lmp0m4y3VPqE++AgLLYh1hR2SV/QiH9gFEj
 qlkSnDLeuQslsYCiNEjtEjlGvlrp3mLyOq1PFuidVTpocItRV388dtN6flC7qWyOydV2
 JWOA==
X-Gm-Message-State: AJIora+LlrlTqhOSnXoenSPi2BIZa3MqNTJxk3m7n3c0oVk88I9x41Ip
 9FHOJ3EhOO0MuEIkpEZ9NCb1/RtEi/T5+cs2nwfXdA0jrVjidMbMaGePBEebWY4z+Ibdv7e7MgO
 X/jGJDmZt5ozG90zjS8XhNydLVqXJo9K0Pw==
X-Received: by 2002:a05:6512:3b8e:b0:481:1a75:452 with SMTP id
 g14-20020a0565123b8e00b004811a750452mr19006798lfv.238.1656916962999; 
 Sun, 03 Jul 2022 23:42:42 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vOnnFGKJMwN/PzXzouFcSS3pF3Zu6L4NLiMGqh+wuk+Mgl3NsgyvhDvimDGXgHwXVzTdOngCgmCJySy89unLg=
X-Received: by 2002:a05:6512:3b8e:b0:481:1a75:452 with SMTP id
 g14-20020a0565123b8e00b004811a750452mr19006783lfv.238.1656916962767; Sun, 03
 Jul 2022 23:42:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220527190658.169439-1-i@hexchain.org>
 <MWHPR11MB0031081716C325EBE19F8ACA9BDC9@MWHPR11MB0031.namprd11.prod.outlook.com>
 <CACGkMEsRKNN4PkNBQEGEPpsFhFM7xLD6rVxfAk+QfwsbMoB+sA@mail.gmail.com>
 <CAFEAcA-7gj3=+bOrYheXPUxvO_sFRw0TR6UquUCm419orsym3A@mail.gmail.com>
In-Reply-To: <CAFEAcA-7gj3=+bOrYheXPUxvO_sFRw0TR6UquUCm419orsym3A@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 4 Jul 2022 14:42:31 +0800
Message-ID: <CACGkMEtipg-8BUSpO9D_vW4uq+ZCdmdfCM1VkTA74XS9AybdiQ@mail.gmail.com>
Subject: Re: [PATCH] ebpf: replace deprecated bpf_program__set_socket_filter
To: Peter Maydell <peter.maydell@linaro.org>
Cc: "Zhang, Chen" <chen.zhang@intel.com>, Haochen Tong <i@hexchain.org>, 
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Andrew Melnychenko <andrew@daynix.com>, 
 Yuri Benditovich <yuri.benditovich@daynix.com>, 
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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
X-List-Received-Date: Mon, 04 Jul 2022 06:42:53 -0000

On Fri, Jul 1, 2022 at 10:05 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Wed, 8 Jun 2022 at 09:17, Jason Wang <jasowang@redhat.com> wrote:
> >
> > On Tue, May 31, 2022 at 1:40 PM Zhang, Chen <chen.zhang@intel.com> wrote:
> > >
> > >
> > >
> > > > -----Original Message-----
> > > > From: Qemu-devel <qemu-devel-
> > > > bounces+chen.zhang=intel.com@nongnu.org> On Behalf Of Haochen Tong
> > > > Sent: Saturday, May 28, 2022 3:07 AM
> > > > To: qemu-devel@nongnu.org
> > > > Cc: qemu-trivial@nongnu.org; Haochen Tong <i@hexchain.org>
> > > > Subject: [PATCH] ebpf: replace deprecated bpf_program__set_socket_filter
> > > >
> > > > bpf_program__set_<TYPE> functions have been deprecated since libbpf 0.8.
> > > > Replace with the equivalent bpf_program__set_type call to avoid a
> > > > deprecation warning.
> > > >
> > > > Signed-off-by: Haochen Tong <i@hexchain.org>
> > >
> > > It looks good to me.
> > > By the way, add eBPF maintainers.
> > > Reviewed-by: Zhang Chen <chen.zhang@intel.com>
> >
> > Applied.
>
> Hi -- did this patch get lost somewhere ?

Kind of, actually the patch is in my queue but the pull request wasn't sent.

> We just had a
> report about it on irc and it doesn't seem to be in master yet.

Will send it soon.

Thanks

>
> thanks
> -- PMM
>


