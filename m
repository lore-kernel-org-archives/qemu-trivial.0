Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qmEdA-00052s-LM
	for mharc-qemu-trivial@gnu.org; Fri, 29 Sep 2023 10:38:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qmEd8-0004zt-4v
 for qemu-trivial@nongnu.org; Fri, 29 Sep 2023 10:38:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qmEd5-0001th-Ai
 for qemu-trivial@nongnu.org; Fri, 29 Sep 2023 10:38:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695998286;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dlZ92PaieIcAo0LulD7/aTcMzuq6A1g2LDknhLTBBBU=;
 b=dcd7NTZKyI7pHr+PyIAzJX6RDaDQR1IzkYIkFrKF8wLtKQZlcx6y05iAQRXT/fexupB59j
 jZJnz5TEONF0hBi8/1PQ2+JOczdmDFGz1MK4DXQEAdpRJEdALCqY/19wxhqmUyALPyWlf5
 amm9JS+z+WNMmcZCZnG8wkJa0hl131Y=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-32-iCyjVlLPP5q4Zf1D2syp-Q-1; Fri, 29 Sep 2023 10:38:05 -0400
X-MC-Unique: iCyjVlLPP5q4Zf1D2syp-Q-1
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-774307520a2so2125562785a.2
 for <qemu-trivial@nongnu.org>; Fri, 29 Sep 2023 07:38:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695998284; x=1696603084;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dlZ92PaieIcAo0LulD7/aTcMzuq6A1g2LDknhLTBBBU=;
 b=IxBsE8vk5ez/5sOhLUsK1DvLixT933FN9Bv7JoSBhH8ME9OEX04Ep0hNRFpTxQ3+uY
 uu5y9zDGGmyyszwQIwDjMyrk0SAKVB0fzKue0UVyTgU/3EkIZpqtjaTagOkQym6X+p/O
 AcuXiOeNyGQkkfI61lmrweVq52+m2DUzJTxQ4bsDw/6Q3Sb8wVGwDf7ZVu+OrrNRwqon
 4um3S5h7H9KIzuZ062ZBWbSxr2vZVEMEJnKTiCnwNaTXFKH/ClM/1EZfUjkRrOg3en/i
 nnMpWlnmTS1abYVMjsEQ2aWCWcdY5Eq3OeCJbm07YkCHpcQqHLBK4/MHsPFd58b1Eu0N
 fAlA==
X-Gm-Message-State: AOJu0Yw50lIeVr812XM8ymWMR1Wi+rstxIrrz950uKx+si2enKr4hDOj
 4p9QlATfTQjNiya4l45iEAZCm9aks7fqs10opa51di4JVcJDiXbtKGG2gFGuVDvpRGX45ib9N9G
 oEZ08JjTblL7fwNU/vg==
X-Received: by 2002:a0c:b45e:0:b0:656:55f8:e82 with SMTP id
 e30-20020a0cb45e000000b0065655f80e82mr3897174qvf.32.1695998284358; 
 Fri, 29 Sep 2023 07:38:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQdkHwyU2OMqeE9C/GSYdBGiZEm7bmnQx1JZUtprBmEEPv7Al5XOEuVljABL2WMTC9EDTIDA==
X-Received: by 2002:a0c:b45e:0:b0:656:55f8:e82 with SMTP id
 e30-20020a0cb45e000000b0065655f80e82mr3897161qvf.32.1695998284104; 
 Fri, 29 Sep 2023 07:38:04 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-177-123.web.vodafone.de.
 [109.43.177.123]) by smtp.gmail.com with ESMTPSA id
 f23-20020ae9ea17000000b00767da9b6ae9sm6976845qkg.11.2023.09.29.07.38.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Sep 2023 07:38:03 -0700 (PDT)
Message-ID: <c7dbf14f-66bf-4180-a4fb-1e064b1581e2@redhat.com>
Date: Fri, 29 Sep 2023 16:38:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] MAINTAINERS: add standard-headers to Hosts/LINUX
To: Cornelia Huck <cohuck@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20230929143012.77128-1-cohuck@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230929143012.77128-1-cohuck@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.295, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 29 Sep 2023 14:38:11 -0000

On 29/09/2023 16.30, Cornelia Huck wrote:
> The files in there are updated via update-linux-headers.sh.
> 
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 355b1960ce46..95df1f3d8884 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -556,6 +556,7 @@ M: Cornelia Huck <cohuck@redhat.com>
>   M: Paolo Bonzini <pbonzini@redhat.com>
>   S: Maintained
>   F: linux-headers/
> +F: include/standard-headers/
>   F: scripts/update-linux-headers.sh
>   
>   POSIX

Reviewed-by: Thomas Huth <thuth@redhat.com>


