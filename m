Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lqVJ7-0007kZ-B3
	for mharc-qemu-trivial@gnu.org; Tue, 08 Jun 2021 02:33:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lqVJ6-0007kF-0w
 for qemu-trivial@nongnu.org; Tue, 08 Jun 2021 02:33:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lqVJ3-0001dk-3u
 for qemu-trivial@nongnu.org; Tue, 08 Jun 2021 02:33:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623134024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ne07C/kBROvbvD6Ev5HENaKP+LTvHFOFJ7Pq9ailGJk=;
 b=LvV44DxnV07qreXtApswp8I4IQX+jds8BMx2G3A3+xS0lulcqtM2FvUvuFsXhEgO5voyVT
 pwaW73oZMEnLALHT6ZyedcC6UxhWLdyQgj1j9UTs1rZ07Nt3gS9UWuK55ybjk/x65m31Bv
 lyVzcF0ckhklc6bwRp0Fan4iFSLcDqc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-474-w98hYHgzOJWBP0iOeSygiA-1; Tue, 08 Jun 2021 02:33:43 -0400
X-MC-Unique: w98hYHgzOJWBP0iOeSygiA-1
Received: by mail-wm1-f71.google.com with SMTP id
 o14-20020a1c4d0e0000b029019a2085ba40so409461wmh.1
 for <qemu-trivial@nongnu.org>; Mon, 07 Jun 2021 23:33:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ne07C/kBROvbvD6Ev5HENaKP+LTvHFOFJ7Pq9ailGJk=;
 b=bCCqCFp3KmqvvQGhwk52YnlPvsP9rKxki3d2SiZD5kKeCUODVsPvOgGF188lEE10Xk
 NxlrnJyz5eAw7dinqXEt92w0Gqaq/bHUJ7hmhzMU1+JbZNw0phl6ya7MQWCML7L7smJz
 XN3tJ1mBFZfLpyDFfdOjQbji3MZhWhPtQwYkNIQP1zvYyLcnQODHFp4oaXE4CQu6uLd8
 2l3kAtsfeDQmuNhYlwPwCnT4hObjVoyNjbu7nkoAYl2Os2S1Drjs4UsAf+nK5K9PtCr/
 pkOHfsY912YwtZKiHY7mqLlSAfDAiVaA5sSKsAYCYocewTmk0NPy/gi6yZlOzlkGKLK+
 WZcg==
X-Gm-Message-State: AOAM532yivc8OvS2Dd1Bl4/4K/TsHuwuv/42JHjoV2GDzoA68Ca6Ld9n
 Z2df5cGXiGxaH6GczNOztAV2SHhxd4XudSs9D/pDfqpM39qLembdUK7kk4BwCAxGzPEK/YaVZzY
 r2LLJ70cyV/M1TjdfdNJU3ELarTV4CoEsaWV9O6UMNE2nqs35h+IQwlMnRk2/Sor7sgg=
X-Received: by 2002:adf:b34a:: with SMTP id k10mr20813012wrd.333.1623134021593; 
 Mon, 07 Jun 2021 23:33:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyKjN2vreV637F83KwntNg+W48CtJGDO4pHN6ubdmxmBwEGiwk4re7iBs1z+upOS/3K0T1aBw==
X-Received: by 2002:adf:b34a:: with SMTP id k10mr20812988wrd.333.1623134021414; 
 Mon, 07 Jun 2021 23:33:41 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id a12sm16333336wmj.36.2021.06.07.23.33.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jun 2021 23:33:41 -0700 (PDT)
Subject: Re: [PATCH] docs/tools/virtiofsd.rst: Do not hard-code the QEMU
 binary name
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-trivial@nongnu.org
References: <20210607174250.920226-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <3909b15c-c0ec-19f3-cc92-ec95c076830b@redhat.com>
Date: Tue, 8 Jun 2021 08:33:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210607174250.920226-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
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
X-List-Received-Date: Tue, 08 Jun 2021 06:33:48 -0000

On 6/7/21 7:42 PM, Thomas Huth wrote:
> In downstream, we want to use a different name for the QEMU binary,
> and some people might also use the docs for non-x86 binaries, that's
> why we already created the |qemu_system| placeholder in the past.
> Use it now in the virtiofsd doc, too.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  docs/tools/virtiofsd.rst | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


