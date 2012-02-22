Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S01cu-0001Qv-IM
	for mharc-qemu-trivial@gnu.org; Tue, 21 Feb 2012 21:08:16 -0500
Received: from eggs.gnu.org ([140.186.70.92]:34706)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1S01cq-0001PO-Ns
	for qemu-trivial@nongnu.org; Tue, 21 Feb 2012 21:08:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1S01cp-000588-8w
	for qemu-trivial@nongnu.org; Tue, 21 Feb 2012 21:08:12 -0500
Received: from csmailer.cs.nctu.edu.tw ([140.113.235.130]:26218)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>)
	id 1S01cm-00057Z-Qv; Tue, 21 Feb 2012 21:08:09 -0500
Received: from csmailer.cs.nctu.edu.tw (localhost [127.0.0.1])
	by csmailer.cs.nctu.edu.tw (Postfix) with ESMTP id 76FEDC72;
	Wed, 22 Feb 2012 10:13:31 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=cs.nctu.edu.tw; h=date
	:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to:content-transfer-encoding; s=rsa1024;
	bh=Znvz+cESNm+WJE/I50VscOtCyiE=; b=kPscKftgfrfB316Dtmdb1bTcJJRQ
	hUEnAy6wePUCPPKjHULC4pQc9mRwAa9IURqsujbSxEGSD+cg/UiFbSkI6Ul6dRxc
	N3S4IxPfKuabYOmcGA/s/ka0k+afFFejFZ4L2p/3lLAUluKZ0lOa4Y8L6QC/7Kvg
	6NM5sMUXkUqp4lY=
Received: from alumni.cs.nctu.edu.tw (alumni.cs.nctu.edu.tw [140.113.235.116])
	by csmailer.cs.nctu.edu.tw (Postfix) with ESMTP id 7219FC71;
	Wed, 22 Feb 2012 10:13:31 +0800 (CST)
Received: (from chenwj@localhost)
	by alumni.cs.nctu.edu.tw (8.14.4/8.14.4/Submit) id q1M2874V011042;
	Wed, 22 Feb 2012 10:08:07 +0800 (CST) (envelope-from chenwj)
Date: Wed, 22 Feb 2012 10:08:07 +0800
From: =?utf-8?B?6Zmz6Z+L5Lu7?= <chenwj@iis.sinica.edu.tw>
To: Stefan Hajnoczi <stefanha@gmail.com>
Message-ID: <20120222020807.GA10573@cs.nctu.edu.tw>
References: <20120221101239.GA95445@cs.nctu.edu.tw>
	<CAJSP0QXhexX4wZUMjGb3mS6u7Rvfi4-ePmQeg=9g0-ZgTSmPsA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAJSP0QXhexX4wZUMjGb3mS6u7Rvfi4-ePmQeg=9g0-ZgTSmPsA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 140.113.235.130
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	=?utf-8?B?6Zmz6Z+L5Lu7?= <chenwj@iis.sinica.edu.tw>
Subject: Re: [Qemu-trivial] [PATCH] Fix dependency issue introduced by
 commit 7b93fadf3a38d1ed65ea5536a52efc2772c6e3b8
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
X-List-Received-Date: Wed, 22 Feb 2012 02:08:14 -0000

On Tue, Feb 21, 2012 at 12:27:26PM +0000, Stefan Hajnoczi wrote:
> On Tue, Feb 21, 2012 at 10:12 AM, =E9=99=B3=E9=9F=8B=E4=BB=BB <chenwj@i=
is.sinica.edu.tw> wrote:
> > =C2=A0Commit 7b93fadf3a38d1ed65ea5536a52efc2772c6e3b8 adds basic vers=
ion of bridge
> > helper, but introduces dependency issue at the same time. While build=
ing target
> > xxx-linux-user, qemu-bridge-helper.c needs config-host.h which is not=
 generated
> > at the moment. Building recurse-all target first fixes the problem.
>=20
> The build system should not rely on ordering side-effects.  Instead,
> please explicitly declare the dependency for the helper or see if the
> dependency can be eliminated if it is inappropriate.

  O.K., since the dependency cannot be eliminated, I'll explicitly declar=
e the
dependency for the helper.

Regards,
chenwj

--=20
Wei-Ren Chen (=E9=99=B3=E9=9F=8B=E4=BB=BB)
Computer Systems Lab, Institute of Information Science,
Academia Sinica, Taiwan (R.O.C.)
Tel:886-2-2788-3799 #1667
Homepage: http://people.cs.nctu.edu.tw/~chenwj

