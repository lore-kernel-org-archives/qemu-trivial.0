Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1maQ9R-0000yb-3X
	for mharc-qemu-trivial@gnu.org; Tue, 12 Oct 2021 18:21:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1maQ9P-0000xm-De
 for qemu-trivial@nongnu.org; Tue, 12 Oct 2021 18:21:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1maQ9L-00022M-SD
 for qemu-trivial@nongnu.org; Tue, 12 Oct 2021 18:21:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634077289;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ka8EX7FV99ACVJtdYujqfg3fCxvyoeJikXX1mf0+6Z0=;
 b=IABWFBcHx0qjMA8s9oWHsmRZ71sovEmjAbt/sQITO2C+xOiqMQX2cucJcgq2E5A/gAMB2r
 ki9G/kGSDA2u1gUdCrxg1iZ1LHqL9tmjVuzZfdjmolLDaHgov1g0EJnWONj8bd9e9AIOQg
 AIKzFcG54c/vSDGo2My+yhS5nHcGhpk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-573-vBnBEoELP3ypHaywCmJhaA-1; Tue, 12 Oct 2021 18:21:28 -0400
X-MC-Unique: vBnBEoELP3ypHaywCmJhaA-1
Received: by mail-wr1-f71.google.com with SMTP id
 c4-20020a5d6cc4000000b00160edc8bb28so424126wrc.9
 for <qemu-trivial@nongnu.org>; Tue, 12 Oct 2021 15:21:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ka8EX7FV99ACVJtdYujqfg3fCxvyoeJikXX1mf0+6Z0=;
 b=5Cgmpp5bw+6+UwwcUrhk42JudIOTzKhYC1cxPcWjWk8KhMKlynW2fOLV5moltdCyue
 86VSX0VYn2S148WV+VVP93hKL3F4Of2YMw7gbwmCJCRQBnNCHQX5ED6pr5n8kdl9hdZ6
 cq1ILOVyr4Y2uvnEKrgO77blUd1LeepgV/7boGN8GAz8L7P37nx7d7kiH9GUELOcaKj2
 HqmpeTiYdMUTIVTXylP9bkGazMrBf8pCBb+7/5Vv6ujoyggnrwN4QFxy3ssVCyGseIZk
 jW3RDXJm3IebBR+sGlzdRO3ebu2Q0wDv3eUGM8mIo5qfJ4Kmpkb3QlaodpQKEA4Hg36K
 YPIg==
X-Gm-Message-State: AOAM532nxSLJkbf6mC5WGO+bnMRBfJWbZdWagy15cwgzbqFBsCjRZaJP
 Y8IONNVPThAphRKv3OLePqKXYkdajarUwzzDOza35pAwPcHoO5GsqpK0yTPoaRTjH4lo7AVHzl0
 ylS9vL5gZucf7lBPTsQ==
X-Received: by 2002:adf:a310:: with SMTP id c16mr34802315wrb.319.1634077287703; 
 Tue, 12 Oct 2021 15:21:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwpJLs3oMFBsxhGcBh/yego2FLpmsDmJr8LEgO1el0TDmET3DspNnVppJEM2Osm9HT+QvH6Iw==
X-Received: by 2002:adf:a310:: with SMTP id c16mr34802286wrb.319.1634077287399; 
 Tue, 12 Oct 2021 15:21:27 -0700 (PDT)
Received: from [192.168.1.36] (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id l6sm3906992wmg.10.2021.10.12.15.21.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Oct 2021 15:21:26 -0700 (PDT)
Message-ID: <4af0e643-b80a-7a77-bf4c-f3bff68d70f7@redhat.com>
Date: Wed, 13 Oct 2021 00:21:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 1/1] util: Make some iova_tree parameters const
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
Cc: Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, qemu-trivial@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Xu <peterx@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20211012155001.811160-1-eperezma@redhat.com>
 <20211012155001.811160-2-eperezma@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211012155001.811160-2-eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 12 Oct 2021 22:21:35 -0000

On 10/12/21 17:50, Eugenio Pérez wrote:
> As qemu guidelines:
> Unless a pointer is used to modify the pointed-to storage, give it the
> "const" attribute.
> 
> In the particular case of iova_tree_find it allows to enforce what is
> requested by its comment, since the compiler would shout in case of
> modifying or freeing the const-qualified returned pointer.
> 
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>  include/qemu/iova-tree.h |  8 ++++----
>  hw/i386/intel_iommu.c    |  2 +-
>  util/iova-tree.c         | 10 +++++-----
>  3 files changed, 10 insertions(+), 10 deletions(-)

> -DMAMap *iova_tree_find_address(IOVATree *tree, hwaddr iova)
> +const DMAMap *iova_tree_find_address(const IOVATree *tree, hwaddr iova)
>  {
>      DMAMap map = { .iova = iova, .size = 0 };

You missed this one ^

With it declared const:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


