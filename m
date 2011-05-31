Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QRPfO-0006MB-Tg
	for mharc-qemu-trivial@gnu.org; Tue, 31 May 2011 10:11:30 -0400
Received: from eggs.gnu.org ([140.186.70.92]:44628)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <avi@redhat.com>) id 1QRPfN-0006M0-1g
	for qemu-trivial@nongnu.org; Tue, 31 May 2011 10:11:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <avi@redhat.com>) id 1QRPfM-0008DI-3U
	for qemu-trivial@nongnu.org; Tue, 31 May 2011 10:11:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:25616)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <avi@redhat.com>)
	id 1QRPfL-0008DC-Sl; Tue, 31 May 2011 10:11:28 -0400
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p4VEBQRH007326
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 31 May 2011 10:11:26 -0400
Received: from balrog.tlv.redhat.com (dhcp-1-27.tlv.redhat.com [10.35.1.27])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p4VEBMvM002933
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 31 May 2011 10:11:24 -0400
Message-ID: <4DE4F706.1000507@redhat.com>
Date: Tue, 31 May 2011 17:11:18 +0300
From: Avi Kivity <avi@redhat.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc15
	Lightning/1.0b3pre Thunderbird/3.1.10
MIME-Version: 1.0
To: Anthony Liguori <anthony@codemonkey.ws>
References: <1306705831-59385-1-git-send-email-andreas.faerber@web.de>
	<4DE4F16D.6030009@codemonkey.ws>
In-Reply-To: <4DE4F16D.6030009@codemonkey.ws>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx1.redhat.com id
	p4VEBQRH007326
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Jan Kiszka <jan.kiszka@siemens.com>,
	=?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <andreas.faerber@web.de>,
	Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Use SIGIO with caution
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
X-List-Received-Date: Tue, 31 May 2011 14:11:29 -0000

On 05/31/2011 04:47 PM, Anthony Liguori wrote:
> On 05/29/2011 04:50 PM, Andreas F=C3=A4rber wrote:
>> BeOS and Haiku don't define SIGIO. When undefined, it won't arrive
>> and doesn't need to be blocked.
>>
>> Signed-off-by: Andreas F=C3=A4rber<andreas.faerber@web.de>
>
> Anything to do with signal masks is never a trivial patch BTW...
>
> But I actually think explicit handling of SIGIO is unneeded.  I think=20
> this is a hold over from the pre-I/O thread days where we selectively=20
> set SIGIO on certain file descriptors to make sure that when an IO fd=20
> became readable, we received a signal to break out of the KVM=20
> emulation loop.
>
> Can the folks on CC confirm/deny?
>
> I can't see any use of SIGIO in the current source tree.
>

We have O_ASYNC in enable_sigio_timer().  That's only used with HPET=20
host timers, which should be very rare.

To be on the safe side I think we should take in the patch, and drop=20
SIGIO support completely only if we decide the hpet host timer is not=20
worth supporting.

--=20
error compiling committee.c: too many arguments to function


