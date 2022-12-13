Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p527V-0008Di-0F
	for mharc-qemu-trivial@gnu.org; Tue, 13 Dec 2022 05:02:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p527N-0008AB-3o
 for qemu-trivial@nongnu.org; Tue, 13 Dec 2022 05:02:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p527I-0002B5-Sh
 for qemu-trivial@nongnu.org; Tue, 13 Dec 2022 05:02:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670925747;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SlCQ6CKPzW9MVFsH/xT+C7970gCYO1cMEGKFqKO++bA=;
 b=aP9P9rKtQCA/Ue9nTR9+5cPfDLRImlVZllfelg8Ec6RQWGFw7+cJHJL5FqO+YExS+WUzxJ
 4eFqV+rs71JZfwW0e94dN101G3G5gcmRAdY4CPsfHS9bWlqvVilbv4f2oIK4zSBhfiok91
 wvz4hBpMmJn4bi0PgGHlY7zhLd0tLgw=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-258-wOUmrvcGNbebtepfea7-7w-1; Tue, 13 Dec 2022 05:02:25 -0500
X-MC-Unique: wOUmrvcGNbebtepfea7-7w-1
Received: by mail-qv1-f71.google.com with SMTP id
 og17-20020a056214429100b004c6ae186493so14153784qvb.3
 for <qemu-trivial@nongnu.org>; Tue, 13 Dec 2022 02:02:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SlCQ6CKPzW9MVFsH/xT+C7970gCYO1cMEGKFqKO++bA=;
 b=xYaMgMQWTF4pG7mxDjISqLPRJicRcb7QBmWNHPa3ZJb64RfEaCZqT0XkKpNTTPRIK7
 xKhNz+t7kSuCTmpuY7QBA99AsRE6pfm+yMzic4Gbl8tgJz2QXE8cpYNF/xbmTbY6SXYg
 GwzUNMV/8SfDhF2X98NteDTNu5VjeA5mcJ6LaZur8o/LSlvqx6+flzdcOqjoNNmLtzfe
 7rWQxaBeYkfxYNCk7Skpt5IdLCcIfWjt1iS93T77kHwcT8ZS4bZ3ysC+bwCl/KlaqqFT
 r4k/Gcg1Kk6AZusLknH++y1ZOtGjZkh3PzFlQkd1VCA9fqOVUwOyAA9PE2EVw2jEhvai
 ugSA==
X-Gm-Message-State: ANoB5plPoQkGABoDPcJF+rR/Q1RdFMUpALzU2/DZ+CJTGVmaIiOrx7tQ
 I1lLWVORY++eRKHOhftUKobHWH3BqwptIIdceqjIxkygCopxBAeM1pyQASxYFXZ+RR6TgmF6m/O
 FvpelFADBUL3qYadWHw==
X-Received: by 2002:a05:622a:5816:b0:39c:eb97:693b with SMTP id
 fg22-20020a05622a581600b0039ceb97693bmr29064294qtb.61.1670925745308; 
 Tue, 13 Dec 2022 02:02:25 -0800 (PST)
X-Google-Smtp-Source: AA0mqf59xfeyutxZx4/c/vVYVzTThQ9ugprD1Wb3KUYbPMW8087Wgdlbkgy+yK8hM8KT8Vt2eprzOA==
X-Received: by 2002:a05:622a:5816:b0:39c:eb97:693b with SMTP id
 fg22-20020a05622a581600b0039ceb97693bmr29064263qtb.61.1670925744738; 
 Tue, 13 Dec 2022 02:02:24 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-178-131.web.vodafone.de.
 [109.43.178.131]) by smtp.gmail.com with ESMTPSA id
 o17-20020ac841d1000000b003a6a4744432sm7305977qtm.87.2022.12.13.02.02.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Dec 2022 02:02:24 -0800 (PST)
Message-ID: <7dbc9dde-2bea-3576-9040-52d44a3f8bb0@redhat.com>
Date: Tue, 13 Dec 2022 11:02:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] hw: Include the VMWare devices only in the x86 targets
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-trivial@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <20221213095144.42355-1-thuth@redhat.com>
In-Reply-To: <20221213095144.42355-1-thuth@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
X-List-Received-Date: Tue, 13 Dec 2022 10:02:37 -0000

On 13/12/2022 10.51, Thomas Huth wrote:
> It seems a little bit weird that the para-virtualized x86 VMWare
> devices "vmware-svga" and "vmxnet3" also show up in non-x86 targets.
> They are likely pretty useless there (since the guest OSes likely
> do not have any drivers for those enabled), so let's change this and
> only enable those devices by default for the classical x86 targets.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   ...ate-Pseudo-encoding.txt => vnc-ledstate-pseudo-encoding.rst} | 0
>   hw/display/Kconfig                                              | 2 +-
>   hw/net/Kconfig                                                  | 2 +-
>   3 files changed, 2 insertions(+), 2 deletions(-)
>   rename docs/interop/{vnc-ledstate-Pseudo-encoding.txt => vnc-ledstate-pseudo-encoding.rst} (100%)
> 
> diff --git a/docs/interop/vnc-ledstate-Pseudo-encoding.txt b/docs/interop/vnc-ledstate-pseudo-encoding.rst
> similarity index 100%
> rename from docs/interop/vnc-ledstate-Pseudo-encoding.txt
> rename to docs/interop/vnc-ledstate-pseudo-encoding.rst

Sorry, that change in the docs directory does not belong to this patch, 
please ignore that part.

  Thomas


