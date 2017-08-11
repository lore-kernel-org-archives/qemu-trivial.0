Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dg8iN-0007jr-1Y
	for mharc-qemu-trivial@gnu.org; Fri, 11 Aug 2017 08:06:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53312)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1dg8iK-0007ht-IW
	for qemu-trivial@nongnu.org; Fri, 11 Aug 2017 08:06:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1dg8iJ-0006D5-Ec
	for qemu-trivial@nongnu.org; Fri, 11 Aug 2017 08:06:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58162)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>)
	id 1dg8iE-00066t-QI; Fri, 11 Aug 2017 08:06:46 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A5D9E486D0;
	Fri, 11 Aug 2017 12:06:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com A5D9E486D0
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=pbonzini@redhat.com
Received: from [10.36.116.177] (ovpn-116-177.ams2.redhat.com [10.36.116.177])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DF64517F57;
	Fri, 11 Aug 2017 12:06:30 +0000 (UTC)
To: Fam Zheng <famz@redhat.com>, Cornelia Huck <cohuck@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	=?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
	Eric Blake <eblake@redhat.com>, Richard Henderson <rth@twiddle.net>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20170728053610.15770-1-f4bug@amsat.org>
	<20170728053610.15770-19-f4bug@amsat.org> <87mv7aumav.fsf@linaro.org>
	<8e2e3aa5-4459-76ba-3309-af6b30220346@amsat.org>
	<87fud0vmak.fsf@linaro.org>
	<3e66742f-04c5-51b7-de3a-f692c0637bc5@amsat.org>
	<20170810104604.342af354.cohuck@redhat.com>
	<CAFEAcA-GP53g+vfgDH1mNQnPHcrNULb+gkQk4JeJhb=8UCt+YA@mail.gmail.com>
	<20170810122520.48403984.cohuck@redhat.com>
	<20170811075455.GC27391@lemon.lan>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <1ac44263-dc9a-b16e-df10-09253b566b1b@redhat.com>
Date: Fri, 11 Aug 2017 14:06:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170811075455.GC27391@lemon.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Fri, 11 Aug 2017 12:06:43 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 18/47] MAINTAINERS: add
 missing TCG entry
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 11 Aug 2017 12:06:53 -0000

On 11/08/2017 09:54, Fam Zheng wrote:
> On Thu, 08/10 12:25, Cornelia Huck wrote:
>>> I think the UI (giving no consideration to how we might implement
>>> this!) would ideally be something like:
>>>  * if anybody mails a patch which touches an "unmaintained" file,
>>>    a robot should send a reply along the lines of "thanks for the
>>>    patch; unfortunately file X is not maintained so it may be
>>>    tricky to get patch review for this. You'll need to be
>>>    persistent and do more of the legwork than if you were patching
>>>    a file that did have an active maintainer" so contributors
>>>    know when they've wandered into the swamp
>>
>> That's a good idea.
>>
>>>  * some mechanism for easily finding patches to unmaintained
>>>    files which haven't got review yet, so that anybody with some
>>>    spare time and interest can move some of them along (the idea
>>>    being to spread the load rather than trying to designate a
>>>    particular "owner" for this headache)
>>
>> Can maybe patchew set a special flag for patches that only touch
>> unmaintained files?
> 
> Interesting idea. We have a number of patch status tracking feature requests for
> patchew already. We can tackle them one by one. (The next priority is implement
> "merged".)

Do you use github issues?

Paolo

