Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1frqA8-0006gr-In
	for mharc-qemu-trivial@gnu.org; Mon, 20 Aug 2018 15:48:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59533)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1frqA5-0006fu-Jp
	for qemu-trivial@nongnu.org; Mon, 20 Aug 2018 15:48:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1frqA2-0000Bl-5r
	for qemu-trivial@nongnu.org; Mon, 20 Aug 2018 15:48:23 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:39574 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1frq9l-0008SS-9c; Mon, 20 Aug 2018 15:48:05 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AD9D580823E3;
	Mon, 20 Aug 2018 19:48:04 +0000 (UTC)
Received: from [10.10.124.180] (ovpn-124-180.rdu2.redhat.com [10.10.124.180])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 11F4F10D18F4;
	Mon, 20 Aug 2018 19:48:01 +0000 (UTC)
To: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
	<f4bug@amsat.org>, Juan Quintela <quintela@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Howard Spoelstra <hsp.cat7@gmail.com>
References: <20180818025653.21192-1-f4bug@amsat.org>
	<66dfe354-9c2c-8642-a905-03155555fe99@redhat.com>
	<a812530c-ad1b-f5ff-6e15-82227cb76c79@redhat.com>
	<2fd04596-a8a0-889f-239d-92853c12c6aa@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <2d91d7e2-938d-dbbe-5a11-edf48d4e0fc8@redhat.com>
Date: Mon, 20 Aug 2018 14:48:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <2fd04596-a8a0-889f-239d-92853c12c6aa@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Mon, 20 Aug 2018 19:48:04 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Mon, 20 Aug 2018 19:48:04 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eblake@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] migration: Replace
 strncpy() by g_strlcpy()
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
X-List-Received-Date: Mon, 20 Aug 2018 19:48:28 -0000

On 08/20/2018 12:16 PM, Thomas Huth wrote:

>>
>> Maybe really set it to zero (memset) before using the g_strlcpy? I am
>> not a fan of disabling warnings, but if you think this is
>> easier/cleaner, let's go for that.

I'm not a fan of strlcpy in general (by the time you've properly set it 
up to detect/report/avoid truncation errors, you've added more 
boilerplate code than you would have by just doing memcpy() yourself).

> 
> FWIW, that new warning from GCC is IMHO just annoying. I had the same
> problem in the SLOF sources, too:
> 
> https://github.com/aik/SLOF/commit/d8a9354c2a35136
> 
> The code with strncpy was perfectly valid before, but to get rid of the
> warning, I replaced it with a more cumbersome memcpy instead (and mad
> sure that the memory is already cleared earlier in that function). Now
> seeing that the problem with strncpy pops up here, too, I think it would
> maybe be better to shut up the warning of GCC, since it's clearly GCC
> who's wrong here.

gcc is not necessarily wrong, as it CAN catch real erroneous uses of 
strncpy().  It's just that 99% of the time, strncpy() is the WRONG 
function to use, and so the remaining few cases where it actually does 
what you want are so rare that you have to consult the manual anyways. 
If nothing else, the gcc warning is making people avoid strncpy() even 
where it is safe (which is not a bad thing, in my opinion, because the 
contract of strncpy() is so counter-intuitive).

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

