Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tYi6D-0006Jg-TC
	for mharc-qemu-trivial@gnu.org; Fri, 17 Jan 2025 03:53:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tYi67-0006GS-W6
 for qemu-trivial@nongnu.org; Fri, 17 Jan 2025 03:53:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tYi65-0006t0-VI
 for qemu-trivial@nongnu.org; Fri, 17 Jan 2025 03:52:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737103977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Nbz7pTOaIvfFkVMaVkfZmNSRTinSNx1/DExwTRtwD+8=;
 b=VgutYzX5av4yVPUhoKoVooj8Da4p2a1XfZm96X8B4lbmFz5V6yyhAIzea+hZ+HE9mk/j/X
 Gl6cF3vQCRH7Rf4lpBx+5dgAiFP433aqRVUMqusHklY1zDPz/g66sfkYWZhbe0A3yF3ANu
 Bl8Ayj8RQ8XvnLLrixr4hF1lbZgVeFY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-168-SsSDeixyNuWt7vaOJlqQsg-1; Fri, 17 Jan 2025 03:52:54 -0500
X-MC-Unique: SsSDeixyNuWt7vaOJlqQsg-1
X-Mimecast-MFC-AGG-ID: SsSDeixyNuWt7vaOJlqQsg
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-38bf5ef17a5so346329f8f.2
 for <qemu-trivial@nongnu.org>; Fri, 17 Jan 2025 00:52:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737103973; x=1737708773;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Nbz7pTOaIvfFkVMaVkfZmNSRTinSNx1/DExwTRtwD+8=;
 b=HBoFQeTnQMS0/PZ7d5oX/37ydlnqw0SLUXdDLAbY3m5dWhi9XyCwfbaLODbX043or9
 SvkPBZlju7QoUcT45gU5l+EOrHyTWPXDsy4wY7SWezwLebAShszpR5G+Bkf9ujpd4VjV
 wYvFFGJaEUYmLJH/HJxUoZeaZmvzF0C7akUgGtFdK3zMvLY9pwB0HeMxCmE4NH37hBOf
 yAvvOTc5B9me2WHO/qhgpuqoZB3ZZSUoJ/NNkEgBZxFkUYCx1uRpyFKEyBQh0C/S9bMX
 IneWr0q8CawNMSoYtP/OP+K3MCP8DqFa20KyeT5PBATAV0lS2GDc4/jI6CPCEmNQUwcE
 7zYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsprZsnP1+/hnl6Hg4NfJK5AWr+ACt7FxQAX1OF44DS3jNGSUfu47llkBhz24HGz/+8RH3WefI3FgGeCU=@nongnu.org
X-Gm-Message-State: AOJu0YzJnRVl3NjrFyHK7r1OdiMjteeSi3Fb3RF6DCbwZA1ysGMOXYz/
 pEu/4NTIaxTP70yHskrRqkfKfQwCHEq66zdC4SL4xJmSCxEgG/ohgHBeZVSv6PmeSdwQTMXB2oj
 7SuIBQKxhXX7cIAX47M2+62yC4Yay8kx86qc5VsxA1cFb7Y3fLAlYiZ8=
X-Gm-Gg: ASbGncsSLs7fSNlj5Y3NgHkBI2zrzBN1kRot6X830HyM3xXXQwSPuu5ThBYLYn2DBWW
 LyChO2ycANXzttubL2qQSWJRCxmZP5670uBgwnHp/IX+V57vSH63CnT1FVt607KZa11lSVZfNaF
 e7zmyRO2j15ztLLr250ZItFeIz53nzmbHcgVJgqX+gBJViYd5lMgFDWI/Y2JrNxM49wlR+2/qFU
 4UaYBgkbRCPqlvC8R29EihQV/rwCIC3K2PxSj4rOQAtG1hwoVtKN3ZekmvsWAwRcw1YXzxyPOzl
 BkGrFEGmANuZ
X-Received: by 2002:a05:6000:178e:b0:388:c61d:43e4 with SMTP id
 ffacd0b85a97d-38bf57b9d47mr1258802f8f.45.1737103972763; 
 Fri, 17 Jan 2025 00:52:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG1vAG4A4w2ulsi16D8ZB4wYfSAOaKt2HirTQ4tv+9x7MTYNaMoPFaWfhuz7y535EmrP5A3vg==
X-Received: by 2002:a05:6000:178e:b0:388:c61d:43e4 with SMTP id
 ffacd0b85a97d-38bf57b9d47mr1258775f8f.45.1737103972434; 
 Fri, 17 Jan 2025 00:52:52 -0800 (PST)
Received: from [192.168.0.7] (ip-109-42-51-119.web.vodafone.de.
 [109.42.51.119]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4389046885esm25669135e9.36.2025.01.17.00.52.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Jan 2025 00:52:52 -0800 (PST)
Message-ID: <9ee34c5f-d65c-447a-b128-96cf44b94b6e@redhat.com>
Date: Fri, 17 Jan 2025 09:52:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/21] hw/i386/pc: Remove unused pc_compat_2_3 declarations
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, QEMU Trivial <qemu-trivial@nongnu.org>
Cc: Jason Wang <jasowang@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, qemu-block@nongnu.org,
 Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Zhao Liu <zhao1.liu@intel.com>,
 Yanan Wang <wangyanan55@huawei.com>, Kevin Wolf <kwolf@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, John Snow <jsnow@redhat.com>
References: <20250115232247.30364-1-philmd@linaro.org>
 <20250115232247.30364-2-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250115232247.30364-2-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: eJPODjfhwFeng_pHUpoWl44MFoOIwM_xXn4v4nmImbQ_1737103973
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.093,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1.797,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-List-Received-Date: Fri, 17 Jan 2025 08:53:01 -0000

On 16/01/2025 00.22, Philippe Mathieu-Daudé wrote:
> We removed the implementations in commit 46a2bd52571
> ("hw/i386/pc: Remove deprecated pc-i440fx-2.3 machine")
> but forgot to remove the declarations. Do it now.
> 
> Fixes: 46a2bd52571 ("hw/i386/pc: Remove deprecated pc-i440fx-2.3 machine")
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/hw/i386/pc.h | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index a558705cb9a..103b54301f8 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -302,9 +302,6 @@ extern const size_t pc_compat_2_5_len;
>   extern GlobalProperty pc_compat_2_4[];
>   extern const size_t pc_compat_2_4_len;
>   
> -extern GlobalProperty pc_compat_2_3[];
> -extern const size_t pc_compat_2_3_len;
> -
>   #define DEFINE_PC_MACHINE(suffix, namestr, initfn, optsfn) \
>       static void pc_machine_##suffix##_class_init(ObjectClass *oc, void *data) \
>       { \

Reviewed-by: Thomas Huth <thuth@redhat.com>


