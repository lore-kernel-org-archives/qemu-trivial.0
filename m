Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m9SXr-0007PN-0d
	for mharc-qemu-trivial@gnu.org; Fri, 30 Jul 2021 09:27:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m9SXp-0007OS-Po
 for qemu-trivial@nongnu.org; Fri, 30 Jul 2021 09:27:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m9SXh-0000yM-Dt
 for qemu-trivial@nongnu.org; Fri, 30 Jul 2021 09:27:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627651631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A/A3McV4BbQguDgDZtklzUxZfJl50b5u1fiu7wrDVJ0=;
 b=WQCIzarfdNP0Pb4FQnN3POnvrZ6SsJ+r9nFniskdqHjPN7VjSD9djWj2UpiKHI2q5WKIde
 q2o34HIXFExicOOiqqlBBLgGrwLvDHNOcF5di9lAgSyXrroOH013Kgdtcwa5d9b9SRTFkk
 YIvPBYKGtapv2awrG/BkucJcWlRrtiA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-pfPcYzONPMm32Z4ecXJNsA-1; Fri, 30 Jul 2021 09:27:10 -0400
X-MC-Unique: pfPcYzONPMm32Z4ecXJNsA-1
Received: by mail-wr1-f70.google.com with SMTP id
 r17-20020adfda510000b02901526f76d738so3237519wrl.0
 for <qemu-trivial@nongnu.org>; Fri, 30 Jul 2021 06:27:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=A/A3McV4BbQguDgDZtklzUxZfJl50b5u1fiu7wrDVJ0=;
 b=Urd3/qYmVyRdBHXbQA7U46IzSw01c8HDdb4kRYJzf3kBOzpoSS85dEmWQCC5fSnJNF
 CiTN7azdcbuiXEc20QMiPXogC1GZVyTSiyj7DF9gag38adUvISR989ps2MpuU5ZB4RVi
 eI8P70VkS3NuugVC7NJqAgg6U2fV0IdGxLkkjWeoJw41zAdLDQfZOZQ02DgHZlIn0zxm
 UcagIO5lW7ylAucB4J5h04cQubCOoxa0m3CTCyrHGFv07bTdeI1S9TEMu8lkrQBZQ03V
 A1K7jeLHOg5MiupNGzzxazsdGBc8NwTAR6+dlWsnVttgTted1A+pcdDWnsppeJrg1KPn
 ozsw==
X-Gm-Message-State: AOAM532BzTexagz2N2sFbodSZmDWePQXIbYB6M09Ln1MbJ/+3OkFtMPT
 veNKFI5sfMLCVylypEut72Z4VqZxs0ju1kvr9pcM5k2r+MovvfBVndlZQmWgVM3EAU/D94Om/Op
 f+rX/P0TCSpudlhqKKRw7k4kbOPqLXDaDvS3//zrZolDs1+Xncu1wieXPaVtV9lnvrh0=
X-Received: by 2002:a5d:51cd:: with SMTP id n13mr2999804wrv.185.1627651628851; 
 Fri, 30 Jul 2021 06:27:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxRgUQjlSH76oHF/7269Ty8BOgdDUAONEpfFArWZa4zvygE+YVtAQ/vk4rKch0EoSqQF/Op4w==
X-Received: by 2002:a5d:51cd:: with SMTP id n13mr2999781wrv.185.1627651628601; 
 Fri, 30 Jul 2021 06:27:08 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id l7sm1633326wmj.9.2021.07.30.06.27.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 06:27:07 -0700 (PDT)
Subject: Re: [PATCH] intel_iommu: Fix typo in comments
To: Cai Huoqing <caihuoqing@baidu.com>, mst@redhat.com, peterx@redhat.com,
 jasowang@redhat.com
Cc: qemu-devel@nongnu.org, QEMU Trivial <qemu-trivial@nongnu.org>
References: <20210730014942.2311-1-caihuoqing@baidu.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <6305f2ce-5d58-7eac-1568-05b64f45d96f@redhat.com>
Date: Fri, 30 Jul 2021 15:27:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210730014942.2311-1-caihuoqing@baidu.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.125, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 30 Jul 2021 13:27:22 -0000

On 7/30/21 3:49 AM, Cai Huoqing wrote:
> Fix typo:
> *Unknwon  ==> Unknown
> *futher  ==> further
> *configed  ==> configured
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> ---
>  hw/i386/intel_iommu.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


