Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ljK3f-0003D2-AD
	for mharc-qemu-trivial@gnu.org; Wed, 19 May 2021 07:08:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ljK3d-0003AV-O6
 for qemu-trivial@nongnu.org; Wed, 19 May 2021 07:08:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ljK3c-0005Ng-4S
 for qemu-trivial@nongnu.org; Wed, 19 May 2021 07:08:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621422487;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aZKaHb4yWbYeoJY6P5K+mCNIQEF9EZfAZKYwiHU5RBA=;
 b=IFA61dlChEvwzdMOh0uPjMUOUsRwjBd08WHFy4ZCCVKnDdrbz7ftVMvjcvolCB8sLkdLRv
 Mp7MUEE3HkMHzzZee2czc57NBngy8/G1r7aWIF3XgkgeW8Wl33oyvHhSeSfUnzHclEn/W8
 t7vT405TpeiHhtIc4KECcvXFcdBSObw=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-68-eohuZ_dcPJ-zoh7lxfpesw-1; Wed, 19 May 2021 07:08:05 -0400
X-MC-Unique: eohuZ_dcPJ-zoh7lxfpesw-1
Received: by mail-ej1-f71.google.com with SMTP id
 gt39-20020a1709072da7b02903a8f7736a08so3565112ejc.1
 for <qemu-trivial@nongnu.org>; Wed, 19 May 2021 04:08:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aZKaHb4yWbYeoJY6P5K+mCNIQEF9EZfAZKYwiHU5RBA=;
 b=YgIFjORrz39D5hJw2rFnzUFFi+dOnDbIUwpiQwBbJACF5xGa1IQO+EagUNrdvBB57/
 jT+9J/vyzbB4gaREY/vcv2pSUH8r1657BJgrfh61HbqL+FNlHWKX0gg7a9Bj3tNMOKY8
 /MZiRiITsQwGXHZkyGP+Sype0TSnL26uHdnlUdKDr+legi5w3KWn3ymuO2wlDjHWT1SR
 E50ye3HoqQnDKofbrEXbtjQY9RvOiAgJz9RlLUk7sJcBFVK8MA3ZCpbXKl7eEbSyYfxW
 f0cCHpC3WOEv1y5asqv7oaSVXHxbdgcGClQOC89F8hYo+ynwn8M4VAPAPyduvII5FmIE
 R/gQ==
X-Gm-Message-State: AOAM530GrHq2Xbbhud44XHSqbLCJPGs3PA13Hke0R4nNgU1GMQB5iCAX
 hWwZX5dD30r4OO2VNcq52ketzIIb22/SxrcukJBQxOaGhUV6QfH73Y6lgvy1O3iGBAICJdX9Cph
 +HnC/pgR1NcGnDHA5tg==
X-Received: by 2002:a50:aa95:: with SMTP id q21mr13526858edc.329.1621422484411; 
 Wed, 19 May 2021 04:08:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJypo8iq4jsH2XNG2BeSz/OYyBka286x1EXQXnj1WreyCvtlUkmUwnbsp8oUn2Bf0la1oVLKWA==
X-Received: by 2002:a50:aa95:: with SMTP id q21mr13526830edc.329.1621422484138; 
 Wed, 19 May 2021 04:08:04 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id f5sm8590690eds.55.2021.05.19.04.08.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 May 2021 04:08:03 -0700 (PDT)
Subject: Re: [PATCH] configure: Avoid error messages about missing
 *-config-*.h files
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20210519105719.290435-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <acfb4c5c-e491-f4f9-942d-f6d400372927@redhat.com>
Date: Wed, 19 May 2021 13:08:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210519105719.290435-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
X-List-Received-Date: Wed, 19 May 2021 11:08:10 -0000

On 5/19/21 12:57 PM, Thomas Huth wrote:
> When compiling with --disable-system there is a harmless yet still
> annoying error message at the end of the "configure" step:
> 
>  sed: can't read *-config-devices.h: No such file or directory
> 
> When only building the tools or docs, without any emulator at all,
> there is even an additional message about missing *-config-target.h
> files.
> 
> Fix it by checking whether any of these files are available before
> using them.
> 
> Fixes: e0447a834d ("configure: Poison all current target-specific #defines")
> Reported-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  configure | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/configure b/configure
> index 963e35b9a7..a8a9e78c61 100755
> --- a/configure
> +++ b/configure
> @@ -6458,10 +6458,14 @@ fi
>  
>  # Create list of config switches that should be poisoned in common code...
>  # but filter out CONFIG_TCG and CONFIG_USER_ONLY which are special.
> -sed -n -e '/CONFIG_TCG/d' -e '/CONFIG_USER_ONLY/d' \
> -    -e '/^#define / { s///; s/ .*//; s/^/#pragma GCC poison /p; }' \
> -    *-config-devices.h *-config-target.h | \
> -    sort -u > config-poison.h
> +target_configs_h=$(ls *-config-devices.h *-config-target.h 2>/dev/null)
> +if test -n "$target_configs_h" ; then
> +    sed -n -e '/CONFIG_TCG/d' -e '/CONFIG_USER_ONLY/d' \
> +        -e '/^#define / { s///; s/ .*//; s/^/#pragma GCC poison /p; }' \
> +        $target_configs_h | sort -u > config-poison.h
> +else
> +    touch config-poison.h

  :> config-poison.h is safer.

> +fi
>  
>  # Save the configure command line for later reuse.
>  cat <<EOD >config.status
> 


