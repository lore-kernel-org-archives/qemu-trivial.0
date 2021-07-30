Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m9Qf2-0007wO-Pm
	for mharc-qemu-trivial@gnu.org; Fri, 30 Jul 2021 07:26:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m9Qf0-0007vZ-Ax
 for qemu-trivial@nongnu.org; Fri, 30 Jul 2021 07:26:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m9Qex-00072h-HQ
 for qemu-trivial@nongnu.org; Fri, 30 Jul 2021 07:26:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627644393;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=btWc/KMCgkQMoCUhrETnKpQeVzxqpi5jTEn3VB1YjS0=;
 b=B/ThBsP1r42Btu+9nm8K4Z0lfWmDwzeQnqb5Hsu1kbFMYb2IekXRXmzkpif0irKro/2zDk
 u0i+AHYfouT9fuSqz6esLMf5rRPtevBUAWZdcczRXBV1xA4EfdIvV4jck6OInM5O4DsmFD
 +3I6Sjnnf59aisxj3yulMH0OxJFBQRM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-PJv1wIuBMzyIoV4Rk4bmsQ-1; Fri, 30 Jul 2021 07:26:32 -0400
X-MC-Unique: PJv1wIuBMzyIoV4Rk4bmsQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 u26-20020adfb21a0000b029013e2b4a9d1eso3133090wra.4
 for <qemu-trivial@nongnu.org>; Fri, 30 Jul 2021 04:26:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=btWc/KMCgkQMoCUhrETnKpQeVzxqpi5jTEn3VB1YjS0=;
 b=NNHKJ85AdtNQSTvjUoaEtC3HxQNGVvxdDl/aXd3UHFxbLhPyKgDvkb2iB52+iD5xnf
 qz/b4xURJepiGxr0awVcliN7ZK7Vuio4ORvlQGO7vCOquTkGxnmGEzgFpGBKNbWO4OLi
 anPdPIZnRoiKCejPrmsO0P7Lj7OOjjyp2oLgl4GpK7ZLJvNlb+ZEfAkt0w3IzMrQaPS+
 tf97glJb87Cx3mIppjCIJECh9PPjE6MXFByFe+AYQt/8UtXDpHIUYcWCHsabGXRgm8yV
 /idOBkywIx/KCTdINmW6eC+eVsbOHclhugw8yyeq2l8BAohO/2NK4HTVW1enhXv94BoH
 9e/A==
X-Gm-Message-State: AOAM530J9b6mwSEhckJbofm4jnr+68dh/svxtYWBMZUfwtYeDfF8atIX
 ZD0qrNUUsVbybgVvW2xuuUbOYHker0R1EVa+egplsfazUwaMnDA71ur9fqDlNtD9N3d33XziTDf
 9dqcp2W++7OlQrZelAv6FRa2/7Vo3CivWm0SoaKqRQmYjGgVbNt01HbSUzWuyNU1yiFw=
X-Received: by 2002:a1c:3505:: with SMTP id c5mr2425593wma.53.1627644391299;
 Fri, 30 Jul 2021 04:26:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzknsC3rPA1NOJXpzqvC5E4LK3+ztR/e5llX5qyEZ1cnyeX1pybxn9KoSdULSEwNekW3oDXwQ==
X-Received: by 2002:a1c:3505:: with SMTP id c5mr2425568wma.53.1627644391051;
 Fri, 30 Jul 2021 04:26:31 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id g15sm1295784wmh.44.2021.07.30.04.26.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 04:26:30 -0700 (PDT)
Subject: Re: [PATCH] hw/vfio: Fix typo in comments
To: Cai Huoqing <caihuoqing@baidu.com>, alex.williamson@redhat.com
Cc: qemu-devel@nongnu.org, QEMU Trivial <qemu-trivial@nongnu.org>
References: <20210730012613.2198-1-caihuoqing@baidu.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ebb42d43-f3b8-f55c-b0d5-55e60a881747@redhat.com>
Date: Fri, 30 Jul 2021 13:26:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210730012613.2198-1-caihuoqing@baidu.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.125, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 30 Jul 2021 11:26:38 -0000

On 7/30/21 3:26 AM, Cai Huoqing wrote:
> Fix typo in comments:
> *programatically  ==> programmatically
> *disconecting  ==> disconnecting
> *mulitple  ==> multiple
> *timout  ==> timeout
> *regsiter  ==> register
> *forumula  ==> formula
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> ---
>  hw/vfio/igd.c        | 2 +-
>  hw/vfio/pci-quirks.c | 2 +-
>  hw/vfio/pci.c        | 6 +++---
>  hw/vfio/platform.c   | 2 +-
>  4 files changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


