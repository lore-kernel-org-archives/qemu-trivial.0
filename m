Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TYqef-00075i-FG
	for mharc-qemu-trivial@gnu.org; Wed, 14 Nov 2012 23:02:17 -0500
Received: from eggs.gnu.org ([208.118.235.92]:41451)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ericj@mips.com>) id 1TYqea-00073b-T7
	for qemu-trivial@nongnu.org; Wed, 14 Nov 2012 23:02:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ericj@mips.com>) id 1TYqeX-0006a7-Qy
	for qemu-trivial@nongnu.org; Wed, 14 Nov 2012 23:02:12 -0500
Received: from dns1.mips.com ([12.201.5.69]:54800)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ericj@mips.com>)
	id 1TYqeX-0006Zo-Fi; Wed, 14 Nov 2012 23:02:09 -0500
Received: from mailgate1.mips.com (mailgate1.mips.com [12.201.5.111])
	by dns1.mips.com (8.13.8/8.13.8) with ESMTP id qAF41fsR011006;
	Wed, 14 Nov 2012 20:01:41 -0800
X-WSS-ID: 0MDIGIP-01-09A-02
X-M-MSG: 
Received: from exchdb01.mips.com (unknown [192.168.36.67])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mailgate1.mips.com (Postfix) with ESMTP id 2FB25364671;
	Wed, 14 Nov 2012 20:01:37 -0800 (PST)
Received: from EXCHDB03.MIPS.com ([fe80::6df1:ae84:797e:9076]) by
	exchdb01.mips.com ([fe80::2897:a30d:a923:303%16]) with mapi id
	14.01.0270.001; Wed, 14 Nov 2012 20:01:33 -0800
From: "Johnson, Eric" <ericj@mips.com>
To: =?iso-2022-jp?B?IBskQkREcGpHJBsoQiAoV2VpLVJlbiBDaGVuKSA=?=
	<chenwj@iis.sinica.edu.tw>
Thread-Topic: [Qemu-devel] [PATCH] target-mips: Clean up microMIPS32 major
	opcode
Thread-Index: AQHNwtcTq/nEklNa4UOtkqHliN5GTJfqK3fwgACXEgD//4OUdg==
Date: Thu, 15 Nov 2012 04:01:32 +0000
Message-ID: <FD6A7462-2EB5-4527-B56C-FDC5DD3A59AD@mips.com>
References: <20121115021501.GA15630@cs.nctu.edu.tw>
	<AD431C1EF67D4B4B801AEC089EB7ED48014488ABEC@exchdb03.mips.com>,
	<20121115032652.GA17050@cs.nctu.edu.tw>
In-Reply-To: <20121115032652.GA17050@cs.nctu.edu.tw>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ems-proccessed: 6LP3oGfGVdcdb8o1aBnt6w==
x-ems-stamp: jHRJ0M1TTPXwsC9hFk+22A==
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 12.201.5.69
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Jia Liu <proljc@gmail.com>
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
X-List-Received-Date: Thu, 15 Nov 2012 04:02:16 -0000

Hi Chen,

Sorry I must have made a copy paste error.  I access the documents internal=
ly. I'll double check the link tomorrow.

The document I referenced is the MIPS64 not the microMIPS64.

Do not change the names. The LD32 and SD32 are microMIPS specific. The asse=
mbler LD and SD opcodes work for either MIPS64 or microMIPS64.

Eric

On Nov 14, 2012, at 7:27 PM, "=1B$BDDpjG$=1B(B (Wei-Ren Chen)" <chenwj@iis.=
sinica.edu.tw> wrote:

> On Thu, Nov 15, 2012 at 02:34:31AM +0000, Johnson, Eric wrote:
>> Hi Chen,
>>=20
>> Please only remove the POOL48A opcode.
>>=20
>> The others are documented in the microMIPS64 Instruction Set manual ( ht=
tp://www.mips.com/secure-download/index.dot?product_name=3D/auth/MD00087-2B=
-MIPS64BIS-AFP-03.51.pdf ).  See http://www.mips.com/products/architectures=
/mips64/ for other relavent docs.
>>=20
>> Instead of removing them please surround the POOL32S, DADDIU32, SD32, an=
d LD32 opcodes with
>> #if defined(TARGET_MIPS64)
>=20
>  Just want to make sure I am reading the right manual, are you refering
> to [1] or [2]? The link you gave me is about MIPS64 not microMIPS64, I=20
> am not sure which one I should look into. I can find DADDIU, SD, and LD
> in [1] and [2], all *without* 32 suffix. Should I change their name?
> I cannot find POOL32S in both document, would you like to point it out?
> Thanks.
>=20
> Regards,
> chenwj
>=20
> [1] MIPS Architecture For Programmers
>      Volume I-B: Introduction to the microMIPS64 Architecture
>=20
>    MD00743-2B-microMIPS64INT-AFP-03.02.pdf
>=20
> [2] MIPS Architecture For Programmers
>      Volume II-A: The MIPS64 Instruction Set
>=20
>    MD00087-2B-MIPS64BIS-AFP-03.51.pdf
>=20
> --=20
> Wei-Ren Chen (=1B$BDDpjG$=1B(B)
> Computer Systems Lab, Institute of Information Science,
> Academia Sinica, Taiwan (R.O.C.)
> Tel:886-2-2788-3799 #1667
> Homepage: http://people.cs.nctu.edu.tw/~chenwj

