Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pewfr-0005zg-F4
	for mharc-qemu-trivial@gnu.org; Wed, 22 Mar 2023 07:30:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pewfp-0005ty-HL
 for qemu-trivial@nongnu.org; Wed, 22 Mar 2023 07:30:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pewfn-0007gW-Gs
 for qemu-trivial@nongnu.org; Wed, 22 Mar 2023 07:30:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679484630;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xnTsaQa2o7rMYyBD15PYSfzs14xkp2ngduIqc1prexk=;
 b=GweJ1Tiv+ve+5U/VKXldgRtwOAc9bValNHNgPV6zcyO0xKB8o88PXmR/wGSHv6HU0a4djc
 fbdDeRG3uB4uFz6LQxtcHLarKKOInpkjoyrg5dUFjDdyCiiqsg9onTrJ5SdXxXcBMrqLpV
 Kfz2cAB4jGB7Nfpc+3JQbOZie6+Q5J0=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-128-5-GUk9XgN9W25_RSe--4Qg-1; Wed, 22 Mar 2023 07:30:29 -0400
X-MC-Unique: 5-GUk9XgN9W25_RSe--4Qg-1
Received: by mail-qk1-f198.google.com with SMTP id
 dw26-20020a05620a601a00b0074300c772c0so8480523qkb.11
 for <qemu-trivial@nongnu.org>; Wed, 22 Mar 2023 04:30:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679484628;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xnTsaQa2o7rMYyBD15PYSfzs14xkp2ngduIqc1prexk=;
 b=LFf1kVtvSQ6XDpILDIcwJEy0lcdrjJi7BEiym/mOmjaVnEPB0fRMQka0dR4UMhcD7N
 MJhE+hNtWTeegI9VdxWLf+ECX8mw3TfN6iXFwYNOV9hPGZtCLBubFLa2qXTBYSFifJo7
 xQVkhz44SBwAkR4dzDYLgRr+SN7aOKJbCOjh1SzqxiMnh0apdH9/BUpvDvCbfgtmWSk0
 bWtsS4Je9q8KXN73HN9ndplDXGfAb+uOGgvmPi5ugG97PMAh1P5XYe67YU0GICMAYno7
 Lqn3+nbLBc8T5gCQcG8TO3NjGVHS3ukj8IUDU9Tsa5xEhhYwHYtKxJpIMnjS1oG5bvmV
 b1ZA==
X-Gm-Message-State: AO0yUKXIRjhlEYJzFDwn6OU6JrEb/uAM0oRstWMdnlhmQwROLLDTu4+R
 KkCQsghw9I9ossgiofrJ1WB20ydr561f80A6BKpxN4BOc0fyMlrOZ3Fv9tjbz+ZmsMmQ0A+8cu5
 N4OocZGSaLrnIhe91ng==
X-Received: by 2002:a05:622a:1491:b0:3d9:218a:3390 with SMTP id
 t17-20020a05622a149100b003d9218a3390mr5416320qtx.8.1679484628800; 
 Wed, 22 Mar 2023 04:30:28 -0700 (PDT)
X-Google-Smtp-Source: AK7set/jHDewuEOf5q8dxkaDt4jgjmkoscoTkWeus/UaVg90yPLUqJ2AkZj2gsvuzmcgpqcxkdx48w==
X-Received: by 2002:a05:622a:1491:b0:3d9:218a:3390 with SMTP id
 t17-20020a05622a149100b003d9218a3390mr5416291qtx.8.1679484628554; 
 Wed, 22 Mar 2023 04:30:28 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-177-44.web.vodafone.de.
 [109.43.177.44]) by smtp.gmail.com with ESMTPSA id
 m4-20020ac866c4000000b003e30aec0b70sm4274388qtp.64.2023.03.22.04.30.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Mar 2023 04:30:28 -0700 (PDT)
Message-ID: <91fda177-fdb4-e3be-7cd7-e231c97a9300@redhat.com>
Date: Wed, 22 Mar 2023 12:30:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] cirrus.yml: Cover SPICE in the MSYS2 job
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Yonggang Luo <luoyonggang@gmail.com>, Jintao Yin <nicememory@gmail.com>,
 qemu-trivial@nongnu.org, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>
References: <20230322110521.59949-1-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230322110521.59949-1-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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
X-List-Received-Date: Wed, 22 Mar 2023 11:30:33 -0000

On 22/03/2023 12.05, Philippe Mathieu-Daudé wrote:
> Include the mingw-w64-x86_64-spice package so SPICE is covered:
> 
>    C compiler for the host machine: cc -m64 -mcx16 (gcc 12.2.0 "cc (Rev10, Built by MSYS2 project) 12.2.0")
>    ...
>    Run-time dependency spice-protocol found: YES 0.14.4
>    Run-time dependency spice-server found: YES 0.15.1
> 
> In particular this would have helped catching the build issue
> reported as https://gitlab.com/qemu-project/qemu/-/issues/1553:

Well, hardly anybody is looking at the output on cirrus-ci.com, so this 
patch here likely would not have prevented the merging of this bug... for 
that, you rather have to add it to .gitlab-ci.d/windows.yml instead.

But anyway, the patch here is still a good idea, too, so:

Reviewed-by: Thomas Huth <thuth@redhat.com>


>    [1851/5253] Compiling C object libcommon.fa.p/ui_spice-core.c.obj
>    FAILED: libcommon.fa.p/ui_spice-core.c.obj
>    ../ui/spice-core.c: In function 'watch_remove':
>    ../ui/spice-core.c:152:5: error: implicit declaration of function 'qemu_close_to_socket' [-Werror=implicit-function-declaration]
>    152 |     qemu_close_to_socket(watch->fd);
>        |     ^~~~~~~~~~~~~~~~~~~~
>    ../ui/spice-core.c:152:5: error: nested extern declaration of 'qemu_close_to_socket' [-Werror=nested-externs]
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> See https://cirrus-ci.com/task/6189732569284608?logs=main#L891
> 
> Based-on: <20230322075256.2043812-1-marcandre.lureau@redhat.com>
> ---
>   .cirrus.yml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/.cirrus.yml b/.cirrus.yml
> index 5fb00da73d..eb1640814d 100644
> --- a/.cirrus.yml
> +++ b/.cirrus.yml
> @@ -41,6 +41,7 @@ windows_msys2_task:
>         mingw-w64-x86_64-curl
>         mingw-w64-x86_64-gnutls
>         mingw-w64-x86_64-libnfs
> +      mingw-w64-x86_64-spice
>       "
>       CHERE_INVOKING: 1
>     msys2_cache:


