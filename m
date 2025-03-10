Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tra0R-00009W-P3
	for mharc-qemu-trivial@gnu.org; Mon, 10 Mar 2025 06:05:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tra0P-00006x-Ij
 for qemu-trivial@nongnu.org; Mon, 10 Mar 2025 06:05:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tra0N-0005VI-N0
 for qemu-trivial@nongnu.org; Mon, 10 Mar 2025 06:05:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741601102;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=DeIWIZK2S1qhkB/CFQuEBp4qiN/DuSqkS7RTlaMsUYQ=;
 b=bhwHHVTuotjk62fbVF8XSknv4MddNutfN84g1XuuFuNkW3BjEry+BBJ/b8wwrJKICVznz9
 i56A8swX/gv4QCZvBbU/UW4zHdu+eU7Vaiz8TTaEVswHiYAQ8u5XSGpW6X17LHyEdo+qmI
 a4D81QTt7IeQDNPrmVD31fD5MuLbF4A=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-Ia1Z1wB3PhGhsrvGN1HgjA-1; Mon, 10 Mar 2025 06:04:59 -0400
X-MC-Unique: Ia1Z1wB3PhGhsrvGN1HgjA-1
X-Mimecast-MFC-AGG-ID: Ia1Z1wB3PhGhsrvGN1HgjA_1741601099
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3912539665cso2228853f8f.1
 for <qemu-trivial@nongnu.org>; Mon, 10 Mar 2025 03:04:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741601098; x=1742205898;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DeIWIZK2S1qhkB/CFQuEBp4qiN/DuSqkS7RTlaMsUYQ=;
 b=PJSNaD7rfDyIV1lMxLwFJanV6xVZ6Wy1CBngKizezOZtcsP/vGRRnNAicOabMpy6kd
 FT0baIDciPJED97OyuLdlZpSXz2NY3QquZjOZp/c0T6+BAeO1tjx6L8NpxU6BkKqqXYH
 Or5k57Z4z9iDyW/wDExes5fAGYvUklHxj+wwe6fVAcgqzvuPRGaZMJ12jPU5mvph+6mD
 zo/Q1QRFc4k7m62yfYp7cpQjaWlLvkXxDFDclpARdR/5zAvZn2EbeZP/sAqK54wcKu1L
 DHuX5ABRwCenppLQR+HUq6LqpEbZGf7JlcXn+iP8c75wt5cr62rWgzFpTqHNHsNsdPX8
 j4pA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6l92ieewoZhrhHajiq5A+Ndy9ZlAtY+TuGxxrN7qHUqJyuptZO0IgCFGNIzE2h3wrq1HgOZof9Ti5ktc=@nongnu.org
X-Gm-Message-State: AOJu0YyjZZkPS6T99s/FcDbIxelaOuqDx3TXfJlxLm4ZaYRKhaRYzucS
 L+6DESP7A+ulb3pf/3PjDQjuHe/mn/BgDZz/8JqHIM/4RkPiyVnQZNkrWvZoKtS59gaDxTJd9mk
 zyVnGLXbF+Ef/cVSBv/J2PhNSinSCwcl1MaVBu+IJkOCim85CEfJmw2M=
X-Gm-Gg: ASbGncv7GYh1CgxTdaTMQFquZbqmTJzPd+wLnQX6jmwFO2Za4c6m3h7fuxYOk69WfMf
 LhJKldmG4jjMgdmVjNSwmHhERPHOzNEIN+ii0tTcCaFEDgaBImhWga9U/hlhmukS3kmPvUWgROV
 H5Mak8/hSHqOEoiYA0IvswCF24ZZfqyOAooyfTLF/5+lNsvoDoSpSeW29KCV+FXhj16MGZuQkSx
 F9hDT0lYuOXz5Gg7YiE+30XvB1toEcGAIooWRXMkkTp4wAAgFYLrJVIjnkkUIYE5m+NUXbMTLwT
 j9vg9Z5BuAF4BVK9jj3vXkaxuRi6bkH8+C75ZInnUpGJbQg=
X-Received: by 2002:a5d:5f82:0:b0:391:3156:6be with SMTP id
 ffacd0b85a97d-3913aeedecdmr5822164f8f.7.1741601098633; 
 Mon, 10 Mar 2025 03:04:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5i4iR5TnZlMlro7CYHgcJqrKzRT/NLw9cj5C6UhITwg/ifb1831MgaFx8b+Iz13fNFLTR7A==
X-Received: by 2002:a5d:5f82:0:b0:391:3156:6be with SMTP id
 ffacd0b85a97d-3913aeedecdmr5822144f8f.7.1741601098311; 
 Mon, 10 Mar 2025 03:04:58 -0700 (PDT)
Received: from [192.168.0.7] (ip-109-42-51-231.web.vodafone.de.
 [109.42.51.231]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912c0e3250sm14470539f8f.61.2025.03.10.03.04.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Mar 2025 03:04:57 -0700 (PDT)
Message-ID: <57e13dec-20b2-427e-a9c8-4d3a77ceec38@redhat.com>
Date: Mon, 10 Mar 2025 11:04:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/functional: Require 'user' netdev for ppc64 e500
 test
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, qemu-devel@nongnu.org
Cc: Bernhard Beschow <shentey@gmail.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20250308071328.193694-1-clg@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250308071328.193694-1-clg@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4_pxJRkICqDaFRHIT1wU2pI3Ao9omot0JinFLkrQFsw_1741601099
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-List-Received-Date: Mon, 10 Mar 2025 10:05:06 -0000

On 08/03/2025 08.13, Cédric Le Goater wrote:
> When commit 72cdd672e18c extended the ppc64 e500 test to add network
> support, it forgot to require the 'user' netdev backend. Fix that.
> 
> Fixes: 72cdd672e18c ("tests/functional: Replace the ppc64 e500 advent calendar test")
> Signed-off-by: Cédric Le Goater <clg@redhat.com>
> ---
>   tests/functional/test_ppc64_e500.py | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/tests/functional/test_ppc64_e500.py b/tests/functional/test_ppc64_e500.py
> index 9ce7ae6c4798..f5fcad9f6b66 100755
> --- a/tests/functional/test_ppc64_e500.py
> +++ b/tests/functional/test_ppc64_e500.py
> @@ -20,6 +20,7 @@ class E500Test(LinuxKernelTest):
>   
>       def test_ppc64_e500_buildroot(self):
>           self.set_machine('ppce500')
> +        self.require_netdev('user')
>           self.cpu = 'e5500'

Thanks, that should fix the issue that I saw in the 
"functional-cfi-ppc64-s390x" job in the gitlab CI (which uses 
--disable-slirp indeed)!

Reviewed-by: Thomas Huth <thuth@redhat.com>


