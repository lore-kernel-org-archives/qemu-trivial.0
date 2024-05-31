Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sCuKk-0000VD-9j
	for mharc-qemu-trivial@gnu.org; Fri, 31 May 2024 00:57:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1sCuKi-0000Uj-7c
 for qemu-trivial@nongnu.org; Fri, 31 May 2024 00:57:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1sCuKg-0000sZ-QT
 for qemu-trivial@nongnu.org; Fri, 31 May 2024 00:57:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1717131456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=lUcBjuxE/YfjXYUH4zR03sit7g5A/lglgv7SoGJ/ci0=;
 b=MHUizLIoOPUA1/QlKg3NImztgnyCFqp9b2a3PfvPRieeCGtRpFSOSv/dPYu4xqSfK1luDI
 Jke1fk7k8K8LSvb2hFcTEJlHQDF0JNODrteKAT/JZGpEboUek/9H0X2leGkPsUoAnAyQFl
 uPn0TOwym4MUUUccmoszLeT5BnrNYbA=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-590-__aW02d7P86-JxEHJMHUAQ-1; Fri, 31 May 2024 00:57:35 -0400
X-MC-Unique: __aW02d7P86-JxEHJMHUAQ-1
Received: by mail-lf1-f71.google.com with SMTP id
 2adb3069b0e04-52b88765386so265181e87.0
 for <qemu-trivial@nongnu.org>; Thu, 30 May 2024 21:57:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717131454; x=1717736254;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lUcBjuxE/YfjXYUH4zR03sit7g5A/lglgv7SoGJ/ci0=;
 b=RXEbuUBnW85CUkVCwGGvOZnv3m/lNC9Ash//5uVT820eDP2YE56Wu8Z+RAQChZrPeW
 7Jip4gB+jJBcdfS+PxqZ3WGnNscF6Wm1tsHVnGU0UoEF5PcXTz0E8M/fTyLX9am222ic
 3vE1BoRjN64QPjNK5PtJXE0oM7gtmS4ZOPq3oElrVHwsP1UzI9aZ0BDh+nz43ZcNI5uV
 xwCEFKi9BK84CMBz1ogR8Xh0xaBxKUjmPoxYg2dUY16bESeexNkmTLS0XvYB5pLhmJ5N
 STJmNCDKlvVkoOj7WpahNXDHnxXrdKRhCj9lRIe+u7pzQKbixeMr8GGurz1eRZ0wQB7O
 pV1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXyP8oud/4zfpDEURErWb7ZfBhrHHtgebzpaOtglvvFJY0spO/TOXfFLelKhCXrOnPFVhh/nic2QWn9AHcQjzJJvU05WOV1zQ==
X-Gm-Message-State: AOJu0YwXZA7n9qld9xwM8SLwIFaYBj7J+0XbgEfbSp+b/Ao0rXu2oF1Z
 IEvB8U5F5cFHoJdcQJbtREOYK3P0NNAJqaHTZO1FlIvm0JQaWPlRJOfax5zgwnbwlrOCi+gtyMC
 cJAlXp/z6Nvsy+XuKNCqC9//WPGV6UJR2xjcEGn/XclosFI1UPnA27Tc=
X-Received: by 2002:ac2:546f:0:b0:523:4f64:828b with SMTP id
 2adb3069b0e04-52b895a9c29mr300134e87.38.1717131454025; 
 Thu, 30 May 2024 21:57:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExwhDiAub2BhXYnLULdgILRkTqwo3jK7h7q/Ydq8yYwOQI3rg0/Ot8SG1Kt47z3ojWAd0zSg==
X-Received: by 2002:ac2:546f:0:b0:523:4f64:828b with SMTP id
 2adb3069b0e04-52b895a9c29mr300116e87.38.1717131453513; 
 Thu, 30 May 2024 21:57:33 -0700 (PDT)
