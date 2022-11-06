Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1orbld-0004kY-Do
	for mharc-qemu-trivial@gnu.org; Sun, 06 Nov 2022 04:16:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1orblc-0004kK-Bq
 for qemu-trivial@nongnu.org; Sun, 06 Nov 2022 04:16:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1orbla-0005xT-NG
 for qemu-trivial@nongnu.org; Sun, 06 Nov 2022 04:16:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667726192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lKK5ub85AjM+PKk6s6HZ410dvFHjyHsT80jsjz4kpm4=;
 b=OJHfsrKrfUmppH7IWaS40dPzcYrQC0nhAbP3rDYTVFWiIcYLUQtnEoLfhhjLNQQErGI06I
 NAbvtRVSno6nwfOcsBlH9ycPpOzss7bp/OKEdN1fY/zx4Os0seiXoJnrUaXiYtMR3gbp+1
 jxMGGCRH2om+xSAl/t1Hxo0sQna1E0M=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-615-KZG3ejGCO3Gkv3Vx_pio_A-1; Sun, 06 Nov 2022 04:16:31 -0500
X-MC-Unique: KZG3ejGCO3Gkv3Vx_pio_A-1
Received: by mail-wr1-f71.google.com with SMTP id
 t12-20020adfa2cc000000b0022adcbb248bso2002401wra.1
 for <qemu-trivial@nongnu.org>; Sun, 06 Nov 2022 01:16:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lKK5ub85AjM+PKk6s6HZ410dvFHjyHsT80jsjz4kpm4=;
 b=Uc3w/9Oy3Sfpufetk4eI98G5BmDUWT0XbzY2IpXxjsBVck0FVhRqIb1qUNX6mHTYy1
 Nwkrw8qgPVS3hGbE56xnPT/LGmK4xPo0B09OzVmzFvFYF2tBKOSat7zEW5NT4wYz4EpR
 Mir46NsvTMwUnm+l2n8ys6wXfDJ6sjYkboWuaz3NRsc2dlxZ2w10t7ik0X5Zh3ZwBKUI
 rgxiz1t7ftoydXY9mRKvRGWd6lMU5LkeEc/OqoeFi/KIR4YqPVbJ8jOkdkIY5oPL95W/
 vpLBR7bWS8JeDxW6YxgN4iLcPA1X7+GhQ4umynjSUaEZdVtWPgMQBxS7hhjdGp+UvlEo
 +biQ==
X-Gm-Message-State: ACrzQf3fLJEAFpB2NLQ5pTeMWzlDOp/y2iFPvm/fcrH+I0SIthdLRkpd
 ukv2SQUw+9/3zTNGPwGYv3ZTsXyflZ4Q6t+/jpRqxRW6oDHwA5eVsHouKmNBi0kPalEczCAgPHQ
 m9eeflsr6BogIjCjDpw==
X-Received: by 2002:adf:fc12:0:b0:236:9b2e:4843 with SMTP id
 i18-20020adffc12000000b002369b2e4843mr27303269wrr.620.1667726190492; 
 Sun, 06 Nov 2022 01:16:30 -0800 (PST)
X-Google-Smtp-Source: AMsMyM5rGIZgqGjMezEGlS0TVqklbBwAwvfz1GKt7xoBO3+bhPcZRlTYpFobLKvcIvGuorEfruLVsA==
X-Received: by 2002:adf:fc12:0:b0:236:9b2e:4843 with SMTP id
 i18-20020adffc12000000b002369b2e4843mr27303257wrr.620.1667726190275; 
 Sun, 06 Nov 2022 01:16:30 -0800 (PST)
Received: from [192.168.8.100] (tmo-067-175.customers.d1-online.com.
 [80.187.67.175]) by smtp.gmail.com with ESMTPSA id
 m42-20020a05600c092a00b003cf5ec79bf9sm4692191wmp.40.2022.11.06.01.16.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Nov 2022 01:16:29 -0800 (PST)
Message-ID: <ab438f25-2570-ce46-cd8b-a827f97f7d58@redhat.com>
Date: Sun, 6 Nov 2022 10:16:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH trivial for 7.2 1/2] hw/usb/hcd-xhci.c: spelling: tranfer
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
References: <20221105114851.306206-1-mjt@msgid.tls.msk.ru>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221105114851.306206-1-mjt@msgid.tls.msk.ru>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sun, 06 Nov 2022 09:16:36 -0000

On 05/11/2022 12.48, Michael Tokarev wrote:
> Fixes: effaf5a240e03020f4ae953e10b764622c3e87cc
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>   hw/usb/hcd-xhci.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/usb/hcd-xhci.c b/hw/usb/hcd-xhci.c
> index 8299f35e66..b89b618ec2 100644
> --- a/hw/usb/hcd-xhci.c
> +++ b/hw/usb/hcd-xhci.c
> @@ -796,7 +796,7 @@ static int xhci_ring_chain_length(XHCIState *xhci, const XHCIRing *ring)
>            */
>       } while (length < TRB_LINK_LIMIT * 65536 / TRB_SIZE);
>   
> -    qemu_log_mask(LOG_GUEST_ERROR, "%s: exceeded maximum tranfer ring size!\n",
> +    qemu_log_mask(LOG_GUEST_ERROR, "%s: exceeded maximum transfer ring size!\n",
>                             __func__);
>   
>       return -1;

Reviewed-by: Thomas Huth <thuth@redhat.com>


