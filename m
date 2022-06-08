Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nyqoX-0003bE-UN
	for mharc-qemu-trivial@gnu.org; Wed, 08 Jun 2022 04:13:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nyqoQ-0003Xh-Jq
 for qemu-trivial@nongnu.org; Wed, 08 Jun 2022 04:13:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nyqoL-0002j9-2o
 for qemu-trivial@nongnu.org; Wed, 08 Jun 2022 04:13:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654675984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=t5qqehEOwVvbuCr1lok3q8OOoWgqa7uOTNcl6JYvvAk=;
 b=MG3yr6cByrl+su5Tw6JEc3ExUhIasJc2Xsesz2RdEHtSNEWG2Xwd6oZhj5huo+UCQbtvlC
 ohALS1/dzl1ahhuASTVZ3w7lcy5AfalFRkfkAR+TAAI6NbEEScxpI0HzjU8dnmwd4+QFWk
 FJlqMaD+oCvlhtlUyStGgM5zR8z0V5g=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-252-xoIRZiD1MtGJh79Kr904kA-1; Wed, 08 Jun 2022 04:13:00 -0400
X-MC-Unique: xoIRZiD1MtGJh79Kr904kA-1
Received: by mail-lj1-f198.google.com with SMTP id
 g3-20020a2e9cc3000000b00253cc2b5ab5so3549940ljj.19
 for <qemu-trivial@nongnu.org>; Wed, 08 Jun 2022 01:13:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t5qqehEOwVvbuCr1lok3q8OOoWgqa7uOTNcl6JYvvAk=;
 b=gEbedaGvxhHWM+wNoIjTemoCeWDjbpWsnACzrCDxgzuRIksw0y1KLMxcgzm3/ZwPlP
 Y1Ey1hPtSuJQKbojfTZXzWaKWaQmMmhO6pHIBIYWrQ+4PwHW1F3jIev5hlAoFxXaRg9Z
 V+GJHGtWFozT5TNss61JHal8PVKJdaUKFMMbrsT+2X6zPi4g3V0ClMfupvzMZt6qYlRp
 HiywJX/Q9lXurPnonedP664EZV0giP3fUuP9wbTrjTMFY5iSb75GhBJSqfGwwkP9zc3I
 B/SjSy+WImsxfXDQQfwod917YjtmmRq0Ja9JMBsAZzRu2N35vdsNYT3JXRpS+meGzJUx
 WvZA==
X-Gm-Message-State: AOAM530OUBcFzAXYdToKwnfK2FuOZRb5A07hXRS6tEO0ItkI9XSAhbAy
 PYGulnW1mjKEcFeuEwLZi+IXKiHp/zftSJdrVURLiOPXJH4Xu6G4RrSvlaw36+i/QlDvkdqc4ph
 ERdTkeYmn0Z0IEOT31fWWNVaCamFeqnOHfQ==
X-Received: by 2002:a05:6512:138d:b0:478:b72a:d66d with SMTP id
 p13-20020a056512138d00b00478b72ad66dmr44702404lfa.641.1654675978973; 
 Wed, 08 Jun 2022 01:12:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJylg1ch1lEJD0KE+aqDRKTTar4pswBsYTkCNy+GmdJUh1eJCp9K+rxTrYE6zlGOdZE6a5LX0sqzmGesy6DHgwY=
X-Received: by 2002:a05:6512:138d:b0:478:b72a:d66d with SMTP id
 p13-20020a056512138d00b00478b72ad66dmr44702382lfa.641.1654675978584; Wed, 08
 Jun 2022 01:12:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220527190658.169439-1-i@hexchain.org>
 <MWHPR11MB0031081716C325EBE19F8ACA9BDC9@MWHPR11MB0031.namprd11.prod.outlook.com>
In-Reply-To: <MWHPR11MB0031081716C325EBE19F8ACA9BDC9@MWHPR11MB0031.namprd11.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 8 Jun 2022 16:12:47 +0800
Message-ID: <CACGkMEsRKNN4PkNBQEGEPpsFhFM7xLD6rVxfAk+QfwsbMoB+sA@mail.gmail.com>
Subject: Re: [PATCH] ebpf: replace deprecated bpf_program__set_socket_filter
To: "Zhang, Chen" <chen.zhang@intel.com>
Cc: Haochen Tong <i@hexchain.org>,
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
X-List-Received-Date: Wed, 08 Jun 2022 08:13:11 -0000

On Tue, May 31, 2022 at 1:40 PM Zhang, Chen <chen.zhang@intel.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Qemu-devel <qemu-devel-
> > bounces+chen.zhang=intel.com@nongnu.org> On Behalf Of Haochen Tong
> > Sent: Saturday, May 28, 2022 3:07 AM
> > To: qemu-devel@nongnu.org
> > Cc: qemu-trivial@nongnu.org; Haochen Tong <i@hexchain.org>
> > Subject: [PATCH] ebpf: replace deprecated bpf_program__set_socket_filter
> >
> > bpf_program__set_<TYPE> functions have been deprecated since libbpf 0.8.
> > Replace with the equivalent bpf_program__set_type call to avoid a
> > deprecation warning.
> >
> > Signed-off-by: Haochen Tong <i@hexchain.org>
>
> It looks good to me.
> By the way, add eBPF maintainers.
> Reviewed-by: Zhang Chen <chen.zhang@intel.com>

Applied.

Thanks

>
> Thanks
> Chen
>
> > ---
> >  ebpf/ebpf_rss.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/ebpf/ebpf_rss.c b/ebpf/ebpf_rss.c index 118c68da83..cee658c158
> > 100644
> > --- a/ebpf/ebpf_rss.c
> > +++ b/ebpf/ebpf_rss.c
> > @@ -49,7 +49,7 @@ bool ebpf_rss_load(struct EBPFRSSContext *ctx)
> >          goto error;
> >      }
> >
> > -    bpf_program__set_socket_filter(rss_bpf_ctx-
> > >progs.tun_rss_steering_prog);
> > +    bpf_program__set_type(rss_bpf_ctx->progs.tun_rss_steering_prog,
> > + BPF_PROG_TYPE_SOCKET_FILTER);
> >
> >      if (rss_bpf__load(rss_bpf_ctx)) {
> >          trace_ebpf_error("eBPF RSS", "can not load RSS program");
> > --
> > 2.36.1
> >
>