Received: from [192.168.0.4] (ip-109-43-176-229.web.vodafone.de.
 [109.43.176.229]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a67eb344410sm44478266b.197.2024.05.30.21.57.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 May 2024 21:57:33 -0700 (PDT)
Message-ID: <4d9c15c6-cfe7-4535-b41a-fbfcb1e5f970@redhat.com>
Date: Fri, 31 May 2024 06:57:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/3] vl: Allow multiple -overcommit commands
To: Zhao Liu <zhao1.liu@intel.com>, Markus Armbruster <armbru@redhat.com>
Cc: Zide Chen <zide.chen@intel.com>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, mst@redhat.com, cfontana@suse.de, xiaoyao.li@intel.com,
 qemu-trivial@nongnu.org
References: <20240524200017.150339-1-zide.chen@intel.com>
 <20240524200017.150339-2-zide.chen@intel.com>
 <e86c1913-a1ff-4c31-9915-d66c269b7e10@redhat.com>
 <ZliGoM9Hy3Q2qthQ@intel.com>
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
In-Reply-To: <ZliGoM9Hy3Q2qthQ@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.085,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Fri, 31 May 2024 04:57:40 -0000

On 30/05/2024 16.01, Zhao Liu wrote:
> On Mon, May 27, 2024 at 07:19:56AM +0200, Thomas Huth wrote:
>> Date: Mon, 27 May 2024 07:19:56 +0200
>> From: Thomas Huth <thuth@redhat.com>
>> Subject: Re: [PATCH V2 1/3] vl: Allow multiple -overcommit commands
>>
>> On 24/05/2024 22.00, Zide Chen wrote:
>>> Both cpu-pm and mem-lock are related to system resource overcommit, but
>>> they are separate from each other, in terms of how they are realized,
>>> and of course, they are applied to different system resources.
>>>
>>> It's tempting to use separate command lines to specify their behavior.
>>> e.g., in the following example, the cpu-pm command is quietly
>>> overwritten, and it's not easy to notice it without careful inspection.
>>>
>>>     --overcommit mem-lock=on
>>>     --overcommit cpu-pm=on
>>>
>>> Fixes: c8c9dc42b7ca ("Remove the deprecated -realtime option")
>>> Suggested-by: Thomas Huth <thuth@redhat.com>
>>> Signed-off-by: Zide Chen <zide.chen@intel.com>
>>> ---
>>>
>>> v2:
>>>
>>> Thanks to Thomas' suggestion, changed to this better approach, which
>>> is more generic and can handle situations like: "enabled the option in
>>> the config file, and now you'd like to disable it on the command line
>>> again".
>>>
>>>    system/vl.c | 4 ++--
>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/system/vl.c b/system/vl.c
>>> index a3eede5fa5b8..dfa6cdd9283b 100644
>>> --- a/system/vl.c
>>> +++ b/system/vl.c
>>> @@ -3545,8 +3545,8 @@ void qemu_init(int argc, char **argv)
>>>                    if (!opts) {
>>>                        exit(1);
>>>                    }
>>> -                enable_mlock = qemu_opt_get_bool(opts, "mem-lock", false);
>>> -                enable_cpu_pm = qemu_opt_get_bool(opts, "cpu-pm", false);
>>> +                enable_mlock = qemu_opt_get_bool(opts, "mem-lock", enable_mlock);
>>> +                enable_cpu_pm = qemu_opt_get_bool(opts, "cpu-pm", enable_cpu_pm);
>>>                    break;
>>>                case QEMU_OPTION_compat:
>>>                    {
>>
>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>>
> 
> Hi Thomas,
> 
> BTW, do you think it's a good idea to define the overcommit via QAPI way
> (defined in a json file)? ;-)
> 
> My rough understanding is that all APIs are better to be defined via
> QAPI to go JSON compatible.

Sorry, no clue whether it makes sense here... CC:-ing Markus for 
recommendations.

  Thomas



