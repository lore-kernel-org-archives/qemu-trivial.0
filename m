Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WQftZ-0005X8-0e
	for mharc-qemu-trivial@gnu.org; Thu, 20 Mar 2014 12:32:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46321)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1WQftS-0005I7-6a
	for qemu-trivial@nongnu.org; Thu, 20 Mar 2014 12:32:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1WQftM-0001UY-Rt
	for qemu-trivial@nongnu.org; Thu, 20 Mar 2014 12:32:34 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35945)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1WQftM-0001UP-Kb; Thu, 20 Mar 2014 12:32:28 -0400
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s2KGWIfW010107
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Thu, 20 Mar 2014 12:32:19 -0400
Received: from yakj.usersys.redhat.com (ovpn-112-49.ams2.redhat.com
	[10.36.112.49])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id s2KGWG6P016280; Thu, 20 Mar 2014 12:32:17 -0400
Message-ID: <532B180F.5080301@redhat.com>
Date: Thu, 20 Mar 2014 17:32:15 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <20140227011300.8CD451983B@mono.eik.bme.hu>
	<alpine.LMD.2.02.1403101939400.485@jedlik.phy.bme.hu>
	<532B0C5D.5060905@msgid.tls.msk.ru> <532B0E71.1000009@redhat.com>
	<alpine.LMD.2.02.1403201659440.1844@jedlik.phy.bme.hu>
In-Reply-To: <alpine.LMD.2.02.1403201659440.1844@jedlik.phy.bme.hu>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] serial-pci: Set prog interface field of
 pci config to 16550 compatible
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
X-List-Received-Date: Thu, 20 Mar 2014 16:32:39 -0000

Il 20/03/2014 17:01, BALATON Zoltan ha scritto:
> On Thu, 20 Mar 2014, Paolo Bonzini wrote:
>> Il 20/03/2014 16:42, Michael Tokarev ha scritto:
>>> 10.03.2014 22:40, BALATON Zoltan wrote:
>>>> Ping!
>>>> http://patchwork.ozlabs.org/patch/324674/
>>>
>>> Thanks, applied to -trivial.
>>
>> No, please don't; this needs to be done for new machine types only.
>
> Why? I tried running a Windows XP image that was set up before this
> patch and it did not complain about changed hardware. Or is there
> another reason I'm missing?

Classes (or anything guest-visible in fact) must never ever be changed 
for the same machine type.  It's a rule.

Paolo


