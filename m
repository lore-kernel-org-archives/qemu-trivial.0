Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uENxf-0004LO-5W
	for mharc-qemu-trivial@gnu.org; Mon, 12 May 2025 03:52:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1uENxe-0004LE-6b
 for qemu-trivial@nongnu.org; Mon, 12 May 2025 03:52:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1uENxc-0005iA-9t
 for qemu-trivial@nongnu.org; Mon, 12 May 2025 03:52:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747036346;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Stoqv4oWQAsN4E8qPCy6LX38dhG3tXNvecHxrv7g2O0=;
 b=b1+hNj5oeAc+HmAJ9PTEp3Lx2wYzFGyZ26qcoIMC6NhArr43XI5S1aSaO3r9u7n/0lKdOh
 d536QGTczkYthG6hTb9/7ARdP0yTKpYKJjIi8Ecy4KxhWFJ2y6v4Vi479SnhqpCuGP+vwd
 /Jv8K+anHEpMRUetN++BN42p9S49iqM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-388-u6YotlcLP_OULwG_jOWKbA-1; Mon, 12 May 2025 03:52:24 -0400
X-MC-Unique: u6YotlcLP_OULwG_jOWKbA-1
X-Mimecast-MFC-AGG-ID: u6YotlcLP_OULwG_jOWKbA_1747036343
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-440a4e2bad7so20352565e9.0
 for <qemu-trivial@nongnu.org>; Mon, 12 May 2025 00:52:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747036343; x=1747641143;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Stoqv4oWQAsN4E8qPCy6LX38dhG3tXNvecHxrv7g2O0=;
 b=WFj2rEhDIbyNkgrg7zIdU98bZYksM0SCDzFzTV2FNLUPQDaNoufek6oqCgT1WqqXNN
 fPnqbflajo3E5EO0jtuUhj1uiB21oOtkSPmwSyObKCQFiMgrEV7/e0ACanuYeIoVzbwD
 bnhOOa19uzs0dJB8nrV+JF0KHDk26zZq5nE0X45iIl+hMSNQ13QCvdv+yO6qoVi4+jZt
 jsKvdLRBHK1YC75wXCexDkJR3qs54XbmcSvC+KbdhOA5z02lpf/W0oBnq/btGs4VyyPU
 6hFBNrvBQxUG7vbFxcUzVD4kH3ImcH0lOd0aJxu79Je0F3R9O3v8JF53kyT5kdL4TMwU
 H+2g==
X-Gm-Message-State: AOJu0YxSfkyR0VRv8BqprAwku7rjjlPeHCAviF/LyQ/3r9Wzs0dEbyam
 z+I3az8v1wZPsOSr0RywV1K+kF4Ar6+R15oyQQLha1NANWRAw9/IGXdIZu6Xg1HfZqW4vW7/Zrz
 hHYDNBORFzba1h4suoVF/l29GnaHnYGdbbyJ2/4yAgATkDfecsoxCEpQ=
X-Gm-Gg: ASbGncvkqY5GVuj98YOZomAzwbUi40P/h/ZPtpe3etGpaGW/yGsFiIyo2pF9ru64f/E
 rP+SejtyGISF5+DBHLk+aKR9Zo4WFjkPCC+vv1TF8eouPB2gNAc6zMuxMOz209Uh8SPQ0m3Buqv
 GvKxa6/m7lW1UMmiYeN0M2aFS7IQJEAHKfXwL3KAk9LPT+OaLDzZun7U0+KD0r2fpdCG/ov4EQf
 wYDGH+wFEq71PHO/cZoNAVJcfC/XcgJcELmyOqi8nDLCTvBh+s3nt3QtK3ikASqKXdU98iCYofc
 vN8VXOHhL9JHY0ovX5sOjZ91ToaWHNs4lltu3H5KfBtXW32rtJz1
X-Received: by 2002:a05:600c:a08c:b0:439:9434:4f3b with SMTP id
 5b1f17b1804b1-442d6db89d4mr103475745e9.8.1747036343412; 
 Mon, 12 May 2025 00:52:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKZJxom0xAm6DtI+iUDbrWPkY5Rz1h/l0fZ8VFVlFAWuy6sgb0rFq6y1ITuKovi0XChh7vFg==
X-Received: by 2002:a05:600c:a08c:b0:439:9434:4f3b with SMTP id
 5b1f17b1804b1-442d6db89d4mr103475625e9.8.1747036343076; 
 Mon, 12 May 2025 00:52:23 -0700 (PDT)
Received: from [192.168.0.7] (ltea-047-064-115-173.pools.arcor-ip.net.
 [47.64.115.173]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442d77e4ec3sm77595355e9.1.2025.05.12.00.52.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 May 2025 00:52:22 -0700 (PDT)
Message-ID: <30df1dfb-7537-41dd-994d-77886698c7c2@redhat.com>
Date: Mon, 12 May 2025 09:52:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/devel/testing/functional: Fix typo
To: Gustavo Romero <gustavo.romero@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20250509152201.19085-1-gustavo.romero@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250509152201.19085-1-gustavo.romero@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: uwuPbd-RmklWu01oV6TC9J5iqRllt1gnymWg7O05bzc_1747036343
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.587,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-List-Received-Date: Mon, 12 May 2025 07:52:30 -0000

On 09/05/2025 17.21, Gustavo Romero wrote:
> Fix the duplication of the word 'run'.
> 
> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
> ---
>   docs/devel/testing/functional.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/docs/devel/testing/functional.rst b/docs/devel/testing/functional.rst
> index 8030cb4299..9e56dd1b11 100644
> --- a/docs/devel/testing/functional.rst
> +++ b/docs/devel/testing/functional.rst
> @@ -274,7 +274,7 @@ speed mode in the meson.build file, while the "quick" speed mode is
>   fine for functional tests that can be run without downloading files.
>   ``make check`` then only runs the quick functional tests along with
>   the other quick tests from the other test suites. If you choose to
> -run only run ``make check-functional``, the "thorough" tests will be
> +run only ``make check-functional``, the "thorough" tests will be
>   executed, too. And to run all functional tests along with the others,
>   you can use something like::

Thanks, queued!

  Thomas


