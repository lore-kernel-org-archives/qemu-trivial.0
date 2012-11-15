Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TZ3BK-0004OG-Ca
	for mharc-qemu-trivial@gnu.org; Thu, 15 Nov 2012 12:24:50 -0500
Received: from eggs.gnu.org ([208.118.235.92]:44065)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ericj@mips.com>) id 1TZ3BF-0004N1-Oy
	for qemu-trivial@nongnu.org; Thu, 15 Nov 2012 12:24:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ericj@mips.com>) id 1TZ3BC-0002ml-Mq
	for qemu-trivial@nongnu.org; Thu, 15 Nov 2012 12:24:45 -0500
Received: from dns1.mips.com ([12.201.5.69]:46809)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ericj@mips.com>)
	id 1TZ3BC-0002mS-8a; Thu, 15 Nov 2012 12:24:42 -0500
Received: from mailgate1.mips.com (mailgate1.mips.com [12.201.5.111])
	by dns1.mips.com (8.13.8/8.13.8) with ESMTP id qAFHO2aT025467;
	Thu, 15 Nov 2012 09:24:02 -0800
X-WSS-ID: 0MDJHO0-01-0P5-02
X-M-MSG: 
Received: from exchdb01.mips.com (unknown [192.168.36.67])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mailgate1.mips.com (Postfix) with ESMTP id 24F88364671;
	Thu, 15 Nov 2012 09:23:59 -0800 (PST)
Received: from EXCHDB03.MIPS.com ([fe80::6df1:ae84:797e:9076]) by
	exchdb01.mips.com ([fe80::2897:a30d:a923:303%16]) with mapi id
	14.01.0270.001; Thu, 15 Nov 2012 09:23:56 -0800
From: "Johnson, Eric" <ericj@mips.com>
To: Aurelien Jarno <aurelien@aurel32.net>
Thread-Topic: [Qemu-devel] [PATCH] target-mips: Clean up microMIPS32 major
	opcode
Thread-Index: AQHNwtcTq/nEklNa4UOtkqHliN5GTJfqK3fwgAFJMgD//7CmoA==
Date: Thu, 15 Nov 2012 17:23:54 +0000
Message-ID: <AD431C1EF67D4B4B801AEC089EB7ED48014488B345@exchdb03.mips.com>
References: <20121115021501.GA15630@cs.nctu.edu.tw>
	<AD431C1EF67D4B4B801AEC089EB7ED48014488ABEC@exchdb03.mips.com>
	<20121115140424.GC21046@ohm.aurel32.net>
In-Reply-To: <20121115140424.GC21046@ohm.aurel32.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.16.149]
x-ems-proccessed: 6LP3oGfGVdcdb8o1aBnt6w==
x-ems-stamp: jNNwImraQD4gSSelC/3irQ==
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 12.201.5.69
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"chenwj@cs.nctu.edu.tw" <chenwj@cs.nctu.edu.tw>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	=?iso-2022-jp?B?GyRCRERwakckGyhCIChXZWktUmVuIENoZW4p?=
	<chenwj@iis.sinica.edu.tw>, Jia Liu <proljc@gmail.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] target-mips: Clean up
 microMIPS32 major opcode
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
X-List-Received-Date: Thu, 15 Nov 2012 17:24:48 -0000

> -----Original Message-----
> From: Aurelien Jarno [mailto:aurelien@aurel32.net]
> Sent: Thursday, November 15, 2012 6:04 AM
> To: Johnson, Eric
> Cc: =1B$BDDpjG$=1B(B (Wei-Ren Chen); qemu-devel@nongnu.org; qemu-trivial@=
nongnu.org;
> chenwj@cs.nctu.edu.tw; Jia Liu
> Subject: Re: [Qemu-devel] [PATCH] target-mips: Clean up microMIPS32 major
> opcode
>=20
> On Thu, Nov 15, 2012 at 02:34:31AM +0000, Johnson, Eric wrote:
> > Hi Chen,
> >
> > Please only remove the POOL48A opcode.
> >
> > The others are documented in the microMIPS64 Instruction Set manual (
> http://www.mips.com/secure-download/index.dot?product_name=3D/auth/MD0008=
7-
> 2B-MIPS64BIS-AFP-03.51.pdf ).  See
> http://www.mips.com/products/architectures/mips64/ for other relavent
> docs.
> >
> > Instead of removing them please surround the POOL32S, DADDIU32, SD32,
> and LD32 opcodes with
> > #if defined(TARGET_MIPS64)
> >
>=20
> I don't think a #if is necessary there, this makes the code more
> difficult to read, while it doesn't change anything on the generated
> code.

Agreed.

-Eric

