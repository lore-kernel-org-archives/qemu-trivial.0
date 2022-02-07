Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nGxFi-0002b4-LU
	for mharc-qemu-trivial@gnu.org; Mon, 07 Feb 2022 01:11:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nGxFa-0002aG-5x
 for qemu-trivial@nongnu.org; Mon, 07 Feb 2022 01:11:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nGxFW-0005Fx-C9
 for qemu-trivial@nongnu.org; Mon, 07 Feb 2022 01:11:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644214299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7xi89ZnhcvtOL1ZBfDcWvRmyB8v8kO2JALHT6IQugTo=;
 b=HDeOqXJBqn0VERFZ90GOe9+Y40UlqnKJJBmw2NKxNGqwuwFozk7YOuBMVlswRT0lsmbg4b
 aouzRzOblwHfkAf/gYkOnzJBDBVaNliyFoto/c19uqhFPT0L44q8aeachulwPVaxDEakas
 p3cu0+EkJZZdN41B4PXys+ZQc1oNuFQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-371-J8TgjNK-MrWn8WUpwZxiPg-1; Mon, 07 Feb 2022 01:11:37 -0500
X-MC-Unique: J8TgjNK-MrWn8WUpwZxiPg-1
Received: by mail-wr1-f71.google.com with SMTP id
 l27-20020adfa39b000000b001e315c20064so343841wrb.10
 for <qemu-trivial@nongnu.org>; Sun, 06 Feb 2022 22:11:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7xi89ZnhcvtOL1ZBfDcWvRmyB8v8kO2JALHT6IQugTo=;
 b=ihIcJ8m70mETA4f83c9q1TOz/dN0V1QN/Aawf6XA2siPU78AZTYq2dJKSkn++QgnhQ
 uLxSxqCJ6G5QvixX0f1b9+m2ENsC5m0PUu06O6WnelEh20TqBU0JrbURocCsIAmTzWjS
 piX5bAeerWYH4zmui4zUZTlwPKgYinyAyX19ZN+PzGynrdznwqHFJ97YfNzErYOG4XFp
 kwa5Mggz7+OUP7ooBLm0bCa8RHv/zPKn0S0TlmcTj0LjmVLk1Yw+SyeFkCNfs4YBF49W
 +KAG1l2CeIAdgTOARyXrdv9EhQjUi+3KYPZFfAiHhk4b5wwvJDivllkHShXF87orzEZQ
 FHOw==
X-Gm-Message-State: AOAM5311y8SdY5P0lSo9X1TQd0uw1FhFuHx22IPwZh1YTyEGSG4Tb3Rj
 45z2aiRyzNuVVHViUDZbk0ww6/mACmdkbQUt6vXCLzyjogVRtYrr3Kmad2nWmGnpPgg43l6osKf
 UEcoZ1i20Y9w1DDVdmg==
X-Received: by 2002:a1c:6a14:: with SMTP id f20mr12738495wmc.123.1644214296878; 
 Sun, 06 Feb 2022 22:11:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzlY1cD13kvCn996HduilKxyJImZcFTrTF3nVYBVq+j08rL2xF0lFACBq18GgTYAx1XT2Y/lQ==
X-Received: by 2002:a1c:6a14:: with SMTP id f20mr12738485wmc.123.1644214296707; 
 Sun, 06 Feb 2022 22:11:36 -0800 (PST)
Received: from [192.168.8.100] (tmo-096-196.customers.d1-online.com.
 [80.187.96.196])
 by smtp.gmail.com with ESMTPSA id o10sm4130252wri.69.2022.02.06.22.11.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Feb 2022 22:11:36 -0800 (PST)
Message-ID: <773614b0-cb96-8d6c-ff0b-a608bfcd9671@redhat.com>
Date: Mon, 7 Feb 2022 07:11:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] erst: drop cast to long long
To: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
Cc: Eric DeVolder <eric.devolder@oracle.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20220206093547.1282513-1-mst@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220206093547.1282513-1-mst@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
X-List-Received-Date: Mon, 07 Feb 2022 06:11:48 -0000

On 06/02/2022 10.35, Michael S. Tsirkin wrote:
> The way to print uint64_t is with PRIx64, not with
> a cast to long long.
> 
> Cc: Eric DeVolder <eric.devolder@oracle.com>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>   tests/qtest/erst-test.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/qtest/erst-test.c b/tests/qtest/erst-test.c
> index c6a0ae4013..f94cd8dd8e 100644
> --- a/tests/qtest/erst-test.c
> +++ b/tests/qtest/erst-test.c
> @@ -75,7 +75,7 @@ static inline uint64_t in_reg64(ERSTState *s, unsigned reg)
>       uint64_t res;
>   
>       res = qpci_io_readq(s->dev, s->reg_bar, reg);
> -    g_test_message("*%s -> %016llx", name, (unsigned long long)res);
> +    g_test_message("*%s -> %016" PRIx64, name, res);
>   
>       return res;
>   }

Reviewed-by: Thomas Huth <thuth@redhat.com>


