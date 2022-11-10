Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ot38S-0006cs-0T
	for mharc-qemu-trivial@gnu.org; Thu, 10 Nov 2022 03:42:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ot38O-0006aX-N6
 for qemu-trivial@nongnu.org; Thu, 10 Nov 2022 03:42:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ot38M-0003OR-LY
 for qemu-trivial@nongnu.org; Thu, 10 Nov 2022 03:42:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668069722;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mjG9CdLG8sgwONgHrpMJ1Gjmyv65c9CxHNl1wRVAcEQ=;
 b=ZtkY5ycghMHb43CamWKufEwenWdG3MUwi1QI0wDtEP3E5PzL3H3isEASw4yolzRW3toQCV
 1rCjrHMVjRNmOy+WqX7qEns7wA2xuOaUHYsvusk+ESZg3NFuNIPjw/ZT2RQoM+PMMHlo9j
 5olctZ3o2iBuB02OAWLAtYy90v5wUMg=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-353-n-Ycx3tOMyufod07mSxVFg-1; Thu, 10 Nov 2022 03:41:58 -0500
X-MC-Unique: n-Ycx3tOMyufod07mSxVFg-1
Received: by mail-pg1-f197.google.com with SMTP id
 p18-20020a63e652000000b0046b27534651so678034pgj.17
 for <qemu-trivial@nongnu.org>; Thu, 10 Nov 2022 00:41:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mjG9CdLG8sgwONgHrpMJ1Gjmyv65c9CxHNl1wRVAcEQ=;
 b=EbkyRKca2LpjJF2hi/PhumdgGiZ7qLxMKeh5ZIznaUGJ7T6zoWMkvXEioX5ndcodZo
 J6GI4ZzqD+xSBO+ZY+BU/UBgeWmOYHv//UpR62ULMgGgi+AwaL89IhR/UPNfU6NGkpfo
 jRPaSNALPaF/CsQLDuUFHrJV2HLDXHwbsAIN065IpZdjXJFkaRzmKzXYEPoaxrrh3/xy
 Vt+Yi6CApExZy2068Nsh9veq7t57M/kRTwmd2rPDjIkoQ/C1BpijO7IS9Xq1NW8fiUVl
 eo50SQ31CSHChwapDetbPb0St7MN75zQ34C2s7JfKUS1tmkm4l4mumBCGxd3fRbx8iTG
 fKsw==
X-Gm-Message-State: ACrzQf2EZUWSRlxduqm5UbBKTJUUrkzgPubBsYq16TuUzrCnKXNEV94Y
 hwYIeggS031igx9b26EBZbq/x+xuT0+Pp2iyzPuphrTjVNw2QMgPWTSrgRDxgRKqhfdIt5Kvq0V
 aDvmz322wV4gDABSQdQ==
X-Received: by 2002:a63:454d:0:b0:43c:e834:ec0 with SMTP id
 u13-20020a63454d000000b0043ce8340ec0mr56906744pgk.270.1668069717477; 
 Thu, 10 Nov 2022 00:41:57 -0800 (PST)
X-Google-Smtp-Source: AMsMyM6jOXDEDijanHATm5UPYim3hNODDRjQhMjdGMXWzAIiXgbamoQ1p8j8rAr4NYGN+1Zs7nj7lA==
X-Received: by 2002:a63:454d:0:b0:43c:e834:ec0 with SMTP id
 u13-20020a63454d000000b0043ce8340ec0mr56906734pgk.270.1668069717165; 
 Thu, 10 Nov 2022 00:41:57 -0800 (PST)
Received: from [10.33.192.232] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 b5-20020aa79505000000b0056bfd4a2702sm9592130pfp.45.2022.11.10.00.41.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Nov 2022 00:41:56 -0800 (PST)
Message-ID: <071437fe-49c6-8d4f-9061-416071a2a9fb@redhat.com>
Date: Thu, 10 Nov 2022 09:41:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 2/4] tulip: Remove unused variable
To: mrezanin@redhat.com, qemu-devel@nongnu.org
References: <cover.1668009030.git.mrezanin@redhat.com>
 <02e1560d115c208df32236df8916fed98429fda1.1668009030.git.mrezanin@redhat.com>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Jason Wang <jasowang@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <02e1560d115c208df32236df8916fed98429fda1.1668009030.git.mrezanin@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 10 Nov 2022 08:42:05 -0000

On 09/11/2022 16.57, mrezanin@redhat.com wrote:
> From: Miroslav Rezanina <mrezanin@redhat.com>
> 
> Variable n used in tulip_idblock_crc function is only incremented but never read.
> This causes 'Unused but set variable' warning on Clang 15.0.1 compiler.
> 
> Removing the variable to prevent the warning.
> 
> Signed-off-by: Miroslav Rezanina <mrezanin@redhat.com>
> ---
>   hw/net/tulip.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/hw/net/tulip.c b/hw/net/tulip.c
> index b9e42c322a..c2b3b1bdfa 100644
> --- a/hw/net/tulip.c
> +++ b/hw/net/tulip.c
> @@ -870,11 +870,10 @@ static const MemoryRegionOps tulip_ops = {
>   
>   static void tulip_idblock_crc(TULIPState *s, uint16_t *srom)
>   {
> -    int word, n;
> +    int word;
>       int bit;
>       unsigned char bitval, crc;
>       const int len = 9;
> -    n = 0;
>       crc = -1;
>   
>       for (word = 0; word < len; word++) {
> @@ -887,7 +886,6 @@ static void tulip_idblock_crc(TULIPState *s, uint16_t *srom)
>                   srom[len - 1] = (srom[len - 1] & 0xff00) | (unsigned short)crc;
>                   break;
>               }
> -            n++;
>               bitval = ((srom[word] >> bit) & 1) ^ ((crc >> 7) & 1);
>               crc = crc << 1;
>               if (bitval == 1) {

Reviewed-by: Thomas Huth <thuth@redhat.com>


