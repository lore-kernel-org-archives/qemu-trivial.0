Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lZDKM-0006K2-G5
	for mharc-qemu-trivial@gnu.org; Wed, 21 Apr 2021 09:55:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lZDKI-0006Im-8j
 for qemu-trivial@nongnu.org; Wed, 21 Apr 2021 09:55:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26128)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lZDKE-0002HN-53
 for qemu-trivial@nongnu.org; Wed, 21 Apr 2021 09:55:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619013328;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=elYDIEgVD6HnltqZOeOrDAIgtq7FbAVRqhWKq+zak9E=;
 b=UnzFzYwqUfYGVNfOnr9B6R0qybIl/FtKnuFG1bhRiuUe35075XeOd17ZHMliFCik/m+XmD
 K8xz+x8gtr+99DYGa60NuDOxJHQun63rOtWJpJkWDKa03Qr0umOdEnySPYZF8Sj1Xyuj4R
 5RynrMuzvDbnVOoHyfavQo9Bg0su1mY=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-MqOYvSWBMt6n4RPJ7e2lvg-1; Wed, 21 Apr 2021 09:55:26 -0400
X-MC-Unique: MqOYvSWBMt6n4RPJ7e2lvg-1
Received: by mail-ej1-f71.google.com with SMTP id
 ne22-20020a1709077b96b02903803a047edeso4589484ejc.3
 for <qemu-trivial@nongnu.org>; Wed, 21 Apr 2021 06:55:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=elYDIEgVD6HnltqZOeOrDAIgtq7FbAVRqhWKq+zak9E=;
 b=HyVogCkAcux79UXE69BZEe4AUtYutvCUqbP3E5GrVzm4pLfezfz3e3p0+R5gqglluc
 6iDJ1zAHKuQK9LsYctYcUk85PQvcUlVrEC3QUrVaur6s6b4OAEaaLBfeyIpdmjji4DA2
 V8e9rBlOzrlVnQWxhI26NI7bDOi/fNrl89Jrj2voQJ7w75c5LYI5DOCrXMBRHARj2XnN
 JzM7/KVHopCk8joakJKxf6o+GJ+LrF//tDJdBiKrXj8tWiNw4gdYg9ROkTzSSRRYJSMq
 Y8HmUo1bPe7iJiKoSxcdrjHueM9mRpinxmTmadYBbOtjbVgCmXNp3OP6YuUc+J8UU4p4
 xmQg==
X-Gm-Message-State: AOAM53186UcOq+QfZB8bW107IXdEsP3JFfok8QJ7LIRhIU2QiUcKyypQ
 DItXEuyU2J9N0f1ww1ccyaj6/ECgDdPdayKaGXmC6QOFtsGl7ZoAtb8IcvNEpnXIAmlDv6m7u5O
 8ZC6ammrd8V8MfmxMulmRGk9R95Tk7HR/+DtK3sfZCGjT+Wgo2iw/xxWjHlw5qATCrUU=
X-Received: by 2002:a05:6402:1157:: with SMTP id
 g23mr38687017edw.303.1619013324774; 
 Wed, 21 Apr 2021 06:55:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzNNfnIrKCoz4NBiXFKyyzvfoIyAV5VbXb02hzv39iC49gima0hhZFYwc1aiIAkh5YJktx/3w==
X-Received: by 2002:a05:6402:1157:: with SMTP id
 g23mr38686994edw.303.1619013324565; 
 Wed, 21 Apr 2021 06:55:24 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id o6sm3425112edw.24.2021.04.21.06.55.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Apr 2021 06:55:23 -0700 (PDT)
Subject: Re: [PATCH] Fix typo in CFI build documentation
To: Serge Guelton <sguelton@redhat.com>, qemu-devel@nongnu.org
References: <1618933722-18022-1-git-send-email-sguelton@redhat.com>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <fb5eb9f9-7087-6a95-34e2-a23fd045e8bb@redhat.com>
Date: Wed, 21 Apr 2021 15:55:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1618933722-18022-1-git-send-email-sguelton@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
X-List-Received-Date: Wed, 21 Apr 2021 13:55:35 -0000

Hi Serge,

Cc'ing qemu-trivial@

On 4/20/21 5:48 PM, serge-sans-paille wrote:
> Signed-off-by: serge-sans-paille <sguelton@redhat.com>

It looks your git-config is misconfigured... Maybe you used
an incorrect profile :) Can you repost please?

> ---
>  docs/devel/control-flow-integrity.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

For the fix:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> 
> diff --git a/docs/devel/control-flow-integrity.rst b/docs/devel/control-flow-integrity.rst
> index d89d707..e6b73a4 100644
> --- a/docs/devel/control-flow-integrity.rst
> +++ b/docs/devel/control-flow-integrity.rst
> @@ -39,7 +39,7 @@ later).
>  Given the use of LTO, a version of AR that supports LLVM IR is required.
>  The easies way of doing this is by selecting the AR provided by LLVM::
>  
> - AR=llvm-ar-9 CC=clang-9 CXX=lang++-9 /path/to/configure --enable-cfi
> + AR=llvm-ar-9 CC=clang-9 CXX=clang++-9 /path/to/configure --enable-cfi
>  
>  CFI is enabled on every binary produced.
>  
> @@ -131,7 +131,7 @@ lld with version 11+.
>  In other words, to compile with fuzzing and CFI, clang 11+ is required, and
>  lld needs to be used as a linker::
>  
> - AR=llvm-ar-11 CC=clang-11 CXX=lang++-11 /path/to/configure --enable-cfi \
> + AR=llvm-ar-11 CC=clang-11 CXX=clang++-11 /path/to/configure --enable-cfi \
>                             -enable-fuzzing --extra-ldflags="-fuse-ld=lld"
>  
>  and then, compile the fuzzers as usual.
> 


