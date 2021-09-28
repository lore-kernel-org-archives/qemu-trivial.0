Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mVAdb-0001tJ-V4
	for mharc-qemu-trivial@gnu.org; Tue, 28 Sep 2021 06:47:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mVAdW-0001r0-Ug
 for qemu-trivial@nongnu.org; Tue, 28 Sep 2021 06:46:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mVAdR-0006nT-W5
 for qemu-trivial@nongnu.org; Tue, 28 Sep 2021 06:46:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632826013;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e+E+OQyuRr04ezd3Dkr8PDTZR+4wCJD5xibUm1NThzA=;
 b=Vkza8lyWqkToxfcyHlHtbJ7nZ1eZGhUzfCde2dxVAaP9h8BxhSefoTU/aWQ9uo9meZsrQU
 2/yjKEFBr7siUnRpFOPGOfsix8oT3bM5Bq/mt2F7L8Z2NbdWM9qWYhlAJKZQbTDQelcfqe
 QIEwHZ6aZ36qemSOVXZyfz1g7qv8zeM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-rZGPlUTSP96kTCe6BSVHLg-1; Tue, 28 Sep 2021 06:46:51 -0400
X-MC-Unique: rZGPlUTSP96kTCe6BSVHLg-1
Received: by mail-wr1-f70.google.com with SMTP id
 f11-20020adfc98b000000b0015fedc2a8d4so15049172wrh.0
 for <qemu-trivial@nongnu.org>; Tue, 28 Sep 2021 03:46:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=e+E+OQyuRr04ezd3Dkr8PDTZR+4wCJD5xibUm1NThzA=;
 b=jLEQLSjc70BQ+lkzouWV6szs0cNJHlcN5xk5tjn7mIucrMxPEWhI2E2ha2V6cJq6qs
 d78oCsFnpp9J0GZQbTizCkJntNyz1aClD/w3/X9k54MrUAZD0NyiQluSBtqPQ/g8TbeG
 QP+8wgu/Trbbcnnf+IkTTbFPpkt6QmPG1IPRO018wb0xbd5cBB7QJwKQvw2USQ4/p+tG
 sGRyexJ6rWFc0EeXZMoH6tk/oIQ0zcbSm5VKw6dlXxELNJuArKMx6n7Xozh1uGXYqUdr
 h7HApXU0vW4wDja+LhyxpghFUrNYHvITzgozelk6fQiamGvIsrdx9uvyJY4Ldd5CIGCx
 Z9nQ==
X-Gm-Message-State: AOAM530Qg6b4s9gR5g+Ag3efg2JO1SF1QEE/UJE7OzmoDZH96gpI+RvV
 QMflggMvcCz2hcXo8HMvpOCkhhz6teLon42hLT5Oi20WE4E81DpxnYtGhG0qMzZlubIVzKLmPIj
 KE3PFWddNGX6btGPtkA==
X-Received: by 2002:a5d:4810:: with SMTP id l16mr5567781wrq.3.1632826010753;
 Tue, 28 Sep 2021 03:46:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw46BYGIBjzwhSQxupnHMq0/Li4KPfFWoXvG5sqUz9W7gOr7Ua20yVyRYOyFDKJvGI/BCm+zQ==
X-Received: by 2002:a5d:4810:: with SMTP id l16mr5567761wrq.3.1632826010498;
 Tue, 28 Sep 2021 03:46:50 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id g21sm2280904wmk.10.2021.09.28.03.46.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Sep 2021 03:46:50 -0700 (PDT)
Message-ID: <9728083c-059c-3990-f651-3fbdce86491c@redhat.com>
Date: Tue, 28 Sep 2021 12:46:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 2/2] qemu-options: Add missing "sockets=2" to CLI "-smp 2"
To: Yanan Wang <wangyanan55@huawei.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Cc: wanghaibin.wang@huawei.com, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
References: <20210928093157.14620-1-wangyanan55@huawei.com>
 <20210928093157.14620-3-wangyanan55@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20210928093157.14620-3-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.562, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 28 Sep 2021 10:46:59 -0000

On 9/28/21 11:31, Yanan Wang wrote:
> There is one example of -smp CLI in qemu-options.hx currently
> using "-smp 2" and assuming that there will be 2 sockets.
> However now the actually calculation logic of missing sockets
> and cores is not immutable, we should use more explicit CLIs
> like "-smp 2,sockets=2" if we want multiple sockets.
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  qemu-options.hx | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/qemu-options.hx b/qemu-options.hx
> index dcd9595650..ff8917c5e1 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -395,7 +395,7 @@ SRST
>          -m 2G \
>          -object memory-backend-ram,size=1G,id=m0 \
>          -object memory-backend-ram,size=1G,id=m1 \
> -        -smp 2 \
> +        -smp 2,sockets=2,maxcpus=2 \

Is the addition of "maxcpus=2" intentional?

>          -numa node,nodeid=0,memdev=m0 \
>          -numa node,nodeid=1,memdev=m1,initiator=0 \
>          -numa cpu,node-id=0,socket-id=0 \
> 


