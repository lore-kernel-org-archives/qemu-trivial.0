Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VM844-0003ob-Ne
	for mharc-qemu-trivial@gnu.org; Tue, 17 Sep 2013 23:04:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59954)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1VM83v-0003nX-RD
	for qemu-trivial@nongnu.org; Tue, 17 Sep 2013 23:04:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1VM83o-0002mB-I1
	for qemu-trivial@nongnu.org; Tue, 17 Sep 2013 23:04:19 -0400
Received: from mail-pb0-f44.google.com ([209.85.160.44]:40546)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1VM83o-0002lm-BV
	for qemu-trivial@nongnu.org; Tue, 17 Sep 2013 23:04:12 -0400
Received: by mail-pb0-f44.google.com with SMTP id xa7so6410724pbc.31
	for <qemu-trivial@nongnu.org>; Tue, 17 Sep 2013 20:04:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=myDIfQqeslFS1vkta0A/A4Mjrp4BaZtfhDugXMcJCTs=;
	b=Kv20s1+TPrOFCH3xvrROYfue7FK0gcXv3gv4r5LNO5ChKUux+wtWZorBufovouqlg+
	5LH5B53Wn3B8ZE3/z9oCfTrAbs62eu01T/ge3hBvEjDDR3RQXlUHV1oOSWciioWAtAkj
	r33dLhzfpKVQnIeHIijAT64Vb2O/tn/QMEWXomdrkcZqYya0GPeIDShhoz9HOP0q8Rm8
	rhd52SBn8+GaPV+z3yVrF+j+zqVlVF5GW+miqH00k1QFRav0u02AWdATgqKHNDodHS/P
	vhTkFQFHgmJ30FED+EwAX5CZl9Oplr9UfsnTp7LUtJVEsZZLSTyUr1udb/DMRV/BOiQm
	osSQ==
X-Gm-Message-State: ALoCoQlnnZ+b2xyzqeUFHWT3ekCBxZ/yr44q5PMenV670cA6p1mynnAXcDSXH3uC3khq40P8Pmfi
X-Received: by 10.68.216.132 with SMTP id oq4mr11929934pbc.143.1379473450091; 
	Tue, 17 Sep 2013 20:04:10 -0700 (PDT)
Received: from aik.ozlabs.ibm.com (ibmaus65.lnk.telstra.net. [165.228.126.9])
	by mx.google.com with ESMTPSA id 7sm1263111paf.22.1969.12.31.16.00.00
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 17 Sep 2013 20:04:09 -0700 (PDT)
Message-ID: <52391821.1050004@ozlabs.ru>
Date: Wed, 18 Sep 2013 13:04:01 +1000
From: Alexey Kardashevskiy <aik@ozlabs.ru>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>
References: <1378196857-27541-1-git-send-email-aik@ozlabs.ru>
	<CAFEAcA8Jp=SQsC3RpxahF1RFRtX2nHOS2690XiT9Jnpn0jGk_g@mail.gmail.com>
	<5225AC9A.2090601@ozlabs.ru> <5225BD32.8030001@siemens.com>
	<52260025.3050704@ozlabs.ru> <522601AB.1050901@redhat.com>
	<5227F79B.8090804@ozlabs.ru> <52281F93.4070805@redhat.com>
In-Reply-To: <52281F93.4070805@redhat.com>
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.160.44
Cc: Peter Maydell <peter.maydell@linaro.org>, kvm-devel <kvm@vger.kernel.org>,
	Gleb Natapov <gleb@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>,
	Jan Kiszka <jan.kiszka@siemens.com>, Michael Tokarev <mjt@tls.msk.ru>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>
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
X-List-Received-Date: Wed, 18 Sep 2013 03:04:27 -0000

On 09/05/2013 04:07 PM, Paolo Bonzini wrote:
> Il 05/09/2013 05:16, Alexey Kardashevskiy ha scritto:
>>>>>> Sorry for my ignorance, but this is The Kernel, it is already there, broken
>>>>>> or not, even if it is broken, qemu cannot stay isolated, no?
>>>>>> This is a mechanical change, no more.
>>>>
>>>> It's a matter of keeping things bisectable.  If we can detect a
>>>> breakage, we can first work around it, and then apply the header update.
>>>>  And if we don't detect it, maintainers usually send pull requests when
>>>> they have time to work on breakage caused by their patches.
>>
>> I can see the discussion but I do not see if anyone is going to pull this
>> through any tree. Please, somebody, pull. Thanks.
> 
> It will go in through the KVM tree, probably sometime next week.


It is pretty impressive how such a trivial patch is still on its way to the
upstream :)


-- 
Alexey

