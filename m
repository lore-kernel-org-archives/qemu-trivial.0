Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rjzaw-0007E3-TB
	for mharc-qemu-trivial@gnu.org; Tue, 12 Mar 2024 06:42:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rjzar-0007DU-Kq
 for qemu-trivial@nongnu.org; Tue, 12 Mar 2024 06:42:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rjzaq-00083j-32
 for qemu-trivial@nongnu.org; Tue, 12 Mar 2024 06:42:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1710240165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=BeuAOt/r8kCLKqvGEqqWgAEL/dK9McVlz20zQTDAsd8=;
 b=HBtyDvnSer0B267nf5QsGr9t3ghpdM3un0KcvOlUlyHjsAX1PQWGYZDbfiur2lMJAMouSm
 5nuFkJi8NdgjY6xn9s9Ur5hq6ouFUnrvtzHkq1o3C/ezpG+fXaCVI4k83Y2cJ20NkyKtbE
 A1K7PN7RtrXahOAzW5Is2aW+kNdfCls=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-347-dcm0h-KIMnedhFFPRg6aYw-1; Tue, 12 Mar 2024 06:42:42 -0400
X-MC-Unique: dcm0h-KIMnedhFFPRg6aYw-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-33e94548450so895034f8f.1
 for <qemu-trivial@nongnu.org>; Tue, 12 Mar 2024 03:42:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710240161; x=1710844961;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BeuAOt/r8kCLKqvGEqqWgAEL/dK9McVlz20zQTDAsd8=;
 b=dEquo3jlf01ewu7PLl+VGIgwFuIutnNVxTJHON5Eh0zDp/9f0EOlrxZi2fG6CutDwv
 sKOsMxFQK/mdOI0HrXaMblBf2SbPrSP0yqdi0lYV1U6zghVVAMXmJvN6SgOhc1pTzBtY
 te11woixGAmB+vDoarf5QW87Irh3ytHl6IBhLyhC4J+cK0xpOnsJgrFVAD/ERIuJoxl+
 Ef3lugQI2LleX1Xf0ck61zNmtcgJglesQDAkSnpBeoWdINm6R7nRrOsngzFqUUlToYyW
 ItGqeR4cPWhYxGe+L6kC2vtrxJUDbquaDkNaeKsNcvynG7nosrS1/frPDOIuRLFKxWM0
 mmSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqH+qmN/PtnwupXm0y4lhAILgAQF0IB1x24D/0aSPbmHOiJLpHVQ3OC0w7kXO+EULTPWwnf+KKRWqCUDAs5tF7ZZGqLt/NkA==
X-Gm-Message-State: AOJu0Ywy3k0uZKCTrYWXOt4qg+fbxWbaN7lyaOsyWHtUJor/p5s1PMVK
 HVh7NZ8vn04YAzhOZYDXbLuyNGLP4FMzYycskFSBBOPjGD9i7ll/f4CQfvQDqkVLo6U9Yn6RjqF
 OWwMqIGP1sLnwgFaq+Pt/5zXUOZhsrelOVI327zyN231b30I209m0OIg=
X-Received: by 2002:adf:e48b:0:b0:33e:6112:fefc with SMTP id
 i11-20020adfe48b000000b0033e6112fefcmr8180229wrm.19.1710240160996; 
 Tue, 12 Mar 2024 03:42:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9VMG5BFPxrlU5lKXRRnDFr2tJIVcjzsetYbQin8et0nrvvUxFa4D9oFEc+SgTQVzvZx72hw==
X-Received: by 2002:adf:e48b:0:b0:33e:6112:fefc with SMTP id
 i11-20020adfe48b000000b0033e6112fefcmr8180208wrm.19.1710240160699; 
 Tue, 12 Mar 2024 03:42:40 -0700 (PDT)
Received: from [192.168.0.9] (ip-109-43-177-86.web.vodafone.de.
 [109.43.177.86]) by smtp.gmail.com with ESMTPSA id
 f4-20020a5d58e4000000b0033e7a204dc7sm8739191wrd.32.2024.03.12.03.42.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Mar 2024 03:42:40 -0700 (PDT)
Message-ID: <5ff0cd3c-88e1-4961-8d97-da0af67a4273@redhat.com>
Date: Tue, 12 Mar 2024 11:42:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/29] Cleanup up to fix missing ERRP_GUARD() for
 error_prepend()
To: Zhao Liu <zhao1.liu@linux.intel.com>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Markus Armbruster <armbru@redhat.com>,
 Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org, Zhao Liu <zhao1.liu@intel.com>
References: <20240311033822.3142585-1-zhao1.liu@linux.intel.com>
 <d48e5d05-0e1e-4bb0-b10a-f0c943b055f6@linaro.org>
 <ZfAVsQTIOgAOjd0Y@intel.com>
 <4ba8e5dc-cda0-4ed4-8baa-82687a235627@redhat.com>
 <ZfAtx3fBR9KgsAWa@intel.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <ZfAtx3fBR9KgsAWa@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.029,
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
X-List-Received-Date: Tue, 12 Mar 2024 10:42:51 -0000

On 12/03/2024 11.26, Zhao Liu wrote:
> On Tue, Mar 12, 2024 at 09:50:25AM +0100, Thomas Huth wrote:
>> Date: Tue, 12 Mar 2024 09:50:25 +0100
>> From: Thomas Huth <thuth@redhat.com>
>> Subject: Re: [PATCH v2 00/29] Cleanup up to fix missing ERRP_GUARD() for
>>   error_prepend()
>>
>> On 12/03/2024 09.43, Zhao Liu wrote:
>>> Hi Thomas/Markus/Michael,
>>>
>>> For the remaing patches, could you please help me merge them next?
>>>
>>> Many thanks!
>>
>> Yes, I'm currently reviewing the ones that don't have a Reviewed-by yet. I
>> can pick up the remaining patches if the other maintainers won't pick them
>> up for the softfreeze today.
>>
> 
> Appreciate that you can help me get on the last train of releases.
> 
> If possible, could you please also help me pick up two other ERRP_GUARD()
> related cleanups (total 8 patches, both got r/b)? ;-)
> 
> My cleanup is too fragmented, I'll try to centralize my work to make it easier
> for maintainer to review and merge in the future!
> 
> [1]: https://lore.kernel.org/qemu-devel/20240223085653.1255438-1-zhao1.liu@linux.intel.com/
> [2]: https://lore.kernel.org/qemu-devel/20240312060337.3240965-1-zhao1.liu@linux.intel.com/

I'll try to include them!

  Thomas



