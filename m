Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WkX1m-0004Bp-7g
	for mharc-qemu-trivial@gnu.org; Wed, 14 May 2014 07:07:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50473)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1WkX1e-0003xR-H3
	for qemu-trivial@nongnu.org; Wed, 14 May 2014 07:07:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1WkX1Y-0003ZR-DL
	for qemu-trivial@nongnu.org; Wed, 14 May 2014 07:07:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43695)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1WkX1L-0003Wl-Fa; Wed, 14 May 2014 07:06:47 -0400
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s4EB6jF9015301
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 14 May 2014 07:06:45 -0400
Received: from yakj.usersys.redhat.com (ovpn-112-71.ams2.redhat.com
	[10.36.112.71])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id s4EB6Znw019347; Wed, 14 May 2014 07:06:36 -0400
Message-ID: <53734E3A.60603@redhat.com>
Date: Wed, 14 May 2014 13:06:34 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: BALATON Zoltan <balaton@eik.bme.hu>, "Michael S. Tsirkin" <mst@redhat.com>
References: <20140507100818.C714A196A9@mono.eik.bme.hu>
	<536BC50D.4000409@msgid.tls.msk.ru>
	<alpine.LMD.2.02.1405140137100.26415@jedlik.phy.bme.hu>
	<20140514032847.GA31904@redhat.com>
	<alpine.LMD.2.02.1405141250450.28935@jedlik.phy.bme.hu>
In-Reply-To: <alpine.LMD.2.02.1405141250450.28935@jedlik.phy.bme.hu>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH v2] serial-pci: Set prog interface field
 of pci config to 16550 compatible
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
X-List-Received-Date: Wed, 14 May 2014 11:07:12 -0000

Il 14/05/2014 12:59, BALATON Zoltan ha scritto:
> On Wed, 14 May 2014, Michael S. Tsirkin wrote:
>> On Wed, May 14, 2014 at 01:39:03AM +0200, BALATON Zoltan wrote:
>>> On Thu, 8 May 2014, Michael Tokarev wrote:
>>>> 27.02.2014 05:05, BALATON Zoltan wrote:
>>>>
>>>> Shoudl we actually make it machine-specific, to keep even prog-if value
>>>> of these things the same as before for older machine types?  I dunno.
>>>> mst says we should, I think this is not a very important property to
>>>> keep.
>>>
>>> So what's the decision? Can it be taken as it is now or do you want
>>> any more changes? (If you want it version specific then please tell
>>> me how to do that or show me an example because I don't know how to
>>> do that.)
>>>
>>
>> If you change it migration to old qemu breaks.
>
> This is unlikely as this pci serial card is not used by default in any
> machine version AFAIK. Is it still desired to keep backward
> compatibility for a device that can only be added by users explicitely?

Yes, after all not even virtio-blk is used by default.

Paolo


