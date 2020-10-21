Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kVAZb-00061W-6T
	for mharc-qemu-trivial@gnu.org; Wed, 21 Oct 2020 05:38:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kVAZZ-0005zW-OT
 for qemu-trivial@nongnu.org; Wed, 21 Oct 2020 05:38:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kVAZW-00081d-PB
 for qemu-trivial@nongnu.org; Wed, 21 Oct 2020 05:38:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603273096;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a69OysY5MjEhpXr8udbVzm6utzKlJUq/IRUQWfuz5qY=;
 b=LgCmFqs0B0vJgms2+IkJ05izF2tfHV5PMbTOcojDx2XqmrqkoAG54C+33hkVH6pTze8NEc
 t7sWa6HZfBI+pIbttjPqYduj8xRhsFnJ4XvjPwvQOw2NfZPxOdaOkKpNCeHQJCxxLf3/Ye
 eVApu+e6Wh06FM45pZ2YSMOiNL+bH6M=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-HPLuoCYzMrOueQqWfLj9AA-1; Wed, 21 Oct 2020 05:38:15 -0400
X-MC-Unique: HPLuoCYzMrOueQqWfLj9AA-1
Received: by mail-wr1-f70.google.com with SMTP id n14so1729937wrp.1
 for <qemu-trivial@nongnu.org>; Wed, 21 Oct 2020 02:38:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=a69OysY5MjEhpXr8udbVzm6utzKlJUq/IRUQWfuz5qY=;
 b=CV+yd8hS/8D+Cz7Ip8vVDz0PU1h8ZfeOBh5HWWCCtFSK/eGS0H25x6Iwl3VbBJATCh
 Pisp/bCaI28KtrCf1RMN1E8HUsv0HNL82VVwDsA7gaDTAJt/PtJGjievb+on257s31nM
 hiINeeFx7Y5Hm4VBpxnDsXCHLuXfr9pkhZ0nd/ojaC4eALnMMTR3OSnXx+QElUKqeTnK
 db7M9ShVnwl7R9uIB3BwY8l8IMAB0wQA8lc9mmpmSYfeGXkMFfYrITGjV53MTs6NiAUx
 u/OY0+jsDGnl8hjcXptjWRvG7Glha/DUjofUsvkTYnfFfqkHV/7Ws9k4aAwpUlKtGfMz
 8vvg==
X-Gm-Message-State: AOAM533QtM/iJTUr14EuKNpjqvD3ROg3kOq2lAUxtuVyAqcD+iquFD7y
 zxvV6rn6rWvrvtbcPCXCeVMTJouNrauK4KvxiTTAhjSe4B+Co6P85q5Y8YsrKnLem7mAsiEZ/69
 1qdgoVFzf/N/hM+zR2g==
X-Received: by 2002:a5d:4843:: with SMTP id n3mr3667565wrs.416.1603273094139; 
 Wed, 21 Oct 2020 02:38:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy5EpkTu47TfadKUaezzxf7r2TRxZF4RcCKaUb2n87TivE64FWK2yEtXaJ17ETgPJFcl+WfUg==
X-Received: by 2002:a5d:4843:: with SMTP id n3mr3667536wrs.416.1603273093856; 
 Wed, 21 Oct 2020 02:38:13 -0700 (PDT)
Received: from [192.168.1.36] (237.red-88-18-140.staticip.rima-tde.net.
 [88.18.140.237])
 by smtp.gmail.com with ESMTPSA id z18sm2932355wrs.82.2020.10.21.02.38.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Oct 2020 02:38:13 -0700 (PDT)
Subject: Re: [PATCH] tests/docker/dockerfiles/centos: Use SDL2 instead of SDL1
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Fam Zheng <fam@euphon.net>, qemu-trivial@nongnu.org,
 "Daniel P . Berrange" <berrange@redhat.com>
References: <20201021072308.9224-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e7ac0344-24d1-d53f-7e7f-798be452adcb@redhat.com>
Date: Wed, 21 Oct 2020 11:38:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201021072308.9224-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/21 02:16:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Wed, 21 Oct 2020 09:38:22 -0000

On 10/21/20 9:23 AM, Thomas Huth wrote:
> We do not support SDL1 in QEMU anymore. Use SDL2 instead.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   tests/docker/dockerfiles/centos7.docker | 2 +-
>   tests/docker/dockerfiles/centos8.docker | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/docker/dockerfiles/centos7.docker b/tests/docker/dockerfiles/centos7.docker
> index 8b273725ee..6f11af1989 100644
> --- a/tests/docker/dockerfiles/centos7.docker
> +++ b/tests/docker/dockerfiles/centos7.docker
> @@ -31,7 +31,7 @@ ENV PACKAGES \
>       perl-Test-Harness \
>       pixman-devel \
>       python3 \
> -    SDL-devel \
> +    SDL2-devel \
>       spice-glib-devel \
>       spice-server-devel \
>       tar \
> diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
> index 585dfad9be..f86931f955 100644
> --- a/tests/docker/dockerfiles/centos8.docker
> +++ b/tests/docker/dockerfiles/centos8.docker
> @@ -2,7 +2,7 @@ FROM centos:8.1.1911
>   
>   RUN dnf -y update
>   ENV PACKAGES \
> -    SDL-devel \
> +    SDL2-devel \
>       bzip2 \
>       bzip2-devel \
>       dbus-daemon \

I wonder if we are having docker image caching issues...

build-system-centos job passed but then in check-system-centos:

FAILED: libcommon.fa.p/ui_sdl2-input.c.o
ui/sdl2.h:7:10: fatal error: SDL.h: No such file or directory
  #include
           ^~~~~~~

And then in acceptance-system-centos:

./qemu-system-x86_64: error while loading shared libraries: 
libSDL2-2.0.so.0: cannot open shared object file: No such file or directory


