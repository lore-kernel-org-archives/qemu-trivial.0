Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qnME1-0007Xp-Vm
	for mharc-qemu-trivial@gnu.org; Mon, 02 Oct 2023 12:56:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1qnMDp-0007Wu-Ov
 for qemu-trivial@nongnu.org; Mon, 02 Oct 2023 12:56:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1qnMDo-00010F-7d
 for qemu-trivial@nongnu.org; Mon, 02 Oct 2023 12:56:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696265799;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fztuQTvCsq83cHqsTUCZXBc7Mf6lNb3Kk9nSdTwWCJA=;
 b=JY+C5ounfDVZGWRKyIc2QujlwwPSujGXQM+llJfPgsHQ7tROU4DuJAf1cJNGxf/ZhwBczC
 Y5+h0w0jY8N0tS0QPENhxnYY55pTfjF4QClP9VlQdd30Vu0qrrpnGkIPdVuzuaaCYTRMP9
 hYGlq+7wtK5A7ljvaETsuI372aKFtP0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-395-eR9KpFyvOpiwC3-g-P0ORQ-1; Mon, 02 Oct 2023 12:56:37 -0400
X-MC-Unique: eR9KpFyvOpiwC3-g-P0ORQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 4fb4d7f45d1cf-5342c8a70a8so9902463a12.1
 for <qemu-trivial@nongnu.org>; Mon, 02 Oct 2023 09:56:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696265797; x=1696870597;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fztuQTvCsq83cHqsTUCZXBc7Mf6lNb3Kk9nSdTwWCJA=;
 b=s9TBTSulJMMbz+7wrQlf2n+qEpvfnSc5imLOGvRIF7PvPNbQnFC9xQ9oc05hptSypZ
 vewo+YBvFbesrzOI6xIfuCiMyX2DVwS9pdYYBUH7eoy0tuXvDBFk7KDJx5VLn3AbgvlI
 RVvzhPlVOi4Zg876sRXKb+UucLyRXf8QAOqrOW4bXIZwPBooHQkolHUI2v+RGAYoJI/v
 KSuWVO2DrB1OupTnjJa3NHPnqfAfhMmDsdZjJf9Lm5ZOxbsIk/8ObJgMZGQ7hrJJ2D1w
 5hHJUWW7g70uob4etk+yUidEiVlhawhC50cr/a7VfrLnhPpp+P/tdgoTsnarW5Ic3mmN
 nj6A==
X-Gm-Message-State: AOJu0Yzof3kCApO0MSszqKfupPKK+Uk3ZQ/PXpoq55rrZWdWEPXIQrLn
 IyVdMqDxlIdsPP2A3hTv9P2MHUq/kmkX2nY7rRZrJ+jaxVym8hx03dtT3fWyEFgcvfodP3rX95j
 sgqWnIoSh6ppGK9GBuw==
X-Received: by 2002:a05:6402:b21:b0:52f:2bd3:6f4d with SMTP id
 bo1-20020a0564020b2100b0052f2bd36f4dmr10712116edb.0.1696265796848; 
 Mon, 02 Oct 2023 09:56:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqagLrCikU52L0VMu7n6OV1okp1JBA4Kg3kTiLz2kxJDH1BQpGpcWHf2+QqO17IWKsLJN0tg==
X-Received: by 2002:a05:6402:b21:b0:52f:2bd3:6f4d with SMTP id
 bo1-20020a0564020b2100b0052f2bd36f4dmr10712107edb.0.1696265796553; 
 Mon, 02 Oct 2023 09:56:36 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:48f9:bea:a04c:3dfe?
 ([2001:b07:6468:f312:48f9:bea:a04c:3dfe])
 by smtp.googlemail.com with ESMTPSA id
 v10-20020aa7cd4a000000b0052ff9bae873sm15727035edw.5.2023.10.02.09.56.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Oct 2023 09:56:35 -0700 (PDT)
Message-ID: <f0fee08b-7d4d-90ab-7961-21324f5c0b5c@redhat.com>
Date: Mon, 2 Oct 2023 18:56:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] Fix compilation when UFFDIO_REGISTER is not set.
To: Michael Tokarev <mjt@tls.msk.ru>, Pierre Labatut <plabatut@google.com>,
 qemu-trivial@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20230928125700.1504442-1-plabatut@google.com>
 <9e380190-4147-fc73-3205-112cb854f25a@tls.msk.ru>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <9e380190-4147-fc73-3205-112cb854f25a@tls.msk.ru>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.321, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 02 Oct 2023 16:56:42 -0000

On 10/2/23 13:56, Michael Tokarev wrote:
> 28.09.2023 15:56, Pierre Labatut wrote:
>> Signed-off-by: Pierre Labatut <plabatut@google.com>
>> ---
>>   subprojects/libvhost-user/libvhost-user.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> I'm not sure how subprojects are handled here.  Should we commit things
> to a subproject directly? This one does not seem to be wrapped at least,
> and has been in contrib/ before moving to subprojects/, so seems to be
> ok.

Yes, subprojects either are hosted directly in qemu.git (they're just a 
nested build system), or they replace a submodule and have a .wrap file 
(and then the patch won't apply).  libvhost-user is of the former kind.

Paolo


