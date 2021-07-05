Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m0KFT-000147-Uz
	for mharc-qemu-trivial@gnu.org; Mon, 05 Jul 2021 04:46:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m0KFS-00013D-3N
 for qemu-trivial@nongnu.org; Mon, 05 Jul 2021 04:46:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m0KFP-0001lH-Sz
 for qemu-trivial@nongnu.org; Mon, 05 Jul 2021 04:46:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625474795;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j8xk7bpSYjdTEYnCT/kpaRigJNTVc+IE8hJG3mXDyQE=;
 b=I4c932OheeCPLLcFvfpg/gP0WlBK4xHTziI2yrLkF1hXX1dBMNvrldHB2vOYqEionLh2ia
 tsa5Ecz1I6XY89BOKmYMAsSnBPgpbHiYSFUjQpQaRWb2Kd/FZOd/YeU4N2t9LvuS2tjZCU
 yPO1O/gezz+H0br1mM3Z3m3xn3Clkas=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-565-Zi9XDh8WO6yjm7hMxXuBwg-1; Mon, 05 Jul 2021 04:46:33 -0400
X-MC-Unique: Zi9XDh8WO6yjm7hMxXuBwg-1
Received: by mail-wm1-f69.google.com with SMTP id
 t12-20020a7bc3cc0000b02901f290c9c44eso5593723wmj.7
 for <qemu-trivial@nongnu.org>; Mon, 05 Jul 2021 01:46:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=j8xk7bpSYjdTEYnCT/kpaRigJNTVc+IE8hJG3mXDyQE=;
 b=uax2piiPXZO9SX/qG1r/LUDZzE9vdtv5Ge6o4Oij+sbUYBsHrsnWz6cqqvAP9aZeQp
 g7go1WO4beUzIgNB2Evk6f6UCjJNwhnGFhhXQ52Q65aRHV2gIxZuw7ko2FD9c68lvl7I
 qAKalGszfvcLaq8XOpYFiZPZhVmCBZW+06vu2mxfgSCE/dS9yxlpEssw7P6pk1fQDjAu
 oZ8K3XMGIYZbHGpYsY8/he3e5rJ7zXrXvGnGRQ3yd8FmiGDWFXF+8Ifr+0j+EQvrcAft
 M8KgHHUy57XsLJh/DU9YgIh5GQWgq29JccBLA0wTkeJA1PGDFlD2e7HTz5Z7AJkM44xF
 XH1g==
X-Gm-Message-State: AOAM53373NHyQhDYS7evfk5G2T38puxsHW+5IO8yTl6sjYvuCHF9Dfuv
 XhiH4sKza65rcgFQ9FSNrsxr1SZJ1Tzl+zfyhAsJ2K29BY3lkCIZgKllJjW3o9mxgx7cRveRCyu
 Dcwm1OjBQExLb0Ib0tg==
X-Received: by 2002:a1c:4b12:: with SMTP id y18mr14084802wma.111.1625474792746; 
 Mon, 05 Jul 2021 01:46:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxy87qWKuROi8VqWemysHe4hFt3SEjpv7KHJxSJ6sWuenpfZggMaV3WIj8Lp/Whp6ZodXsciA==
X-Received: by 2002:a1c:4b12:: with SMTP id y18mr14084783wma.111.1625474792527; 
 Mon, 05 Jul 2021 01:46:32 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id n12sm11918585wrs.12.2021.07.05.01.46.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jul 2021 01:46:32 -0700 (PDT)
Subject: Re: [PATCH] Makefile: Remove /usr/bin/env wrapper from the SHELL
 variable
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-trivial@nongnu.org, Richard Zak <richard.j.zak@gmail.com>,
 Eric Blake <eblake@redhat.com>
References: <20210705082542.936856-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ce2ae677-559c-4e95-2913-4729f43e6110@redhat.com>
Date: Mon, 5 Jul 2021 10:46:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210705082542.936856-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.441,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 05 Jul 2021 08:46:38 -0000

On 7/5/21 10:25 AM, Thomas Huth wrote:
> The wrapper should not be needed here (it's not the shebang line of
> a shell script), and it is causing trouble on Haiku where "env"
> resides in a different directory.
> 
> Reported-by: Richard Zak <richard.j.zak@gmail.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


