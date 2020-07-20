Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jxR6f-0007kp-2f
	for mharc-qemu-trivial@gnu.org; Mon, 20 Jul 2020 04:25:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1jxR6d-0007iv-RF
 for qemu-trivial@nongnu.org; Mon, 20 Jul 2020 04:25:03 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:51075
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1jxR6c-0001gQ-CX
 for qemu-trivial@nongnu.org; Mon, 20 Jul 2020 04:25:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595233501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=49GZ6We9Ef+Cwest0ZEcgIIXf9t8GN+9skXH3jVyZe8=;
 b=FoHZSOFpPR2dTFoGYManCsSJL+66rYhFU9jVxvpZLAmDpvFtpJFTDH/DRg9u512w2frQv3
 EC5KiLtNHlAmThpCfL2f2MgVPEmJGpLZSVJc1ya9nhGgg/thS/an2z7PWyuM54wcQ5WZKr
 vIDFFJqtBIIEddaFAQbR9J33bwzb12E=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-F9g7SqQeOD20qfL2i_Hr5w-1; Mon, 20 Jul 2020 04:24:57 -0400
X-MC-Unique: F9g7SqQeOD20qfL2i_Hr5w-1
Received: by mail-wm1-f71.google.com with SMTP id y204so13998804wmd.2
 for <qemu-trivial@nongnu.org>; Mon, 20 Jul 2020 01:24:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=49GZ6We9Ef+Cwest0ZEcgIIXf9t8GN+9skXH3jVyZe8=;
 b=FdBh4X0cfUjgmFjfknr8tB32uTFk7AJ8HZIxdZLaYTKvi09ZA+d9fCOOaFgbzMlMDK
 8zoy1KFR7UpJg/t+vwmUQ/3K5qhn42AtxqnfqdDit7cpOYdRTlx3Y7OraVDEJpfwgg8M
 p3o44rI6xdmNGAFvwhTvEEu3Z+XRIDpxC54QMYVuhs5BbH0g9T+jDCcoXzl7rKQEcXjb
 mkgErRdbWyzJV3JhVZMlpiTBtoG9AWdNcZrqSQShTn+cxSbk2kJNca3rbO8EA7TGzN8r
 Uo3NJr6gZ6mt0WhDEfzCqt8Udh+JzHCisx2UBopuBO9YQYz4ulQIInBpX6cT2bhVIOyl
 2gDQ==
X-Gm-Message-State: AOAM532WxRoqcyTQ60gMEYq9mKFySO2x96g1fRv1vRHCLToeDLN0Xqa2
 BVCbhBmyLgwfPP8HSTSniu22jCHn5uCrvBr6a/iPWHHVewnPbnhoM1yCfdxy4PIiUWqn7xE0158
 NZI8wHracog91aJ3K/Q==
X-Received: by 2002:a5d:4e81:: with SMTP id e1mr20169856wru.22.1595233495368; 
 Mon, 20 Jul 2020 01:24:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwp0aRrUKNx8xfrtCs5OgdEeWEa75/VyhKvlZqt3XMwqfltiapnxqe+w6yjy9Le8Z88lX79zw==
X-Received: by 2002:a5d:4e81:: with SMTP id e1mr20169830wru.22.1595233495124; 
 Mon, 20 Jul 2020 01:24:55 -0700 (PDT)
Received: from steredhat ([5.180.207.22])
 by smtp.gmail.com with ESMTPSA id j16sm32466556wrt.7.2020.07.20.01.24.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 01:24:54 -0700 (PDT)
Date: Mon, 20 Jul 2020 10:24:37 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Kenta Ishiguro <kentaishiguro@slowstart.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Subject: Re: [PATCH] hw/i386/kvm/ioapic.c: fix typo in error message
Message-ID: <20200720082437.sbuylue5l5co4yyu@steredhat>
References: <20200717123514.15406-1-kentaishiguro@slowstart.org>
MIME-Version: 1.0
In-Reply-To: <20200717123514.15406-1-kentaishiguro@slowstart.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/20 03:17:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 20 Jul 2020 08:25:04 -0000

+Cc qemu-trivial@nongnu.org

On Fri, Jul 17, 2020 at 09:35:14PM +0900, Kenta Ishiguro wrote:
> Fix a typo in an error message for KVM_SET_IRQCHIP ioctl:
> "KVM_GET_IRQCHIP" should be "KVM_SET_IRQCHIP".
> 
> Signed-off-by: Kenta Ishiguro <kentaishiguro@slowstart.org>
> ---
>  hw/i386/kvm/ioapic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/i386/kvm/ioapic.c b/hw/i386/kvm/ioapic.c
> index 4ba8e47251..c5528df942 100644
> --- a/hw/i386/kvm/ioapic.c
> +++ b/hw/i386/kvm/ioapic.c
> @@ -97,7 +97,7 @@ static void kvm_ioapic_put(IOAPICCommonState *s)
>  
>      ret = kvm_vm_ioctl(kvm_state, KVM_SET_IRQCHIP, &chip);
>      if (ret < 0) {
> -        fprintf(stderr, "KVM_GET_IRQCHIP failed: %s\n", strerror(ret));
> +        fprintf(stderr, "KVM_SET_IRQCHIP failed: %s\n", strerror(ret));
>          abort();
>      }
>  }
> -- 
> 2.17.1
> 
> 

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


