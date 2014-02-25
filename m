Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WIDZk-0006cE-SB
	for mharc-qemu-trivial@gnu.org; Tue, 25 Feb 2014 03:41:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33156)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1WIDZb-0006Nz-B8
	for qemu-trivial@nongnu.org; Tue, 25 Feb 2014 03:41:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1WIDZU-0000sf-Vl
	for qemu-trivial@nongnu.org; Tue, 25 Feb 2014 03:41:07 -0500
Received: from cantor2.suse.de ([195.135.220.15]:36581 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1WIDZI-0000ks-CE; Tue, 25 Feb 2014 03:40:48 -0500
Received: from relay1.suse.de (charybdis-ext.suse.de [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id DEDAE75013;
	Tue, 25 Feb 2014 08:40:47 +0000 (UTC)
Message-ID: <530C570C.2010108@suse.de>
Date: Tue, 25 Feb 2014 09:40:44 +0100
From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
References: <1393174935-11750-1-git-send-email-sw@weilnetz.de>	<530C2AE2.1010003@weilnetz.de>
	<530C5265.4040900@redhat.com>
In-Reply-To: <530C5265.4040900@redhat.com>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.135.220.15
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 0/9] w32: Reduce dependency
	on Windows API
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
X-List-Received-Date: Tue, 25 Feb 2014 08:41:14 -0000

Am 25.02.2014 09:20, schrieb Paolo Bonzini:
> Il 25/02/2014 06:32, Stefan Weil ha scritto:
>> Am 23.02.2014 18:02, schrieb Stefan Weil:
>>> Today, most .o files depend on windows.h when QEMU is built with
>>> MinGW or
>>> MinGW-w64 (32 and 64 bit builds). These patches reduce the number of
>>> such
>>> files from more than 1800 to less than 180. They also allow removing
>>> some
>>> hacks which were needed because of conflicts with windows.h. A nasty
>>> compiler warning is fixed, too.
>>>
>>> The modifications were tested with MinGW (32 bit native) and MinGW-w6=
4
>>> (32 and 64 bit cross).
>>>
>>> Regards
>>> Stefan W.
>>>
>>> [PATCH 1/9] util/iov: Use qemu/sockets.h instead of conditional code
>>> [PATCH 2/9] exec: Remove unneeded include files
>>> [PATCH 3/9] qemu-img: Remove unneeded include files
>>> [PATCH 4/9] qga: Remove unneeded include file
>>> [PATCH 5/9] vl: Remove unneeded include file
>>> [PATCH 6/9] w32: Add and use intermediate include file for windows.h
>>> [PATCH 7/9] w32: Move inline function from header file to C source
>>> [PATCH 8/9] w32: Reduce dependencies in sysemu/os-win32.h
>>> [PATCH 9/9] w32: Replace Windows specific data types in common
>>>
>>
>> This patch series needs at least one more iteration with a v2.
>>
>> Patches 1-5 can be applied independently of the rest and are trivial, =
so
>> maybe they can be applied by qemu-trivial, or I can send a pull reques=
t
>> for only those patches as soon as they were reviewed. That would reduc=
e
>> the size of my v2 patch set.
>=20
> Patches 1-5 are
>=20
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

Seconded, no objections to those,

Reviewed-by: Andreas F=E4rber <afaerber@suse.de>

Regards,
Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

