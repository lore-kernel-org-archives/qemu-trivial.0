Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kolqF-0004sc-1n
	for mharc-qemu-trivial@gnu.org; Mon, 14 Dec 2020 06:16:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kolq1-0004q9-DE
 for qemu-trivial@nongnu.org; Mon, 14 Dec 2020 06:16:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kolpy-0008Kv-IW
 for qemu-trivial@nongnu.org; Mon, 14 Dec 2020 06:16:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607944578;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OQdMLotxjpaz51sWXsbU/PEXVDKAqbWm1m7IWUWH82I=;
 b=HEzVwc4nalSfZZBQbRwl6VWuvp/1QHLFOYv3vqUQHkyJKX9ArmAx1czgl0CuusmJEyT7BD
 3wYxTUOGAGmqZCVw/WiKPH5pLWHvk386wJmWINsSWky3Fzqs5tl6EFANGu3t1weB7CsfKO
 p5qT3sNvG/VBuTKk8N2S1FvVJvjEdlU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-77-lBWaLvEWMFi5kjrvUtj-Zw-1; Mon, 14 Dec 2020 06:16:13 -0500
X-MC-Unique: lBWaLvEWMFi5kjrvUtj-Zw-1
Received: by mail-wr1-f70.google.com with SMTP id d2so6503269wrr.5
 for <qemu-trivial@nongnu.org>; Mon, 14 Dec 2020 03:16:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OQdMLotxjpaz51sWXsbU/PEXVDKAqbWm1m7IWUWH82I=;
 b=HfEPUzyiIBmGrz3ExEE44HQaQB2GvZosypmWzcJwduZIOG+sP8bn72683gFMQ3NK2q
 zgynYSIRRqHIY0O6yFh94VRgP10+9+DC6k+Qe6+WY5LADdnX/jyL1YqeK3OytfIQvrKx
 QdaIZIdsHdNw8wOPBQT3Z9Zf/yU4brgNpIs/YxEYZLodw6DxIpGwHX6VXOoH5QNCsBJG
 CBJ/Jo+0WVNbuqQLao8bvzROYtCQjnG7Mxxm2PDsGkFf5TAr9b50Q3qLzFEia7UwXgG7
 gBTzk11Do3TWDpdEc57PsWtMC6OLeZYJ6A9QVe2XujRYNKiUlrRuizh1lQ/0tHkmMa5y
 PUew==
X-Gm-Message-State: AOAM5308q4qnJDbATJTULndnxFK83iMpCMQUwygqGAcjHsP+9+AWAuMJ
 jyc3OtywWggU2ETW8cN5W8KNFvJTFJkFzAIn8zSMODJ8CgIQSGXn0T8HTbyduWnLxTeVOnA88DY
 ZuSscuSOZShUeVp+QPg==
X-Received: by 2002:adf:fb03:: with SMTP id c3mr23545236wrr.248.1607944571561; 
 Mon, 14 Dec 2020 03:16:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwGgm+3dMjUKaeWCmtokAP0NXT0VSRSsKwFEfFGy9VU4sNgmwWcbwNSh8ircozFPUjZT+/51w==
X-Received: by 2002:adf:fb03:: with SMTP id c3mr23545193wrr.248.1607944571261; 
 Mon, 14 Dec 2020 03:16:11 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id m17sm33867416wrn.0.2020.12.14.03.16.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Dec 2020 03:16:10 -0800 (PST)
Subject: Re: [PATCH] scripts/git.orderfile: Keep files with .inc extension
 sorted
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
References: <20201213205132.243628-1-f4bug@amsat.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <c777aead-4080-09e7-7db4-30d56de83d76@redhat.com>
Date: Mon, 14 Dec 2020 12:16:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201213205132.243628-1-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 14 Dec 2020 11:16:29 -0000

On 13/12/20 21:51, Philippe Mathieu-Daudé wrote:
> Sort .inc files along with the extension including them.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   scripts/git.orderfile | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/scripts/git.orderfile b/scripts/git.orderfile
> index 3736c1d6aff..b32203b7106 100644
> --- a/scripts/git.orderfile
> +++ b/scripts/git.orderfile
> @@ -12,6 +12,7 @@
>   # Documentation
>   docs/*
>   *.rst
> +*.rst.inc
>   
>   # build system
>   configure
> @@ -28,9 +29,11 @@ qga/*.json
>   
>   # headers
>   *.h
> +*.h.inc
>   
>   # decoding tree specification
>   *.decode
>   
>   # code
>   *.c
> +*.c.inc
> 

Queued, thanks.

Paolo


