Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mGMYH-0005h6-CX
	for mharc-qemu-trivial@gnu.org; Wed, 18 Aug 2021 10:28:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGMYG-0005fD-0H
 for qemu-trivial@nongnu.org; Wed, 18 Aug 2021 10:28:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGMYE-0006Iv-Kd
 for qemu-trivial@nongnu.org; Wed, 18 Aug 2021 10:28:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629296897;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dSXUCoyCKzIPP6ljFNUFRGnS0EvH2cMhAXmcIjKh+ko=;
 b=fuzJPEBtaTrp3ubDR2CoweP9EjM9HaChyLtHyKCJIzWOwNNJu2iayLii3r0bA7JS50ITsm
 FNJ91N9YxsSB0xmY8rWtySqmi0/hdicsIpMlQeWpJXNzOj3Rk/v9GMLxi/s5B4WRma52hV
 uL5Ao2cpQDMlSyn6JyDAA2slmo51Y5E=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-549-OnQdg7PoMFuCLoN6PIQOrQ-1; Wed, 18 Aug 2021 10:28:16 -0400
X-MC-Unique: OnQdg7PoMFuCLoN6PIQOrQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 q4-20020a05600000c400b00156d811312aso648380wrx.3
 for <qemu-trivial@nongnu.org>; Wed, 18 Aug 2021 07:28:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dSXUCoyCKzIPP6ljFNUFRGnS0EvH2cMhAXmcIjKh+ko=;
 b=Et+MVHF7oPyGkMBtCXTgPvh0Cn97DnpHpZcYJmquwHW5Se6QCm2N+iFexaKIOq9ANw
 UmD6Kq0m4Rx9mHpPM5tsedb0vjkmutQkQUNTHFzBexZtjCnt2AmdTlJbbCWTWND0iSau
 bl/Xz3FztbneFPw3YbrknP2FwCEwGRCmRXEv0mpSKWcp6ZcwacDhxi66vQTwr95M3LF+
 boPhMU4KhPxQKr2225WVvqCdc4LxKHBEWp0NIxiCrlQCQkKAMl1WjZVoC9K+O5vTfvE1
 ph5ej1m0PaR2TiJJc4gtBaJR6Iu9obOX0kBvkOcpzABnrgKex0jGu/pS0CoSDqBe0yWe
 xKqQ==
X-Gm-Message-State: AOAM531S2HQbNrn7vZ5mhD2ig0Z88QlNgEc2RMg1pqP+tfnKI0PLXN9m
 pC00tAVLnGvsweB/SY4fLEsbuo4mg9EkN4Y4+Rzddeu8Vl4Vq0+QvUAF8uvzAECaiS+gbGG2fKB
 nYfbu0gBrcfDeAsDMltExyfCPb4QQRbaFcDPAN5gUm+/gFZCZq4/nfwPJZIuXtNQsu/8=
X-Received: by 2002:adf:f282:: with SMTP id k2mr10974783wro.255.1629296895187; 
 Wed, 18 Aug 2021 07:28:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwRv8Bt+bAZyvlP2N4p0f+6mOMoLMR439hsg5HQbwoGZNTt+C+T6XI4P2VrtoPLNNyz4zXj9A==
X-Received: by 2002:adf:f282:: with SMTP id k2mr10974763wro.255.1629296895008; 
 Wed, 18 Aug 2021 07:28:15 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id a3sm6165682wrx.38.2021.08.18.07.28.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 07:28:14 -0700 (PDT)
Subject: Re: [PATCH, trivial, for-6.1] spelling: sytem => system
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <fefb5f5c-82bc-05e2-b4c1-665e9d6896ff@msgid.tls.msk.ru>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <931a2977-58ea-5e70-abf7-781ed75f80e3@redhat.com>
Date: Wed, 18 Aug 2021 16:28:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <fefb5f5c-82bc-05e2-b4c1-665e9d6896ff@msgid.tls.msk.ru>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.961, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 18 Aug 2021 14:28:20 -0000

On 8/18/21 4:06 PM, Michael Tokarev wrote:
> Signed-off-By: Michael Tokarev <mjt@tls.msk.ru>
> ---
> It is safe for 6.1

But too late ;)

> 
>  block/file-posix.c              | 2 +-
>  tools/virtiofsd/fuse_lowlevel.h | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


