Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rjxqO-00048l-Hu
	for mharc-qemu-trivial@gnu.org; Tue, 12 Mar 2024 04:50:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rjxqF-00043d-3K
 for qemu-trivial@nongnu.org; Tue, 12 Mar 2024 04:50:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rjxqB-0005mA-U3
 for qemu-trivial@nongnu.org; Tue, 12 Mar 2024 04:50:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1710233430;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=1VRk1c+RLEPigqDbqoCcY3ibvyOTKcjaTe1GsSxEYhE=;
 b=OmMjidiopsir0aXXtEhrufiDd8t5YrTCrKiwpIOQLG1WTJ7ziyTaXNUt/Hn+H6OwU//wO0
 rWnEz/RRqkwpzghfEJZqeEF4NRFpBWXj5kZfstRRDHt/dfg9ew/zCEMyrbS8rP0mNtWER2
 b3s3WggvbamXUTMl9RJ8KTVVIES0WeM=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-75-u7K750BePPWm01_tB0BGug-1; Tue, 12 Mar 2024 04:50:28 -0400
X-MC-Unique: u7K750BePPWm01_tB0BGug-1
Received: by mail-lf1-f71.google.com with SMTP id
 2adb3069b0e04-513a1ed3ff8so2401237e87.1
 for <qemu-trivial@nongnu.org>; Tue, 12 Mar 2024 01:50:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710233427; x=1710838227;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1VRk1c+RLEPigqDbqoCcY3ibvyOTKcjaTe1GsSxEYhE=;
 b=R8jPRIqnUWQY8BXivj/AUTHK4xQF+iRMWqu2eH+f8YprxZjbhS6pTVqiXTkldeCzKQ
 3PIhi51E1dq1JV9J2bO1JdfFnQsiV8Lvq6oSldWwifGkcs++mmWTYFlxbw/zCRDcqMtN
 G8G4JJhI2Ge1+nwmmHzZsiOcZxuK0BAkjJXavI8XpQ+j6eeDJxo4JpXgG73ppiCCu3sS
 GoO8qO80Soj5xdCCufo4GbXCKAzQZfDOV36Q0rpzJ+wiZ38ZTa7fjn+XLFfYJdwh+iKV
 +eG/QNsXqPxuZrQSh6LxeS8YyoD/p+M6S+OKDTd3eOAZ6v+Noxymk/DbxuW4RUugEqas
 pkGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUowjqvQvXFqoNYLswChxQxLnD8hdPSvPxLiEC7GQj/MAECgy44V7/IXyR+1+eK5zTd5+RFHa6rk7VR0/l3P/om3eqfQuC3iw==
X-Gm-Message-State: AOJu0YzE05dn3LzLfG5OIu6hYFKbCoVtFJMEEoX7DEKOGrmkTKv7wqRh
 qIXCPk58mQfSjwQ4x9kTuTXOzhUN9vFclti7HpcNZtLkxfj4JxmiZhwyWbhODgXSL+pwqJUbGvO
 JfZewrT6BXg8zOIGS9BxYx6Wt0drLWe8KjGvq65KloPhfypcqRSvCt4I=
X-Received: by 2002:a05:6512:2207:b0:513:b159:e711 with SMTP id
 h7-20020a056512220700b00513b159e711mr3159639lfu.4.1710233427346; 
 Tue, 12 Mar 2024 01:50:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrbHM8HQNspLfLsZ2yAQl4rOUe4bhtpb/ccCaU+HrxT7o0XBG1Gcyyha1yO8kM8jC9sTvpOA==
X-Received: by 2002:a05:6512:2207:b0:513:b159:e711 with SMTP id
 h7-20020a056512220700b00513b159e711mr3159628lfu.4.1710233427014; 
 Tue, 12 Mar 2024 01:50:27 -0700 (PDT)
Received: from [192.168.0.9] (ip-109-43-177-86.web.vodafone.de.
 [109.43.177.86]) by smtp.gmail.com with ESMTPSA id
 h17-20020a05600c315100b004101f27737asm18150696wmo.29.2024.03.12.01.50.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Mar 2024 01:50:26 -0700 (PDT)
Message-ID: <4ba8e5dc-cda0-4ed4-8baa-82687a235627@redhat.com>
Date: Tue, 12 Mar 2024 09:50:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/29] Cleanup up to fix missing ERRP_GUARD() for
 error_prepend()
