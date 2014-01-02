Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vyjek-0007DF-G1
	for mharc-qemu-trivial@gnu.org; Thu, 02 Jan 2014 09:53:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40430)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1Vyjec-00076M-D8
	for qemu-trivial@nongnu.org; Thu, 02 Jan 2014 09:53:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1VyjeW-0004K8-9V
	for qemu-trivial@nongnu.org; Thu, 02 Jan 2014 09:53:46 -0500
Received: from cantor2.suse.de ([195.135.220.15]:55402 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1VyjeJ-0004Hl-Mt; Thu, 02 Jan 2014 09:53:27 -0500
Received: from relay2.suse.de (charybdis-ext.suse.de [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id DF7AEAC11;
	Thu,  2 Jan 2014 14:53:26 +0000 (UTC)
Message-ID: <52C57D63.4080809@suse.de>
Date: Thu, 02 Jan 2014 15:53:23 +0100
From: =?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Peter Crosthwaite <peter.crosthwaite@xilinx.com>, 
	Kewei Yu <keweihk@gmail.com>
References: <1388464944-26911-1-git-send-email-keweihk@gmail.com>	<CAEgOgz54Zj9w8gQaMNBvVCiFQX5raPFXLGODy97PrD-TmYSBvw@mail.gmail.com>	<CAJBZ5eP8tRvaQf6qW-zzUs_WQ2WcwTyo0i5Xz3ak8SSprU9vmQ@mail.gmail.com>
	<CAEgOgz5_cT3B38fEUChB7+w7KTsZL5bbTQYiAvp6_i47nNvFMw@mail.gmail.com>
In-Reply-To: <CAEgOgz5_cT3B38fEUChB7+w7KTsZL5bbTQYiAvp6_i47nNvFMw@mail.gmail.com>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.135.220.15
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 1/1] qtest: Fix the bug
 about disabling vnc causes "make check" hang
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
X-List-Received-Date: Thu, 02 Jan 2014 14:53:52 -0000

Am 01.01.2014 05:40, schrieb Peter Crosthwaite:
> On Tue, Dec 31, 2013 at 11:29 PM, Kewei Yu <keweihk@gmail.com> wrote:
>> 2013/12/31 Peter Crosthwaite <peter.crosthwaite@xilinx.com>
>>> On Tue, Dec 31, 2013 at 2:42 PM, Kewei Yu <keweihk@gmail.com> wrote:
>>>> When we disabling vnc from "./configure", the qemu can't use the vnc
>>>> option.
[...]
>>>> So qtest can't use the "vnc -none ", otherwise "make check" will han=
g.
>>>
>>> Curious, why exactly does make check hang? Shouldn't it just fail wit=
h
>>> an error result in this case?
>>
>> Yeah, there is an error result "VNC support is disabled".
>=20
> I think its just terminology then. s/hangs/fails.

Actually no. When qtest gets an unsupported command line argument, so
that QEMU exits right away, then qtest hangs, waiting for the process.
This was easily reproducible by mistyping machine names in my qom-test.
That's a separate issue though.

Regards,
Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

