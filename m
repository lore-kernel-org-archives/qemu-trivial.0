Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VGspi-0000Uh-6L
	for mharc-qemu-trivial@gnu.org; Tue, 03 Sep 2013 11:47:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47890)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1VGspa-0000Jt-Co
	for qemu-trivial@nongnu.org; Tue, 03 Sep 2013 11:47:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1VGspR-0000b8-22
	for qemu-trivial@nongnu.org; Tue, 03 Sep 2013 11:47:50 -0400
Received: from mail-pb0-f42.google.com ([209.85.160.42]:59462)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1VGspQ-0000as-RU
	for qemu-trivial@nongnu.org; Tue, 03 Sep 2013 11:47:40 -0400
Received: by mail-pb0-f42.google.com with SMTP id un15so6185699pbc.1
	for <qemu-trivial@nongnu.org>; Tue, 03 Sep 2013 08:47:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=p85ACiKA9jCOy8jt0p6Ot+A6Q4U+soXj8zBTz2RW2g0=;
	b=l9Bhzuu5a8uILLFbUEYdT90xqZtR+xZOuyqD76akEQewZn5I0cm5gcC2RcwTpD+iCw
	7ASVifzKmUrKD54/gNI13zzyMu8+PspJ4wRLMs7cHizWxl7g+pVPoxY8qB7Gev9mlL/a
	bgoOzGL37DGBeeIhRvd1FBUtdX4oXiQLGxxE5Xieh13VR7Abblrt6jLajajheazTl0GC
	yxRard1kdrkPPjw54Hu3MHPuRf30xezVjExECTo0uyKxQlesh5ggHnOF/Ds48P3NL10A
	fE/O01Liym6XwB/YXOo3XG1EC5RVcm0gNvA9pDOs6zPcHV0NZIx1vTTaOSUf+nQdYuac
	m3GA==
X-Gm-Message-State: ALoCoQkIxAzKfgqj/bkIxj8KfLF40MaLknTdUzviDDlH1Iu4ykLWcio5lY6/KxzpYaxD606/cHui
X-Received: by 10.66.26.194 with SMTP id n2mr9488303pag.151.1378223259931;
	Tue, 03 Sep 2013 08:47:39 -0700 (PDT)
Received: from aik.ozlabs.ibm.com (60-242-102-4.tpgi.com.au. [60.242.102.4])
	by mx.google.com with ESMTPSA id
	xn12sm24827543pac.12.1969.12.31.16.00.00
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 03 Sep 2013 08:47:39 -0700 (PDT)
Message-ID: <5226048E.2090004@ozlabs.ru>
Date: Wed, 04 Sep 2013 01:47:26 +1000
From: Alexey Kardashevskiy <aik@ozlabs.ru>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130625 Thunderbird/17.0.7
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1378196857-27541-1-git-send-email-aik@ozlabs.ru>
	<CAFEAcA8Jp=SQsC3RpxahF1RFRtX2nHOS2690XiT9Jnpn0jGk_g@mail.gmail.com>
	<5225AC9A.2090601@ozlabs.ru> <5225BD32.8030001@siemens.com>
	<52260025.3050704@ozlabs.ru>
	<CAFEAcA8b26fm17sUZ=aUeETVD9q2AahkXQDLQWuRJGM9JMMqkQ@mail.gmail.com>
In-Reply-To: <CAFEAcA8b26fm17sUZ=aUeETVD9q2AahkXQDLQWuRJGM9JMMqkQ@mail.gmail.com>
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.160.42
Cc: kvm-devel <kvm@vger.kernel.org>, Gleb Natapov <gleb@redhat.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	Jan Kiszka <jan.kiszka@siemens.com>, Michael Tokarev <mjt@tls.msk.ru>,
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
X-List-Received-Date: Tue, 03 Sep 2013 15:47:56 -0000

On 09/04/2013 01:34 AM, Peter Maydell wrote:
> On 3 September 2013 16:28, Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
>> On 09/03/2013 08:42 PM, Jan Kiszka wrote:
>>> This shouldn't be routed through trivial in general as things broke too
>>> often in this area.
>>
>>
>> Sorry for my ignorance, but this is The Kernel, it is already there, broken
>> or not, even if it is broken, qemu cannot stay isolated, no?
>> This is a mechanical change, no more.
> 
> The classic way for things to break is that a header
> update accidentally reverts something (because a
> previous update was from kvm-next and this one is
> from mainline, for example). Accidental updates against
> a kernel which is neither kvm-next nor mainline are
> the other common "broken" version of a header update
> patch.

I can understand that but this update is a mainline kernel update and it is
not an accidental one but very specific :-/


-- 
Alexey