To: Zhao Liu <zhao1.liu@linux.intel.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Markus Armbruster <armbru@redhat.com>
Cc: Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org, Zhao Liu <zhao1.liu@intel.com>
References: <20240311033822.3142585-1-zhao1.liu@linux.intel.com>
 <d48e5d05-0e1e-4bb0-b10a-f0c943b055f6@linaro.org>
 <ZfAVsQTIOgAOjd0Y@intel.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 xsFNBFH7eUwBEACzyOXKU+5Pcs6wNpKzrlJwzRl3VGZt95VCdb+FgoU9g11m7FWcOafrVRwU
 yYkTm9+7zBUc0sW5AuPGR/dp3pSLX/yFWsA/UB4nJsHqgDvDU7BImSeiTrnpMOTXb7Arw2a2
 4CflIyFqjCpfDM4MuTmzTjXq4Uov1giGE9X6viNo1pxyEpd7PanlKNnf4PqEQp06X4IgUacW
 tSGj6Gcns1bCuHV8OPWLkf4hkRnu8hdL6i60Yxz4E6TqlrpxsfYwLXgEeswPHOA6Mn4Cso9O
 0lewVYfFfsmokfAVMKWzOl1Sr0KGI5T9CpmRfAiSHpthhHWnECcJFwl72NTi6kUcUzG4se81
 O6n9d/kTj7pzTmBdfwuOZ0YUSqcqs0W+l1NcASSYZQaDoD3/SLk+nqVeCBB4OnYOGhgmIHNW
 0CwMRO/GK+20alxzk//V9GmIM2ACElbfF8+Uug3pqiHkVnKqM7W9/S1NH2qmxB6zMiJUHlTH
 gnVeZX0dgH27mzstcF786uPcdEqS0KJuxh2kk5IvUSL3Qn3ZgmgdxBMyCPciD/1cb7/Ahazr
 3ThHQXSHXkH/aDXdfLsKVuwDzHLVSkdSnZdt5HHh75/NFHxwaTlydgfHmFFwodK8y/TjyiGZ
 zg2Kje38xnz8zKn9iesFBCcONXS7txENTzX0z80WKBhK+XSFJwARAQABzR5UaG9tYXMgSHV0
 aCA8dGh1dGhAcmVkaGF0LmNvbT7CwXgEEwECACIFAlVgX6oCGwMGCwkIBwMCBhUIAgkKCwQW
 AgMBAh4BAheAAAoJEC7Z13T+cC21EbIP/ii9cvT2HHGbFRl8HqGT6+7Wkb+XLMqJBMAIGiQK
 QIP3xk1HPTsLfVG0ao4hy/oYkGNOP8+ubLnZen6Yq3zAFiMhQ44lvgigDYJo3Ve59gfe99KX
 EbtB+X95ODARkq0McR6OAsPNJ7gpEUzfkQUUJTXRDQXfG/FX303Gvk+YU0spm2tsIKPl6AmV
 1CegDljzjycyfJbk418MQmMu2T82kjrkEofUO2a24ed3VGC0/Uz//XCR2ZTo+vBoBUQl41BD
 eFFtoCSrzo3yPFS+w5fkH9NT8ChdpSlbNS32NhYQhJtr9zjWyFRf0Zk+T/1P7ECn6gTEkp5k
 ofFIA4MFBc/fXbaDRtBmPB0N9pqTFApIUI4vuFPPO0JDrII9dLwZ6lO9EKiwuVlvr1wwzsgq
 zJTPBU3qHaUO4d/8G+gD7AL/6T4zi8Jo/GmjBsnYaTzbm94lf0CjXjsOX3seMhaE6WAZOQQG
 tZHAO1kAPWpaxne+wtgMKthyPLNwelLf+xzGvrIKvLX6QuLoWMnWldu22z2ICVnLQChlR9d6
 WW8QFEpo/FK7omuS8KvvopFcOOdlbFMM8Y/8vBgVMSsK6fsYUhruny/PahprPbYGiNIhKqz7
 UvgyZVl4pBFjTaz/SbimTk210vIlkDyy1WuS8Zsn0htv4+jQPgo9rqFE4mipJjy/iboDzsFN
 BFH7eUwBEAC2nzfUeeI8dv0C4qrfCPze6NkryUflEut9WwHhfXCLjtvCjnoGqFelH/PE9NF4
 4VPSCdvD1SSmFVzu6T9qWdcwMSaC+e7G/z0/AhBfqTeosAF5XvKQlAb9ZPkdDr7YN0a1XDfa
 +NgA+JZB4ROyBZFFAwNHT+HCnyzy0v9Sh3BgJJwfpXHH2l3LfncvV8rgFv0bvdr70U+On2XH
 5bApOyW1WpIG5KPJlDdzcQTyptOJ1dnEHfwnABEfzI3dNf63rlxsGouX/NFRRRNqkdClQR3K
 gCwciaXfZ7ir7fF0u1N2UuLsWA8Ei1JrNypk+MRxhbvdQC4tyZCZ8mVDk+QOK6pyK2f4rMf/
 WmqxNTtAVmNuZIwnJdjRMMSs4W4w6N/bRvpqtykSqx7VXcgqtv6eqoDZrNuhGbekQA0sAnCJ
 VPArerAZGArm63o39me/bRUQeQVSxEBmg66yshF9HkcUPGVeC4B0TPwz+HFcVhheo6hoJjLq
 knFOPLRj+0h+ZL+D0GenyqD3CyuyeTT5dGcNU9qT74bdSr20k/CklvI7S9yoQje8BeQAHtdV
 cvO8XCLrpGuw9SgOS7OP5oI26a0548M4KldAY+kqX6XVphEw3/6U1KTf7WxW5zYLTtadjISB
 X9xsRWSU+Yqs3C7oN5TIPSoj9tXMoxZkCIHWvnqGwZ7JhwARAQABwsFfBBgBAgAJBQJR+3lM
 AhsMAAoJEC7Z13T+cC21hPAQAIsBL9MdGpdEpvXs9CYrBkd6tS9mbaSWj6XBDfA1AEdQkBOn
 ZH1Qt7HJesk+qNSnLv6+jP4VwqK5AFMrKJ6IjE7jqgzGxtcZnvSjeDGPF1h2CKZQPpTw890k
 fy18AvgFHkVk2Oylyexw3aOBsXg6ukN44vIFqPoc+YSU0+0QIdYJp/XFsgWxnFIMYwDpxSHS
 5fdDxUjsk3UBHZx+IhFjs2siVZi5wnHIqM7eK9abr2cK2weInTBwXwqVWjsXZ4tq5+jQrwDK
 cvxIcwXdUTLGxc4/Z/VRH1PZSvfQxdxMGmNTGaXVNfdFZjm4fz0mz+OUi6AHC4CZpwnsliGV
 ODqwX8Y1zic9viSTbKS01ZNp175POyWViUk9qisPZB7ypfSIVSEULrL347qY/hm9ahhqmn17
 Ng255syASv3ehvX7iwWDfzXbA0/TVaqwa1YIkec+/8miicV0zMP9siRcYQkyTqSzaTFBBmqD
 oiT+z+/E59qj/EKfyce3sbC9XLjXv3mHMrq1tKX4G7IJGnS989E/fg6crv6NHae9Ckm7+lSs
 IQu4bBP2GxiRQ+NV3iV/KU3ebMRzqIC//DCOxzQNFNJAKldPe/bKZMCxEqtVoRkuJtNdp/5a
 yXFZ6TfE1hGKrDBYAm4vrnZ4CXFSBDllL59cFFOJCkn4Xboj/aVxxJxF30bn
