Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1URijt-0001br-VE
	for mharc-qemu-trivial@gnu.org; Mon, 15 Apr 2013 08:42:29 -0400
Received: from eggs.gnu.org ([208.118.235.92]:44485)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Petar.Jovanovic@imgtec.com>) id 1URijp-0001VM-1P
	for qemu-trivial@nongnu.org; Mon, 15 Apr 2013 08:42:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Petar.Jovanovic@imgtec.com>) id 1URijm-0003AZ-5f
	for qemu-trivial@nongnu.org; Mon, 15 Apr 2013 08:42:24 -0400
Received: from multi.imgtec.com ([194.200.65.239]:49604)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Petar.Jovanovic@imgtec.com>) id 1URijm-0003AG-0l
	for qemu-trivial@nongnu.org; Mon, 15 Apr 2013 08:42:22 -0400
From: Petar Jovanovic <Petar.Jovanovic@imgtec.com>
To: Peter Maydell <peter.maydell@linaro.org>, Petar Jovanovic
	<petar.jovanovic@rt-rk.com>
Thread-Topic: [Qemu-devel] [PATCH] linux-user: change do_semop to return
	target errno when unsuccessful
Thread-Index: AQHOJl3fGipKB/aWdEaiYvy3HYyNEJiw5W6AgBDETkeACxgfYYAKlT7p
Date: Mon, 15 Apr 2013 12:10:10 +0000
Message-ID: <56EA75BA695AE044ACFB41322F6D2BF40189171D@bamail02.ba.imgtec.org>
References: <1363888656-123910-1-git-send-email-petar.jovanovic@rt-rk.com>,
	<CAFEAcA-uf_Y3QSF9L+1z6b0KGemobJUP=+xS8AZtwZ6q-MLiPA@mail.gmail.com>,
	<56EA75BA695AE044ACFB41322F6D2BF40188EB50@bamail02.ba.imgtec.org>,
	<56EA75BA695AE044ACFB41322F6D2BF401890FFF@bamail02.ba.imgtec.org>
In-Reply-To: <56EA75BA695AE044ACFB41322F6D2BF401890FFF@bamail02.ba.imgtec.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.64.117]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-SEF-Processed: 7_3_0_01181__2013_04_15_13_10_23
X-detected-operating-system: by eggs.gnu.org: Windows XP
X-Received-From: 194.200.65.239
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"riku.voipio@linaro.org" <riku.voipio@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] linux-user: change do_semop
 to return target errno when unsuccessful
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
X-List-Received-Date: Mon, 15 Apr 2013 12:42:28 -0000

+ qemu-trivial@nongnu.org=0A=
=0A=
ping=0A=
________________________________________=0A=
From: Petar Jovanovic=0A=
Sent: Monday, April 08, 2013 8:31 PM=0A=
To: Peter Maydell; Petar Jovanovic=0A=
Cc: qemu-devel@nongnu.org; riku.voipio@linaro.org=0A=
Subject: RE: [Qemu-devel] [PATCH] linux-user: change do_semop to return tar=
get errno when unsuccessful=0A=
=0A=
ping=0A=
________________________________________=0A=
From: Petar Jovanovic=0A=
Sent: Monday, April 01, 2013 7:07 PM=0A=
To: Peter Maydell; Petar Jovanovic=0A=
Cc: qemu-devel@nongnu.org; riku.voipio@linaro.org=0A=
Subject: RE: [Qemu-devel] [PATCH] linux-user: change do_semop to return tar=
get errno when unsuccessful=0A=
=0A=
ping=0A=
=0A=
http://patchwork.ozlabs.org/patch/229787/=0A=
=0A=
________________________________________=0A=
From: Peter Maydell [peter.maydell@linaro.org]=0A=
Sent: Thursday, March 21, 2013 7:03 PM=0A=
To: Petar Jovanovic=0A=
Cc: qemu-devel@nongnu.org; riku.voipio@linaro.org; Petar Jovanovic=0A=
Subject: Re: [Qemu-devel] [PATCH] linux-user: change do_semop to return tar=
get errno when unsuccessful=0A=
=0A=
On 21 March 2013 17:57, Petar Jovanovic <petar.jovanovic@rt-rk.com> wrote:=
=0A=
> From: Petar Jovanovic <petar.jovanovic@imgtec.com>=0A=
>=0A=
> do_semop() is called from two places, and one of these fails to convert=
=0A=
> return error to target errno when semop fails. This patch changes the=0A=
> function to always return target errno in case of an unsuccessful call.=
=0A=
>=0A=
> Signed-off-by: Petar Jovanovic <petar.jovanovic@imgtec.com>=0A=
=0A=
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>=0A=
=0A=
-- PMM=0A=


