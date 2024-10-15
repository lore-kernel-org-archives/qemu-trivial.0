Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1t0j5I-0004Le-SU
	for mharc-qemu-trivial@gnu.org; Tue, 15 Oct 2024 11:03:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1t0j5I-0004LO-2Q
 for qemu-trivial@nongnu.org; Tue, 15 Oct 2024 11:03:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1t0j5F-0000kN-UO
 for qemu-trivial@nongnu.org; Tue, 15 Oct 2024 11:03:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1729004616;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=lmIlRIhlbnD/dD97TF0JpMUoIrpZokPy0h8TyAun+4c=;
 b=MB3uWZOYSwFscRGJAGNraUBfOigqRt9Tkg9tCxLBKuwByd/O1v45LIKlPDj8wIS9+eoilz
 7g6bOOxSWksEwvLYRlvN4CERXRT7SEcp2qUA8SpqyTHT3gkw/suUYcWrmGypcmhPohghEp
 XTQxlNJue7qHfA38KWv+31UJbi0ZUDQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-124-hD9j_624N8mwLbjG9009GQ-1; Tue, 15 Oct 2024 11:03:34 -0400
X-MC-Unique: hD9j_624N8mwLbjG9009GQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-431159f2864so28805365e9.0
 for <qemu-trivial@nongnu.org>; Tue, 15 Oct 2024 08:03:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729004613; x=1729609413;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lmIlRIhlbnD/dD97TF0JpMUoIrpZokPy0h8TyAun+4c=;
 b=jFcMM3txZK98WuM52BT/Kdp3CVcoA/e3ICBkittmjaOhyCIngaQVJ51RrWMS47f8BA
 iQHa9X30Br4fzO1xuE7PESHlyuPR5pdFCEHtKh5natt8KSMPMZykdT1LEXOX9cIYcJ2Q
 yOwF+kVubUIVwA69dkEIxA85KKS814H/cEjoSbN+3Td8Eg4v/sFYVrGuPkpgtw54AE5t
 ACKFAsXEFiM4F8CtUTW1wWXTbwW5e1GLrNb9ezzr93sNgvLwaRc8Vem58WG85/ABYipo
 N3iDMEFCKmV2aujUVdcvXPx1EGtIouwxLtX7kXQp6ig/Rxjb+glDU5WKn2uA5TAD+9ee
 JXOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4UDpisf4lDjiTZCyCTak52ytkLO3o2nfygzs5Civ36WNYhdukMmnkkACmzjOzGDxt0CVtJHFaB6Wr248=@nongnu.org
X-Gm-Message-State: AOJu0YwRx/slMIts8NSbq24q7W5DPl5BRIHo66ZaiUR01wQvXARJue37
 DmdmhqqKeVCAYXVM3KCCxhNiFdyetsCcLX03g0V6FOUW6Uz95wqvh5mAq4bJhm++vyvtdsqZ5Zi
 NWjdZvQdQepo/TpuTS6QtvBMtJ/PDQM9tX1adw24Qz9M6oRw0rqeSG+Y=
X-Received: by 2002:a05:600c:348d:b0:431:43c6:e868 with SMTP id
 5b1f17b1804b1-4314a35e9d3mr7162545e9.23.1729004613181; 
 Tue, 15 Oct 2024 08:03:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmvA11iprruoCmakUupw4Xra2ueYzSyvfhvQwUtAuVjjIxOiiH0/hY18HJjEOKoPkSh41SuQ==
X-Received: by 2002:a05:600c:348d:b0:431:43c6:e868 with SMTP id
 5b1f17b1804b1-4314a35e9d3mr7162155e9.23.1729004612536; 
 Tue, 15 Oct 2024 08:03:32 -0700 (PDT)
Received: from [192.168.0.7] (ip-109-42-48-109.web.vodafone.de.
 [109.42.48.109]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d7fc45577sm1771652f8f.116.2024.10.15.08.03.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Oct 2024 08:03:32 -0700 (PDT)
Message-ID: <4f8968d6-2608-4359-81e5-ff9233ef692f@redhat.com>
Date: Tue, 15 Oct 2024 17:03:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ui/console-vc: Silence warning about sprintf() on
 OpenBSD
To: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
Cc: Brad Smith <brad@comstyle.com>, qemu-trivial@nongnu.org,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>
References: <20241015112510.412471-1-thuth@redhat.com>
 <3a7da33b-c802-44f2-8478-ce4de64665a4@linaro.org>
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
In-Reply-To: <3a7da33b-c802-44f2-8478-ce4de64665a4@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.063,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Tue, 15 Oct 2024 15:03:40 -0000

On 15/10/2024 16.47, Richard Henderson wrote:
> On 10/15/24 04:25, Thomas Huth wrote:
>> The linker on OpenBSD complains:
>>
>>   ld: warning: console-vc.c:824 (../src/ui/console-vc.c:824)([...]):
>>   warning: sprintf() is often misused, please use snprintf()
>>
>> Using g_strdup_printf() is certainly better here, so let's switch
>> to that function instead.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   v2: Use g_strdup_printf() instead of snprintf()
>>
>>   ui/console-vc.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/ui/console-vc.c b/ui/console-vc.c
>> index 8393d532e7..53fcee88f4 100644
>> --- a/ui/console-vc.c
>> +++ b/ui/console-vc.c
>> @@ -648,7 +648,7 @@ static void vc_putchar(VCChardev *vc, int ch)
>>       QemuTextConsole *s = vc->console;
>>       int i;
>>       int x, y;
>> -    char response[40];
>> +    g_autofree char *response = NULL;
>>       switch(vc->state) {
>>       case TTY_STATE_NORM:
>> @@ -821,7 +821,7 @@ static void vc_putchar(VCChardev *vc, int ch)
>>                       break;
>>                   case 6:
>>                       /* report cursor position */
>> -                    sprintf(response, "\033[%d;%dR",
>> +                    response = g_strdup_printf("\033[%d;%dR",
>>                              (s->y_base + s->y) % s->total_height + 1,
>>                               s->x + 1);
>>                       vc_respond_str(vc, response);
> 
> Could be better by limiting the scope of the variable to this case.

I tried that first, but then I need curly braces around the whole case block 
to avoid compiler warnings, which is ugly, too, so I decided to keep it at 
the top.

  Thomas


