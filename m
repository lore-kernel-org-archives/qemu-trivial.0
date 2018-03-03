Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1es9IO-0001qq-SE
	for mharc-qemu-trivial@gnu.org; Sat, 03 Mar 2018 10:42:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37711)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1es9IM-0001pm-8n
	for qemu-trivial@nongnu.org; Sat, 03 Mar 2018 10:41:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1es9IL-0004E8-It
	for qemu-trivial@nongnu.org; Sat, 03 Mar 2018 10:41:58 -0500
Received: from mail.weilnetz.de ([37.120.169.71]:57548
	helo=v2201612906741603.powersrv.de)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sw@weilnetz.de>)
	id 1es9IF-0004CL-BS; Sat, 03 Mar 2018 10:41:51 -0500
Received: from localhost (localhost [127.0.0.1])
	by v2201612906741603.powersrv.de (Postfix) with ESMTP id 2327ADA1041;
	Sat,  3 Mar 2018 16:41:49 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at v2201612906741603.powersrv.de
Received: from v2201612906741603.powersrv.de ([127.0.0.1])
	by localhost (v2201612906741603.powersrv.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id iUaeEAApPMIm; Sat,  3 Mar 2018 16:41:47 +0100 (CET)
Received: from edv32.bib.uni-mannheim.de (pD9E01CF7.dip0.t-ipconnect.de
	[217.224.28.247])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 19040DA0077; 
	Sat,  3 Mar 2018 16:41:47 +0100 (CET)
To: Anatoly Trosinenko <anatoly.trosinenko@gmail.com>,
	Richard Henderson <rth@twiddle.net>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20180127134908.24095-1-anatoly.trosinenko@gmail.com>
	<20180127134908.24095-2-anatoly.trosinenko@gmail.com>
	<aab013fb-5ada-6ee5-d038-0277d8ef0b24@weilnetz.de>
	<CAE5jQCfxjM9ykBCes0oDhrc0B6g8AC5Se39sXBsbZo=-dKQpyg@mail.gmail.com>
	<CAE5jQCe8O3BT=6SDdm2p7J_wxgzZTcqhyS1mfnEr=4tci9fipg@mail.gmail.com>
	<efe4a642-a220-5a40-b1e0-769a4216389d@twiddle.net>
	<CAE5jQCcCA=3kkVa=5eMZs-BGAM_p4fZG+GPu1SmQMg7_sPAH5Q@mail.gmail.com>
From: Stefan Weil <sw@weilnetz.de>
Message-ID: <57abe9de-1258-3624-2f8a-882f1de1d19d@weilnetz.de>
Date: Sat, 3 Mar 2018 16:41:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAE5jQCcCA=3kkVa=5eMZs-BGAM_p4fZG+GPu1SmQMg7_sPAH5Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 37.120.169.71
Subject: Re: [Qemu-trivial] [PATCH 1/1] tci: eliminate UB due to unaligned
 reads
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 03 Mar 2018 15:41:59 -0000

Am 03.03.2018 um 15:07 schrieb Anatoly Trosinenko:
> Can rewriting TCI in such a way that every operation is aligned at 4- o=
r
> even 8-byte boundary fix the situation or are there some more serious
> problems?

That's my preferred solution. Are there cases which would require 8-byte
alignment?

Richard, the discussion about non-portable calls to helper functions is
not new, but I still have no test case which fails. Do you think of a
special case (architecture, helper function)?

Stefan

