Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m12hJ-0007EP-Mb
	for mharc-qemu-trivial@gnu.org; Wed, 07 Jul 2021 04:14:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m12hI-0007D5-Ps
 for qemu-trivial@nongnu.org; Wed, 07 Jul 2021 04:14:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m12gZ-0003vx-HK
 for qemu-trivial@nongnu.org; Wed, 07 Jul 2021 04:14:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625645614;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6aA7WbRS7MqzTvnYl7/nrZQHzywSWhxz4tp+MOsYAgo=;
 b=GoJ9WkC27qkvyP9K9Bv6tsgGD1g9RECMy4OzjjCT2Nwy5m7UJI6WLzD+Esy1qqxrfcNBvS
 mzcX4ebCgscV0gxer1qQMXyV/Ezuja1jPL7QKlKD38YCUu8wneRm27eu3lt+w+S6Cy4Rz0
 Nz0N84H7tHIuk2T5P+TCreKATVUNLjw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-514-TcQmPMTBMaaEGFwYdMwz9g-1; Wed, 07 Jul 2021 04:13:33 -0400
X-MC-Unique: TcQmPMTBMaaEGFwYdMwz9g-1
Received: by mail-wm1-f69.google.com with SMTP id
 i3-20020a05600c3543b02902075ed92710so2160121wmq.0
 for <qemu-trivial@nongnu.org>; Wed, 07 Jul 2021 01:13:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6aA7WbRS7MqzTvnYl7/nrZQHzywSWhxz4tp+MOsYAgo=;
 b=ukCP9FXWC0+CM90OJOdoNHsekD/GhL3LnV1o44QzvqSonn9TeOIsRW6rDbiNOVV9co
 dwQZA//upRLUqklGNqZ1nnZ3lCbS4mdsjmj1jCVxBVBqmUssSpBIJNEldGZoVNHp+P2U
 iDMGN4gpw2UTaXpjSGCHJlAZaOdDSmgL3Y1tioKXIvPZNHMq/Ydm591oUD+uvxuEHmTi
 +iSqhx7kRoBnR380Y5bUy8D8K/Q7CLeeAxs7gg7CTngXsQ1ZRR0jE3fCZTlAXXrRVUq+
 pDeSkIJu11VgzywZU7x6hLp/jg4gKN++AKqXRYgR9ScAem0dIx+dtvjIAYkUF/VdQ+LP
 nXMA==
X-Gm-Message-State: AOAM532uN4HNAbCdQM4En0ZGk77iPdvSe2ghrKnlsc0bedy1BsXaOif3
 IqJkzaNpN9wZgIt4wDQcrYLo/yYjm6SvQ8j8fQq0DAukdP3NOlWP7sOYhGqKdP/IGImxzh2HE33
 HJWf6TQsi6FAkFlbiaw==
X-Received: by 2002:adf:ba43:: with SMTP id t3mr21103631wrg.184.1625645612517; 
 Wed, 07 Jul 2021 01:13:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4c9iR7oXKAw5OCKVws4OQ+4UeIDdBnKgnNSjzTqe1mWstXzSfgwoe2XAKWYcNVJ2ApG7Uvw==
X-Received: by 2002:adf:ba43:: with SMTP id t3mr21103609wrg.184.1625645612300; 
 Wed, 07 Jul 2021 01:13:32 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id q1sm15423581wma.27.2021.07.07.01.13.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jul 2021 01:13:31 -0700 (PDT)
Subject: Re: [PATCH] Fix libdaxctl option
To: Thomas Huth <thuth@redhat.com>, Miroslav Rezanina <mrezanin@redhat.com>,
 qemu-devel@nongnu.org
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, pbonzini@redhat.com
References: <20210707063124.81954-1-mrezanin@redhat.com>
 <66a2e508-462b-a19f-3d04-1a55077aba89@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <0d76b55d-3c13-c0d1-4aea-49eab97d839b@redhat.com>
Date: Wed, 7 Jul 2021 10:13:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <66a2e508-462b-a19f-3d04-1a55077aba89@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 07 Jul 2021 08:14:21 -0000

On 7/7/21 8:35 AM, Thomas Huth wrote:
> On 07/07/2021 08.31, Miroslav Rezanina wrote:
>> For some reason, libdaxctl option setting was set to work in an opposite
>> way (--enable-libdaxctl disabled it and vice versa). Fixing this so
>> configuration works properly.
>>
>> Signed-off-by: Miroslav Rezanina <mrezanin@redhat.com>
>> ---
>>   configure | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/configure b/configure
>> index 650d9c0735..4f51528a77 100755
>> --- a/configure
>> +++ b/configure
>> @@ -1531,9 +1531,9 @@ for opt do
>>     ;;
>>     --disable-keyring) secret_keyring="no"
>>     ;;
>> -  --enable-libdaxctl) libdaxctl=disabled
>> +  --enable-libdaxctl) libdaxctl="enabled"
>>     ;;
>> -  --disable-libdaxctl) libdaxctl=enabled
>> +  --disable-libdaxctl) libdaxctl="disabled"
>>     ;;
>>     --enable-fuse) fuse="enabled"
>>     ;;
>>
> 
> Fixes: 83ef16821a ("configure, meson: convert libdaxctl detection to
> meson")
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


