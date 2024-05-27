Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sBSmW-0000gG-De
	for mharc-qemu-trivial@gnu.org; Mon, 27 May 2024 01:20:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1sBSmU-0000e6-6W
 for qemu-trivial@nongnu.org; Mon, 27 May 2024 01:20:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1sBSmG-00018p-00
 for qemu-trivial@nongnu.org; Mon, 27 May 2024 01:20:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1716787206;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=z0i48rhp0SdphvRr+Ko2VpEImX3SDYuZnmhgp9bhXPM=;
 b=TKxUnwMQgSnZG5lWCU0WKYkv1xe9DSskL5VZC99SPMSOeql3ZrMMG5QwAgkkualVFEJqPX
 CyG61bM+qGMVDIE0u00N0jmlfKRm7nBptmNr7ARshfpMR4CG0ofuaeAFlqN8QbUprvliyM
 h5iBbwXYhvwRWrW7kdpamMvrtFtqJf8=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-355-SdFcQqZFMRSgEuhIdzH1Tg-1; Mon, 27 May 2024 01:20:02 -0400
X-MC-Unique: SdFcQqZFMRSgEuhIdzH1Tg-1
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-627e4afa326so34418337b3.2
 for <qemu-trivial@nongnu.org>; Sun, 26 May 2024 22:20:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716787202; x=1717392002;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z0i48rhp0SdphvRr+Ko2VpEImX3SDYuZnmhgp9bhXPM=;
 b=dpm4Mv/HAImNs0UJn+498DyJ8DYCpE7NH02zU395x1+aeHtFpsQajSRMDHtXjlVELK
 zpaBR7enQ92pt7jrOTkA9i3ijvgTqtcz48mdeOWfOW6E11jdjICcPs7f3QOKqakROt9L
 09lLpOfP4uKrouvK51rC0uKTgXIqfH8YKFcgKfl1UN42hd4jg9Ge+NTxS/3xQSl7OeR8
 AodKVglJl9TSJ/ms04qrZupqlVTzeLTXz0zXTvqw6+mnvCrLKfoTIilXeZXgzO3dWY2L
 H2epuVeXexYLq7bhFtdkU07dVnPh+ZWV5O3Rl/JRDpLYpTsa7Rav2ZV6rhRCLPusCaCw
 6kuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVStfIGX0SbP08ApDNBATayPgszTixyKifa7HVd8iPY8DKRrLq4q4MZ4Dg3hMYRA9k/GG744+VOwoDSNBwacJEJx37Q9cCzDg==
X-Gm-Message-State: AOJu0YzsxByCy3TEiAmtJkMLkeEN73Dq6jgUpugmN/GkW5ApXxGRkVci
 YrOG7WcOAmCc7mBE+/ZZjAAM4gNnO2l3VJu97v4bQ/oK8d1OGRBYss9zNqXFtZQl/BZmk0137gv
 cAPzlrXw6CA+EPAhMaT2P2s/MgDDdAKTSPzQwTdVwA8+Hl5Q97bUVKsw=
X-Received: by 2002:a81:8315:0:b0:617:c383:42ac with SMTP id
 00721157ae682-62a08f3ca5cmr71426597b3.51.1716787202153; 
 Sun, 26 May 2024 22:20:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRVMOtFff2FjJxVJwLGuNYjJHccE/gOtIkC8rBM2uBLgU1HeKjCV6OgakiGjfgRYeW3J4QZA==
X-Received: by 2002:a81:8315:0:b0:617:c383:42ac with SMTP id
 00721157ae682-62a08f3ca5cmr71426487b3.51.1716787201805; 
 Sun, 26 May 2024 22:20:01 -0700 (PDT)
Received: from [192.168.0.4] (ip-109-43-179-90.web.vodafone.de.
 [109.43.179.90]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6ad71678996sm17825526d6.139.2024.05.26.22.19.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 May 2024 22:20:01 -0700 (PDT)
Message-ID: <e86c1913-a1ff-4c31-9915-d66c269b7e10@redhat.com>
Date: Mon, 27 May 2024 07:19:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/3] vl: Allow multiple -overcommit commands
To: Zide Chen <zide.chen@intel.com>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, mst@redhat.com, cfontana@suse.de,
 xiaoyao.li@intel.com, qemu-trivial@nongnu.org
References: <20240524200017.150339-1-zide.chen@intel.com>
 <20240524200017.150339-2-zide.chen@intel.com>
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
In-Reply-To: <20240524200017.150339-2-zide.chen@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.145,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Mon, 27 May 2024 05:20:22 -0000

On 24/05/2024 22.00, Zide Chen wrote:
> Both cpu-pm and mem-lock are related to system resource overcommit, but
> they are separate from each other, in terms of how they are realized,
> and of course, they are applied to different system resources.
> 
> It's tempting to use separate command lines to specify their behavior.
> e.g., in the following example, the cpu-pm command is quietly
> overwritten, and it's not easy to notice it without careful inspection.
> 
>    --overcommit mem-lock=on
>    --overcommit cpu-pm=on
> 
> Fixes: c8c9dc42b7ca ("Remove the deprecated -realtime option")
> Suggested-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Zide Chen <zide.chen@intel.com>
> ---
> 
> v2:
> 
> Thanks to Thomas' suggestion, changed to this better approach, which
> is more generic and can handle situations like: "enabled the option in
> the config file, and now you'd like to disable it on the command line
> again".
> 
>   system/vl.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/system/vl.c b/system/vl.c
> index a3eede5fa5b8..dfa6cdd9283b 100644
> --- a/system/vl.c
> +++ b/system/vl.c
> @@ -3545,8 +3545,8 @@ void qemu_init(int argc, char **argv)
>                   if (!opts) {
>                       exit(1);
>                   }
> -                enable_mlock = qemu_opt_get_bool(opts, "mem-lock", false);
> -                enable_cpu_pm = qemu_opt_get_bool(opts, "cpu-pm", false);
> +                enable_mlock = qemu_opt_get_bool(opts, "mem-lock", enable_mlock);
> +                enable_cpu_pm = qemu_opt_get_bool(opts, "cpu-pm", enable_cpu_pm);
>                   break;
>               case QEMU_OPTION_compat:
>                   {

Reviewed-by: Thomas Huth <thuth@redhat.com>


