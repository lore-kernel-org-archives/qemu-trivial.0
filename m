Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n5qV6-0006BH-R9
	for mharc-qemu-trivial@gnu.org; Fri, 07 Jan 2022 09:45:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1n5qUs-0005zv-S8
 for qemu-trivial@nongnu.org; Fri, 07 Jan 2022 09:45:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1n5qUp-0001zZ-Sp
 for qemu-trivial@nongnu.org; Fri, 07 Jan 2022 09:45:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641566733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z7Y4ZGhOxeHGRsiJL7IY0x/v+cdybg3bWuVMsMYKOZA=;
 b=XZABpMrxBG08586P6dYEDmdCYyoa3h0YahtA/JFkz6r3waTIe6lL69HLwAo6o9M+0Yx7Qe
 3tXu4C582ncY4sM0K3MFNaUA97WS3ea6NyxEEMXQELIozKYnEPd+hdjRHQ9ss0MUyS333m
 HRuxZIut1RPKqEor5wtk/oy7P/E51tY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-380-wGnXhhazPEKvyI-DVMdfVw-1; Fri, 07 Jan 2022 09:45:32 -0500
X-MC-Unique: wGnXhhazPEKvyI-DVMdfVw-1
Received: by mail-ed1-f72.google.com with SMTP id
 z8-20020a056402274800b003f8580bfb99so4846351edd.11
 for <qemu-trivial@nongnu.org>; Fri, 07 Jan 2022 06:45:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Z7Y4ZGhOxeHGRsiJL7IY0x/v+cdybg3bWuVMsMYKOZA=;
 b=nTy47o3bGhQLrn5GPiPY/NLcJHvzUM8raTrDPJ/Cr5ooDRz0qaQAsB6paZj9KYC3bD
 JTZQHCDgj8kP0LKhBnkkIfw7QiVSYjYhAF1WWFAHu6RywtctGA63IRNCXJz00Y86Onmm
 4FZheITR9h47xi9SEZ3JS4uSL8XdfvmMyQSASTZJLqOX72EgYqPNGeHZgEmdtiO7+nvB
 yyTJj0a1uqH4B8XgkEsLCrCue+ufbcWjZ9Q4oHrX9TziV++VcDFTNQfDXFydEB+A+27O
 TBZD2S2CVVWotPguh+9yHONAUOeCjcSF8K8Dupaiq9ZEB4B9wNt5Uqd2bTqpLmAsLVN5
 ZGRw==
X-Gm-Message-State: AOAM531IFIdJZTtpvzAmG/srChrZ0qkak9J7IOwYG73G8zPsytxtlQ1c
 JHu96N5ApaWItDAFDKWViZniYbgMz3x6ZH8/uRIwHhhjJNcsnN1x4m+r4R0jiU4P2DjElDdo4Xh
 2NufjkgkSbwfZis2cpg==
X-Received: by 2002:a05:6402:1d4b:: with SMTP id
 dz11mr61780750edb.15.1641566731581; 
 Fri, 07 Jan 2022 06:45:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxLmtYdIXy4eeiM2d2bm/EbJNU/Zw6GeYMB2wnDDIA7bf48zTFj84w/wC/Vo0kGccd8FP/5PQ==
X-Received: by 2002:a05:6402:1d4b:: with SMTP id
 dz11mr61780723edb.15.1641566731280; 
 Fri, 07 Jan 2022 06:45:31 -0800 (PST)
Received: from gator (cst2-173-70.cust.vodafone.cz. [31.30.173.70])
 by smtp.gmail.com with ESMTPSA id ds7sm1465201ejc.50.2022.01.07.06.45.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 06:45:30 -0800 (PST)
Date: Fri, 7 Jan 2022 15:45:29 +0100
From: Andrew Jones <drjones@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-trivial@nongnu.org
Subject: Re: [PATCH] softmmu/device_tree: Silence compiler warning with
 --enable-sanitizers
Message-ID: <20220107144529.3oovw6ywlcqg3fc7@gator>
References: <20220107133844.145039-1-thuth@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220107133844.145039-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Fri, 07 Jan 2022 14:45:39 -0000

On Fri, Jan 07, 2022 at 02:38:44PM +0100, Thomas Huth wrote:
> If I configure my build with --enable-sanitizers, my GCC (v8.5.0)
> complains:
> 
> .../softmmu/device_tree.c: In function ‘qemu_fdt_add_path’:
> .../softmmu/device_tree.c:560:18: error: ‘retval’ may be used uninitialized
>  in this function [-Werror=maybe-uninitialized]
>      int namelen, retval;
>                   ^~~~~~
> 
> It's a false warning since the while loop is always executed at least
> once (p has to be non-NULL, otherwise the derefence in the if-statement
> earlier will crash). Thus let's switch to a do-while loop here instead
> to make the compiler happy in all cases.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  softmmu/device_tree.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
> index 3965c834ca..9e96f5ecd5 100644
> --- a/softmmu/device_tree.c
> +++ b/softmmu/device_tree.c
> @@ -564,7 +564,7 @@ int qemu_fdt_add_path(void *fdt, const char *path)
>          return -1;
>      }
>  
> -    while (p) {
> +    do {
>          name = p + 1;
>          p = strchr(name, '/');
>          namelen = p != NULL ? p - name : strlen(name);
> @@ -584,7 +584,7 @@ int qemu_fdt_add_path(void *fdt, const char *path)
>          }
>  
>          parent = retval;
> -    }
> +    } while (p);
>  
>      return retval;
>  }
> -- 
> 2.27.0
>

 
Reviewed-by: Andrew Jones <drjones@redhat.com>


