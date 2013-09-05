Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VHSjP-000631-At
	for mharc-qemu-trivial@gnu.org; Thu, 05 Sep 2013 02:07:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39849)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1VHSjF-0005qM-JH
	for qemu-trivial@nongnu.org; Thu, 05 Sep 2013 02:07:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1VHSj7-0004p3-4q
	for qemu-trivial@nongnu.org; Thu, 05 Sep 2013 02:07:41 -0400
Received: from mail-ee0-x22e.google.com ([2a00:1450:4013:c00::22e]:43383)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1VHSiq-0004ni-3z; Thu, 05 Sep 2013 02:07:16 -0400
Received: by mail-ee0-f46.google.com with SMTP id c13so202583eek.33
	for <multiple recipients>; Wed, 04 Sep 2013 23:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=isWxWfu6wdCkh9goA9BSsBNLXZvkXxBzOFXcMzFYI/g=;
	b=Hx7IT/aysl5bItNmUAN1YGmfomtndfQGFne9yiloXri1pU5HK4eppWSP+MXRCo5Lxl
	tgxVHfus27o2yG9j9hXwGb1zdjm2DNE0YnUyL/71UL79K5G3WH/T2WJKtdgjsjUdTqYD
	yidtWjis9Id10HLbZFxtvdQLpBnj0lCCkHwgf3fpiBHHsG4dmAROEtqlQ00yh/E98lHX
	tOzAXWCa9loPOwdkQP3q5w/mktvkR/88zwkKhERGD0wNeBaw+SaWrQDCQ35ZgfDc/T47
	S7NhqpUC56849f3A6fZexxaUXKOZEXHgnUgaLfZbsHYjGUIKCwvrNCXxZIZVrhV+qugw
	4O9g==
X-Received: by 10.14.194.131 with SMTP id m3mr10813701een.45.1378361235285;
	Wed, 04 Sep 2013 23:07:15 -0700 (PDT)
Received: from yakj.usersys.redhat.com
	(net-37-117-144-28.cust.dsl.vodafone.it. [37.117.144.28])
	by mx.google.com with ESMTPSA id p5sm45714194eeg.5.1969.12.31.16.00.00
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Wed, 04 Sep 2013 23:07:14 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <52281F93.4070805@redhat.com>
Date: Thu, 05 Sep 2013 08:07:15 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: Alexey Kardashevskiy <aik@ozlabs.ru>
References: <1378196857-27541-1-git-send-email-aik@ozlabs.ru>
	<CAFEAcA8Jp=SQsC3RpxahF1RFRtX2nHOS2690XiT9Jnpn0jGk_g@mail.gmail.com>
	<5225AC9A.2090601@ozlabs.ru> <5225BD32.8030001@siemens.com>
	<52260025.3050704@ozlabs.ru> <522601AB.1050901@redhat.com>
	<5227F79B.8090804@ozlabs.ru>
In-Reply-To: <5227F79B.8090804@ozlabs.ru>
X-Enigmail-Version: 1.5.2
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4013:c00::22e
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
X-List-Received-Date: Thu, 05 Sep 2013 06:07:50 -0000

Il 05/09/2013 05:16, Alexey Kardashevskiy ha scritto:
>>> >> Sorry for my ignorance, but this is The Kernel, it is already there, broken
>>> >> or not, even if it is broken, qemu cannot stay isolated, no?
>>> >> This is a mechanical change, no more.
>> > 
>> > It's a matter of keeping things bisectable.  If we can detect a
>> > breakage, we can first work around it, and then apply the header update.
>> >  And if we don't detect it, maintainers usually send pull requests when
>> > they have time to work on breakage caused by their patches.
> 
> I can see the discussion but I do not see if anyone is going to pull this
> through any tree. Please, somebody, pull. Thanks.

It will go in through the KVM tree, probably sometime next week.

Paolo

