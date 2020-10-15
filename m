Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kT4q1-0006bh-Ae
	for mharc-qemu-trivial@gnu.org; Thu, 15 Oct 2020 11:06:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kT4px-0006a9-CU
 for qemu-trivial@nongnu.org; Thu, 15 Oct 2020 11:06:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kT4pt-00048Y-9y
 for qemu-trivial@nongnu.org; Thu, 15 Oct 2020 11:06:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602774392;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1RJ3DyiwwpRwvoNkb4PFnt+mf8SoKW5A/k4t5y8tXQQ=;
 b=TjdVnjJOYIpVK/zVVIYeEugjjpyKtlH9cfGNgwdlJq8+QIj+OZ4oILSPt37x4HJUDxg07O
 gehNE+b7kfwt40KfUUidFWt0iKJEDeY5EjZnZ+kkW7qXNkUxE8+iX0swQ+MI5h16g2a8pz
 tD/j1aQsL7mYSpyEumT3r7dB4BUQy58=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-K7riIkV9M7y_K3W06C7EUg-1; Thu, 15 Oct 2020 11:06:30 -0400
X-MC-Unique: K7riIkV9M7y_K3W06C7EUg-1
Received: by mail-wr1-f71.google.com with SMTP id i6so2102487wrx.11
 for <qemu-trivial@nongnu.org>; Thu, 15 Oct 2020 08:06:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1RJ3DyiwwpRwvoNkb4PFnt+mf8SoKW5A/k4t5y8tXQQ=;
 b=csdvLyRfEob/o1qlSsXZwCCrJY7qhOqR3Wt2i40dscb+cLDwAEVolI1VLCgB254myO
 vLione0Nm5pU6LLnqCS7+6d/crXGC1VQPh065Ynx7V34PPysK/3t0uRGoYAIJkDtPIFB
 eE/CXpnXIuxvtihOpzX63KrCIjmoSJEQ7YPnIu2nG4xbX+8AJ2OAX9eFL7YO60JcPjqS
 ksEgVW7VqmRvOfDNuZdv7sUQPwU+9kQNA9LShHPRHwGqqxHoMgAEcud0/kaf9t/9+1JS
 ncigM/HFO1b+b1YXmf1ZGReXIGFaceVLI46TAQ2cAxlkl+6zjvQWTkcwN2DRRJgv4dR+
 E+Hg==
X-Gm-Message-State: AOAM532yqK02jcfEnLnB4RZtXLjQDM3tLZJRt8U5i5CvYOyJYzIA0wwD
 MVrxgjDteQBDxyBCncx/qvbxEEzLJIZo18HwuD9+jLeLLb6pxFoKq9XSabxGI6vFwPTbw8Ea8do
 qe1oUM98n4PlrG02wFQ==
X-Received: by 2002:adf:bb43:: with SMTP id x3mr4854110wrg.250.1602774389267; 
 Thu, 15 Oct 2020 08:06:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwZyvfPEG/maBD2hfLHtzVOJwGCNmVZTz/tMxHIdLJFOD/G6B/HLXKN2khB3IjR7W2MS5MJgg==
X-Received: by 2002:adf:bb43:: with SMTP id x3mr4854062wrg.250.1602774388877; 
 Thu, 15 Oct 2020 08:06:28 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:2110:4ced:a13b:6857?
 ([2001:b07:6468:f312:2110:4ced:a13b:6857])
 by smtp.gmail.com with ESMTPSA id n2sm4871216wrt.82.2020.10.15.08.06.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Oct 2020 08:06:27 -0700 (PDT)
Subject: Re: [PATCH] Makefile: Ensure cscope.out/tags/TAGS are generated in
 the source tree
To: Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <160277334665.1754102.10921580280105870386.stgit@bahia.lan>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <1bb86de1-75b3-be22-0363-505363478ada@redhat.com>
Date: Thu, 15 Oct 2020 17:06:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <160277334665.1754102.10921580280105870386.stgit@bahia.lan>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/15 02:38:26
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.019, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
X-List-Received-Date: Thu, 15 Oct 2020 15:06:39 -0000

On 15/10/20 16:49, Greg Kurz wrote:
> Tools usually expect the index files to be in the source tree, eg. emacs.
> This is already the case when doing out-of-tree builds, but with in-tree
> builds they end up in the build directory.
> 
> Force cscope, ctags and etags to put them in the source tree.
> 
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>  Makefile |   10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 3c5a0b0f7a11..45f983d9ef08 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -194,19 +194,19 @@ find-src-path = find "$(SRC_PATH)/" -path "$(SRC_PATH)/meson" -prune -o \( -name
>  
>  .PHONY: ctags
>  ctags:
> -	rm -f tags
> -	$(find-src-path) -exec ctags --append {} +
> +	rm -f "$(SRC_PATH)/"tags
> +	$(find-src-path) -exec ctags -f "$(SRC_PATH)/"tags --append {} +
>  
>  .PHONY: TAGS
>  TAGS:
> -	rm -f TAGS
> -	$(find-src-path) -exec etags --append {} +
> +	rm -f "$(SRC_PATH)/"TAGS
> +	$(find-src-path) -exec etags -f "$(SRC_PATH)/"TAGS --append {} +
>  
>  .PHONY: cscope
>  cscope:
>  	rm -f "$(SRC_PATH)"/cscope.*
>  	$(find-src-path) -print | sed -e 's,^\./,,' > "$(SRC_PATH)/cscope.files"
> -	cscope -b -i"$(SRC_PATH)/cscope.files"
> +	cscope -b -i"$(SRC_PATH)/cscope.files" -f"$(SRC_PATH)"/cscope.out
>  
>  # Needed by "meson install"
>  export DESTDIR
> 
> 

Queued, thanks.

Paolo


