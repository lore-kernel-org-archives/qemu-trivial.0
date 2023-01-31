Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pMrCP-00066i-F9
	for mharc-qemu-trivial@gnu.org; Tue, 31 Jan 2023 09:01:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMrCG-00065a-Lk
 for qemu-trivial@nongnu.org; Tue, 31 Jan 2023 09:01:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMrCC-00024G-HP
 for qemu-trivial@nongnu.org; Tue, 31 Jan 2023 09:01:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675173671;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uCzLvOIX/WUniRn+p0Kn2xtNaVyhknAVBtVLlJFF0Ms=;
 b=QLAdaLbcEtcp9j5oQDi1SQ23BlDhr7KNlGi1U0aX4kHJODZTf9VNIss2GMvhF1HFk3oQhd
 OWeq6qExBCieo1UAO84Ld9QhaSwW7mTfeRKZ4ZQZMvElo6feOz3rKCt4w+V7spH76+8rdP
 mJrVrve6k86ymfwxnQRi/7L5hT/jKLU=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-629--Vx-aqxGNX-GgoUdYWrgnA-1; Tue, 31 Jan 2023 09:01:09 -0500
X-MC-Unique: -Vx-aqxGNX-GgoUdYWrgnA-1
Received: by mail-qv1-f72.google.com with SMTP id
 j7-20020a0cf507000000b0053b538958d5so4124069qvm.18
 for <qemu-trivial@nongnu.org>; Tue, 31 Jan 2023 06:01:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uCzLvOIX/WUniRn+p0Kn2xtNaVyhknAVBtVLlJFF0Ms=;
 b=BZt41nivcO1JkOW9uzRnOUwdUBKks395rOmTEr7LQppASASW2/JN8lAIy9f+iih7FH
 MXTFqBA98Px3q3KvuGt8w/lbf97GAp5Z7boB9iv1rxhY5whH1keBGHCO6KaE7mgtrLyG
 yFNGUGox9AfDUxFpiEjpgjKEpo4Okz4kaqHwg+CQzpyNR7Kv19zbou6kHQXf3VNisMAx
 8+YsUpzmcFOoyNo2Xb59WHW+7S2dq3/gVmJ9o1rqDlou9lkGYQ8LDCmIqz7yVONxwD0L
 rA5hMR0B+8zzZ2JKxBBhEGIifWyeO1SAZmGDDN3ayEUkNv8ePQm0rploEhaI1ObD+I38
 81zw==
X-Gm-Message-State: AFqh2krjdiJ0MiF0ommRVQQgTxZNxE8o/trXc1g6HgPs/xEQJ7OXw6sS
 o/TyGz9QluZlOvSKUPPFDrailoy3HUfWP1cKx0etDhzRHe981u9/qd4Z3Qsp0e3otFTaBQkMxgn
 pddSh3S3iTxx3VOaqaA==
X-Received: by 2002:ac8:4703:0:b0:3a5:4064:9fd3 with SMTP id
 f3-20020ac84703000000b003a540649fd3mr74281723qtp.24.1675173662206; 
 Tue, 31 Jan 2023 06:01:02 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu04YOylhVngO+otxitvQKIVPcVjj+RHD6+yNjBLFDNYDUYpmOyEVADhXtpdF1i/WzzJd5ZeQ==
X-Received: by 2002:ac8:4703:0:b0:3a5:4064:9fd3 with SMTP id
 f3-20020ac84703000000b003a540649fd3mr74281480qtp.24.1675173658635; 
 Tue, 31 Jan 2023 06:00:58 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-155.web.vodafone.de.
 [109.43.176.155]) by smtp.gmail.com with ESMTPSA id
 b187-20020ae9ebc4000000b0071f40a59fe5sm4097447qkg.127.2023.01.31.06.00.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Jan 2023 06:00:57 -0800 (PST)
Message-ID: <7d8d8021-0dc7-0e24-f7b9-5fecb3d15d4b@redhat.com>
Date: Tue, 31 Jan 2023 15:00:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 08/20] hw/i386/ich9: Rename Q35_MASK to ICH9_MASK
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Ani Sinha
 <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Laurent Vivier <lvivier@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, qemu-trivial@nongnu.org
References: <20230131115326.12454-1-shentey@gmail.com>
 <20230131115326.12454-9-shentey@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230131115326.12454-9-shentey@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
X-List-Received-Date: Tue, 31 Jan 2023 14:01:22 -0000

On 31/01/2023 12.53, Bernhard Beschow wrote:
> The Q35_MASK macro is already defined by TYPE_Q35_HOST_DEVICE, so let
> TYPE_ICH9_LPC_DEVICE have its own one to prevent potential name clash.

Ouch, good catch!

> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   include/hw/i386/ich9.h | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


