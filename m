Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TYq6l-0005pf-1r
	for mharc-qemu-trivial@gnu.org; Wed, 14 Nov 2012 22:27:15 -0500
Received: from eggs.gnu.org ([208.118.235.92]:36135)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1TYq6g-0005Yg-1A
	for qemu-trivial@nongnu.org; Wed, 14 Nov 2012 22:27:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1TYq6c-00044U-UL
	for qemu-trivial@nongnu.org; Wed, 14 Nov 2012 22:27:09 -0500
Received: from csmailer.cs.nctu.edu.tw ([140.113.235.130]:60700)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>)
	id 1TYq6V-00042G-Jb; Wed, 14 Nov 2012 22:27:00 -0500
Received: from csmailer.cs.nctu.edu.tw (localhost [127.0.0.1])
	by csmailer.cs.nctu.edu.tw (Postfix) with ESMTP id ADD74650;
	Thu, 15 Nov 2012 11:26:53 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=cs.nctu.edu.tw; h=date
	:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to:content-transfer-encoding; s=rsa1024;
	bh=XXCvkRUZEvMwjQrsXBW6XiGnr10=; b=O2nUZjedu+lVYla7bkaVVu6L9Psm
	IoqKNk9XbQM+yWINXHqy2zOzkzwU24MWm7IgaPIE00+rrjxggwx4igEBacLmNMRG
	6a4DBBTx3xImH5vRYWfmdJqUZzIEI3WwFZPCvKLvWy6I7+8TuqpiKJGoROKqudk9
	Hy0uVlK72KYNtxA=
Received: from alumni.cs.nctu.edu.tw (alumni.cs.nctu.edu.tw [140.113.235.116])
	by csmailer.cs.nctu.edu.tw (Postfix) with ESMTP id 9AD5664F;
	Thu, 15 Nov 2012 11:26:53 +0800 (CST)
Received: (from chenwj@localhost)
	by alumni.cs.nctu.edu.tw (8.14.5/8.14.5/Submit) id qAF3Qq0Y017573;
	Thu, 15 Nov 2012 11:26:52 +0800 (CST) (envelope-from chenwj)
Date: Thu, 15 Nov 2012 11:26:52 +0800
From: =?utf-8?B?6Zmz6Z+L5Lu7IChXZWktUmVuIENoZW4p?= <chenwj@iis.sinica.edu.tw>
To: "Johnson, Eric" <ericj@mips.com>
Message-ID: <20121115032652.GA17050@cs.nctu.edu.tw>
References: <20121115021501.GA15630@cs.nctu.edu.tw>
	<AD431C1EF67D4B4B801AEC089EB7ED48014488ABEC@exchdb03.mips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <AD431C1EF67D4B4B801AEC089EB7ED48014488ABEC@exchdb03.mips.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: FreeBSD 8.x
X-Received-From: 140.113.235.130
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	=?utf-8?B?6Zmz6Z+L5Lu7IChXZWktUmVuIENoZW4p?= <chenwj@iis.sinica.edu.tw>,
	Jia Liu <proljc@gmail.com>
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
X-List-Received-Date: Thu, 15 Nov 2012 03:27:13 -0000

On Thu, Nov 15, 2012 at 02:34:31AM +0000, Johnson, Eric wrote:
> Hi Chen,
>=20
> Please only remove the POOL48A opcode.
>=20
> The others are documented in the microMIPS64 Instruction Set manual ( h=
ttp://www.mips.com/secure-download/index.dot?product_name=3D/auth/MD00087=
-2B-MIPS64BIS-AFP-03.51.pdf ).  See http://www.mips.com/products/architec=
tures/mips64/ for other relavent docs.
>=20
> Instead of removing them please surround the POOL32S, DADDIU32, SD32, a=
nd LD32 opcodes with
> #if defined(TARGET_MIPS64)
=20
  Just want to make sure I am reading the right manual, are you refering
to [1] or [2]? The link you gave me is about MIPS64 not microMIPS64, I=20
am not sure which one I should look into. I can find DADDIU, SD, and LD
in [1] and [2], all *without* 32 suffix. Should I change their name?
I cannot find POOL32S in both document, would you like to point it out?
Thanks.

Regards,
chenwj

[1] MIPS Architecture For Programmers
      Volume I-B: Introduction to the microMIPS64 Architecture

    MD00743-2B-microMIPS64INT-AFP-03.02.pdf
=20
[2] MIPS Architecture For Programmers
      Volume II-A: The MIPS64 Instruction Set

    MD00087-2B-MIPS64BIS-AFP-03.51.pdf

--=20
Wei-Ren Chen (=E9=99=B3=E9=9F=8B=E4=BB=BB)
Computer Systems Lab, Institute of Information Science,
Academia Sinica, Taiwan (R.O.C.)
Tel:886-2-2788-3799 #1667
Homepage: http://people.cs.nctu.edu.tw/~chenwj

