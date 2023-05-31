Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1q4NqP-0002Lm-Ij
	for mharc-qemu-trivial@gnu.org; Wed, 31 May 2023 11:34:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1q4NqM-0002LP-P4
 for qemu-trivial@nongnu.org; Wed, 31 May 2023 11:34:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1q4NqK-0000zN-5B
 for qemu-trivial@nongnu.org; Wed, 31 May 2023 11:34:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1685547264;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=umgitms0WDA+J6n4PBGFnFBxJfVSSct62UU2xiE9bh8=;
 b=IsWQkVs53xoM6UIo27bjjEmiXCpkdyEeLy+zSBxA+Xx8mXLJ45lqEX6iG6sdpYEtb5a4Av
 LOWGusbGp4B68YKox97TN0jeB7lxk+bNIbMFlP5ClbijDVH9oxQwFQy/DDW1rOhUs7O1hj
 hicEBCnI0WthhcaIVRBwFPX1HaUtXeo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-435-ii6vdtZxPBSXtH8jagb65Q-1; Wed, 31 May 2023 11:34:23 -0400
X-MC-Unique: ii6vdtZxPBSXtH8jagb65Q-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-30af81cf4dbso910396f8f.2
 for <qemu-trivial@nongnu.org>; Wed, 31 May 2023 08:34:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685547262; x=1688139262;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=umgitms0WDA+J6n4PBGFnFBxJfVSSct62UU2xiE9bh8=;
 b=KRX+K+G6I3Lb/3wmToONjdh+OnCtLhbVISTG08kWK825IwUL/RV5Ccap7yrIKqxz43
 Kjkg2B9yk2qKahZEJE0xW2yWRuT6vT63AL41Ran5+eGc9+6yqOu8w4MS+GSv+IV6igUB
 UFfQ4cdC8qZoJ05ID8FsNmOw4ebkgw38GOrID/0hiWSqLoiOcf63N9ostEuRkIpr7rkg
 Zq/01d2s3x6YlPvwQLa4BKOZWGS0oP5qE6w+4tp0CqtNq5KB3OJeFVq/ZvsnwKzCqsgD
 sNgTz29vLSpwAxcu3w1OpMlqBJDcUSNqqy9K0s0ZaY8hfflW1Tov0igr7XAYps22slX+
 PYCg==
X-Gm-Message-State: AC+VfDwJ1kTRfiW0Aw+/P3fWMsuQCpfpkP5QmeH0SLsRgMXdJpJlJaOi
 521tBAtX2RW68zWRnNlt92ryUOC7FUWMTbi1kojah3jk2usgs6JByshzoxfrORHPagFLpWNT6zu
 wdMVMp1DHkLe15uj23A==
X-Received: by 2002:a5d:5083:0:b0:304:b967:956f with SMTP id
 a3-20020a5d5083000000b00304b967956fmr5865097wrt.8.1685547262114; 
 Wed, 31 May 2023 08:34:22 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5qmRLaAjOTsTojZd4boW8sMOfJa3tWYmjYWLPBbJmPnX6Ii4n9FuX2unlbdZTYzRDECgLPjA==
X-Received: by 2002:a5d:5083:0:b0:304:b967:956f with SMTP id
 a3-20020a5d5083000000b00304b967956fmr5865082wrt.8.1685547261861; 
 Wed, 31 May 2023 08:34:21 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-178-4.web.vodafone.de. [109.43.178.4])
 by smtp.gmail.com with ESMTPSA id
 l16-20020adffe90000000b0030ae93bd196sm7173571wrr.21.2023.05.31.08.34.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 May 2023 08:34:21 -0700 (PDT)
Message-ID: <035823a1-e5f9-0f4c-9732-d69a39cdef93@redhat.com>
Date: Wed, 31 May 2023 17:34:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] meson.build: Use -Wno-undef only for SDL 2.0.8 and older
From: Thomas Huth <thuth@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-trivial@nongnu.org
References: <20230531093902.70695-1-thuth@redhat.com>
In-Reply-To: <20230531093902.70695-1-thuth@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.163,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.091, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
X-List-Received-Date: Wed, 31 May 2023 15:34:35 -0000

On 31/05/2023 11.39, Thomas Huth wrote:
> There is no need to disable this useful compiler warning for
> newer versions of the SDL anymore.
> 
> This also enables the printing of the version number with
> newer versions of the SDL in the summary of the meson output
> again.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   meson.build | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/meson.build b/meson.build
> index bc76ea96bf..8ccd928dca 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1273,10 +1273,12 @@ if not get_option('sdl').auto() or have_system
>     sdl_image = not_found
>   endif
>   if sdl.found()
> -  # work around 2.0.8 bug
> -  sdl = declare_dependency(compile_args: '-Wno-undef',
> -                           dependencies: sdl,
> -                           version: sdl.version())
> +  if sdl.version().version_compare('<=2.0.8')
> +    # work around 2.0.8 bug
> +    sdl = declare_dependency(compile_args: '-Wno-undef',
> +                             dependencies: sdl,
> +                             version: sdl.version())
> +  endif

Drat, never mind, this still fails with the SDL2 from MinGW:

  https://gitlab.com/thuth/qemu/-/jobs/4385862312#L3048

  Thomas



