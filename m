Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XqYg8-0003Hh-Vz
	for mharc-qemu-trivial@gnu.org; Mon, 17 Nov 2014 21:38:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51753)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1XqYg0-00035O-QL
	for qemu-trivial@nongnu.org; Mon, 17 Nov 2014 21:38:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1XqYfu-0002BU-IV
	for qemu-trivial@nongnu.org; Mon, 17 Nov 2014 21:37:56 -0500
Received: from mail-pa0-f45.google.com ([209.85.220.45]:44605)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1XqYfu-0002B6-CW
	for qemu-trivial@nongnu.org; Mon, 17 Nov 2014 21:37:50 -0500
Received: by mail-pa0-f45.google.com with SMTP id lf10so23621425pab.32
	for <qemu-trivial@nongnu.org>; Mon, 17 Nov 2014 18:37:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=G564C1ECqDY1Ts7ktQXZjswQiTp/ufGLx/+luJOyx34=;
	b=dntyY+RQAOocH52TgoshCSOVN6vDzHEubyidxqcbT7+6a+GcgaAzwIrttjBL9h3NND
	tyF7+SnFWAL+jAmfbYtP7t+ofQxEqfvmwNi1Qx6Rn5Z5wscUJ7ISldEKyRB3cNmT+j2a
	8VNLkPmKS8krvcwDgssz1t9u/Q2lygVYUkENX1WKm3hR6Vlko4GWDFBQTXZ9bRghnot+
	LR/4pCxxR5c9d6myW9TwEU7VPv7XwU5m3I8KfhKyolbJhw7qfH9jE1CT5FZ7pn17QfUE
	2B154BD1Z47IAYMAgj4k0ysA4aPNa3fpaGTbXDph9fezlcRxJ6Tk0eulMotmL40Ybdtm
	4TXg==
X-Gm-Message-State: ALoCoQkkFKFFVypd16wfe+5kXkUy30XLleqh8f16xrgxz2LqQRyr0Jjcok63GYLO1APX5xefXlcH
X-Received: by 10.68.136.137 with SMTP id qa9mr34103262pbb.8.1416278269050;
	Mon, 17 Nov 2014 18:37:49 -0800 (PST)
Received: from aik.ozlabs.ibm.com (bh02i525f01.au.ibm.com. [202.81.18.30])
	by mx.google.com with ESMTPSA id
	ki6sm33992193pdb.85.2014.11.17.18.37.44 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Nov 2014 18:37:47 -0800 (PST)
Message-ID: <546AB0F4.2060009@ozlabs.ru>
Date: Tue, 18 Nov 2014 13:37:40 +1100
From: Alexey Kardashevskiy <aik@ozlabs.ru>
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: Alexander Graf <agraf@suse.de>
References: <1416196496-10637-1-git-send-email-aik@ozlabs.ru>
	<1C4EF2B8-76EF-4E4B-AFF8-9063DA607A25@suse.de>
In-Reply-To: <1C4EF2B8-76EF-4E4B-AFF8-9063DA607A25@suse.de>
Content-Type: text/plain; charset=koi8-r
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.220.45
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Gavin Shan <gwshan@linux.vnet.ibm.com>,
	David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [Qemu-trivial] [RFC PATCH] spapr-pci: Enable huge BARs
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
X-List-Received-Date: Tue, 18 Nov 2014 02:38:03 -0000

On 11/17/2014 11:43 PM, Alexander Graf wrote:
> 
> 
> 
>> Am 17.11.2014 um 04:54 schrieb Alexey Kardashevskiy <aik@ozlabs.ru>:
>>
>> At the moment sPAPR only supports 512MB window for MMIO BARs. However
>> modern devices might want bigger 64bit BARs.
>>
>> This adds another 64bit MMIO window per PHB and advertises it via
>> the PHB's "ranges" property in the device tree. The new window is 1TB long
>> and starts from 1TB offset on a PCI address space.
>>
>> Older (<3.12) kernels expect BARs to have the same offset on both bus
>> and memory address spaces. Since we are getting now another MMIO region,
>> we either have to add (0xA000.0000 - 0x8000.0000) offset to
>> its bus offset OR simply put MMIO range at the same offset as on the bus.
>> This puts 32bit MMIO space at 0x8000.0000 offset in RAM and IO space
>> at 0xA000.0000 (used to be vice versa).
>>
>> While we are here, let's increase PHB address spacing from 64GB to 16TB
>> in order not to touch it again any time soon.
>>
>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> 
> I'll have to digthrough the compatibility matrix details myself still, but please make sure that you don't change address space layouts for pseries-2.2.

Right. Still restoring after Europe :)
Ben suggested better idea about windows so never mind, I'll post another
version.



-- 
Alexey

