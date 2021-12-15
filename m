Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mxQGh-0000Mb-7e
	for mharc-qemu-trivial@gnu.org; Wed, 15 Dec 2021 04:08:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1mxQGf-0000GT-4G
 for qemu-trivial@nongnu.org; Wed, 15 Dec 2021 04:08:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1mxQGY-0006NJ-8g
 for qemu-trivial@nongnu.org; Wed, 15 Dec 2021 04:08:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639559280;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OUeYNA8OmDpyoA0nkGMB6wh/eAf+ymk5AgkOFs7ifL4=;
 b=MKdLUHhZqg8BEdc2iMOEKmCJHThtzHWctalIzfkKCu0dLhN2HspnzrcT1MeTd9B6Z9o+pG
 opwaXJ8DTL5/M1vKCNFkNSeiBig4ApEmF4Us8IT/CBgWBvImJUHXObnCGZRnJb9PotVlpK
 6JsHLtJwZtQGg48lGKq3fQ/IAGf6OgY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-655-jenS_C84MImel5TLV1RdpQ-1; Wed, 15 Dec 2021 04:07:59 -0500
X-MC-Unique: jenS_C84MImel5TLV1RdpQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 r129-20020a1c4487000000b00333629ed22dso14347128wma.6
 for <qemu-trivial@nongnu.org>; Wed, 15 Dec 2021 01:07:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OUeYNA8OmDpyoA0nkGMB6wh/eAf+ymk5AgkOFs7ifL4=;
 b=qw6tQVaQe5Bnuae72s7367W9HIkxy9+zA8S/CDcniMS6URzXF7bdWl1h0TaCWCbzpy
 4jp/cV2uQE+JthfioCqD76rRYKDuo3UiaSufk2/Pls3WCEhTAz5+tuHrHKXawywJljdZ
 uw+o/dSkMreRzH38a8oaYGLbHhH+W5mQ2mBNT4787322l3bNegZaU7WI4NV0TpLxu4VI
 QTV40IF5AThzKfkWv3os+/uC4oFjllwzgI91YFPb17Tr9TvPYRSmKzj0POO0YhPfVpRo
 B3H1OEWIBInrZgoOlt4NYDklrtZ34jePJQKbu5llLfmEKs6MlciZF8wikXrwykVUar18
 cllw==
X-Gm-Message-State: AOAM531HLEMiFvDs4m9o6UVvnpDyZbIVufqq2KbeeS26hJEdXINq6Y82
 bhFlD7/00XmX5q0f5WT5LTPG1gCMjb4sfRb1fkHcs8UvKaYwWHt4NBUqoYN1XmC1dHzkajnnxIr
 L7qtciGzy7TgPjQWjuw==
X-Received: by 2002:a05:6000:154b:: with SMTP id
 11mr3478799wry.394.1639559278530; 
 Wed, 15 Dec 2021 01:07:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzvXmr1kyZUKdkUNayRgm1rgn4SFRfG2D+/dOjcPPMB21fcsLiMKcUwR0Fdg/kwnJpoTbSt3g==
X-Received: by 2002:a05:6000:154b:: with SMTP id
 11mr3478774wry.394.1639559278232; 
 Wed, 15 Dec 2021 01:07:58 -0800 (PST)
Received: from [10.43.2.64] (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id p12sm1604582wrr.10.2021.12.15.01.07.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 01:07:58 -0800 (PST)
Message-ID: <ed2e415f-8f95-7ee8-b45a-0648706e7d01@redhat.com>
Date: Wed, 15 Dec 2021 10:07:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] qemu-options: Remove the deprecated -no-quit option
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 libvir-list@redhat.com
References: <20211215082417.180735-1-thuth@redhat.com>
From: =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>
In-Reply-To: <20211215082417.180735-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mprivozn@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mprivozn@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.64, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 15 Dec 2021 09:08:09 -0000

On 12/15/21 09:24, Thomas Huth wrote:
> This option was just a wrapper around the -display ...,window-close=off
> parameter, and the name "no-quit" is rather confusing compared to
> "window-close" (since there are still other means to quit the emulator),
> so let's remove this now.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  docs/about/deprecated.rst       | 6 ------
>  docs/about/removed-features.rst | 7 +++++++
>  qemu-options.hx                 | 8 --------
>  softmmu/vl.c                    | 8 +-------
>  4 files changed, 8 insertions(+), 21 deletions(-)

Libvirt has never used it. So from my POV: ACK.

Michal


