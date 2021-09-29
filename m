Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mVaj0-0002YH-69
	for mharc-qemu-trivial@gnu.org; Wed, 29 Sep 2021 10:38:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mVaix-0002Wp-L2
 for qemu-trivial@nongnu.org; Wed, 29 Sep 2021 10:38:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mVait-0002xq-FV
 for qemu-trivial@nongnu.org; Wed, 29 Sep 2021 10:38:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632926293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gPptCaPb+3Tk3HUBd+J/guZ2dfz52kYwK8bl+wzvJI8=;
 b=iI4nllDgUhmVKB4UVuwy0tQtzPTfNlSZ4sey87RJZ+ce/Hfl91K4NwrDeV7Nrf7UzuqSpm
 IVfvF7J4nBCNjRc88hYM4LPTkoJE8GUxHroRe1Pk6XPXPuoB0Y4keMjjxUTDKUSCvz9M0a
 ynLiCyqjJ+HQ+0fSAn146OhnS0nkano=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-119-fkbD4qwCNh6ZO_zoPc68zg-1; Wed, 29 Sep 2021 10:38:11 -0400
X-MC-Unique: fkbD4qwCNh6ZO_zoPc68zg-1
Received: by mail-ed1-f72.google.com with SMTP id
 s12-20020a05640217cc00b003cde58450f1so2651197edy.9
 for <qemu-trivial@nongnu.org>; Wed, 29 Sep 2021 07:38:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gPptCaPb+3Tk3HUBd+J/guZ2dfz52kYwK8bl+wzvJI8=;
 b=7pyRnZNq0+r47r+9wW/HiAVtIMf0vq5SDBIRfe24LkX2cgyAHHOH2A+VPtTqWejqWf
 xpR+obXdrGlB4QOrPl14tX/P62kpRyNPcg14aDfP7XZxDQ/tjhZhkEPAJTpOCoHIRDL8
 WzKqxEygsgLVvw0apnSGVN4oqdcR0xiUyG6G9sp6j00MmZbWhF99gbtlJhLKQblf3i56
 SEuupi4eTUWVmZax/9Hy5ygxSqdcZvq2ESCMFpkLCgQbSrbzZs2qsPa/H2v5WzZk0Jz7
 jHNP6Rr65dIQplkt7mFDpq/gr32Le+cyI1/ceKTSNQ3zDGWx7V/lJmjAqWluvnv0W0b1
 T6CA==
X-Gm-Message-State: AOAM532GwLlN10b53dDYq9mTgEK0o7sYNRBLBZMGOZwbNkk+XtLnPbSo
 NhA9Frmxne3cGVJ3YlXljrr3RlBSiO2avo6gR0TeyXTFYr9oe/7tQu6P3Sk9d1r5FQUAQxm+4C2
 Ry19kXPuRZtDNntOj8g==
X-Received: by 2002:a17:906:919:: with SMTP id i25mr34483ejd.171.1632926290541; 
 Wed, 29 Sep 2021 07:38:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyuF+T83Mfb+C0OJBtFrZLUmItdoSIiumQuYZKF04JDrwZYxH0+A+eEMSrKrfn66sRtG7Kb7w==
X-Received: by 2002:a17:906:919:: with SMTP id i25mr34463ejd.171.1632926290358; 
 Wed, 29 Sep 2021 07:38:10 -0700 (PDT)
Received: from gator.home (cst2-174-28.cust.vodafone.cz. [31.30.174.28])
 by smtp.gmail.com with ESMTPSA id my11sm17692ejc.80.2021.09.29.07.38.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 07:38:09 -0700 (PDT)
Date: Wed, 29 Sep 2021 16:38:07 +0200
From: Andrew Jones <drjones@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, wanghaibin.wang@huawei.com
Subject: Re: [PATCH v2 1/2] qemu-options: Tweak [,maxcpus=cpus] to
 [,maxcpus=maxcpus]
Message-ID: <20210929143807.iztxqypswpkknzlt@gator.home>
References: <20210928121134.21064-1-wangyanan55@huawei.com>
 <20210928121134.21064-2-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210928121134.21064-2-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Sep 2021 14:38:20 -0000

On Tue, Sep 28, 2021 at 08:11:33PM +0800, Yanan Wang wrote:
> In qemu-option.hx, there is "-smp [[cpus=]n][,maxcpus=cpus]..." in the
> DEF part, and "-smp [[cpus=]n][,maxcpus=maxcpus]..." in the RST part.
> Obviously the later is right, let's fix the previous one.
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
>  qemu-options.hx | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 5c1b0311c0..dcd9595650 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -200,7 +200,7 @@ SRST
>  ERST
>  
>  DEF("smp", HAS_ARG, QEMU_OPTION_smp,
> -    "-smp [[cpus=]n][,maxcpus=cpus][,sockets=sockets][,dies=dies][,cores=cores][,threads=threads]\n"
> +    "-smp [[cpus=]n][,maxcpus=maxcpus][,sockets=sockets][,dies=dies][,cores=cores][,threads=threads]\n"
>      "                set the number of CPUs to 'n' [default=1]\n"
>      "                maxcpus= maximum number of total CPUs, including\n"
>      "                offline CPUs for hotplug, etc\n"
> -- 
> 2.19.1
>

Reviewed-by: Andrew Jones <drjones@redhat.com>


