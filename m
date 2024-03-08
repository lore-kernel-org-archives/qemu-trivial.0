Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1riX9D-0004Bk-8x
	for mharc-qemu-trivial@gnu.org; Fri, 08 Mar 2024 05:08:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1riX9B-00048j-AV
 for qemu-trivial@nongnu.org; Fri, 08 Mar 2024 05:08:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1riX99-0008WT-NS
 for qemu-trivial@nongnu.org; Fri, 08 Mar 2024 05:08:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709892490;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=kBX+z/z57+r8+7rIrPfN4XVVZZVFxDkYRzioPzn0ojY=;
 b=B2BskgyIwL2tIIDcN7LovRDspgCckiu6HH84JoKVva7aB+c1TqIRUNUPBylVDp1ulu2B05
 r31/egGl1ZNtmkmi0L6Kf5ZYaJtMdQ0ypPyOnKIbybZ/Ar5dEZvEgaW6ddQQ4Fv0oQeLZS
 sntaUDmo8cia+NThYxMXanD+t8MLGmc=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-551-RzEVNGNUPv-yToePWlYfEQ-1; Fri, 08 Mar 2024 05:08:08 -0500
X-MC-Unique: RzEVNGNUPv-yToePWlYfEQ-1
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-78823bb1fcbso304149485a.1
 for <qemu-trivial@nongnu.org>; Fri, 08 Mar 2024 02:08:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709892488; x=1710497288;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kBX+z/z57+r8+7rIrPfN4XVVZZVFxDkYRzioPzn0ojY=;
 b=c9lZt2JJzbzOdoDlli1lbcyKdZf2aD2azarJl+8iwa0YpOzh+bn8jcXPeJl1mIgqA8
 fNDH3SiqSy/i9aqpJA8LnjACbIli3/0jUoz2Jv3qCqBEeVj0Cf36hCxH/acwMdhzWj0y
 y9QtStZijkQ0A2JxZceyozD9RThBJ56KAD0Qg6v3aQpvVMgBUkgoygQwWtja/FmzXYOq
 EPHhfoKsPmiiEPdTh+ry0oj6O8vCcS2Ca/QqFuZtgoGjnglbcivxzTPL2dbsbktHwr6w
 5co7L7+U/JNXEjptkLo2HFlvtXUiVVicXb9JIO5F89qVVn12bOQPBXGr/IVKfK9f42dB
 pXNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdzZDRhAUmUXAL1kHmi0BGim/IfjzsqjUgn93oh5EFJ6KSO/Y3HzYqfWmLbqnyTeCY7jlaz9iRUfedXbBtKmIzx4kR11qtoA==
X-Gm-Message-State: AOJu0YxKdHUNnuP3Bxwo28oLUbsJHk6bg964UESpaJZgN+XqjTapgEMV
 bvJsHpm2ezEP9JgG+4bOgJ1Jhra3imOKFO/yCmyX2w6WqT7yrSmAQcuzn+ruNmatO+SK+C+1WLs
 /U3MKRtX2LGfdX81TYhQrG43y2mienbGb/5QI2PFmtf7ab9JaR2H+8D0=
X-Received: by 2002:a05:620a:2010:b0:787:c0b9:e83 with SMTP id
 c16-20020a05620a201000b00787c0b90e83mr6011830qka.22.1709892488331; 
 Fri, 08 Mar 2024 02:08:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEu6ZtX8LyywdZqxqRQdLjdRYCvqUpsfNzt7rkRXWtqcZBI+F+CXUKxpxTSI4yZkjwSFx2iMw==
X-Received: by 2002:a05:620a:2010:b0:787:c0b9:e83 with SMTP id
 c16-20020a05620a201000b00787c0b90e83mr6011811qka.22.1709892488058; 
 Fri, 08 Mar 2024 02:08:08 -0800 (PST)
Received: from [192.168.0.9] (ip-109-43-178-151.web.vodafone.de.
 [109.43.178.151]) by smtp.gmail.com with ESMTPSA id
 c17-20020a05620a0cf100b007881eb5683fsm6192157qkj.2.2024.03.08.02.08.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Mar 2024 02:08:07 -0800 (PST)
Message-ID: <99ea790b-c30d-4c69-aad9-d02941ee820e@redhat.com>
Date: Fri, 8 Mar 2024 11:08:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/17] target/s390x/cpu_models: Fix missing ERRP_GUARD()
 for error_prepend()
To: Zhao Liu <zhao1.liu@linux.intel.com>
Cc: Markus Armbruster <armbru@redhat.com>, Michael Roth
 <michael.roth@amd.com>, Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>
References: <20240229143914.1977550-1-zhao1.liu@linux.intel.com>
 <20240229143914.1977550-18-zhao1.liu@linux.intel.com>
 <6e7eff95-cfd3-46f9-9937-7597b2e4f3ee@redhat.com>
 <Zerkf6nNsrUTXIrb@intel.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <Zerkf6nNsrUTXIrb@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.583,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 08 Mar 2024 10:08:13 -0000

On 08/03/2024 11.12, Zhao Liu wrote:
> Hi Thomas,
> 
>>>    void s390_realize_cpu_model(CPUState *cs, Error **errp)
>>>    {
>>> +    ERRP_GUARD();
>>>        Error *err = NULL;
>>
>> I think that function could use an additional clean-up now: Remove the local
>> "err" variable and use "errp" only instead.
>>
> 
> Since many cases check @err to determine if the callee function fails,
> it's better also make those functions reture something like boolean
> instead of void. Then we could avoid checking @err/@errp.
> 
> Thus, the remaining cleanups include:
> * related conversion of local @err to @errp and
> * make the callee function return someting,
> 
> I can do these centrally in another series, and this series (part 1 +
> part 2, 33 patches in total) will only be used for adding ERRP_GUARD(),
> which makes it easier to review as well as easier to merge.
> 
> Do you agree? ;-)

Fine for me.

  Thomas



