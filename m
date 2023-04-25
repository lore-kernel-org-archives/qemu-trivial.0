Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1prErU-00070T-9v
	for mharc-qemu-trivial@gnu.org; Tue, 25 Apr 2023 05:21:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1prErS-0006zs-PT
 for qemu-trivial@nongnu.org; Tue, 25 Apr 2023 05:21:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1prErP-0004wl-Ey
 for qemu-trivial@nongnu.org; Tue, 25 Apr 2023 05:21:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682414477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MN9oXgsc8DHoo1VpyjDGkHB8D0MhxIlnzkrg3+EvyyI=;
 b=aGZ/on9nG7bNvfy4DgDwdXyl2eiDNRTiS9i1y14j2wViga5oKgERkrCFDRMJN44KB2e8UU
 3t4KhJPrsTg2sgVX6OZ2A2F5ELGdj7p7bm4nrPDMjBzGyAc/6dR3RxuhPiSaqjq7aZYrMd
 hg1nwNyXajOMujNo9ANVBBNb3gh0P8w=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-483-I4K95331OLeSnmv7dmusZw-1; Tue, 25 Apr 2023 05:21:16 -0400
X-MC-Unique: I4K95331OLeSnmv7dmusZw-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3f18b63229bso53597635e9.0
 for <qemu-trivial@nongnu.org>; Tue, 25 Apr 2023 02:21:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682414474; x=1685006474;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MN9oXgsc8DHoo1VpyjDGkHB8D0MhxIlnzkrg3+EvyyI=;
 b=XjevcjlJSlphVQ4/w3uQ4NmtgSmnV4lo8dBKZ7XgFYboS7oHFOTXMuYVUjPqeyaWu1
 aWdGCB8i1wrhUeS9kVGb7s/HF+4bd51WdGdFapVYIIVAtNcDLwTfrbQgnt9vp5/4Hrdq
 4+XLLsmJuRxdiKFW6Dg0oSMOrmXR2dPeJOzJQddPCdaRwIbtBkua6o1wnSZxBMaRQ3/N
 FlEDQxqgLToRX5wv9MB6I5+HHd+5/v7Ot/joJXG2gLF9U+V6SwFd7selmZZkoWvy+eit
 MAHtNHFZYqjsOY/1X9mhyZHLDrbb5fzLyUcTJ7BOZXQNn70rPdKNUL2cWVddAvl2Oi7a
 K2WQ==
X-Gm-Message-State: AAQBX9daEAHLbri5S8cDauuEE0T+RNNNdgcloATnFCcSrd7HFsEal18S
 RfVVXwG0bBDmaFfy2I3wTrmc+qChLOrh2etXviAUpBquZHTdE2duTNj9jVIws8nSqACOaAzb5R0
 QfTlkn8MGdD2sLuZ1nQ==
X-Received: by 2002:a1c:4c13:0:b0:3f1:72f2:25c4 with SMTP id
 z19-20020a1c4c13000000b003f172f225c4mr9575516wmf.13.1682414474871; 
 Tue, 25 Apr 2023 02:21:14 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZLuSp7XDFOpHgXeBZjKve/FX0TjkCPYNbEdM9TBWh3dDFfTkStP/iM10UGGNvuhPtP6ffuJg==
X-Received: by 2002:a1c:4c13:0:b0:3f1:72f2:25c4 with SMTP id
 z19-20020a1c4c13000000b003f172f225c4mr9575496wmf.13.1682414474606; 
 Tue, 25 Apr 2023 02:21:14 -0700 (PDT)
Received: from [10.33.192.205] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 m7-20020a5d4a07000000b002c55521903bsm12609942wrq.51.2023.04.25.02.21.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Apr 2023 02:21:14 -0700 (PDT)
Message-ID: <90e96d55-fc8b-52ec-6747-4fecd10e9e10@redhat.com>
Date: Tue, 25 Apr 2023 11:21:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] aspeed/hace: Initialize g_autofree pointer
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@aj.id.au>, Steven Lee <steven_lee@aspeedtech.com>,
 Joel Stanley <joel@jms.id.au>, QEMU Trivial <qemu-trivial@nongnu.org>
References: <20230421131547.2177449-1-clg@kaod.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230421131547.2177449-1-clg@kaod.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.194, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 25 Apr 2023 09:21:23 -0000

On 21/04/2023 15.15, Cédric Le Goater wrote:
> As mentioned in docs/devel/style.rst "Automatic memory deallocation":
> 
> * Variables declared with g_auto* MUST always be initialized,
>    otherwise the cleanup function will use uninitialized stack memory
> 
> This avoids QEMU to coredump when running the "hash test" command
> under Zephyr.
> 
> Cc: Steven Lee <steven_lee@aspeedtech.com>
> Cc: Joel Stanley <joel@jms.id.au>
> Fixes: c5475b3f9a ("hw: Model ASPEED's Hash and Crypto Engine")
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   hw/misc/aspeed_hace.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
> index 12a761f1f5..b07506ec04 100644
> --- a/hw/misc/aspeed_hace.c
> +++ b/hw/misc/aspeed_hace.c
> @@ -189,7 +189,7 @@ static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode,
>                                 bool acc_mode)
>   {
>       struct iovec iov[ASPEED_HACE_MAX_SG];
> -    g_autofree uint8_t *digest_buf;
> +    g_autofree uint8_t *digest_buf = NULL;

We maybe need a checkpatch.pl rule to catch such bugs...

Reviewed-by: Thomas Huth <thuth@redhat.com>


