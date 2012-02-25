Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S1KKd-0007Cn-NL
	for mharc-qemu-trivial@gnu.org; Sat, 25 Feb 2012 11:18:47 -0500
Received: from eggs.gnu.org ([208.118.235.92]:37474)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1S1KKW-0006o2-L6
	for qemu-trivial@nongnu.org; Sat, 25 Feb 2012 11:18:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1S1KKR-0002iB-EZ
	for qemu-trivial@nongnu.org; Sat, 25 Feb 2012 11:18:40 -0500
Received: from cantor2.suse.de ([195.135.220.15]:37603 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1S1KKG-0002gX-CF; Sat, 25 Feb 2012 11:18:24 -0500
Received: from relay2.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id AAA43916B4;
	Sat, 25 Feb 2012 17:18:23 +0100 (CET)
Message-ID: <4F4909CE.8000203@suse.de>
Date: Sat, 25 Feb 2012 17:18:22 +0100
From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120208 Thunderbird/10.0.1
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1330178223-31717-1-git-send-email-sw@weilnetz.de>
	<4F4904EA.5050002@suse.de> <4F4907C2.2080402@weilnetz.de>
In-Reply-To: <4F4907C2.2080402@weilnetz.de>
X-Enigmail-Version: 1.3.5
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Anthony Liguori <aliguori@us.ibm.com>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] vnc: Add break statement
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
X-List-Received-Date: Sat, 25 Feb 2012 16:18:45 -0000

Am 25.02.2012 17:09, schrieb Stefan Weil:
> Am 25.02.2012 16:57, schrieb Andreas F=E4rber:
>> Am 25.02.2012 14:57, schrieb Stefan Weil:
>>> This was not a bug, but it is not common practice to omit the break
>>> statement
>>> from the last case statement before an empty default case.
>>>
>>> Any change of the default case would introduce a bug.
>>>
>>> This was reported as a warning by splint.
>>>
>>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>>> ---
>>> ui/vnc-enc-hextile-template.h | 1 +
>>> 1 files changed, 1 insertions(+), 0 deletions(-)
>>>
>>> diff --git a/ui/vnc-enc-hextile-template.h
>>> b/ui/vnc-enc-hextile-template.h
>>> index b9f9f5e..a7310e1 100644
>>> --- a/ui/vnc-enc-hextile-template.h
>>> +++ b/ui/vnc-enc-hextile-template.h
>>> @@ -175,6 +175,7 @@ static void CONCAT(send_hextile_tile_,
>>> NAME)(VncState *vs,
>>> /* we really don't have to invalidate either the bg or fg
>>> but we've lost the old values. oh well. */
>>> }
>>> + break;
>>> default:
>>
>> Doesn't that require a fallthrough comment for other tools then?
>>
>> Andreas
>=20
> It was a fall through (so a comment would have satisfied static code
> analyzers), but with the added 'break' it no longer is.
>=20
> As I tried to explain in the commit message, a fall through would
> not be reasonable in this special case.

Ah sorry, my comment was based on reading "omit break before default" in
the commit message; tired, should've looked more closely. FWIW:

Reviewed-by: Andreas F=E4rber <afaerber@suse.de>

Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

