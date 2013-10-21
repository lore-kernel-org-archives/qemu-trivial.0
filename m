Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VYG9E-00043s-KU
	for mharc-qemu-trivial@gnu.org; Mon, 21 Oct 2013 10:07:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32922)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Petar.Jovanovic@imgtec.com>) id 1VYG98-00043i-OQ
	for qemu-trivial@nongnu.org; Mon, 21 Oct 2013 10:07:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Petar.Jovanovic@imgtec.com>) id 1VYG93-0006rT-VD
	for qemu-trivial@nongnu.org; Mon, 21 Oct 2013 10:07:50 -0400
Received: from multi.imgtec.com ([194.200.65.239]:34905)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Petar.Jovanovic@imgtec.com>)
	id 1VYG93-0006rN-Pc; Mon, 21 Oct 2013 10:07:45 -0400
From: Petar Jovanovic <Petar.Jovanovic@imgtec.com>
To: Peter Maydell <peter.maydell@linaro.org>
Thread-Topic: [Qemu-trivial] [Qemu-devel] [PATCH] linux-user: pass correct
	parameter to do_shmctl()
Thread-Index: AQHOxoLJWCEFMfbm1Em0lW9WoP/OcJnwU1aA//+kwFKAD2QmgP//rKXagACh0AD//5XgYg==
Date: Mon, 21 Oct 2013 14:07:40 +0000
Message-ID: <56EA75BA695AE044ACFB41322F6D2BF44CCA55FE@BADAG02.ba.imgtec.org>
References: <1381496638-29127-1-git-send-email-petar.jovanovic@rt-rk.com>
	<CAFEAcA8HGFUT8P3unP0FfaxsrORm1uHewEb_8DrKFqXqY8wtJg@mail.gmail.com>
	<56EA75BA695AE044ACFB41322F6D2BF40224FF76@BADAG02.ba.imgtec.org>
	<5264E9C3.6090001@msgid.tls.msk.ru>
	<56EA75BA695AE044ACFB41322F6D2BF44CCA356C@BADAG01.ba.imgtec.org>,
	<CAFEAcA-ASmyrbDBCYaMPMUB-yKHAZ_QrYDevsyZEMYqGdG7OBQ@mail.gmail.com>
In-Reply-To: <CAFEAcA-ASmyrbDBCYaMPMUB-yKHAZ_QrYDevsyZEMYqGdG7OBQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.64.117]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-SEF-Processed: 7_3_0_01192__2013_10_21_15_07_45
X-detected-operating-system: by eggs.gnu.org: Windows XP
X-Received-From: 194.200.65.239
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Riku
	Voipio <riku.voipio@linaro.org>, Michael Tokarev <mjt@tls.msk.ru>,
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
X-List-Received-Date: Mon, 21 Oct 2013 14:07:55 -0000

________________________________________=0A=
From: Peter Maydell [peter.maydell@linaro.org]=0A=
Sent: Monday, October 21, 2013 3:26 PM=0A=
To: Petar Jovanovic=0A=
Cc: Michael Tokarev; Petar Jovanovic; QEMU Trivial; Riku Voipio; QEMU Devel=
opers=0A=
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] linux-user: pass correct p=
arameter to do_shmctl()=0A=
=0A=
> I meant, "divide this one patch into two patches and post them as=0A=
> a single patch series [ie a cover letter with patches labelled 1/2 and=0A=
> 2/2, with the correct threading]". This is the standard way to submit=0A=
> changes which are best split into multiple patches/commits for=0A=
> ease of review but which combine to form a single feature/bugfix.=0A=
=0A=
The two patches can also be viewed as separate single patches, this is why=
=0A=
I sent them separately instead of a patch series.=0A=
Nevertheless, are we fine with the way the patches are sent for this time?=
=0A=
=0A=
Regards,=0A=
Petar=


