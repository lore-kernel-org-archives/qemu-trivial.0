Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m3gJj-0001t8-Cb
	for mharc-qemu-trivial@gnu.org; Wed, 14 Jul 2021 10:56:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m3gJi-0001rM-9a
 for qemu-trivial@nongnu.org; Wed, 14 Jul 2021 10:56:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m3gJg-0004Zx-GX
 for qemu-trivial@nongnu.org; Wed, 14 Jul 2021 10:56:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626274611;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=66mpSeLPShBX209PcEQqq6I3DL4h5/75RHs3fAbCrCo=;
 b=W09CfZn19p6pBEys9/uF2aVCRe0DiGKVgwxe3Jzb19ZlB9NxqR9sEE5bxp36APZYE2PvvM
 pWCx8RTxpT/SRpjhD6k7GCXV8FLO+CS2m6yG/bbyv5ENiUaypUfBhPLnOpqDoBLYkVvniR
 tmwUfYW1i9XCeFndcw7orjA2gMyJfdE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-508-lsSYTIuwMFCPWtOiaP_n7w-1; Wed, 14 Jul 2021 10:56:47 -0400
X-MC-Unique: lsSYTIuwMFCPWtOiaP_n7w-1
Received: by mail-wm1-f72.google.com with SMTP id
 k8-20020a05600c1c88b02901b7134fb829so532343wms.5
 for <qemu-trivial@nongnu.org>; Wed, 14 Jul 2021 07:56:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=66mpSeLPShBX209PcEQqq6I3DL4h5/75RHs3fAbCrCo=;
 b=RVepw9MklV+nndEv52UCXfBMfi4MD6a8IEdxViz3+9SjybznDoFonCgD+K5qhbGs4k
 8GQTKQXMr3qupdltGEv/gjpW9XTYeonnECM+ZimNYwb7yQ0OX1F+kwRQjUo/YDm+YOxe
 4PtDtkw9gH+9j13SsCO3tkhm0tJd/zJyWVh6tDqm6QJs82DJD6Rt2mdeahn2SrV1zsYc
 ag1lJjxxCQzBkUIfmGYgG2WKd0oXLT8zr/BAtdIzLTMBvwqUp4ySvSfD2VUn+7xpHDA1
 riWqiwfwy9ujl28F3ZqpPJNr8RpIR8YLLNHDOViGjDGOGQ8OQkFiVn29hs4lW9A+x9me
 K6HQ==
X-Gm-Message-State: AOAM533Dy3AHm79z8HxsXJleH/k6DiKG8qQ90hyamRPRdPRT3B2HfLyO
 6ur4HdqlGhsnwEEM/zZCELSJMVvuDiaKKabY2tbm3iYti9pL2o4RzB6mdsQxvEmWt1Hcb39mAYT
 bBWpmiLziR+WQv65WLhGZ6CiTclpiQT1VCmKfGRy7ID8LW7uiEHebjpXwPnBYjNXa3JxW2g==
X-Received: by 2002:a5d:6302:: with SMTP id i2mr13558729wru.366.1626274605764; 
 Wed, 14 Jul 2021 07:56:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyGd1JG8eEWw2cwJ7bODaRrPb3Gs0jIXTQ7S7kcNwQCLwnSGmB92BaDRciUXjXbyDgOl9BpOw==
X-Received: by 2002:a5d:6302:: with SMTP id i2mr13558710wru.366.1626274605544; 
 Wed, 14 Jul 2021 07:56:45 -0700 (PDT)
Received: from ?IPv6:2001:b07:add:ec09:c399:bc87:7b6c:fb2a?
 ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.gmail.com with ESMTPSA id l34sm6424232wms.45.2021.07.14.07.56.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jul 2021 07:56:45 -0700 (PDT)
Subject: Re: [PATCH] configure: Drop obsolete check for the alloc_size
 attribute
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-trivial@nongnu.org
References: <20210714072855.785566-1-thuth@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <78a4a3af-ef79-07e2-e6a1-37d11e5ef7ac@redhat.com>
Date: Wed, 14 Jul 2021 16:56:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210714072855.785566-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
X-List-Received-Date: Wed, 14 Jul 2021 14:56:54 -0000

On 14/07/21 09:28, Thomas Huth wrote:
> We recently bumped our requirement for Clang to at least version 6.0.
> And according to:
> 
>   https://releases.llvm.org/6.0.0/tools/clang/docs/AttributeReference.html
> 
> Clang v6.0 supports the alloc_size attribute. Thus we can drop this
> check in the configure script now.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   configure | 12 ------------
>   1 file changed, 12 deletions(-)
> 
> diff --git a/configure b/configure
> index a0a32c427c..eee1356814 100755
> --- a/configure
> +++ b/configure
> @@ -3184,18 +3184,6 @@ if ! compile_prog "$glib_cflags" "$glib_libs" ; then
>   	       "build target"
>   fi
>   
> -# Silence clang 3.5.0 warnings about glib attribute __alloc_size__ usage
> -cat > $TMPC << EOF
> -#include <glib.h>
> -int main(void) { return 0; }
> -EOF
> -if ! compile_prog "$glib_cflags -Werror" "$glib_libs" ; then
> -    if cc_has_warning_flag "-Wno-unknown-attributes"; then
> -        glib_cflags="-Wno-unknown-attributes $glib_cflags"
> -        CONFIGURE_CFLAGS="-Wno-unknown-attributes $CONFIGURE_CFLAGS"
> -    fi
> -fi
> -
>   # Silence clang warnings triggered by glib < 2.57.2
>   cat > $TMPC << EOF
>   #include <glib.h>
> 

Queued, thanks.

Paolo


