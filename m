Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rjaIj-0006cw-Vs
	for mharc-qemu-trivial@gnu.org; Mon, 11 Mar 2024 03:42:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clegoate@redhat.com>)
 id 1rjaIg-0006c5-IS
 for qemu-trivial@nongnu.org; Mon, 11 Mar 2024 03:42:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clegoate@redhat.com>)
 id 1rjaIe-0006JT-2P
 for qemu-trivial@nongnu.org; Mon, 11 Mar 2024 03:42:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1710142939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NdKaBwIYTS5kAgFX4EAlzXqT8OITpef6c+klwQHgjk8=;
 b=OiFuL5PlwBi2tNja1W4nfB9vsLaR9maMDTiR40i+6v88kIxD1X5kIc3NQqkokcbqzkiOOY
 zPjVGvYNAy8nD2KripmzQa4tUthBbZcdqn8jVbPxh2uqNSIUSc6Febij+ceJ5LL/F1tiqK
 7W5CRyx2cNkCea1ia1rYJ3658N0aDYM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-336-Pw1Ptgs_OoGnEljYeqmIgQ-1; Mon, 11 Mar 2024 03:42:17 -0400
X-MC-Unique: Pw1Ptgs_OoGnEljYeqmIgQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4132cf5b950so1162755e9.0
 for <qemu-trivial@nongnu.org>; Mon, 11 Mar 2024 00:42:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710142935; x=1710747735;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NdKaBwIYTS5kAgFX4EAlzXqT8OITpef6c+klwQHgjk8=;
 b=bfukN3LTi4F2Si8jrjmPJJtIPthxyuNzJ46m1Z6vLiiw2sEpEuciOUuWT7HxO6mKib
 E1RtRLzCBTHOls5rwmxJ+NMFN5p4z4AZwPDX37hgS698FbTPPCdb3mHNN6jS8LyQiUI/
 2LCPKDG5sk2XunMibzzwrQZrXbFdaNq9U1NrgABMck808hF5zNwBaDkaKTFIXJI2aYWk
 JriR09eOIb/tqlNXYBEAsUeC0NurVMV/GFT7dTFNigGu8sIEEGAM54iBjBRqCJ5UJz+T
 KyZTEp93lM81Zq4ZGM67kyILKhY8BJbHcqVlNPSPAMAVdMZOOoA4CIUhFRmhmEN4wjA0
 pJ7w==
X-Gm-Message-State: AOJu0YzmRDA7e49MdTlgZfh7QGtPqZWI+oJLpLnjemyVhtutO4XX+pQX
 JO4Ugo8tkAi8KlnEDiv8bo2I5MYwQxiqb61x+GLU+KhGFCM8Rsr4MFdNS5z7Q/gCGQpeuJT/g9e
 bs1YQjMNhdHpjgNeHnlIrdNGmnAKrrOZqwBMJOPGZdlwcJ0aFsJYI6R8=
X-Received: by 2002:a05:600c:4f50:b0:412:ee33:db93 with SMTP id
 m16-20020a05600c4f5000b00412ee33db93mr5147958wmq.3.1710142935815; 
 Mon, 11 Mar 2024 00:42:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHaC+vmNUs5IeDU5nUBD1wW16ZGHUDGeZPHVSeY+NX35mFIgdWI8bksTsuSE/th1aPIErPZAw==
X-Received: by 2002:a05:600c:4f50:b0:412:ee33:db93 with SMTP id
 m16-20020a05600c4f5000b00412ee33db93mr5147942wmq.3.1710142935527; 
 Mon, 11 Mar 2024 00:42:15 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:280:24f0:9db0:474c:ff43:9f5c?
 ([2a01:e0a:280:24f0:9db0:474c:ff43:9f5c])
 by smtp.gmail.com with ESMTPSA id
 m38-20020a05600c3b2600b00412b6fbb9b5sm14797294wms.8.2024.03.11.00.42.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Mar 2024 00:42:15 -0700 (PDT)
Message-ID: <8c190ff9-137e-4f1e-ba74-b4beaaa90e7f@redhat.com>
Date: Mon, 11 Mar 2024 08:42:12 +0100
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clegoate@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.945,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Mon, 11 Mar 2024 07:42:24 -0000

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


Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.



