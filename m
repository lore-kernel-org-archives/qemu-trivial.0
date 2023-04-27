Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ps1Ah-0004Fz-6v
	for mharc-qemu-trivial@gnu.org; Thu, 27 Apr 2023 08:56:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ps1Ag-0004DD-9T
 for qemu-trivial@nongnu.org; Thu, 27 Apr 2023 08:56:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ps1Ae-0004mH-O7
 for qemu-trivial@nongnu.org; Thu, 27 Apr 2023 08:56:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682600182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IfclxeSdUSyg5QrSLqcHhq+pSnFVJv1yUJYwKGUdf4c=;
 b=Nc40K73rF7t/zYfFA/DtoDyr1IFjGIPvXBeUip5XAscoURRP7QRiBP2Si+Id21m7AzALbN
 F6wJbxAO7q3RYHR+vpLxjcTDXvAFNxxHxx7QDlv9mJ0VGsHcjgiQxkQIBrBEKBBW0HCiuh
 AyLMse5Lpklp5c39Ua/geFsKukn4tN0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-348-KKfwGFprMW6v1raN1_fatw-1; Thu, 27 Apr 2023 08:56:21 -0400
X-MC-Unique: KKfwGFprMW6v1raN1_fatw-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f1757ebb1eso30189955e9.2
 for <qemu-trivial@nongnu.org>; Thu, 27 Apr 2023 05:56:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682600180; x=1685192180;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IfclxeSdUSyg5QrSLqcHhq+pSnFVJv1yUJYwKGUdf4c=;
 b=hI6GxwWekaVvCUPjA7odX1erqaqCeJwtqhBewiRXcjOJdxog2HSyRmzqjV9HIPWFCp
 uyBsgQnhno8UMp7f+a64TCKZ0C4/6MvDK17iLKPTLdNmkCDY+Wr0jO2u7yOWaTGYAag4
 THdRB+wTybdrD0ApV/V43izXGvTlrW9xbwfyluOTsu1Wm4r6hRyq0g7TNwysiCAR5R7O
 MB9197joghDn5JVX5oShXeKjlARhcZm4Wo3hTJW6QXAvhe059cQDZOJxfzWw4lNpcCx+
 GU9OzelhfUtypZySRa4gPk+n57rY496pX6Hei6zEyXPZXbbY3TcQWVJ9jy+Hb7iH+xZh
 OJJg==
X-Gm-Message-State: AC+VfDyw/cmHkqZoS+hxMD1v9M4njvLn2FZOvWkh9y8GKnJJyNZl8Beq
 7lz1Tzif2wTlFKk9KZL9KCXzgZNkC95w+NXX8jAERtoQnf/2Ih7oxfOAHaAEJQMnbA2h2QkhSdU
 YjdA1CEXEU+NNfPZGFQ==
X-Received: by 2002:a7b:cb8c:0:b0:3ee:6cdf:c357 with SMTP id
 m12-20020a7bcb8c000000b003ee6cdfc357mr1419453wmi.20.1682600180082; 
 Thu, 27 Apr 2023 05:56:20 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5vZ1hF6lrpvBQpu6xUI14t+rQJqjlNyuX/dy+gdY36TXRQy7F/QS7TxMkvCsufd+8kDf42Dg==
X-Received: by 2002:a7b:cb8c:0:b0:3ee:6cdf:c357 with SMTP id
 m12-20020a7bcb8c000000b003ee6cdfc357mr1419442wmi.20.1682600179825; 
 Thu, 27 Apr 2023 05:56:19 -0700 (PDT)
Received: from [10.33.192.205] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 o10-20020a1c750a000000b003f191c9c4b0sm17943557wmc.11.2023.04.27.05.56.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Apr 2023 05:56:19 -0700 (PDT)
Message-ID: <58980d6b-7c33-0663-3712-7a07dc0d33ff@redhat.com>
Date: Thu, 27 Apr 2023 14:56:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] tests: vhost-user-test: release mutex on protocol
 violation
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: mst@redhat.com, qemu-trivial@nongnu.org
References: <20230427125423.103536-1-pbonzini@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230427125423.103536-1-pbonzini@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.422, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Thu, 27 Apr 2023 12:56:26 -0000

On 27/04/2023 14.54, Paolo Bonzini wrote:
> chr_read() is printing an error message and returning with s->data_mutex taken.
> This can potentially cause a hang.  Reported by Coverity.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   tests/qtest/vhost-user-test.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/qtest/vhost-user-test.c b/tests/qtest/vhost-user-test.c
> index bf9f7c4248ca..e4f95b2858f0 100644
> --- a/tests/qtest/vhost-user-test.c
> +++ b/tests/qtest/vhost-user-test.c
> @@ -351,7 +351,7 @@ static void chr_read(void *opaque, const uint8_t *buf, int size)
>           if (size != msg.size) {
>               qos_printf("%s: Wrong message size received %d != %d\n",
>                          __func__, size, msg.size);
> -            return;
> +            goto out;
>           }
>       }
>   
> @@ -509,6 +509,7 @@ static void chr_read(void *opaque, const uint8_t *buf, int size)
>           break;
>       }
>   
> +out:
>       g_mutex_unlock(&s->data_mutex);
>   }
>   

Reviewed-by: Thomas Huth <thuth@redhat.com>


