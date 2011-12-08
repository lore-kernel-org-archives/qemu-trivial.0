Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RYY0z-0001mM-0u
	for mharc-qemu-trivial@gnu.org; Thu, 08 Dec 2011 02:03:33 -0500
Received: from eggs.gnu.org ([140.186.70.92]:40338)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1RYY0u-0001bT-TG
	for qemu-trivial@nongnu.org; Thu, 08 Dec 2011 02:03:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1RYY0t-0007O3-QN
	for qemu-trivial@nongnu.org; Thu, 08 Dec 2011 02:03:28 -0500
Received: from csmailer.cs.nctu.edu.tw ([140.113.235.130]:55154)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>)
	id 1RYY0q-0007IP-GB; Thu, 08 Dec 2011 02:03:25 -0500
Received: from csmailer.cs.nctu.edu.tw (localhost [127.0.0.1])
	by csmailer.cs.nctu.edu.tw (Postfix) with ESMTP id 0725C80A;
	Thu,  8 Dec 2011 15:00:55 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=cs.nctu.edu.tw; h=date
	:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to:content-transfer-encoding; s=rsa1024;
	bh=z+JowA5RDVxqi1N9KIP/bE5ze24=; b=AUD9MklL6+Ge60LUBW4aiD1+n/hR
	1zuh11J/RbKVcS00WTrT+ssUtLK9hPyuSVFe7WMlt+NHsxYYIK451wNI17EjZ5mO
	KknRq0mlCB8H1aAmwkkw+ZGDjxXNnu/nrox1jqm6BP2At+vnUCQ/PPEFrJfIZ1EH
	dwZoUm6eq1fAWno=
Received: from alumni.cs.nctu.edu.tw (alumni.cs.nctu.edu.tw [140.113.235.116])
	by csmailer.cs.nctu.edu.tw (Postfix) with ESMTP id DE86D809;
	Thu,  8 Dec 2011 15:00:54 +0800 (CST)
Received: (from chenwj@localhost)
	by alumni.cs.nctu.edu.tw (8.14.4/8.14.4/Submit) id pB873BVf037901;
	Thu, 8 Dec 2011 15:03:11 +0800 (CST) (envelope-from chenwj)
Date: Thu, 8 Dec 2011 15:03:11 +0800
From: =?utf-8?B?6Zmz6Z+L5Lu7?= <chenwj@iis.sinica.edu.tw>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20111208070311.GA34443@cs.nctu.edu.tw>
References: <1323297106-27312-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1323297106-27312-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 140.113.235.130
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] tcg: Remove redundant
 declarations of TCG_TARGET_REG_BITS
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
X-List-Received-Date: Thu, 08 Dec 2011 07:03:30 -0000

On Wed, Dec 07, 2011 at 11:31:46PM +0100, Stefan Weil wrote:
> TCG_TARGET_REG_BITS is declared in tcg.h for all TCG targets.

  Just want to make sure. When we talk about target in TCG, that _always_=
 means
the host, right?

Regards,
chenwj

--=20
Wei-Ren Chen (=E9=99=B3=E9=9F=8B=E4=BB=BB)
Computer Systems Lab, Institute of Information Science,
Academia Sinica, Taiwan (R.O.C.)
Tel:886-2-2788-3799 #1667
Homepage: http://people.cs.nctu.edu.tw/~chenwj

