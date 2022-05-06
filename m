Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nmqZh-0007Mq-MG
	for mharc-qemu-trivial@gnu.org; Fri, 06 May 2022 01:32:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nmqZX-0007M2-8U
 for qemu-trivial@nongnu.org; Fri, 06 May 2022 01:32:12 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.133.74]:60205)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nmqZT-0001Mi-Q4
 for qemu-trivial@nongnu.org; Fri, 06 May 2022 01:32:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651815127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SUpY1J6F01Hx9ZhMvKP034OpvEhdt7W+srEg5e6h3y4=;
 b=eT5rRsI6O5hye5M1nFYGzFJGUwBEz4sjZWHu/8Z8Z44GBQpyfXVSj5IwKn2D+dWPu0DNM8
 5BrKGJZGBmWfB7m3j0u0pMGX7q91CAs14tHWZe2/e8GmHS0B75wGtAwNoG1WsW3no5QTMB
 878FmxaDiiWvsehqM6UG/d7K1120qB8=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-92-2LSZhRfPNuWnReUTVCNUng-1; Fri, 06 May 2022 01:32:05 -0400
X-MC-Unique: 2LSZhRfPNuWnReUTVCNUng-1
Received: by mail-qv1-f71.google.com with SMTP id
 m8-20020a0c9d08000000b00456549a0589so5169540qvf.2
 for <qemu-trivial@nongnu.org>; Thu, 05 May 2022 22:32:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SUpY1J6F01Hx9ZhMvKP034OpvEhdt7W+srEg5e6h3y4=;
 b=aOFKqD0IkpKpL6HKJv8WxJ8RQ5anLQS0bi0TEwBoAyLH1avVuGXxZvR5mY/XxFIKFJ
 3KPoyE9ANggp9IYXgGtSKY57wLiXxC8AGkm0IhTXWtv7TYAwoNPcI4+fXq4/w6cF3AcI
 UpgFTSJNn9jgHGINa/KEzyC+p1+nhb8zvW+LiXNG1Yil10ABSC2j9uxdYkez8PNAxpxV
 9AUwIssu9Ic8SeWbCa+2Ox3GKwYrd/zxoVk2063w/9XthjIcpueR3+1kTZI3ULfSAfbc
 k40amxyJkHMqRnNFfDHDuJd3njV2lYCA+n7jKAUArzCRu3KrfZ2TNygT9IocQBszsSj8
 fRdg==
X-Gm-Message-State: AOAM530+ylXtutAINUfu0gDrLSUXoS1yXYCu5GwZfVNlk9/mthd/xBXF
 io6M4v1BWCrs/K4Omq3FhhheOaqrElH45VP/Pybr3exC4X9C7mDWU/riEE584XVmZSEc6lp4rmO
 MXKQa7ZXE2dTd9vupTg==
X-Received: by 2002:ac8:5b93:0:b0:2f3:9b90:34a5 with SMTP id
 a19-20020ac85b93000000b002f39b9034a5mr1279412qta.677.1651815125162; 
 Thu, 05 May 2022 22:32:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzJsJpKOxUrjiWsfd830mUdBUNscIgO1yMB8RqoOKFrfywGY8r6vYrkyZPA2kJaw82SFggqkQ==
X-Received: by 2002:ac8:5b93:0:b0:2f3:9b90:34a5 with SMTP id
 a19-20020ac85b93000000b002f39b9034a5mr1279389qta.677.1651815124852; 
 Thu, 05 May 2022 22:32:04 -0700 (PDT)
Received: from [192.168.8.104] (tmo-082-126.customers.d1-online.com.
 [80.187.82.126]) by smtp.gmail.com with ESMTPSA id
 x9-20020ac84d49000000b002f39b99f677sm2041808qtv.17.2022.05.05.22.32.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 May 2022 22:32:04 -0700 (PDT)
Message-ID: <309ab0f5-7bb0-ddb4-3736-8cf0a4cfb269@redhat.com>
Date: Fri, 6 May 2022 07:31:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH][RESEND] MAINTAINERS: Add myself as a reviewer for Hyper-V
 VMBus
To: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org
References: <7ecb5ece9d1e0a607e801d547d387bc840b250ea.1651779343.git.maciej.szmigiero@oracle.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <7ecb5ece9d1e0a607e801d547d387bc840b250ea.1651779343.git.maciej.szmigiero@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.74; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 06 May 2022 05:32:15 -0000

On 05/05/2022 21.36, Maciej S. Szmigiero wrote:
> From: "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>
> 
> This way there is at least some contact point for incoming patches.
> 
> We'll see whether the code still gets just a random patch a few times
> a year or whether it requires a permanent maintainer to take care of it.
> 
> Signed-off-by: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
> ---
>      Resending, since the previous submission at [1] wasn't picked up.
>      
>      [1]: https://lore.kernel.org/qemu-devel/b145dcf08ae606e9d29e55b2f701a3fe4f16b347.1637433881.git.maciej.szmigiero@oracle.com/
> 
>   MAINTAINERS | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 218c9459b6..907f1d4a88 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1776,6 +1776,12 @@ F: include/hw/block/fdc.h
>   F: tests/qtest/fdc-test.c
>   T: git https://gitlab.com/jsnow/qemu.git ide
>   
> +Hyper-V VMBus
> +S: Odd Fixes
> +R: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
> +F: hw/hyperv/vmbus.c
> +F: include/hw/hyperv/vmbus*.h

If there's no dedicated maintainer, I'd rather pick "Orphan" instead of "Odd 
Fixes" here? Who's supposed to pick up the related patches?

  Thomas


