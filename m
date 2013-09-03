Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VGmyO-000404-Eh
	for mharc-qemu-trivial@gnu.org; Tue, 03 Sep 2013 05:32:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37766)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1VGmyH-0003xA-DN
	for qemu-trivial@nongnu.org; Tue, 03 Sep 2013 05:32:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1VGmy9-0002CF-7Q
	for qemu-trivial@nongnu.org; Tue, 03 Sep 2013 05:32:25 -0400
Received: from mail-pa0-f49.google.com ([209.85.220.49]:52251)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1VGmy9-0002Bu-23
	for qemu-trivial@nongnu.org; Tue, 03 Sep 2013 05:32:17 -0400
Received: by mail-pa0-f49.google.com with SMTP id ld10so6123221pab.8
	for <qemu-trivial@nongnu.org>; Tue, 03 Sep 2013 02:32:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=QaMwugJST0B6xDANzRFKxeVvfqtXEmqg/PvoyOpTysc=;
	b=MxLRRGUjx9s4sH3s2TK23zm01Pmhz9/J2P8JGvwPJNgTJ0xxsLdS/5b8erZGtVJkDW
	E9ATVrRO0phVCipCTz/U5pmyRpucFtOwFu2ePY2JxFy67NGHtMyHxTMr79IBc9n7E6I7
	ApomEVrysqx1cjxnk7OZ4iEqS4B1+A1RZE4GFzHsjajQM2DmNsYe7z52ES60Zh7Nj9Es
	PonrXaVYLIDEvKKSXEkobEL++5Df8CZrIj5ggz836iRd/XeeTu+pmOIQ+8R0Nj7gHxGr
	92/J4eXYuKy42rKe0t7fttOoxpTjiu/gjazr2r39mljQ+bm9qK2hJa7yJH5bJ1lCh/HH
	WPXA==
X-Gm-Message-State: ALoCoQlh6GyJtyuQh/9lJTrb3epAwFirCK2Sw45Y9jQYVyg8CznqV/fM/Y+xFEd7Pk4v4EnoNqIM
X-Received: by 10.66.118.71 with SMTP id kk7mr18218460pab.14.1378200736011;
	Tue, 03 Sep 2013 02:32:16 -0700 (PDT)
Received: from aik.ozlabs.ibm.com (ibmaus65.lnk.telstra.net. [165.228.126.9])
	by mx.google.com with ESMTPSA id
	fa4sm15136913pab.17.1969.12.31.16.00.00
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 03 Sep 2013 02:32:14 -0700 (PDT)
Message-ID: <5225AC9A.2090601@ozlabs.ru>
Date: Tue, 03 Sep 2013 19:32:10 +1000
From: Alexey Kardashevskiy <aik@ozlabs.ru>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130625 Thunderbird/17.0.7
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1378196857-27541-1-git-send-email-aik@ozlabs.ru>
	<CAFEAcA8Jp=SQsC3RpxahF1RFRtX2nHOS2690XiT9Jnpn0jGk_g@mail.gmail.com>
In-Reply-To: <CAFEAcA8Jp=SQsC3RpxahF1RFRtX2nHOS2690XiT9Jnpn0jGk_g@mail.gmail.com>
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.220.49
Cc: kvm-devel <kvm@vger.kernel.org>, Gleb Natapov <gleb@redhat.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>
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
X-List-Received-Date: Tue, 03 Sep 2013 09:32:31 -0000

On 09/03/2013 07:29 PM, Peter Maydell wrote:
> On 3 September 2013 09:27, Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>> ---
>>
>> I need this update as VFIO on PPC64/pseries got in upstream kernel
>> and this is required by VFIO-SPAPR bits in QEMU. Others may find this
>> update useful too :)
>> ---
>>  linux-headers/asm-arm64/kvm.h       | 168 ++++++++++++++++++++++++++++++++++++
>>  linux-headers/asm-arm64/kvm_para.h  |   1 +
>>  linux-headers/asm-mips/kvm.h        |  81 +++++++++--------
>>  linux-headers/linux/kvm.h           |   3 +
>>  linux-headers/linux/vfio.h          |  42 ++++++++-
>>  linux-headers/linux/virtio_config.h |   3 +
>>  6 files changed, 254 insertions(+), 44 deletions(-)
>>  create mode 100644 linux-headers/asm-arm64/kvm.h
>>  create mode 100644 linux-headers/asm-arm64/kvm_para.h
> 
> I think this should go in via the KVM tree, not trivial.

I do not mind, it just went through the trivial tree last time, that's it.


-- 
Alexey

