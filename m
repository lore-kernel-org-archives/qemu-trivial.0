Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qZZNx-0002um-EU
	for mharc-qemu-trivial@gnu.org; Fri, 25 Aug 2023 12:10:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qZZNt-0002u0-9H
 for qemu-trivial@nongnu.org; Fri, 25 Aug 2023 12:10:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qZZNo-0006lc-FU
 for qemu-trivial@nongnu.org; Fri, 25 Aug 2023 12:10:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1692979796;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u6JaF77xm8eS1JTMn6tJ8s/tT8+/+Worac655JTupZc=;
 b=LeifZjWB9qmM4CElVJhpgAlls16UVvB9b4S5gayF9ZazQnara7MOvlwtb8lc5BsXohbxxk
 PYBDiQ1Ihfu5M/IcXmBLhthudDgHSISuJwWmWWcleuM3khfd6x02hiJqlDyvnpd6tCjE8f
 KRyUV4NbU5805j67B6uYDvihnRfwW/U=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-232-KRkcLAhBOCyAlTtI8JZajw-1; Fri, 25 Aug 2023 12:09:55 -0400
X-MC-Unique: KRkcLAhBOCyAlTtI8JZajw-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4011f56165eso11991135e9.0
 for <qemu-trivial@nongnu.org>; Fri, 25 Aug 2023 09:09:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692979794; x=1693584594;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=u6JaF77xm8eS1JTMn6tJ8s/tT8+/+Worac655JTupZc=;
 b=cvO1v/wW7NAntnxGDTu7kZqVz/CvHrs8EhNYtv1aCIfqdUQmya8j628IIrKJIAZPSB
 GZBxghbuKStpCbIgYcvznUhVwFlO1m5QpGMDuEToBaLrGo77A2y8PSQQI5GMZh3XQDfD
 /YOkcN53r84wKHGvNL86MePfmg2vUUtOxccGky68oS+m86wHHQBywDu1qz5I1K0lPpFj
 6Y8WT2is/gDSmuHdQhLRkXMN/E9bDePVNADDBRMYVFK8iMk6lDau6wiBkDcK4NMkOwdv
 LGzV+B1p8XeQSW4krL/2N2fAAppYRgXD5KWFQOpUs27jcfOUQVJ6FN3QaSo2CezPKppW
 FfvQ==
X-Gm-Message-State: AOJu0YxBVe5oOtdPm3hry+S861Wp3nsTaMCaqAZWbPWHFnRrrVSFAAWd
 iwIi8B//s4/65/26iOaJytdjO6g1j3P9DWofVNWOa6qVrhZnHatBCPbZOHFuiO1YhLiXjQ5OJHY
 EBDwUoKijcbFP7QdgiQ==
X-Received: by 2002:a05:600c:1e85:b0:401:bcec:be3e with SMTP id
 be5-20020a05600c1e8500b00401bcecbe3emr699629wmb.17.1692979794218; 
 Fri, 25 Aug 2023 09:09:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlgAeVwTjrb/2llpvAB/Z6uvQKxWAERXXexau6ALJEwfX1RSKfkNrJu2WHk9f7mwBcu2JFTw==
X-Received: by 2002:a05:600c:1e85:b0:401:bcec:be3e with SMTP id
 be5-20020a05600c1e8500b00401bcecbe3emr699614wmb.17.1692979793840; 
 Fri, 25 Aug 2023 09:09:53 -0700 (PDT)
Received: from [192.168.8.103] (tmo-099-164.customers.d1-online.com.
 [80.187.99.164]) by smtp.gmail.com with ESMTPSA id
 21-20020a05600c231500b003fc0505be19sm2564312wmo.37.2023.08.25.09.09.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Aug 2023 09:09:53 -0700 (PDT)
Message-ID: <dc4980ae-1045-321c-cf65-0fef97bd8f05@redhat.com>
Date: Fri, 25 Aug 2023 18:09:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/2] tests/qtest/test-hmp: Fix migrate_set_parameter
 xbzrle-cache-size test
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: kwolf@redhat.com, hreitz@redhat.com, dave@treblig.org,
 qemu-block@nongnu.org, berrange@redhat.com, dgilbert@redhat.com,
 qemu-trivial@nongnu.org
References: <20230825155923.1983141-1-armbru@redhat.com>
 <20230825155923.1983141-3-armbru@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230825155923.1983141-3-armbru@redhat.com>
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
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.57, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
X-List-Received-Date: Fri, 25 Aug 2023 16:10:05 -0000

On 25/08/2023 17.59, Markus Armbruster wrote:
> The command always fails with "Error: Parameter 'xbzrle_cache_size'
> expects a power of two no less than the target page size".  The test
> passes anyway.  Change the argument from 1 to 64k to make the test a
> bit more useful.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   tests/qtest/test-hmp.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/qtest/test-hmp.c b/tests/qtest/test-hmp.c
> index c0d2d70689..fc9125f8bb 100644
> --- a/tests/qtest/test-hmp.c
> +++ b/tests/qtest/test-hmp.c
> @@ -45,7 +45,7 @@ static const char *hmp_cmds[] = {
>       "log all",
>       "log none",
>       "memsave 0 4096 \"/dev/null\"",
> -    "migrate_set_parameter xbzrle-cache-size 1",
> +    "migrate_set_parameter xbzrle-cache-size 64k",
>       "migrate_set_parameter downtime-limit 1",
>       "migrate_set_parameter max-bandwidth 1",
>       "netdev_add user,id=net1",

Reviewed-by: Thomas Huth <thuth@redhat.com>


