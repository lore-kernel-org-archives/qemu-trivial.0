Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RvcrK-0000KI-8j
	for mharc-qemu-trivial@gnu.org; Thu, 09 Feb 2012 17:52:58 -0500
Received: from eggs.gnu.org ([140.186.70.92]:43343)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1RvcrG-00008a-Oq
	for qemu-trivial@nongnu.org; Thu, 09 Feb 2012 17:52:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1RvcrF-0001rX-Ln
	for qemu-trivial@nongnu.org; Thu, 09 Feb 2012 17:52:54 -0500
Received: from cantor2.suse.de ([195.135.220.15]:40858 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>)
	id 1RvcrD-0001r1-B0; Thu, 09 Feb 2012 17:52:51 -0500
Received: from relay1.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id 7E94C8FB75;
	Thu,  9 Feb 2012 23:52:50 +0100 (CET)
Mime-Version: 1.0 (Apple Message framework v1257)
Content-Type: text/plain; charset=iso-8859-1
From: Alexander Graf <agraf@suse.de>
In-Reply-To: <4F3413D9.7040204@suse.de>
Date: Thu, 9 Feb 2012 23:52:49 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <D1954BAB-FF21-42F3-8994-385E9CB09351@suse.de>
References: <CAFKAgTdwXj_XZ3EOgwR0=x_biz6s=SJKVsKX5C+z38=SicWY2A@mail.gmail.com>
	<4F3413D9.7040204@suse.de>
To: =?iso-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>
X-Mailer: Apple Mail (2.1257)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, Riku Voipio <riku.voipio@iki.fi>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [TRIVIAL] sas_ss_flags bug for
	powerpc
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
X-List-Received-Date: Thu, 09 Feb 2012 22:52:55 -0000


On 09.02.2012, at 19:43, Andreas F=E4rber wrote:

> Am 09.02.2012 19:30, schrieb Alex Barcelo:
>> Signed-off-by: Alex Barcelo <abarcelo@ac.upc.edu>
>=20
> This patch needs a better description than "bug"

Yes. In general I also reject patches with empty description.

> , and you forgot to cc the linux-user maintainer

Yes

> . The patch should describe what it touches
> (linux-user), what it does, what for and make clear why that is =
correct.

Yes

> Is there a particular test case that's broken without the patch?

Very important. Please provide a test case that breaks for you.

> I can't speak for Stefan, but to me it is totally unclear from looking
> at the patch what sas_ss_flags() does here so this is likely not =
really
> a trivial one.

It is definitely not trivial. I think I have a rough understanding of =
what the code does and I agree with the patch in general. But I would =
still like to see a ppc binary break in qemu first.


Alex


