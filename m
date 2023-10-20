Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qtqQb-0002Qc-S1
	for mharc-qemu-trivial@gnu.org; Fri, 20 Oct 2023 10:24:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qtqQa-0002MI-Cu
 for qemu-trivial@nongnu.org; Fri, 20 Oct 2023 10:24:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qtqQY-0005Wo-VD
 for qemu-trivial@nongnu.org; Fri, 20 Oct 2023 10:24:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697811877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=eKkurRpxg+wOFE0iX+4T11sU7fO+QJQ+3FWVLnmKKHQ=;
 b=BlL4h8jbtFedbUmVzmZ+nyqmCkqiZyBgDemyYwwD7kXZ9CWXuKuIB7/RojFPY8dkQUdv4S
 ZlR9V9fViI35TlRvn/4jq8X7a8VugGBhokcoXrz/TdNr96nfXe6CPOoPg4uTGTMStf2ICP
 KZx55gFwxp5K+D4S2JzQIeWGmdjFOM4=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-68-UMngApy_NBmonJg4S2j7Dw-1; Fri, 20 Oct 2023 10:24:36 -0400
X-MC-Unique: UMngApy_NBmonJg4S2j7Dw-1
Received: by mail-ot1-f71.google.com with SMTP id
 46e09a7af769-6cd91356d52so1255610a34.2
 for <qemu-trivial@nongnu.org>; Fri, 20 Oct 2023 07:24:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697811875; x=1698416675;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eKkurRpxg+wOFE0iX+4T11sU7fO+QJQ+3FWVLnmKKHQ=;
 b=AJMN75dIXPmH2EFlUS0ddGt3WY3lJjpUSk626hMk9bw0w8uOeyAdbCAw0XsH+M6hPg
 /mrJHXb2mf3LIDNriJuor8QtPomVLobLCgPvZwLAHG2f4dhLjpK8Fji2wZ8kah5ovBlB
 bF2oNphQPep66Leee/IXpyjM35vwY07cReHzpWuSaYoQMXaysv+MMYof5LGNMlHJ0IEL
 sg0nveWR4LWsgnuXxq49SndzwE6HOwPCjA/x/TBk1ia48K6RY6sbrhuEGR115IxgZjmQ
 i1dwjGlp+6r/VWn/LsGPzjLesD++by2PiQ50NxYFWly7/5THmwJsMNknvVY9siOKHFRW
 yxXQ==
X-Gm-Message-State: AOJu0Yz12HEPToHb+DaEhibZ4hwFWlnLnlSxDrWSPMprI9igGAZ+wdl5
 Dy9hPE50l2ti3poG5u9d6pKDjO/hDcN8hPUZVwzeV46Lb1oLyRfwBXRnCJiaMkdnmqLtMPPjWJr
 32vsAn39j1+9TtUsnaA==
X-Received: by 2002:a05:6808:1c1:b0:3b2:f588:5a9c with SMTP id
 x1-20020a05680801c100b003b2f5885a9cmr1951057oic.6.1697811875658; 
 Fri, 20 Oct 2023 07:24:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9nU4QfqkPslUPlVzupEd+r96um1Zx94YSNrhzT/oENqwmZI6u9FdQqNfZ/zfBz5Esc9GNdw==
X-Received: by 2002:a05:6808:1c1:b0:3b2:f588:5a9c with SMTP id
 x1-20020a05680801c100b003b2f5885a9cmr1951037oic.6.1697811875383; 
 Fri, 20 Oct 2023 07:24:35 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-141.web.vodafone.de.
 [109.43.176.141]) by smtp.gmail.com with ESMTPSA id
 pz6-20020ad45506000000b0065b24c08994sm710039qvb.128.2023.10.20.07.24.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Oct 2023 07:24:35 -0700 (PDT)
Message-ID: <de6d7692-34fd-403e-b5ea-026f7699c32f@redhat.com>
Date: Fri, 20 Oct 2023 16:24:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Fix a couple s390 paths
To: Eric Farman <farman@linux.ibm.com>, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>
Cc: qemu-s390x@nongnu.org, David Hildenbrand <david@redhat.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Juan Quintela <quintela@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>
References: <20231020141509.2096591-1-farman@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20231020141509.2096591-1-farman@linux.ibm.com>
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Fri, 20 Oct 2023 14:24:40 -0000

On 20/10/2023 16.15, Eric Farman wrote:
> These are simple typos, since the directories don't exist but the
> files themselves do in hw/s390x/
> 
> Fixes: 56e3483402 ("MAINTAINERS: split out s390x sections")
> Signed-off-by: Eric Farman <farman@linux.ibm.com>
> ---
>   MAINTAINERS | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9bd4fe378d..ac71eff7fa 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2574,7 +2574,7 @@ M: Halil Pasic <pasic@linux.ibm.com>
>   M: Christian Borntraeger <borntraeger@linux.ibm.com>
>   S: Supported
>   F: hw/s390x/storage-keys.h
> -F: hw/390x/s390-skeys*.c
> +F: hw/s390x/s390-skeys*.c
>   L: qemu-s390x@nongnu.org
>   
>   S390 storage attribute device
> @@ -2582,7 +2582,7 @@ M: Halil Pasic <pasic@linux.ibm.com>
>   M: Christian Borntraeger <borntraeger@linux.ibm.com>
>   S: Supported
>   F: hw/s390x/storage-attributes.h
> -F: hw/s390/s390-stattrib*.c
> +F: hw/s390x/s390-stattrib*.c
>   L: qemu-s390x@nongnu.org
>   
>   S390 floating interrupt controller

Reviewed-by: Thomas Huth <thuth@redhat.com>


