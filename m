Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VUja2-0007gf-2R
	for mharc-qemu-trivial@gnu.org; Fri, 11 Oct 2013 16:45:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40032)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Petar.Jovanovic@imgtec.com>) id 1VUjZw-0007ZT-8Z
	for qemu-trivial@nongnu.org; Fri, 11 Oct 2013 16:45:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Petar.Jovanovic@imgtec.com>) id 1VUjZs-0001Uy-52
	for qemu-trivial@nongnu.org; Fri, 11 Oct 2013 16:44:56 -0400
Received: from multi.imgtec.com ([194.200.65.239]:30533)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Petar.Jovanovic@imgtec.com>)
	id 1VUjZq-0001Ul-Ug; Fri, 11 Oct 2013 16:44:52 -0400
From: Petar Jovanovic <Petar.Jovanovic@imgtec.com>
To: Peter Maydell <peter.maydell@linaro.org>, Petar Jovanovic
	<petar.jovanovic@rt-rk.com>
Thread-Topic: [Qemu-devel] [PATCH] linux-user: pass correct parameter to
	do_shmctl()
Thread-Index: AQHOxoLJWCEFMfbm1Em0lW9WoP/OcJnwU1aA//+kwFI=
Date: Fri, 11 Oct 2013 20:44:44 +0000
Message-ID: <56EA75BA695AE044ACFB41322F6D2BF40224FF76@BADAG02.ba.imgtec.org>
References: <1381496638-29127-1-git-send-email-petar.jovanovic@rt-rk.com>,
	<CAFEAcA8HGFUT8P3unP0FfaxsrORm1uHewEb_8DrKFqXqY8wtJg@mail.gmail.com>
In-Reply-To: <CAFEAcA8HGFUT8P3unP0FfaxsrORm1uHewEb_8DrKFqXqY8wtJg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.64.117]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-SEF-Processed: 7_3_0_01192__2013_10_11_21_44_49
X-detected-operating-system: by eggs.gnu.org: Windows XP
X-Received-From: 194.200.65.239
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Riku Voipio <riku.voipio@linaro.org>,
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
X-List-Received-Date: Fri, 11 Oct 2013 20:45:00 -0000

=0A=
________________________________________=0A=
From: Peter Maydell [peter.maydell@linaro.org]=0A=
Sent: Friday, October 11, 2013 9:10 PM=0A=
To: Petar Jovanovic=0A=
Cc: QEMU Developers; QEMU Trivial; Riku Voipio; Petar Jovanovic; Aurelien J=
arno=0A=
Subject: Re: [Qemu-devel] [PATCH] linux-user: pass correct parameter to do_=
shmctl()=0A=
=0A=
On 11 October 2013 22:03, Petar Jovanovic <petar.jovanovic@rt-rk.com> wrote=
:=0A=
> From: Petar Jovanovic <petar.jovanovic@imgtec.com>=0A=
>=0A=
> Fix shmctl issue by passing correct parameter buf to do_shmctl().=0A=
=0A=
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>=0A=
=0A=
> It would be nice if you gave more detail than "shmctl issue"...=0A=
=0A=
Yes, indeed. However, this is a bit tricky, because it can be associated=0A=
with different issues, and this particular fix is a follow up to an=0A=
another change [1] that I posted previously that defines arch-specific=0A=
structs target_ipc_perm and target_shmid_ds. The layout of the structs=0A=
is important.=0A=
=0A=
This particular change will for instance, when joined with the=0A=
preceding change, make the code correctly return values in the buf=0A=
struct after:=0A=
=0A=
shmctl(shm_id, IPC_STAT, &buf)=0A=
=0A=
Different architectures benefit from these two patches.=0A=
=0A=
Regards,=0A=
Petar=


