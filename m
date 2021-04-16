Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lXMds-0000aH-R6
	for mharc-qemu-trivial@gnu.org; Fri, 16 Apr 2021 07:28:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lXMdr-0000Zq-RB
 for qemu-trivial@nongnu.org; Fri, 16 Apr 2021 07:28:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51253)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lXMdo-0007jW-3S
 for qemu-trivial@nongnu.org; Fri, 16 Apr 2021 07:28:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618572483;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ELTAsvqWtIwBFoV4R0MTAcs0uowJXmAEhH4PwIXzgZ4=;
 b=NmloGRkb14hTyc7QgdDVV5JLZUFvv7AEiozXFx1KV1OhbBonFoC9EMFiP923Qv6IUpvAbM
 b6jmtO8TEUii9gwLA3pVGAmLIpHHamdvuj14SgYjzWYqUZQxL0sRnwAs766gLJK7EHUREh
 DERUjKvBSorSDUCTkAu9OKV7qHdFYoo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-328-s-OMgzGLNiiWDLcvbMT8gA-1; Fri, 16 Apr 2021 07:27:59 -0400
X-MC-Unique: s-OMgzGLNiiWDLcvbMT8gA-1
Received: by mail-wm1-f70.google.com with SMTP id
 x20-20020a7bc2140000b029012bb4d2b5d6so3644352wmi.1
 for <qemu-trivial@nongnu.org>; Fri, 16 Apr 2021 04:27:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ELTAsvqWtIwBFoV4R0MTAcs0uowJXmAEhH4PwIXzgZ4=;
 b=DGR0w7deklv3X3UCfoPAHLFeNkK6/DFFHxQErt7ypQTPvEKrI02G+sd3XIWTPvzOlv
 jzIdQghPPsROv6SJzJzoa7VOSATmh8uG88aIsn0Q+ltDxALHNiqnQYgG++LTY3KadO4j
 MPmFWnn3bk75/k1ZDIYiq7QwPCpqBk3CHrA19h7mBfhVxgd38sikMhmg/PG7zCQfuM/m
 C3BplMinH1oO4OipiDT3dcxlPrq/92xc4viRba3tHQDy1sHEVGXBJ2eRWKxbJGWh+ar/
 QP7g+WOC6/QRIBgre1J65MmihnLWT/Nf6+DhKAJQgpziCGZAZHcgVLeUzRcP3rM88ijz
 BpjQ==
X-Gm-Message-State: AOAM532hO2wkGWGQXqS4yDWNjcRkqwP6CKuEhBm1zcj4BlwtGSHq5alI
 pkmJ8xPxKfvWb/PxhWf82z364eGiupmudauS9NhuT2vDAH1CXUpa79Xh9gMgc4BnUSPJwEXEYRf
 964Ck7wj1s8xbMnGsbQ==
X-Received: by 2002:a5d:4912:: with SMTP id x18mr8943733wrq.198.1618572478261; 
 Fri, 16 Apr 2021 04:27:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzbdcXKCBMmVlyUtg+k9RKabHYE6LQzINByCuqo6ZID4tWjpPvffUbgsVbkG9tzP+m/+MWoTA==
X-Received: by 2002:a5d:4912:: with SMTP id x18mr8943700wrq.198.1618572477926; 
 Fri, 16 Apr 2021 04:27:57 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id j12sm9667340wro.29.2021.04.16.04.27.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Apr 2021 04:27:57 -0700 (PDT)
Subject: Re: [PATCH-for-6.0?] mptsas: remove unused MPTSASState.pending
 (CVE-2021-3392)
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-trivial@nongnu.org, Prasad J Pandit <pjp@fedoraproject.org>,
 qemu-stable@nongnu.org
References: <20210416102243.1293871-1-mjt@msgid.tls.msk.ru>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <8c313f51-db0d-c9c0-621d-a9af689b7164@redhat.com>
Date: Fri, 16 Apr 2021 13:27:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210416102243.1293871-1-mjt@msgid.tls.msk.ru>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
X-List-Received-Date: Fri, 16 Apr 2021 11:28:08 -0000

On 4/16/21 12:22 PM, Michael Tokarev wrote:
> During previous attempt to fix CVE-2021-3392 it was discovered
> that MPTSASState.pending is actually not used. So instead of
> fixing the prob, just remove the offending code entirely

What problem?

> 
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> Cc: Prasad J Pandit <pjp@fedoraproject.org>
> Cc: qemu-stable@nongnu.org
> ---
>  hw/scsi/mptsas.c | 4 ----
>  hw/scsi/mptsas.h | 1 -
>  2 files changed, 5 deletions(-)
> 
> diff --git a/hw/scsi/mptsas.c b/hw/scsi/mptsas.c
> index 7416e78706..5abbc742aa 100644
> --- a/hw/scsi/mptsas.c
> +++ b/hw/scsi/mptsas.c
> @@ -257,7 +257,6 @@ static void mptsas_free_request(MPTSASRequest *req)
>          req->sreq->hba_private = NULL;
>          scsi_req_unref(req->sreq);
>          req->sreq = NULL;
> -        QTAILQ_REMOVE(&s->pending, req, next);
>      }
>      qemu_sglist_destroy(&req->qsg);
>      g_free(req);
> @@ -303,7 +302,6 @@ static int mptsas_process_scsi_io_request(MPTSASState *s,
>      }
>  
>      req = g_new0(MPTSASRequest, 1);
> -    QTAILQ_INSERT_TAIL(&s->pending, req, next);
>      req->scsi_io = *scsi_io;
>      req->dev = s;
>  
> @@ -1319,8 +1317,6 @@ static void mptsas_scsi_realize(PCIDevice *dev, Error **errp)
>  
>      s->request_bh = qemu_bh_new(mptsas_fetch_requests, s);
>  
> -    QTAILQ_INIT(&s->pending);
> -
>      scsi_bus_new(&s->bus, sizeof(s->bus), &dev->qdev, &mptsas_scsi_info, NULL);
>  }
>  
> diff --git a/hw/scsi/mptsas.h b/hw/scsi/mptsas.h
> index b85ac1a5fc..c046497db7 100644
> --- a/hw/scsi/mptsas.h
> +++ b/hw/scsi/mptsas.h
> @@ -79,7 +79,6 @@ struct MPTSASState {
>      uint16_t reply_frame_size;
>  
>      SCSIBus bus;
> -    QTAILQ_HEAD(, MPTSASRequest) pending;
>  };
>  
>  void mptsas_fix_scsi_io_endianness(MPIMsgSCSIIORequest *req);
> 


