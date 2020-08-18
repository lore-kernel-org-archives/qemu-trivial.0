Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k80kh-0006P7-K1
	for mharc-qemu-trivial@gnu.org; Tue, 18 Aug 2020 08:30:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1k80kf-0006Ni-Oy
 for qemu-trivial@nongnu.org; Tue, 18 Aug 2020 08:30:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54115)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1k80kc-0002rR-6s
 for qemu-trivial@nongnu.org; Tue, 18 Aug 2020 08:30:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597753801;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=C7TyGiPKRN1/Jvg3tI0gQkFZLZG97NglV/J8yhy68TU=;
 b=jExJBFMokxppKKvAIOBf05XtyjUEFcsfxrVJZQ+nJwMlGN2KN7HFQxyWXwpVKSIImOMS6t
 4+YGm3b4ZOV+HBf3BIA8337hDr8GzLbaFqQ0jzPr5uJPKeH9oDfgt8coE6+vIrWr87h8X0
 9KH5H0IhSO3gcNxSB0njybnaw/WJzy4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-XBGJyRRXO5-PvMs2EUfV9g-1; Tue, 18 Aug 2020 08:29:57 -0400
X-MC-Unique: XBGJyRRXO5-PvMs2EUfV9g-1
Received: by mail-wm1-f71.google.com with SMTP id c124so6063924wme.0
 for <qemu-trivial@nongnu.org>; Tue, 18 Aug 2020 05:29:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=C7TyGiPKRN1/Jvg3tI0gQkFZLZG97NglV/J8yhy68TU=;
 b=X5oFvc63autLJWqDy1FISG3W9rfwpUmKaNe8kt1JbmKSHSrPYkD5+uqu4j17gSvRyA
 UKwd7nK72mnyQ9fKybkgR7LjbX1PitBcxePguSywWwEfSQJrWOUbDODMc6kYTvmE6Nd+
 cXjOUXlfGJEPCFggec/Kk4C94vsUGPm8iot2oaAufpfxgBD2dwzfcR/12Xc6g7VGrwG9
 UyLeo3e9c543Z0JnJJiOjU0fMyj7qbtqGmxc13PwtU4k7SyqasUaGBjm/FurhbOMUAJ6
 UoXv0M4rLq7C3DEwMlsXoaSBmPieWB8jFUgczPcXzsFcDRl+4MWyxKAbmb90joUBeaAj
 YELQ==
X-Gm-Message-State: AOAM531dqZP8XM1SY7AzykqQnqYbKs7qVsF4nYS0BulyPyegT77xJgck
 5a6v9w9ji8y+jxboDbtVKLaAItfqW5ZqULPGOiO97bkpcpp4JRgcagaCadVf2L6vo0RFkKUeLmG
 wn8FNZ801DrHYBChP9g==
X-Received: by 2002:a7b:c185:: with SMTP id y5mr19429165wmi.95.1597753796207; 
 Tue, 18 Aug 2020 05:29:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxXjLvHyAw/jSSnzsyRqNU8i5VwMHeBNHtsnQ0w9VV5Gee8E++Bd2UFcG+dc+rv0g1/siI9gQ==
X-Received: by 2002:a7b:c185:: with SMTP id y5mr19429149wmi.95.1597753795904; 
 Tue, 18 Aug 2020 05:29:55 -0700 (PDT)
Received: from [192.168.1.36] (121.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.121])
 by smtp.gmail.com with ESMTPSA id d7sm36257177wra.29.2020.08.18.05.29.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Aug 2020 05:29:55 -0700 (PDT)
Subject: Re: [PATCH] Makefile: Let the 'help' target list the helper targets
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Miroslav Rezanina <mrezanin@redhat.com>
References: <20200423104345.5092-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <e0479e77-5cfe-698f-1b45-6d2b05789094@redhat.com>
Date: Tue, 18 Aug 2020 14:29:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200423104345.5092-1-philmd@redhat.com>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/18 02:02:19
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 18 Aug 2020 12:30:06 -0000

Hi Mirek,

