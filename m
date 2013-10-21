Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VYD3Q-0000o9-NN
	for mharc-qemu-trivial@gnu.org; Mon, 21 Oct 2013 06:49:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50755)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Petar.Jovanovic@imgtec.com>) id 1VYD3L-0000n9-5d
	for qemu-trivial@nongnu.org; Mon, 21 Oct 2013 06:49:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Petar.Jovanovic@imgtec.com>) id 1VYD3G-0008P5-QE
	for qemu-trivial@nongnu.org; Mon, 21 Oct 2013 06:49:39 -0400
Received: from multi.imgtec.com ([194.200.65.239]:61310)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Petar.Jovanovic@imgtec.com>)
	id 1VYD3G-0008Nf-KR; Mon, 21 Oct 2013 06:49:34 -0400
From: Petar Jovanovic <Petar.Jovanovic@imgtec.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Thread-Topic: [Qemu-trivial] [Qemu-devel] [PATCH] linux-user: pass correct
	parameter to do_shmctl()
Thread-Index: AQHOxoLJWCEFMfbm1Em0lW9WoP/OcJnwU1aA//+kwFKAD2QmgP//rKXa
Date: Mon, 21 Oct 2013 10:49:22 +0000
Message-ID: <56EA75BA695AE044ACFB41322F6D2BF44CCA356C@BADAG01.ba.imgtec.org>
References: <1381496638-29127-1-git-send-email-petar.jovanovic@rt-rk.com>,
	<CAFEAcA8HGFUT8P3unP0FfaxsrORm1uHewEb_8DrKFqXqY8wtJg@mail.gmail.com>
	<56EA75BA695AE044ACFB41322F6D2BF40224FF76@BADAG02.ba.imgtec.org>,
	<5264E9C3.6090001@msgid.tls.msk.ru>
In-Reply-To: <5264E9C3.6090001@msgid.tls.msk.ru>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.64.117]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-SEF-Processed: 7_3_0_01192__2013_10_21_11_49_33
X-detected-operating-system: by eggs.gnu.org: Windows XP
X-Received-From: 194.200.65.239
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>, Riku
	Voipio <riku.voipio@linaro.org>,
	Petar Jovanovic <petar.jovanovic@rt-rk.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] linux-user: pass correct
 parameter to do_shmctl()
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
X-List-Received-Date: Mon, 21 Oct 2013 10:49:43 -0000

=0A=
________________________________________=0A=
From: Michael Tokarev [mjt@tls.msk.ru]=0A=
Sent: Monday, October 21, 2013 10:45 AM=0A=
To: Petar Jovanovic=0A=
Cc: Peter Maydell; Petar Jovanovic; QEMU Trivial; Riku Voipio; QEMU Develop=
ers=0A=
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] linux-user: pass correct p=
arameter to do_shmctl()=0A=
=0A=
> What "[1]" are you referring to?=0A=
=0A=
[1] http://patchwork.ozlabs.org/patch/281527/=0A=
=0A=
> Shouldn't the two patches be applied together and be routed via some=0A=
> other, "non-trivial" tree instead?=0A=
=0A=
This is what I originally did, but Peter suggested to separate it in two pa=
tches.=0A=
Dividing that patch into two separate patches made this one trivial.=0A=
=0A=
Regards,=0A=
Petar=


