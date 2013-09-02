Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VGUbS-0006w5-K8
	for mharc-qemu-trivial@gnu.org; Mon, 02 Sep 2013 09:55:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46069)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Taimoor_Mirza@mentor.com>) id 1VGJ4q-0001Cl-MU
	for qemu-trivial@nongnu.org; Sun, 01 Sep 2013 21:37:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Taimoor_Mirza@mentor.com>) id 1VGJ4l-0007be-7v
	for qemu-trivial@nongnu.org; Sun, 01 Sep 2013 21:37:12 -0400
Received: from relay1.mentorg.com ([192.94.38.131]:41135)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Taimoor_Mirza@mentor.com>)
	id 1VGJ4l-0007bY-1l; Sun, 01 Sep 2013 21:37:07 -0400
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1VGJ4f-0004KJ-Ae from Taimoor_Mirza@mentor.com ;
	Sun, 01 Sep 2013 18:37:01 -0700
Received: from SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Sun, 1 Sep 2013 18:37:01 -0700
Received: from EU-MBX-02.mgc.mentorg.com ([169.254.3.165]) by
	SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) with mapi id
	14.02.0247.003; Mon, 2 Sep 2013 02:37:00 +0100
From: "Mirza, Taimoor" <Taimoor_Mirza@mentor.com>
To: Stefan Weil <sw@weilnetz.de>, Michael Tokarev <mjt@tls.msk.ru>
Thread-Topic: [Qemu-trivial] [PATCH v3] slirp: Port redirection option
	behave differently on Linux and Windows
Thread-Index: AQHOme2IzAAA3KpqSkGC4FT9cjQQA5mtnKmAgANzfwCAAAeAgIAArXT8
Date: Mon, 2 Sep 2013 01:36:59 +0000
Message-ID: <329C84666C5EA34DAB3CD0561FC4617EDEF06682@EU-MBX-02.mgc.mentorg.com>
References: <1376594735-7433-1-git-send-email-tmirza@codesourcery.com>
	<52207C25.9070302@siemens.com>
	<52236146.3050801@msgid.tls.msk.ru>,<52236791.9000900@weilnetz.de>
In-Reply-To: <52236791.9000900@weilnetz.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.69]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginalArrivalTime: 02 Sep 2013 01:37:01.0574 (UTC)
	FILETIME=[EBE4B260:01CEA77C]
X-detected-operating-system: by eggs.gnu.org: Windows NT kernel [generic]
	[fuzzy]
X-Received-From: 192.94.38.131
X-Mailman-Approved-At: Mon, 02 Sep 2013 09:55:37 -0400
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH v3] slirp: Port redirection option behave
 differently on Linux and Windows
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
X-List-Received-Date: Mon, 02 Sep 2013 01:37:18 -0000

Hi Guys,=0A=
=0A=
Thanks for reviewing the patch. Only difference between v2 and v3 is that v=
2 had an extra character added at top of the file (socket.c). This was remo=
ved in v3.=0A=
=0A=
Regards,=0A=
Taimoor=0A=
=0A=
=0A=
________________________________________=0A=
From: Stefan Weil [sw@weilnetz.de]=0A=
Sent: Sunday, September 01, 2013 9:13 PM=0A=
To: Michael Tokarev=0A=
Cc: Jan Kiszka; qemu-trivial@nongnu.org; Mirza, Taimoor; qemu-devel@nongnu.=
org=0A=
Subject: Re: [Qemu-trivial] [PATCH v3] slirp: Port redirection option behav=
e differently on Linux and Windows=0A=
=0A=
Am 01.09.2013 17:46, schrieb Michael Tokarev:=0A=
> 30.08.2013 15:04, Jan Kiszka wrote:=0A=
>> On 2013-08-15 21:25, Taimoor wrote:=0A=
>>> From: Taimoor Mirza <tmirza@codesourcery.com>=0A=
>>>=0A=
>>> port redirection code uses SO_REUSEADDR socket option before binding to=
=0A=
>>> host port. Behavior of SO_REUSEADDR is different on Windows and Linux.=
=0A=
>>> Relaunching QEMU with same host and guest port redirection values on=0A=
>>> Linux=0A=
>>> throws error but on Windows it does not throw any error.=0A=
>>> Problem is discussed in=0A=
>>> http://lists.gnu.org/archive/html/qemu-devel/2013-04/msg03089.html=0A=
> []=0A=
>> Stefan, can you ack this? Then I would pick it up for the slirp queue.=
=0A=
>=0A=
> I remember having exactly the same issue myself a few years back with=0A=
> the difference of SO_REUSEADDR behavour on windows and *nix, and the=0A=
> suggested change appears to be correct.  So you can count on my=0A=
>=0A=
> Reviewed-by: Michael Tokarev <mjt@tls.msk.ru>=0A=
>=0A=
> as well.=0A=
>=0A=
> I applied the v2 of this patch (with a trivial fix) to trivial queue=0A=
> (before seeing this v3), I can remove it if you like.=0A=
>=0A=
> Thanks,=0A=
>=0A=
> /mjt=0A=
=0A=
Hi Michael,=0A=
=0A=
thanks for your review of this patch. I had no opportunity to test=0A=
it myself, but I also think that it is fine.=0A=
=0A=
(v2 + trivial fix) should be identical to v3, so this looks good, too.=0A=
=0A=
Cheers,=0A=
Stefan=0A=
=0A=

