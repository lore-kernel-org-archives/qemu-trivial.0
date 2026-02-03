Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C6E7E8784C
	for <qemu-trivial@archiver.kernel.org>; Tue,  3 Feb 2026 18:25:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1vnL5Z-0001MX-Jo; Tue, 03 Feb 2026 13:25:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1vnL5Y-0001MI-K6
 for qemu-trivial@nongnu.org; Tue, 03 Feb 2026 13:25:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1vnL5X-00045U-87
 for qemu-trivial@nongnu.org; Tue, 03 Feb 2026 13:25:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1770143121;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=4VJ5qGLmwlGAWb947iv+WzdmCl1wDHJk64TuQe2Qung=;
 b=Nco5ROzfnlmUbyJPb5+5dGHLnpkFmgKVdNk2MJCp1ywbo2I4vQnANS7u2/NvZOHIvvDob9
 avA73dX5Ze9KCcRqcFrTBoRExwDSC/PmgTsmiZEa7q3oKC+q3XtqKUUuumKAGoRIkAPQqG
 9XY52g9sa9HLx58UsqsY/ycZJ3O79YA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-167-_LeaW3bYNUCEEyYk7X3Lbw-1; Tue, 03 Feb 2026 13:25:18 -0500
X-MC-Unique: _LeaW3bYNUCEEyYk7X3Lbw-1
X-Mimecast-MFC-AGG-ID: _LeaW3bYNUCEEyYk7X3Lbw_1770143117
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-4325b182e3cso4244357f8f.2
 for <qemu-trivial@nongnu.org>; Tue, 03 Feb 2026 10:25:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770143117; x=1770747917;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4VJ5qGLmwlGAWb947iv+WzdmCl1wDHJk64TuQe2Qung=;
 b=OQZo/7nSdQYvic40+05xKR02NhyW3uj8Hnck+B0XA9bW4uqE8KkWQjaaoTVDghJnfM
 HcS0VELOF+qtg56I+JXZGuRN4pgwYhXQAkItRR65T67hLvMKrtLp2jKHfLZkr9Xu4K9D
 d7hP/+IkzufOsfjvzdex1kLLf0ayaqWCGBTt3J7nZCga9/LRBgNbG9+k1e2rSOTJxCaW
 isdtqo8kbMn8ikJskvz7QjeaORxbPy78yP0lUZmut9Y7HrtH2BUX3iz5Yg3I+n49d4o2
 mhfVyacG9cmNENIGqgLSRHNuV0Ns7mfQV6JVCJUdvFIxnNwY9EjM3is/zDCmSWbyoHIK
 oLVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwslLKyzmn5hwIbpvUgvWwaLSFBqtQIPSk4A3Jy01vAuw02YdJORm8xz/9qBaWxSJirQIDqAI9mQB/Vwo=@nongnu.org
X-Gm-Message-State: AOJu0YwKaD3CzcrgaVju0WiVE6YzB5nCQhqiN+qQNrVnzMWSuBBrjjXm
 NnVJmQgiMNBCCURB/xPiCMTcfhgo+Smw7HLg0sEVIVK7upVbJ6BJMO7Hk6v9VJ3PmD4biwDRaDS
 PWa2wK35sQmZL1rYyacx4Bs2ErxJXM82ThiILxuay0oumrw1WmEeKP4KM91A=
X-Gm-Gg: AZuq6aI7LxANp4j8THiHcmT8dGj8skqCtC1AWvy0lx4Ad76t6Mx66jTqc4x+xLKVZPP
 PbQEyc0HrR/qbAZz1r5xS1fGsoqN7iAdEfe8uKGHbcnNnihbugmw2xrjD2TfsnyBK6CX7qN4MoQ
 M0sigtPOQM2dMZrX7bHArmzLfQr+NtckV++We/iyWvs2McwTYArRq7lLULzo4FUVjUKhqpbtVRy
 Mqqsyh2R7Aos3QGKct/FGhSpC2SPNLUEMm5tQMU4aAlxh++5lWqJdAKiD1p0n7b8KulUb3WEThW
 dch10CX/kQdPAiLa0ZzDXt/DkpXyCQzK+JnAzDbgXMu9DUgNI1T9AhyZnEWr2ce42bAyoXak3Ra
 JzF1aCFc=
X-Received: by 2002:a5d:5d05:0:b0:436:cf5:67c2 with SMTP id
 ffacd0b85a97d-43617e3a314mr459591f8f.11.1770143117463; 
 Tue, 03 Feb 2026 10:25:17 -0800 (PST)
X-Received: by 2002:a5d:5d05:0:b0:436:cf5:67c2 with SMTP id
 ffacd0b85a97d-43617e3a314mr459557f8f.11.1770143117084; 
 Tue, 03 Feb 2026 10:25:17 -0800 (PST)
Received: from [192.168.0.9] ([47.64.115.203])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4361805f25dsm463621f8f.29.2026.02.03.10.25.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Feb 2026 10:25:16 -0800 (PST)
Message-ID: <e3d242f7-a649-4c08-b30f-c2180f3b7055@redhat.com>
Date: Tue, 3 Feb 2026 19:25:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/.../reverse_debugging: Remove unsatisfiable
 condition
To: Yodel Eldar <yodel.eldar@yodel.dev>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, qemu-trivial@nongnu.org
References: <20260203182153.75276-1-yodel.eldar@yodel.dev>
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
In-Reply-To: <20260203182153.75276-1-yodel.eldar@yodel.dev>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4vuBfP9bmLGJxa6g-tpYQXh1m6nqg9tYcOkorvlxT5w_1770143117
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org
Sender: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org

On 03/02/2026 19.21, Yodel Eldar wrote:
> get_qemu_img() already skips the test if qemu-img is not found and does
> not return None. Eliminate the check for None on its result, and the
> unreachable skipTest() gated by it.
> 
> Signed-off-by: Yodel Eldar <yodel.eldar@yodel.dev>
> ---
>   tests/functional/reverse_debugging.py | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/tests/functional/reverse_debugging.py b/tests/functional/reverse_debugging.py
> index 8e6f0b0e92..eaf178da49 100644
> --- a/tests/functional/reverse_debugging.py
> +++ b/tests/functional/reverse_debugging.py
> @@ -73,9 +73,6 @@ def reverse_debugging(self, gdb_arch, shift=7, args=None, big_endian=False):
>           self.log.info('creating qcow2 image for VM snapshots')
>           image_path = os.path.join(self.workdir, 'disk.qcow2')
>           qemu_img = get_qemu_img(self)
> -        if qemu_img is None:
> -            self.skipTest('Could not find "qemu-img", which is required to '
> -                          'create the temporary qcow2 image')
>           out = check_output([qemu_img, 'create', '-f', 'qcow2', image_path, '128M'],
>                              encoding='utf8')
>           self.log.info("qemu-img: %s" % out)

Reviewed-by: Thomas Huth <thuth@redhat.com>