In-Reply-To: <ZfAVsQTIOgAOjd0Y@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Tue, 12 Mar 2024 08:50:38 -0000

On 12/03/2024 09.43, Zhao Liu wrote:
> Hi Thomas/Markus/Michael,
> 
> For the remaing patches, could you please help me merge them next?
> 
> Many thanks!

Yes, I'm currently reviewing the ones that don't have a Reviewed-by yet. I 
can pick up the remaining patches if the other maintainers won't pick them 
up for the softfreeze today.

  Thomas


> On Tue, Mar 12, 2024 at 09:17:30AM +0100, Philippe Mathieu-Daudé wrote:
>> Date: Tue, 12 Mar 2024 09:17:30 +0100
>> From: Philippe Mathieu-Daudé <philmd@linaro.org>
>> Subject: Re: [PATCH v2 00/29] Cleanup up to fix missing ERRP_GUARD() for
>>   error_prepend()
>>
>> On 11/3/24 04:37, Zhao Liu wrote:
>>
>>> ---
>>> Zhao Liu (29):
>>
>>>     hw/core/loader-fit: Fix missing ERRP_GUARD() for error_prepend()
>>>     hw/core/qdev-properties-system: Fix missing ERRP_GUARD() for
>>>       error_prepend()
>>>     hw/misc/ivshmem: Fix missing ERRP_GUARD() for error_prepend()
>>
>> I'm queuing these 3 patches, thanks!
> 
> 
> 


