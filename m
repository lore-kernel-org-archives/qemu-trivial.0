Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rfk8M-0000dF-Rk
	for mharc-qemu-trivial@gnu.org; Thu, 29 Feb 2024 12:23:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rfk8K-0000cg-Px
 for qemu-trivial@nongnu.org; Thu, 29 Feb 2024 12:23:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rfk8J-0005ic-9d
 for qemu-trivial@nongnu.org; Thu, 29 Feb 2024 12:23:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709227426;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=AF958iBVDvVZ6Sh/biVmlFGVJWkuLgohM5B9kQ2u/+4=;
 b=TP0TUmh6OqoclV6+D7INXFZsNv7Zbv9T0kU6AN6FLdORvXunYT+sdynT0hiMPseiBOm4+S
 AW8l+2Yjl9rXlvRlk5R4we5uYUw5r1FuZQeyJTXi5vBsy+UpuWFHWVAo0FYP/3EJoLYDL4
 U21kVvs/LYHwQ5sCISYDo/wV798pyhA=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-442-z6YRAaH2Pv-33sc03M_-GA-1; Thu, 29 Feb 2024 12:23:44 -0500
X-MC-Unique: z6YRAaH2Pv-33sc03M_-GA-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-a30f9374db7so245659066b.0
 for <qemu-trivial@nongnu.org>; Thu, 29 Feb 2024 09:23:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709227423; x=1709832223;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AF958iBVDvVZ6Sh/biVmlFGVJWkuLgohM5B9kQ2u/+4=;
 b=wL63PaTxJWrb+Zg/zXEl579BwwPSJKBjtvZv050sVbhpPmXy/dda2hOlTwfgx9JyWK
 aaK7sYCUK5IvhILRyieHUnxD4XI7PIew/5wDRA1zHJM8QG+ILRoPdt/XifsWiOp/8CkE
 Ts9DSyOkh+40eTjOreWvM+JteZLgU6Dj4Xei0AsIxAmVGs36z/S9hjLil5dtbHXeAiQ8
 R+Cysyd3TJgpscixKNtSwutwZ4F+3tCYRYf6YowtPveoejr7Nyogsmp2VG5O1/8+wwG+
 0Ca5x95QumNewMby9wUbuDdiMNUx11SlpCSANsnpRuc8bEBvriqr9hhTtwszKSSn7mYx
 QYDg==
X-Gm-Message-State: AOJu0YwBad0C1n8/PEOTkKzCPMZyJZ1E4nbVNQmm7/d/34MEP9nsNUKO
 5JWj98bFODOoWLJvt7+AWMmG4N2kMu9Kq7jJ2zHoXpWRD0WEOx05+63AKXyOQodwbWXCERpZATy
 /70qBLBehNORf3jgs2v0CAvuAk3C0XL7f9RACbb432pFncUtFQWjIPgs=
X-Received: by 2002:a17:907:6d0d:b0:a3f:f8a7:e1f7 with SMTP id
 sa13-20020a1709076d0d00b00a3ff8a7e1f7mr2378689ejc.5.1709227423199; 
 Thu, 29 Feb 2024 09:23:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG95jIFqYIOzwFg4A1wbseviLXAH5IUH9KiHRH5XWy2W4LcH4HdYp+M9la2m+RJ6J1Tq5rl1w==
X-Received: by 2002:a17:907:6d0d:b0:a3f:f8a7:e1f7 with SMTP id
 sa13-20020a1709076d0d00b00a3ff8a7e1f7mr2378666ejc.5.1709227422865; 
 Thu, 29 Feb 2024 09:23:42 -0800 (PST)
Received: from [192.168.0.9] (ip-109-43-178-133.web.vodafone.de.
 [109.43.178.133]) by smtp.gmail.com with ESMTPSA id
 ks27-20020a170906f85b00b00a442124bd2dsm881520ejb.37.2024.02.29.09.23.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Feb 2024 09:23:42 -0800 (PST)
Message-ID: <dec70521-cacc-419c-8405-44780b39f84a@redhat.com>
Date: Thu, 29 Feb 2024 18:23:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/17] hw/misc/ivshmem: Fix missing ERRP_GUARD() for
 error_prepend()
To: Zhao Liu <zhao1.liu@linux.intel.com>,
 Markus Armbruster <armbru@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Michael Tokarev <mjt@tls.msk.ru>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Zhao Liu <zhao1.liu@intel.com>,
 Juan Quintela <quintela@trasno.org>,
 Steve Sistare <steven.sistare@oracle.com>,
 Michael Galaxy <mgalaxy@akamai.com>
References: <20240229143914.1977550-1-zhao1.liu@linux.intel.com>
 <20240229143914.1977550-2-zhao1.liu@linux.intel.com>
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
In-Reply-To: <20240229143914.1977550-2-zhao1.liu@linux.intel.com>
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
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.096,
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
X-List-Received-Date: Thu, 29 Feb 2024 17:23:49 -0000

On 29/02/2024 15.38, Zhao Liu wrote:
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
> ERRP_GUARD() could avoid the case when @errp is the pointer of
> error_fatal, the user can't see this additional information, because
> exit() happens in error_setg earlier than information is added [1].
> 
> The ivshmem_common_realize() passes @errp to error_prepend(), and as a
> DeviceClass.realize method, its @errp is so widely sourced that it is
> necessary to protect it with ERRP_GUARD().
> 
> To avoid the issue like [1] said, add missing ERRP_GUARD() at the
> beginning of this function.
> 
> [1]: Issue description in the commit message of commit ae7c80a7bd73
>       ("error: New macro ERRP_GUARD()").
> 
> Cc: Juan Quintela <quintela@trasno.org>
> Cc: Steve Sistare <steven.sistare@oracle.com>
> Cc: "Philippe Mathieu-Daudé" <philmd@linaro.org>
> Cc: Michael Galaxy <mgalaxy@akamai.com>
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> ---
>   hw/misc/ivshmem.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/hw/misc/ivshmem.c b/hw/misc/ivshmem.c
> index a2fd0bc36544..de49d1b8a826 100644
> --- a/hw/misc/ivshmem.c
> +++ b/hw/misc/ivshmem.c
> @@ -832,6 +832,7 @@ static void ivshmem_write_config(PCIDevice *pdev, uint32_t address,
>   
>   static void ivshmem_common_realize(PCIDevice *dev, Error **errp)
>   {
> +    ERRP_GUARD();
>       IVShmemState *s = IVSHMEM_COMMON(dev);
>       Error *err = NULL;

Please remove "err" and the error_propagate in here now.

  Thomas



