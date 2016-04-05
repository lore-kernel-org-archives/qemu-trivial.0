Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1anZzN-0001aO-MK
	for mharc-qemu-trivial@gnu.org; Tue, 05 Apr 2016 19:02:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55116)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1anZzL-0001a5-GG
	for qemu-trivial@nongnu.org; Tue, 05 Apr 2016 19:02:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1anZzI-0008I6-BG
	for qemu-trivial@nongnu.org; Tue, 05 Apr 2016 19:02:23 -0400
Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242]:34373)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1anZzI-0008I2-30; Tue, 05 Apr 2016 19:02:20 -0400
Received: by mail-wm0-x242.google.com with SMTP id n3so8418790wmn.1;
	Tue, 05 Apr 2016 16:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=yR0n1XBamEiZbaAdbDwWkK4TuVw8oHqjxAHBZ0K7uL8=;
	b=gdgtB91oRP5pOvQzf2QAN5Nh9md91vygl+NWGujJghhz42HrPfJl7pMceePbX7/1Hl
	xMX/6KtPs+boaqGWvoPe65CLM5ujx6BtnbMRh96sPNc69UZC1jyFleEjTFCg8JmFLWln
	93aCauRw0GTIeKBv3Pj39wjHIbem+XQ46EUT9FM51e4WXAjSYb4wqAZBVNOYZmyMkxPM
	mSZPfhxGF42YJf5h9Bb3iyvhJHHBlLO4zCdMxxLpF849+uurVs7gEPSgLP7ile3akH24
	jdeLge2j/TSWJNdQraqWFxbAitygLTWbk8i3ujEZ5CA4eSYe0e2EQqZe/um4UyGaeToD
	Kb7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=yR0n1XBamEiZbaAdbDwWkK4TuVw8oHqjxAHBZ0K7uL8=;
	b=J8jQv3UBEClkZ5fFety/jgr8KhsbSz34I1nhOdYtknZI1H119JinUhw7yKifRl6ZX2
	ZLJSWf+LBQLILAwfJxb/7tjoPicmwuCc9ktLerM4oYejvXDl+RIcg6qp159wAd/vN6LT
	dLdOTTLx+J0porqIucfU+Ij8HXrnngfCOVHGG1iNMSChoQhfqxzmnY8driMSg9kQ2PWq
	JVGpgPQSDOMqtuO4DHud4YEvCiaP8/z5ExUNUVcG7NdnCe0cRu7GCQEnLYk+kVQIK2gf
	CSMMl/m2LhPtZ6ORU/HAFNBarqqNoSDQoN5UPHBFHH3R9z4UTI8q1kj+gVuvQJO6fkHE
	9Zpw==
X-Gm-Message-State: AD7BkJKAh3i9n6qHcudb2YLqpMYWTBC6TOQMWJMHm1VUuJI4RjNuPI7+On2pgYjK8FCCsQ==
X-Received: by 10.28.158.78 with SMTP id h75mr18058213wme.53.1459897338695;
	Tue, 05 Apr 2016 16:02:18 -0700 (PDT)
Received: from [192.168.10.150] (94-39-141-76.adsl-ull.clienti.tiscali.it.
	[94.39.141.76]) by smtp.googlemail.com with ESMTPSA id
	j71sm491110wmj.21.2016.04.05.16.02.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 05 Apr 2016 16:02:17 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
To: Wei Jiangang <weijg.fnst@cn.fujitsu.com>, qemu-devel@nongnu.org
References: <1458639954-9980-1-git-send-email-weijg.fnst@cn.fujitsu.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <570443F6.5010603@redhat.com>
Date: Wed, 6 Apr 2016 01:02:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1458639954-9980-1-git-send-email-weijg.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::242
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org, mjt@tls.msk.ru,
	avi@redhat.com
Subject: Re: [Qemu-trivial] [PATCH] docs: fix typo in memory.txt
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Apr 2016 23:02:24 -0000



On 22/03/2016 10:45, Wei Jiangang wrote:
> The scale line should align with A line's end,

No, A ends at 0x7fff so the line should end just before.  See what
happens for B/C/D/E.

However, the space between 7000 and 8000 is indede 7 characters instead
of 6, so I will take your patch and also reduce the space between A's
brackets.

Thanks,

Paolo

> and correct the range of vga-window example 0xa0000-0xbffff.


> Signed-off-by: Wei Jiangang <weijg.fnst@cn.fujitsu.com>
> ---
>  docs/memory.txt | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/docs/memory.txt b/docs/memory.txt
> index 97134e1..5a7163c 100644
> --- a/docs/memory.txt
> +++ b/docs/memory.txt
> @@ -185,8 +185,8 @@ an MMIO region mapped at 0x0, size 0x6000, priority 1. B currently has two
>  of its own subregions: D of size 0x1000 at offset 0 and E of size 0x1000 at
>  offset 0x2000. As a diagram:
>  
> -        0      1000   2000   3000   4000   5000   6000   7000    8000
> -        |------|------|------|------|------|------|------|-------|
> +        0      1000   2000   3000   4000   5000   6000   7000   8000
> +        |------|------|------|------|------|------|------|------|
>    A:    [                                                       ]
>    C:    [CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC]
>    B:                  [                          ]
> @@ -247,7 +247,7 @@ system_memory: container@0-2^48-1
>   |
>   +---- himem: alias@0x100000000-0x11fffffff ---> #ram (0xe0000000-0xffffffff)
>   |
> - +---- vga-window: alias@0xa0000-0xbfffff ---> #pci (0xa0000-0xbffff)
> + +---- vga-window: alias@0xa0000-0xbffff ---> #pci (0xa0000-0xbffff)
>   |      (prio 1)
>   |
>   +---- pci-hole: alias@0xe0000000-0xffffffff ---> #pci (0xe0000000-0xffffffff)
> 