On 4/23/20 12:43 PM, Philippe Mathieu-Daudé wrote:
> List the name of the helper targets when calling 'make help',
> along with the tool targets:
> 
>   $ make help
>   [...]
> 
>   Helper targets:
>     fsdev/virtfs-proxy-helper      - Build virtfs-proxy-helper
>     scsi/qemu-pr-helper            - Build qemu-pr-helper
>     qemu-bridge-helper             - Build qemu-bridge-helper
>     vhost-user-gpu                 - Build vhost-user-gpu
>     virtiofsd                      - Build virtiofsd
> 
>   Tools targets:
>     qemu-ga                        - Build qemu-ga tool
>     qemu-keymap                    - Build qemu-keymap tool
>     elf2dmp                        - Build elf2dmp tool
>     ivshmem-client                 - Build ivshmem-client tool
>     ivshmem-server                 - Build ivshmem-server tool
>     qemu-nbd                       - Build qemu-nbd tool
>     qemu-storage-daemon            - Build qemu-storage-daemon tool
>     qemu-img                       - Build qemu-img tool
>     qemu-io                        - Build qemu-io tool
>     qemu-edid                      - Build qemu-edid tool
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  configure | 5 +++--
>  Makefile  | 9 +++++++--
>  2 files changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/configure b/configure
> index 23b5e93752..caf880c38e 100755
> --- a/configure
> +++ b/configure
> @@ -6374,7 +6374,7 @@ if test "$softmmu" = yes ; then
>    if test "$linux" = yes; then
>      if test "$virtfs" != no && test "$cap_ng" = yes && test "$attr" = yes ; then
>        virtfs=yes
> -      tools="$tools fsdev/virtfs-proxy-helper\$(EXESUF)"
> +      helpers="$helpers fsdev/virtfs-proxy-helper\$(EXESUF)"
>      else
>        if test "$virtfs" = yes; then
>          error_exit "VirtFS requires libcap-ng devel and libattr devel"
> @@ -6389,7 +6389,7 @@ if test "$softmmu" = yes ; then
>        fi
>        mpath=no
>      fi
> -    tools="$tools scsi/qemu-pr-helper\$(EXESUF)"
> +    helpers="$helpers scsi/qemu-pr-helper\$(EXESUF)"

Paolo said on IRC this patch didn't follow the recommendation
from https://www.mail-archive.com/qemu-devel@nongnu.org/msg524586.html
and moved qemu-pr-helper from /usr/bin to /usr/libexec.

FYI virtfs-proxy-helper might be also affected.

>    else
>      if test "$virtfs" = yes; then
>        error_exit "VirtFS is supported only on Linux"
> @@ -7630,6 +7630,7 @@ else
>    QEMU_INCLUDES="-iquote \$(SRC_PATH)/tcg/\$(ARCH) $QEMU_INCLUDES"
>  fi
>  
> +echo "HELPERS=$helpers" >> $config_host_mak
>  echo "TOOLS=$tools" >> $config_host_mak
>  echo "ROMS=$roms" >> $config_host_mak
>  echo "MAKE=$make" >> $config_host_mak
> diff --git a/Makefile b/Makefile
> index 8a9113e666..021a0cd491 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -336,9 +336,9 @@ $(call set-vpath, $(SRC_PATH))
>  LIBS+=-lz $(LIBS_TOOLS)
>  
>  vhost-user-json-y =
> -HELPERS-y =
> +HELPERS-y = $(HELPERS)
>  
> -HELPERS-$(call land,$(CONFIG_SOFTMMU),$(CONFIG_LINUX)) = qemu-bridge-helper$(EXESUF)
> +HELPERS-$(call land,$(CONFIG_SOFTMMU),$(CONFIG_LINUX)) += qemu-bridge-helper$(EXESUF)
>  
>  ifeq ($(CONFIG_LINUX)$(CONFIG_VIRGL)$(CONFIG_GBM)$(CONFIG_TOOLS),yyyy)
>  HELPERS-y += vhost-user-gpu$(EXESUF)
> @@ -1255,6 +1255,11 @@ endif
>  		$(foreach t, $(TARGET_DIRS), \
>  		$(call print-help-run,$(t)/all,Build for $(t));) \
>  		echo '')
> +	@$(if $(HELPERS-y), \
> +		echo 'Helper targets:'; \
> +		$(foreach t, $(HELPERS-y), \
> +		$(call print-help-run,$(t),Build $(shell basename $(t)));) \
> +		echo '')
>  	@$(if $(TOOLS), \
>  		echo 'Tools targets:'; \
>  		$(foreach t, $(TOOLS), \
> 


