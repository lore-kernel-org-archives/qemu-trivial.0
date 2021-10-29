Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mgL5n-0007td-Lf
	for mharc-qemu-trivial@gnu.org; Fri, 29 Oct 2021 02:10:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mgL5b-0007sX-Sg
 for qemu-trivial@nongnu.org; Fri, 29 Oct 2021 02:10:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mgL5a-0002ZK-5E
 for qemu-trivial@nongnu.org; Fri, 29 Oct 2021 02:10:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635487805;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2u+inP+aKyI76LYtCQk95FBJS6VcSHyRUPCveCzt2tY=;
 b=fNXIH9tGbDy0k5vXlGVQocCrAda2MeJ6PeVaLHtVwMz7ezIWuXPOP1HBXfJhMTdfttFx9/
 QKjldMnEX7gLZFT3iCgf5iLEY85tksMWMTjRJmSuX2DqhJ+msHO1Ls5XO7yYrtww69TMWo
 9YY05U+mwi54V2j80lc2r58gtdFWjUw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-294-c9xShn50P1WCRhEdU_aMuw-1; Fri, 29 Oct 2021 02:10:02 -0400
X-MC-Unique: c9xShn50P1WCRhEdU_aMuw-1
Received: by mail-wm1-f70.google.com with SMTP id
 125-20020a1c0183000000b003306ae8bfb7so974356wmb.7
 for <qemu-trivial@nongnu.org>; Thu, 28 Oct 2021 23:10:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2u+inP+aKyI76LYtCQk95FBJS6VcSHyRUPCveCzt2tY=;
 b=M+LVpLRqmAVLCuMWrL4OMQuHiAHjW1MGedyETtXxtf38BRK8/bgGxrqrvLWSOGbHtY
 zxdbIP84PXOsmMjaQwcCH4W74gDkQJFNSfY0WocKFJYX/JobRElure/s2nefcvsUGN7x
 mWO3U6pidOkJn4o5soCJFSsHlNI9FfHaOct9kUO+zwojhtL9pzhEYhSP5dJeTvBEXmk8
 +eCqN217JUsE+5wWiUwyyyTYysJSIwJJsNn7IgDtmue7WAClCwJSlM6oKLwMbYDl2yFb
 oRKIjHcPmEPguzhCsfTdo7Iww6QhAaGaSRdqsx2MGWJ5ImfVPG6FRYlNWAF0CG11VLZV
 F7xA==
X-Gm-Message-State: AOAM5334ddIHiiXWKM9UGkZEFmE0bHIh5G2ACdgkkxUdDheNl86Xi9jm
 2r8/yKtbkzbeWH0b1QQrg9S08kZ0DCpWRsl4H1Ce2jsAbDnwkBHBBramEfLDabMQLkGrnHva5T7
 Vrt91UurOtg61SrMZNQ==
X-Received: by 2002:adf:e34d:: with SMTP id n13mr11548219wrj.97.1635487800822; 
 Thu, 28 Oct 2021 23:10:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzTkSJRPmQJhqc+BFf8IK1NjyZP0OfMTgJBhSd/NlxzBWplel7TqNHxy9lYkcDZuoWbGTtJwg==
X-Received: by 2002:adf:e34d:: with SMTP id n13mr11548196wrj.97.1635487800613; 
 Thu, 28 Oct 2021 23:10:00 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id r1sm8891802wmr.36.2021.10.28.23.09.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 23:10:00 -0700 (PDT)
Message-ID: <a2e059da-4c3a-66b7-6ce6-2b2fed0f980a@redhat.com>
Date: Fri, 29 Oct 2021 08:09:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] hvf: Use standard CR0 and CR4 register definitions
To: Cameron Esfahani <dirty@apple.com>, qemu-devel@nongnu.org
Cc: r.bolshakov@yadro.com, QEMU Trivial <qemu-trivial@nongnu.org>
References: <20211029013315.79207-1-dirty@apple.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211029013315.79207-1-dirty@apple.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.847, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 29 Oct 2021 06:10:10 -0000

On 10/29/21 03:33, Cameron Esfahani wrote:
> No need to have our own definitions of these registers.
> 
> Signed-off-by: Cameron Esfahani <dirty@apple.com>
> ---
>  target/i386/hvf/vmx.h      | 17 +++++++++--------
>  target/i386/hvf/x86.c      |  6 +++---
>  target/i386/hvf/x86.h      | 34 ----------------------------------
>  target/i386/hvf/x86_mmu.c  |  2 +-
>  target/i386/hvf/x86_task.c |  3 ++-
>  5 files changed, 15 insertions(+), 47 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


