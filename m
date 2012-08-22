Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T40cI-0003JV-Ql
	for mharc-qemu-trivial@gnu.org; Tue, 21 Aug 2012 22:24:22 -0400
Received: from eggs.gnu.org ([208.118.235.92]:33213)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1T40cA-0002qg-Kq
	for qemu-trivial@nongnu.org; Tue, 21 Aug 2012 22:24:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1T40c9-0000wc-Kc
	for qemu-trivial@nongnu.org; Tue, 21 Aug 2012 22:24:14 -0400
Received: from csmailer.cs.nctu.edu.tw ([140.113.235.130]:14045)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>)
	id 1T40c5-0000w2-FZ; Tue, 21 Aug 2012 22:24:09 -0400
Received: from csmailer.cs.nctu.edu.tw (localhost [127.0.0.1])
	by csmailer.cs.nctu.edu.tw (Postfix) with ESMTP id 38F9D582;
	Wed, 22 Aug 2012 10:24:08 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=cs.nctu.edu.tw; h=date
	:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to:content-transfer-encoding; s=rsa1024;
	bh=eGkp7KFE3P5xXsh89599X24lhNg=; b=XrFkYp+Pm4CsrdnuifEgdojhaGEE
	s1x9HGzQ8ZRcLBMKPvgPxD1jgcJ0L8aCb/EZRtIUHCP7FER39l5gzE/BFs4uuikG
	WXlCTRSS5F7BiA1rIabhzRoxidqySZLYrQaKSDfnJmxhm1V0jgxhOGIPbSBEgqkU
	qZlCfozFm05WP/o=
Received: from alumni.cs.nctu.edu.tw (alumni.cs.nctu.edu.tw [140.113.235.116])
	by csmailer.cs.nctu.edu.tw (Postfix) with ESMTP id 28BE4581;
	Wed, 22 Aug 2012 10:24:08 +0800 (CST)
Received: (from chenwj@localhost)
	by alumni.cs.nctu.edu.tw (8.14.4/8.14.4/Submit) id q7M2O6YK012671;
	Wed, 22 Aug 2012 10:24:06 +0800 (CST) (envelope-from chenwj)
Date: Wed, 22 Aug 2012 10:24:06 +0800
From: =?utf-8?B?6Zmz6Z+L5Lu7IChXZWktUmVuIENoZW4p?= <chenwj@iis.sinica.edu.tw>
To: BALATON Zoltan <balaton@eik.bme.hu>
Message-ID: <20120822022406.GB11966@cs.nctu.edu.tw>
References: <Pine.GSO.4.64.1208212330010.11653@mono>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Pine.GSO.4.64.1208212330010.11653@mono>
User-Agent: Mutt/1.5.21 (2010-09-15)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 140.113.235.130
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Fix copy&paste typos in
 documentation comments
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
X-List-Received-Date: Wed, 22 Aug 2012 02:24:20 -0000

On Tue, Aug 21, 2012 at 11:31:26PM +0200, BALATON Zoltan wrote:
>=20
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   memory.h |   11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)
>=20
> diff --git a/memory.h b/memory.h
> index bd1bbae..aba5721 100644
> --- a/memory.h
> +++ b/memory.h
> @@ -252,9 +252,9 @@ void memory_region_init_ram(MemoryRegion *mr,
>                               uint64_t size);
>=20
>   /**
> - * memory_region_init_ram:  Initialize RAM memory region from a user-p=
rovided.
> - *                          pointer.  Accesses into the region will mo=
dify
> - *                          memory directly.
> + * memory_region_init_ram_ptr:  Initialize RAM memory region from a
> + *                          user-provided pointer.  Accesses into the
> + *                          region will modify memory directly.
                               ^^^

  Would be better if you make it align.=20

Regards,
chenwj

--=20
Wei-Ren Chen (=E9=99=B3=E9=9F=8B=E4=BB=BB)
Computer Systems Lab, Institute of Information Science,
Academia Sinica, Taiwan (R.O.C.)
Tel:886-2-2788-3799 #1667
Homepage: http://people.cs.nctu.edu.tw/~chenwj

