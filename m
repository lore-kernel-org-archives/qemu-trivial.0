Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pMr75-0005Qo-IC
	for mharc-qemu-trivial@gnu.org; Tue, 31 Jan 2023 08:55:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMr6z-0005QH-Th
 for qemu-trivial@nongnu.org; Tue, 31 Jan 2023 08:55:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMr6v-0000WB-DG
 for qemu-trivial@nongnu.org; Tue, 31 Jan 2023 08:55:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675173344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o08yW3FuLyNxr3iG/vP75eXGUnw6+S0gAKTdOpPMBWM=;
 b=OesWYwxL5a0CpynBsaDwN0TWiJwMmp4Qhdo4ZLs+E9dfU6dg0RIwt2F+CswN+byR5Xjux2
 FDf0ZBzcPM2Wqb0avZB61Dj4kpQxNwAxZf+uivdaE2IXlkK8eJjC4NO0DlVN+rb+au6WRQ
 0xcrM+/DCB34qV4i03RXj+z/oN0kadU=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-333-IkdXEUWyOWSpETkfxz82IQ-1; Tue, 31 Jan 2023 08:55:43 -0500
X-MC-Unique: IkdXEUWyOWSpETkfxz82IQ-1
Received: by mail-qt1-f198.google.com with SMTP id
 o16-20020ac841d0000000b003b689580725so6653301qtm.22
 for <qemu-trivial@nongnu.org>; Tue, 31 Jan 2023 05:55:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=o08yW3FuLyNxr3iG/vP75eXGUnw6+S0gAKTdOpPMBWM=;
 b=KVQDJLCJGbb5LhbwrOAt4p91kBEq6Impcye39FKrD2Kf1h5dCalvKoaBUTT0JPApKP
 i38EqEI+lqnieMS/lbPxckfL+urfWiUpR7G/yVlOujWwI0uzy8NXcOiBNrIElTEsJOLi
 eVU/elX2AAxp00mSB6QSux4gKdL9RPYWDcSiKiU97l5fbICUd7cxVxiEF/4CvLF3ZlJV
 1LZZB33AYtUSd+DHEtBLZ82M2OJhSsQ6eU7rd866v9ANnKkUzNJnK0ZFduv1Dud7iCP4
 +d0oh/duAR39LKAU105zLijnkkjUx2U7b9mkn8JP6W3j0+eCgwmRTZ3Cbg+nUma46RRy
 g4tA==
X-Gm-Message-State: AO0yUKUmIJC3PoBblCe+aF3EI5brwa6ApSf3suHj8lCD9l+Qs4hxEqhn
 P2YxrEttd8qEGjE1FQif9jQHEJ2RxMGjgLumawAK0kWDQer1rSdllg2pvfXfIX8z+mWLPOny0Wc
 JzqC1ZSiOqG5dMzQ+gQ==
X-Received: by 2002:a05:622a:408:b0:3b9:b6c8:6d5b with SMTP id
 n8-20020a05622a040800b003b9b6c86d5bmr294608qtx.35.1675173343206; 
 Tue, 31 Jan 2023 05:55:43 -0800 (PST)
X-Google-Smtp-Source: AK7set/SJhAm/1le1/czUnI7Te1Is61BHIGMIGFYTOVkTGOz3JjIKBtK7iQDsKUBP7Uj6Gb7W02wig==
X-Received: by 2002:a05:622a:408:b0:3b9:b6c8:6d5b with SMTP id
 n8-20020a05622a040800b003b9b6c86d5bmr294579qtx.35.1675173342987; 
 Tue, 31 Jan 2023 05:55:42 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-155.web.vodafone.de.
 [109.43.176.155]) by smtp.gmail.com with ESMTPSA id
 a8-20020ae9e808000000b0071dc769d5e7sm4826831qkg.56.2023.01.31.05.55.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Jan 2023 05:55:42 -0800 (PST)
Message-ID: <9a41a7e9-f50b-566c-520c-c7014d9f658c@redhat.com>
Date: Tue, 31 Jan 2023 14:55:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 05/20] hw/i386/pc_{q35, piix}: Reuse MachineClass::desc
 as SMB product name
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Ani Sinha
 <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Laurent Vivier <lvivier@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, qemu-trivial@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20230131115326.12454-1-shentey@gmail.com>
 <20230131115326.12454-6-shentey@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230131115326.12454-6-shentey@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 31 Jan 2023 13:55:50 -0000

On 31/01/2023 12.53, Bernhard Beschow wrote:
> No need to repeat the descriptions.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/i386/pc_piix.c | 2 +-
>   hw/i386/pc_q35.c  | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


