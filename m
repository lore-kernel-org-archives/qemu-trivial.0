Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VHQ4D-0001XP-MB
	for mharc-qemu-trivial@gnu.org; Wed, 04 Sep 2013 23:17:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47572)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1VHQ45-0001Sw-VO
	for qemu-trivial@nongnu.org; Wed, 04 Sep 2013 23:17:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1VHQ3w-0001Yj-U2
	for qemu-trivial@nongnu.org; Wed, 04 Sep 2013 23:17:01 -0400
Received: from mail-pa0-f41.google.com ([209.85.220.41]:61496)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1VHQ3w-0001YS-Mt
	for qemu-trivial@nongnu.org; Wed, 04 Sep 2013 23:16:52 -0400
Received: by mail-pa0-f41.google.com with SMTP id bj1so1309896pad.14
	for <qemu-trivial@nongnu.org>; Wed, 04 Sep 2013 20:16:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=Eu2GUfsQRIL5uXXP8RO3PQmNrYdWSerNilhlrPJLZIg=;
	b=SUrcR2enQyU09KURqVrB8E25/ZcMJBsBYGRHoj1eFoi8Mhxp3toeb/AfQfgFqG+Aex
	+7277EuTl/fFvdiyDWGpMU4PSzz0oVat6jWT2m0jVGSoqG4GAL1Hu5Gqi97XWXRHvxw2
	2czriBIbv+xXsF4QzSDzR6YL7LCdAmzrFiAUGdlsDg6bP82PrxStPVihI0CA9F7m8n/H
	B8fdJPmDFF45XsnSmD0wFdccMeNmZg6tyybxd138zetiwQnf3XQkLlDpp6DrIslw1yvW
	yxpdyk8wzxMLwSenie8EuDbb03tgknTetJAYBCPL1leFY4aAwpInalFvH37Igke0hUAq
	3cSA==
X-Gm-Message-State: ALoCoQmLHkcsSx3zgq+f+3+ZNaVAP1DHRl70pfP0cJOfJC/ykjoZJFhBdBDodag/EBu+eN4dMI+p
X-Received: by 10.68.52.41 with SMTP id q9mr6743586pbo.108.1378351011123;
	Wed, 04 Sep 2013 20:16:51 -0700 (PDT)
Received: from aik.ozlabs.ibm.com (ibmaus65.lnk.telstra.net. [165.228.126.9])
	by mx.google.com with ESMTPSA id
	os4sm32249632pbb.25.1969.12.31.16.00.00
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Wed, 04 Sep 2013 20:16:50 -0700 (PDT)
Message-ID: <5227F79B.8090804@ozlabs.ru>
Date: Thu, 05 Sep 2013 13:16:43 +1000
From: Alexey Kardashevskiy <aik@ozlabs.ru>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130625 Thunderbird/17.0.7
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>
References: <1378196857-27541-1-git-send-email-aik@ozlabs.ru>
	<CAFEAcA8Jp=SQsC3RpxahF1RFRtX2nHOS2690XiT9Jnpn0jGk_g@mail.gmail.com>
	<5225AC9A.2090601@ozlabs.ru> <5225BD32.8030001@siemens.com>
	<52260025.3050704@ozlabs.ru> <522601AB.1050901@redhat.com>
In-Reply-To: <522601AB.1050901@redhat.com>
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.220.41
Cc: Peter Maydell <peter.maydell@linaro.org>, kvm-devel <kvm@vger.kernel.org>,
	Gleb Natapov <gleb@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>,
	Jan Kiszka <jan.kiszka@siemens.com>, Michael Tokarev <mjt@tls.msk.ru>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] linux-headers: update to
	3.11
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
X-List-Received-Date: Thu, 05 Sep 2013 03:17:08 -0000

On 09/04/2013 01:35 AM, Paolo Bonzini wrote:
> Il 03/09/2013 17:28, Alexey Kardashevskiy ha scritto:
>> On 09/03/2013 08:42 PM, Jan Kiszka wrote:
>>> On 2013-09-03 11:32, Alexey Kardashevskiy wrote:
>>>> On 09/03/2013 07:29 PM, Peter Maydell wrote:
>>>>> On 3 September 2013 09:27, Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
>>>>>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>>>>>> ---
>>>>>>
>>>>>> I need this update as VFIO on PPC64/pseries got in upstream kernel
>>>>>> and this is required by VFIO-SPAPR bits in QEMU. Others may find this
>>>>>> update useful too :)
>>>>>> ---
>>>>>>  linux-headers/asm-arm64/kvm.h       | 168 ++++++++++++++++++++++++++++++++++++
>>>>>>  linux-headers/asm-arm64/kvm_para.h  |   1 +
>>>>>>  linux-headers/asm-mips/kvm.h        |  81 +++++++++--------
>>>>>>  linux-headers/linux/kvm.h           |   3 +
>>>>>>  linux-headers/linux/vfio.h          |  42 ++++++++-
>>>>>>  linux-headers/linux/virtio_config.h |   3 +
>>>>>>  6 files changed, 254 insertions(+), 44 deletions(-)
>>>>>>  create mode 100644 linux-headers/asm-arm64/kvm.h
>>>>>>  create mode 100644 linux-headers/asm-arm64/kvm_para.h
>>>>>
>>>>> I think this should go in via the KVM tree, not trivial.
>>>>
>>>> I do not mind, it just went through the trivial tree last time, that's it.
>>>
>>> This shouldn't be routed through trivial in general as things broke too
>>> often in this area.
>>
>> Sorry for my ignorance, but this is The Kernel, it is already there, broken
>> or not, even if it is broken, qemu cannot stay isolated, no?
>> This is a mechanical change, no more.
> 
> It's a matter of keeping things bisectable.  If we can detect a
> breakage, we can first work around it, and then apply the header update.
>  And if we don't detect it, maintainers usually send pull requests when
> they have time to work on breakage caused by their patches.


I can see the discussion but I do not see if anyone is going to pull this
through any tree. Please, somebody, pull. Thanks.


-- 
Alexey

