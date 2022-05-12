Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1npC45-0005RN-Iw
	for mharc-qemu-trivial@gnu.org; Thu, 12 May 2022 12:53:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1npC3y-0005Pp-Ff
 for qemu-trivial@nongnu.org; Thu, 12 May 2022 12:53:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55045)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1npC3v-0007jM-Q9
 for qemu-trivial@nongnu.org; Thu, 12 May 2022 12:53:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652374394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y70Ye0n+2+jx/Ps62i0xftBgcS6n2NKBuj2pSW+o4RI=;
 b=Gdkgw1HwGDGuDqxaOaeaKBGno8uScD3AUhkGTy3apOux/DML1jraNqtLtW6UbLpeFXVaaa
 1J5Hd5PbhylWA6jcym3xI5sTrQS2chzTNvSH6nyJYEhxwo9ZWhhe97RwGC3MakAHQrXw7w
 qmnSetE5hV2/EP6LFgeJHxi/GmbhxYs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-197-duNrp9pGMaOmxadyAVc-VQ-1; Thu, 12 May 2022 12:53:13 -0400
X-MC-Unique: duNrp9pGMaOmxadyAVc-VQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 e9-20020a05600c4e4900b00394779649b1so4637151wmq.3
 for <qemu-trivial@nongnu.org>; Thu, 12 May 2022 09:53:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Y70Ye0n+2+jx/Ps62i0xftBgcS6n2NKBuj2pSW+o4RI=;
 b=ynNtOrc87Y2Nx+aoiB0ikkME5CNx3lYS/PeOpAflxlozenyBldm1P0ElcT/1vk5MvM
 6wkDYWhprCjUAd4mA+wtY57ZNSQ0ZNYFlwWefXuG3wkiujVyvhq5VN510DRumDNhZC7O
 iI4Ft8VbvRxZb53Sl64dVKpUVh5QrVnxUAy+tjdjtrxRdGmuCv0UTAz36+4Y02ag0XXQ
 jZEd6TzHkF9ln7O01hDirCMlAgkv4iGXNvZ1s0pWV9Vfi/v5N2zXkUGqW1bhQLGhFKD7
 0NbjM4MkeaapK8UasdSb/h4ff8iysFtsnVSELlG74QH3Vhga5PGvfgzLcfDaoKAJBmh4
 uhRA==
X-Gm-Message-State: AOAM532QDW3IoWVk8LxOp2iDUrUfX0iFBmIgA2LKFmDSvXgADMs9OYkJ
 MbKjIfccoBKFKB1ZuhFulOKUWwTMyksk4wBZ/WiZohf6SSkn+I24pvA9WLBCarM/FBaFBXi6nnm
 VMfsA+3IinqJolmtblw==
X-Received: by 2002:adf:fb05:0:b0:20a:e113:8f3f with SMTP id
 c5-20020adffb05000000b0020ae1138f3fmr517253wrr.534.1652374392010; 
 Thu, 12 May 2022 09:53:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2TT6LTGHORqQYIGNyxjFP1w6uRYGcSWO/H+GX1DblmNGnJ/+WwEOfQay7CtG7qjeGAOTLew==
X-Received: by 2002:adf:fb05:0:b0:20a:e113:8f3f with SMTP id
 c5-20020adffb05000000b0020ae1138f3fmr517239wrr.534.1652374391785; 
 Thu, 12 May 2022 09:53:11 -0700 (PDT)
Received: from [192.168.100.42] ([82.142.21.186])
 by smtp.gmail.com with ESMTPSA id
 i8-20020a05600c354800b003945cdd0d55sm174189wmq.26.2022.05.12.09.53.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 May 2022 09:53:10 -0700 (PDT)
Message-ID: <8310cc7f-8c9c-9411-3c6a-ab416f79d8b9@redhat.com>
Date: Thu, 12 May 2022 18:53:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] util: Return void on iova_tree_remove
To: Peter Xu <peterx@redhat.com>, Eugenio Perez Martin <eperezma@redhat.com>
Cc: qemu-level <qemu-devel@nongnu.org>, qemu-trivial@nongnu.org,
 Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
References: <20220427154931.3166388-1-eperezma@redhat.com>
 <CAJaqyWdwzUnP71LNEDe6Fo+th9-qMLQXJMgeo2nb3jE-GyUCPw@mail.gmail.com>
 <Yn0vz+6nYs0d/Hvj@xz-m1.local>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <Yn0vz+6nYs0d/Hvj@xz-m1.local>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 12 May 2022 16:53:19 -0000

On 12/05/2022 18:03, Peter Xu wrote:
> On Thu, May 12, 2022 at 05:48:47PM +0200, Eugenio Perez Martin wrote:
>> On Wed, Apr 27, 2022 at 5:50 PM Eugenio Pérez <eperezma@redhat.com> wrote:
>>>
>>> It always returns IOVA_OK so nobody uses it.
>>>
>>> Acked-by: Jason Wang <jasowang@redhat.com>
>>> Reviewed-by: Peter Xu <peterx@redhat.com>
>>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>>
>> Hi! Friendly ping about this, is it something pending from my side?
> 
> Don't think so. :)
> 
> This patch does look fine to go via trivial branch, Laurent?
> 
> Also copying Michael since for other iova-tree change it always go via
> Michael before.
> 

I can take it via qemu-trivial.

Thanks,
Laurent


