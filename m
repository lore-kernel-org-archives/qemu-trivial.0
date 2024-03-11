Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rjaIT-0006aC-KD
	for mharc-qemu-trivial@gnu.org; Mon, 11 Mar 2024 03:42:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clegoate@redhat.com>)
 id 1rjaIS-0006ZX-7L
 for qemu-trivial@nongnu.org; Mon, 11 Mar 2024 03:42:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clegoate@redhat.com>)
 id 1rjaIP-0006Fw-Kf
 for qemu-trivial@nongnu.org; Mon, 11 Mar 2024 03:42:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1710142923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lZsD4Cd8TiQrd0EYmIkzGuuEMBx0IvBbsO+tklst1EA=;
 b=CVNcC0upZpAsRMlT3XQ7H+IE6E7hMdi0mo+kCCntZ6Ych7EW+1QNzl1KJFWfir9gpPqjgq
 C1FWTIlvaIq2JhqUmd41tY9JZbDWVpEfZi2biqWH1FlKC/zqhErFMHwciSc/G60op7IUTo
 8I2LK6lh6JZ40gdAebG8xT7s9DkEW/4=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-373-3nVCefosNdCDKrLNbuaAxw-1; Mon, 11 Mar 2024 03:42:00 -0400
X-MC-Unique: 3nVCefosNdCDKrLNbuaAxw-1
Received: by mail-lf1-f72.google.com with SMTP id
 2adb3069b0e04-5139c92ba2eso1284430e87.1
 for <qemu-trivial@nongnu.org>; Mon, 11 Mar 2024 00:42:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710142919; x=1710747719;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lZsD4Cd8TiQrd0EYmIkzGuuEMBx0IvBbsO+tklst1EA=;
 b=abfEdi3vxOdOpxAaEKD5HeNABHQnB2nzLfpFPo5gRO9Vxo6LE8vgr9BRcjNu9snSSn
 SOOlaGpL12qqMnCUYccLlcpLTABgtsvl9nDBR9i/STjqdWHgtUcTu0suhPS1LjUXwTG8
 XQi2WPQUZmNHUHb65FS2pntW0929cyfd/qUaejqZeAs9ufIFW4mJRP54vJ9MYpOyIPTB
 BejzqCN34bx7Fi+bdapGptDcVcPKrsdrPaJZmulj1m0KCaIZRKX48EoixD+Xfr/vvzIs
 fg3D9v/mrNdG97uHC/G0td16X4PhHAgdrjTfN9538FYc8R38JGU97TdhSia7wUdbzvV5
 lPyA==
X-Gm-Message-State: AOJu0Yx4Mu1g2re+yh4FDCHZeUnDAhx3C9JSWeTpfWpc2558BJvx/AYm
 uCnbuezSmlD7etpdJpCUyp2TFIe7rWTtuuH8lNPP5oeVsH97TfhP6natNPDpAVnTWw4GC/6+g1a
 UA1DxLEshASjme6UcGN0B/5PF/haPsIrdeDEYP1hZwO054vBJ9pyxEMg=
X-Received: by 2002:a05:6512:118e:b0:513:23be:e924 with SMTP id
 g14-20020a056512118e00b0051323bee924mr4457943lfr.59.1710142919031; 
 Mon, 11 Mar 2024 00:41:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKRe/7tgwMXo120uKBJePAZrklcFs4PoDG+6meLDMuz6j5bg/D9Tg8U5X1Vv2rn/8F9RNtUw==
X-Received: by 2002:a05:6512:118e:b0:513:23be:e924 with SMTP id
 g14-20020a056512118e00b0051323bee924mr4457920lfr.59.1710142918662; 
 Mon, 11 Mar 2024 00:41:58 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:280:24f0:9db0:474c:ff43:9f5c?
 ([2a01:e0a:280:24f0:9db0:474c:ff43:9f5c])
 by smtp.gmail.com with ESMTPSA id
 e10-20020a05600c4e4a00b004132aa2f857sm2001045wmq.17.2024.03.11.00.41.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Mar 2024 00:41:58 -0700 (PDT)
Message-ID: <675daa19-96ac-48c4-a2a5-baf4cc38facb@redhat.com>
Date: Mon, 11 Mar 2024 08:41:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 29/29] target/s390x/cpu_models: Fix missing
 ERRP_GUARD() for error_prepend()
To: Zhao Liu <zhao1.liu@linux.intel.com>, Thomas Huth <thuth@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Michael Tokarev <mjt@tls.msk.ru>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Zhao Liu <zhao1.liu@intel.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, qemu-s390x@nongnu.org
References: <20240311033822.3142585-1-zhao1.liu@linux.intel.com>
 <20240311033822.3142585-30-zhao1.liu@linux.intel.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clegoate@redhat.com>
In-Reply-To: <20240311033822.3142585-30-zhao1.liu@linux.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clegoate@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.945,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 11 Mar 2024 07:42:08 -0000

On 3/11/24 04:38, Zhao Liu wrote:
> From: Zhao Liu <zhao1.liu@intel.com>
> 
> As the comment in qapi/error, passing @errp to error_prepend() requires
> ERRP_GUARD():
> 
> * = Why, when and how to use ERRP_GUARD() =
> *
> * Without ERRP_GUARD(), use of the @errp parameter is restricted:
> ...
> * - It should not be passed to error_prepend(), error_vprepend() or
> *   error_append_hint(), because that doesn't work with &error_fatal.
> * ERRP_GUARD() lifts these restrictions.
> *
> * To use ERRP_GUARD(), add it right at the beginning of the function.
> * @errp can then be used without worrying about the argument being
> * NULL or &error_fatal.
> 
> ERRP_GUARD() could avoid the case when @errp is &error_fatal, the user
> can't see this additional information, because exit() happens in
> error_setg earlier than information is added [1].
> 
> In target/s390x/cpu_models.c, there are 2 functions passing @errp to
> error_prepend() without ERRP_GUARD():
> - check_compatibility()
> - s390_realize_cpu_model()
> 
> Though both their @errp parameters point to their callers' local @err
> virables and don't cause the issue as [1] said, to follow the
> requirement of @errp, also add missing ERRP_GUARD() at their beginning.
> 
> [1]: Issue description in the commit message of commit ae7c80a7bd73
>       ("error: New macro ERRP_GUARD()").
> 
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Ilya Leoshkevich <iii@linux.ibm.com>
> Cc: qemu-s390x@nongnu.org
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> ---


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.




