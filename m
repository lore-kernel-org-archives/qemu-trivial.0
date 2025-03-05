Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tpmJB-0007x7-2U
	for mharc-qemu-trivial@gnu.org; Wed, 05 Mar 2025 05:49:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tpmJ9-0007wm-Ug
 for qemu-trivial@nongnu.org; Wed, 05 Mar 2025 05:48:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tpmJ8-0008Hb-67
 for qemu-trivial@nongnu.org; Wed, 05 Mar 2025 05:48:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741171737;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Zi8TYJXIRo742efp9c9ooVWub5kQoW1rshzUifHHiLE=;
 b=D3eB9MXPvrTbjoyepBZ5U2Fb6bZ1U1TyyJzx8bc5sxaF3TJ77zYLfDhLyV63CEN/L5B68F
 D7GumS9X4L8TXoyW0Y1Vv/oG2BnJD4jzO+pd8dzelJRZ2uY31iXMEiX85AHvKzDWSIXjgW
 iNj7uwH+vZzn6jG1cVLpvKTpjA7KpsA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-550-oiUmF1lIPxSsh1UYZyM1fA-1; Wed, 05 Mar 2025 05:48:40 -0500
X-MC-Unique: oiUmF1lIPxSsh1UYZyM1fA-1
X-Mimecast-MFC-AGG-ID: oiUmF1lIPxSsh1UYZyM1fA_1741171719
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-390eb06d920so4992935f8f.3
 for <qemu-trivial@nongnu.org>; Wed, 05 Mar 2025 02:48:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741171719; x=1741776519;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Zi8TYJXIRo742efp9c9ooVWub5kQoW1rshzUifHHiLE=;
 b=ZxGpgDcYNGoZI8nLbvayE/JQgScygxr1JuYT8gd8HXFUuZ3gG9YSIJ69PXgIZSTM71
 zcdk0nQcldYIgr5YQRu+WPUMouZM5OT/PGdQcCSrI/sTpcgtQXWMTssYK9ydu3WO461R
 ua81qu+Tl1MmmFoeyX2SxX2p5fiZAhIzpWnzDxUZJzMp+mLxyuvESU9BoJtdMCS2kBaV
 LlR6pxnO36CgcgNVQo4BpudBgCysyFl7dXy/ZL8Zpyuqwsu1vkcQGTPYmLUTNoILOQex
 XlHcz0wc1KMh7hz/utKq3X+hw+ofKHQMtP22oMQZntyjGpqwG9gTIqaN/weP16+kfMK4
 o+Gg==
X-Gm-Message-State: AOJu0Yy6VJx8H1Uce3UkmYrPL0xEeIhjd4PHtnMnxeRpE5Fxd03PFnlr
 fxyopYeU/v+iQS3ydAymUSeq8WYWHkaQ8zNytfYbeIwVgSdVSZJnnnpBJaGRAblTm2nIPY7aWBt
 RYQvYHTfzJqod5RRE6U3WVBY8BFiMloX9c7tKCW6hEpENxqK2OW39JHc=
X-Gm-Gg: ASbGnct1Jixn1UxnX4DmKRdq7lkLFCZv4/iXFBAgyppZIQHkz+bZy7dZvNavNVTnavS
 mId0HDJ5PBz6GmwkT62LBYOujTYMCJw+CNNKDe3BmgZw48lhWE5udCupOesS+ubRT+eiAxslbmI
 wnCMbfV8W9QUkiq5E3YrG/MmWy5H0Wo0jgJmXaVHw+XMEW3tDdljOGZBq6WV3fKYubyaExkgeh3
 b06w8qqTJRul5H1yGOH+V0utHqvXwst2zMlA7QGj16uT8J8hN9+C10Xfq0GQ+tCEw960HRyHHPT
 EEt+MTrlnqTnbOZxcQ3zEHuJMu6Ed8hGt4NsikAj8yhCZKs=
X-Received: by 2002:a5d:6dad:0:b0:390:ffd0:4142 with SMTP id
 ffacd0b85a97d-3911f75678emr2074814f8f.26.1741171719300; 
 Wed, 05 Mar 2025 02:48:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF13bvT2KclFDloxNTKHqsSxYG2XrIVTfGNufYvBcJ2j2xre42KXInvZX0V1h5isjkOCnaB1w==
X-Received: by 2002:a5d:6dad:0:b0:390:ffd0:4142 with SMTP id
 ffacd0b85a97d-3911f75678emr2074797f8f.26.1741171718912; 
 Wed, 05 Mar 2025 02:48:38 -0800 (PST)
Received: from [192.168.0.7] (ip-109-42-51-231.web.vodafone.de.
 [109.42.51.231]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e484452asm20816071f8f.61.2025.03.05.02.48.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Mar 2025 02:48:38 -0800 (PST)
Message-ID: <2aadca2b-f889-477d-88ed-dc030f576c24@redhat.com>
Date: Wed, 5 Mar 2025 11:48:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/about/emulation: Fix broken link
To: Santiago Monserrat Campanello <santimonserr@gmail.com>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, laurent@vivier.eu, mjt@tls.msk.ru,
 qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>
References: <20250305102632.91376-1-santimonserr@gmail.com>
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
In-Reply-To: <20250305102632.91376-1-santimonserr@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: U2tiEUXRyvz9ooLehxBphWizxrTF8fnOL4x-lgmaoOE_1741171719
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-List-Received-Date: Wed, 05 Mar 2025 10:49:00 -0000

On 05/03/2025 11.26, Santiago Monserrat Campanello wrote:
> semihosting link to risc-v changed
> 
> Signed-off-by: Santiago Monserrat Campanello <santimonserr@gmail.com>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2717
> ---
> the original one linked it's still accesible on
> https://github.com/riscv-non-isa/riscv-semihosting/blob/0.2/riscv-semihosting-spec.adoc
> ---
>   docs/about/emulation.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/docs/about/emulation.rst b/docs/about/emulation.rst
> index 3bc3579434..a72591ee4d 100644
> --- a/docs/about/emulation.rst
> +++ b/docs/about/emulation.rst
> @@ -171,7 +171,7 @@ for that architecture.
>       - Unified Hosting Interface (MD01069)
>     * - RISC-V
>       - System and User-mode
> -    - https://github.com/riscv/riscv-semihosting-spec/blob/main/riscv-semihosting-spec.adoc
> +    - https://github.com/riscv-non-isa/riscv-semihosting/blob/main/riscv-semihosting.adoc
>     * - Xtensa
>       - System
>       - Tensilica ISS SIMCALL

Reviewed-by: Thomas Huth <thuth@redhat.com>


