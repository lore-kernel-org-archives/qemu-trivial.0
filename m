Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YW3x2-00015w-21
	for mharc-qemu-trivial@gnu.org; Thu, 12 Mar 2015 10:19:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38698)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1YW3wv-0000xb-T3
	for qemu-trivial@nongnu.org; Thu, 12 Mar 2015 10:19:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1YW3ws-0002ls-Ma
	for qemu-trivial@nongnu.org; Thu, 12 Mar 2015 10:18:57 -0400
Received: from mail-we0-x233.google.com ([2a00:1450:400c:c03::233]:46151)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1YW3wg-0002jF-K8; Thu, 12 Mar 2015 10:18:42 -0400
Received: by wesk11 with SMTP id k11so16663486wes.13;
	Thu, 12 Mar 2015 07:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=vSJALYvH/ZRxsYy3wlE8+xKXXl16m0CvDed6pgYXbDo=;
	b=AoLEi+o02wn1+1z/YCFK/Ft0gpiOtXWn6zaCBUb+of75GpjG8K6F/H60XYXccqEtMV
	xe/xaBHPHKJmMfSXvfg2XWzrGWZeYbQtUNBSnJANMcaIXxAOQwLrK75bW4k8unlcJ8v2
	EwqH/PNDjbB99cu3vzKGXTHQPwz5wzZLKd3jPzTyXmQW56+9XMci03tMOXVPPWLVLeKT
	VLGI+E0+8CDQ4XVsOhQshDX4OXs/HjnPHKAZrNGn6K9WB0X6LY/DR1Hj02nFE4XkhJ4l
	6Bw6+R0e7FeP4UrAufpbY98NaMoqdeVd2OVCTlyG5fEXvPHJoBlUc8UoltdwAq3uPpWb
	QrFg==
X-Received: by 10.180.189.37 with SMTP id gf5mr132731316wic.86.1426169922027; 
	Thu, 12 Mar 2015 07:18:42 -0700 (PDT)
Received: from [192.168.10.150] (net-188-216-23-124.cust.vodafonedsl.it.
	[188.216.23.124]) by mx.google.com with ESMTPSA id
	lu13sm10930807wic.10.2015.03.12.07.18.40
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Mar 2015 07:18:41 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <5501A03E.7080301@redhat.com>
Date: Thu, 12 Mar 2015 15:18:38 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>, Peter Maydell <peter.maydell@linaro.org>
References: <55012E99.3030408@msgid.tls.msk.ru>	<CAFEAcA9sksApiTRo_0RQ588xLYq+Jy26CQ02nKPp4zoFzyV3_Q@mail.gmail.com>
	<550148F0.4030108@msgid.tls.msk.ru>
In-Reply-To: <550148F0.4030108@msgid.tls.msk.ru>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c03::233
Cc: qemu-trivial <qemu-trivial@nongnu.org>, 778737@bugs.debian.org,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] configure: enable kvm on x32
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
X-List-Received-Date: Thu, 12 Mar 2015 14:19:01 -0000



On 12/03/2015 09:06, Michael Tokarev wrote:
> 12.03.2015 10:16, Peter Maydell wrote:
>> On 12 March 2015 at 06:13, Michael Tokarev <mjt@tls.msk.ru> wrote:
>>> Here's a trivial change to enable kvm on x32 architecture.
>>> I'm not 100% sure the result works correctly in all cases,
>>> but this is a good start and in theory everything should
>>> work.
>>
>> Given the pessimism expressed in this comment, perhaps
>> we should delay this to 2.4 and when it's had more
>> testing?
> 
> There's no pessimism really.  It is a new arch for kvm, so
> _something_ might not work.  In practice it works fairy well,
> see https://bugs.debian.org/778737 -- at least debian can
> be installed in x32 kvm.
> 
> And we don't lose anything really because it is a new arch.
> 
> That's why it was Cc'd -trivial.

Acked-by: Paolo Bonzini <pbonzini@redhat.com>

... but I'm not going to test it.

Paolo

