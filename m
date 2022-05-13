Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1npTTP-0002Eu-Ti
	for mharc-qemu-trivial@gnu.org; Fri, 13 May 2022 07:28:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1npTT5-0002D9-Pu
 for qemu-trivial@nongnu.org; Fri, 13 May 2022 07:28:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1npTSq-0005mx-Og
 for qemu-trivial@nongnu.org; Fri, 13 May 2022 07:28:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652441285;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8Q2RcdbUMLDEh/nK1EE7CHRFNqWQSdfjpVXPKN8pgFE=;
 b=iEW7a7RYoTlAmbFFhxu9sBcZ/ylC5K/E78G+zJ3jyCxWTk/xzUVQGu4aOBji16YIAahaO6
 yX8fv0xUmvvmkUJvrAytZuRwbbiVSo5HenOshSwDm4YugeS1q4kowtu6V+A0RHpJr7whOo
 nEqRi59UKTx9zgVPZPwwv65MWbG7PKE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-257-Q6_PeCAEOxmwmyFyb14q2g-1; Fri, 13 May 2022 07:28:04 -0400
X-MC-Unique: Q6_PeCAEOxmwmyFyb14q2g-1
Received: by mail-wm1-f72.google.com with SMTP id
 bg7-20020a05600c3c8700b0039468585269so2815875wmb.3
 for <qemu-trivial@nongnu.org>; Fri, 13 May 2022 04:28:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8Q2RcdbUMLDEh/nK1EE7CHRFNqWQSdfjpVXPKN8pgFE=;
 b=1NvgR0PdzNHxkPESFIZbQ683PbfaAqBUEK/SppDH8V8GxX/KYeeaajYbCylzK++nYn
 ayigAm/oExZKSh5Hos/Vt1G/Ln7j1ERCQ7Kx/YaiYqUnTu2RYCsZXnWKvNglcNwyh7Es
 p36YYOvGHEQ0W9RjZ3Ukl4Nu++7tv8PcUBYt5vJZS3V8nL5F3TSp58MorkC+lilJKZ2b
 //vrRpGWtpgYVLQkq24gsc/wcAvMlJBGZfkBtv9wH3NOhiT6stD/EQNRMiDPQOX2GJCe
 kDt02/iTxEDSaPe/iU8K9pZHuQ3KgkrufS8A5JlyV5BVNFNClB+oJjT3CwLUnrn3LYMz
 IMsQ==
X-Gm-Message-State: AOAM531p0cXKO2NEYlBEwZ8kZz2xPc8pALcm3/6j8wzS2CmAKOygGazk
 iRoPooYEZokm3IRrk0JuR3s38GhidvYB9zmhnoZ3TQ7nv8Q4xM88TSY+qYa0Nn7uAyFMNWdDbWH
 opJq35FqvUh4JCZCh6A==
X-Received: by 2002:a05:600c:1d95:b0:394:5d0d:6f70 with SMTP id
 p21-20020a05600c1d9500b003945d0d6f70mr4144667wms.48.1652441283214; 
 Fri, 13 May 2022 04:28:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx4McUdgwfyYEAhPtwpFqWYrSRMY5AXhr+4F6NJyVv82hIcxRJhCsvIxwxWWtL8cxGYy4BLVg==
X-Received: by 2002:a05:600c:1d95:b0:394:5d0d:6f70 with SMTP id
 p21-20020a05600c1d9500b003945d0d6f70mr4144648wms.48.1652441282946; 
 Fri, 13 May 2022 04:28:02 -0700 (PDT)
Received: from redhat.com ([2.53.15.195]) by smtp.gmail.com with ESMTPSA id
 n8-20020a05600c4f8800b0039444973258sm6797712wmq.0.2022.05.13.04.28.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 04:28:02 -0700 (PDT)
Date: Fri, 13 May 2022 07:27:58 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Subject: Re: [PATCH 00/11] Random cleanup patches
Message-ID: <20220513072734-mutt-send-email-mst@kernel.org>
References: <20220505161805.11116-1-shentey@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20220505161805.11116-1-shentey@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 13 May 2022 11:28:40 -0000

On Thu, May 05, 2022 at 06:17:54PM +0200, Bernhard Beschow wrote:
> This patch series contains random cleanups that I made while studying the code.
> 
> Bernhard Beschow (11):
>   hw/rtc/mc146818rtc: Inline isa_connect_gpio_out() and remove it
>   hw: Reuse TYPE_I8042 define
>   hw/audio/cs4231a: Const'ify global tables
>   hw/i386/pc: Unexport PC_CPU_MODEL_IDS macro
>   hw/i386/pc: Unexport functions used only internally
>   hw/i386/pc: Remove orphan declarations
>   hw/ppc/e500: Remove unused BINARY_DEVICE_TREE_FILE
>   hw/net/fsl_etsec/etsec: Remove obsolete and unused etsec_create()
>   accel/tcg/cpu-exec: Unexport dump_drift_info()
>   accel/tcg: Inline dump_opcount_info() and remove it
>   docs/devel: Fix link to developer mailing lists

pc changes looks like trivial tree material.
Acked-by: Michael S. Tsirkin <mst@redhat.com>


>  accel/tcg/cpu-exec.c              |  4 ++--
>  accel/tcg/translate-all.c         |  5 -----
>  docs/devel/submitting-a-patch.rst |  6 +++---
>  hw/audio/cs4231a.c                |  8 ++++----
>  hw/i386/pc.c                      | 17 +++++++++++++----
>  hw/isa/isa-bus.c                  |  6 ------
>  hw/net/fsl_etsec/etsec.c          | 23 -----------------------
>  hw/net/fsl_etsec/etsec.h          |  7 -------
>  hw/ppc/e500.c                     |  1 -
>  hw/rtc/mc146818rtc.c              |  3 ++-
>  hw/sparc64/sun4u.c                |  2 +-
>  include/exec/cpu-all.h            |  3 ---
>  include/hw/i386/pc.h              | 14 --------------
>  include/hw/isa/isa.h              |  1 -
>  14 files changed, 25 insertions(+), 75 deletions(-)
> 
> -- 
> 2.36.0
> 
> 
> 


