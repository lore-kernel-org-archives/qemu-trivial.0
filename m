Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mVajQ-0003Cm-66
	for mharc-qemu-trivial@gnu.org; Wed, 29 Sep 2021 10:38:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mVajO-00039N-Bt
 for qemu-trivial@nongnu.org; Wed, 29 Sep 2021 10:38:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mVajM-0003N7-TJ
 for qemu-trivial@nongnu.org; Wed, 29 Sep 2021 10:38:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632926324;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VHOqifya4sK2klQSyY/VDUTq1lVM/gXqENpKHyQVMs0=;
 b=UzCXsmp3Gly+g/qHEFcW/ZGt/68RP7Lhovdz5UhfrtrxdT26AVddKSLtcCzmc+ADwy7v5+
 k58Fs5BqeByIKhVQcA6QSGRauHP0wmoGdsU+nhTL+DsNg9LTXRzVAPZgNet/BPw//PDYKz
 49Kwc9DkX5QyKuCTle9zAyk032fX6t4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-ntjNJKyZOfO51LNH5Jenuw-1; Wed, 29 Sep 2021 10:38:42 -0400
X-MC-Unique: ntjNJKyZOfO51LNH5Jenuw-1
Received: by mail-ed1-f72.google.com with SMTP id
 1-20020a508741000000b003da559ba1eeso2642042edv.13
 for <qemu-trivial@nongnu.org>; Wed, 29 Sep 2021 07:38:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VHOqifya4sK2klQSyY/VDUTq1lVM/gXqENpKHyQVMs0=;
 b=SeFnYakVX2Rk5rmHefytcTvOuoTrtuc4ew6NbVPhQ8ajYoiL9YlqST22NIMtPnTFHp
 K9GkUNmIZSc1o9ZQUT6mrFPt3ijrsJEpcCJojdSDN8VZOixlIAEZ36LiDx49qoeHF6uX
 pVGW+AIGumUCvJzFZKxKksKyi8CNlDQKT+Lqnjf5hHtNLEArV3zsNL+hSAMc051KYSzi
 4Cx7IFOcg0FwMPPTf+ZeuxwxAy0mDt9WJhmea3HOYPUwXN/ZvI+WnvV9IEFlyt5bpILr
 f+d5ivkXe79+mrUo1rT1Hm0rqa5EwWlizfsswziG/gnCRGn87Z2jDgwZ8ByIqbrvVJ2c
 8nKw==
X-Gm-Message-State: AOAM533wYcgzOfPBGMYFmJKzzVuj3qwmVTqe4qmP014FwseCRcezUf13
 44VllWJ4TCVhB7eAhtG5OL3/clZG4motAvnyjlhxR1HLAESSKWtQx+2XwnvezUM4TcgQRPK36YC
 eRZGwuyFd/E/4BbFI7A==
X-Received: by 2002:a17:906:a59:: with SMTP id x25mr50018ejf.33.1632926321053; 
 Wed, 29 Sep 2021 07:38:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxXjmN1uWDy1Ejunn+EHCR+ZvV2W8nQCegz8Z6Ul/R142Mep78/BmTKUWkT5EgFOO8i1mxnqg==
X-Received: by 2002:a17:906:a59:: with SMTP id x25mr49995ejf.33.1632926320877; 
 Wed, 29 Sep 2021 07:38:40 -0700 (PDT)
Received: from gator.home (cst2-174-28.cust.vodafone.cz. [31.30.174.28])
 by smtp.gmail.com with ESMTPSA id b2sm8781ejj.124.2021.09.29.07.38.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 07:38:40 -0700 (PDT)
Date: Wed, 29 Sep 2021 16:38:38 +0200
From: Andrew Jones <drjones@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, wanghaibin.wang@huawei.com
Subject: Re: [PATCH v2 2/2] qemu-options: Add missing "sockets=2,maxcpus=2"
 to CLI "-smp 2"
Message-ID: <20210929143838.ppxvide4jfdt5rd6@gator.home>
References: <20210928121134.21064-1-wangyanan55@huawei.com>
 <20210928121134.21064-3-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210928121134.21064-3-wangyanan55@huawei.com>
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
X-List-Received-Date: Wed, 29 Sep 2021 14:38:46 -0000

On Tue, Sep 28, 2021 at 08:11:34PM +0800, Yanan Wang wrote:
> There is one numa config example in qemu-options.hx currently
> using "-smp 2" and assuming that there will be 2 sockets and
> 2 cpus totally. However now the actual calculation logic of
> missing sockets and cores is not immutable and is considered
> liable to change. Although we will get maxcpus=2 finally based
> on current parser, it's always stable to specify it explicitly.
> 
> So "-smp 2,sockets=2,maxcpus=2" will be optimal when we expect
> multiple sockets and 2 cpus totally.
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> Reviewed-by: Philippe Mathieu-Daude <philmd@redhat.com>
> ---
>  qemu-options.hx | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/qemu-options.hx b/qemu-options.hx
> index dcd9595650..ff8917c5e1 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -395,7 +395,7 @@ SRST
>          -m 2G \
>          -object memory-backend-ram,size=1G,id=m0 \
>          -object memory-backend-ram,size=1G,id=m1 \
> -        -smp 2 \
> +        -smp 2,sockets=2,maxcpus=2 \
>          -numa node,nodeid=0,memdev=m0 \
>          -numa node,nodeid=1,memdev=m1,initiator=0 \
>          -numa cpu,node-id=0,socket-id=0 \
> -- 
> 2.19.1
>

Reviewed-by: Andrew Jones <drjones@redhat.com>


