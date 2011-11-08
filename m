Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RNmlW-0002Y2-VN
	for mharc-qemu-trivial@gnu.org; Tue, 08 Nov 2011 09:35:06 -0500
Received: from eggs.gnu.org ([140.186.70.92]:34828)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1RNmlT-0002NX-Rz
	for qemu-trivial@nongnu.org; Tue, 08 Nov 2011 09:35:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1RNmlN-00069b-Us
	for qemu-trivial@nongnu.org; Tue, 08 Nov 2011 09:35:03 -0500
Received: from csmailer.cs.nctu.edu.tw ([140.113.235.130]:19758)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>)
	id 1RNmlC-00061f-Qo; Tue, 08 Nov 2011 09:34:47 -0500
Received: from csmailer.cs.nctu.edu.tw (localhost [127.0.0.1])
	by csmailer.cs.nctu.edu.tw (Postfix) with ESMTP id 60233CCD;
	Tue,  8 Nov 2011 22:32:47 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=cs.nctu.edu.tw; h=date
	:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to:content-transfer-encoding; s=rsa1024;
	bh=sbP5mG6NLVXoh8AIQBqNLR/1sPk=; b=iaCudAHfqhNHBWYtgYGvqUgJlgDj
	FacRD1KZQZjGEyMV9o1qroicJL5nKth+P6q+JLJSTMdrLqgtoZHWwypneiqOZ9JC
	74GhiAw0y6sHxOGxMe6A9G8soRhDBiCaXC7mYjBCTU8cG2Rc3brE7ex53LpuaR4M
	VKVQj9bTYhX6ksY=
Received: from alumni.cs.nctu.edu.tw (alumni.cs.nctu.edu.tw [140.113.235.116])
	by csmailer.cs.nctu.edu.tw (Postfix) with ESMTP id 5B940CCC;
	Tue,  8 Nov 2011 22:32:47 +0800 (CST)
Received: (from chenwj@localhost)
	by alumni.cs.nctu.edu.tw (8.14.4/8.14.4/Submit) id pA8EYZ1B052303;
	Tue, 8 Nov 2011 22:34:35 +0800 (CST) (envelope-from chenwj)
Date: Tue, 8 Nov 2011 22:34:35 +0800
From: =?utf-8?B?6Zmz6Z+L5Lu7?= <chenwj@iis.sinica.edu.tw>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20111108143435.GA51305@cs.nctu.edu.tw>
References: <1320756321-8059-1-git-send-email-armbru@redhat.com>
	<CAJSP0QXBVX-Tmg9+nJbCo6vVGarDgaPOe7rtR7Z0WVwD+np0_g@mail.gmail.com>
	<m3bosmu1wd.fsf@blackfin.pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <m3bosmu1wd.fsf@blackfin.pond.sub.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 140.113.235.130
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] ui/vnc: Convert
 sasl.mechlist to g_malloc() & friends
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
X-List-Received-Date: Tue, 08 Nov 2011 14:35:05 -0000

> Stefan Hajnoczi <stefanha@gmail.com> writes:
>=20
> > On Tue, Nov 8, 2011 at 12:45 PM, Markus Armbruster <armbru@redhat.com=
> wrote:
> >> Fixes protocol_client_auth_sasl_mechname() not to crash when malloc(=
)
> >> fails. =C2=A0Spotted by Coverity.
> >> ---
> >> =C2=A0ui/vnc-auth-sasl.c | =C2=A0 19 +++++--------------
> >> =C2=A01 files changed, 5 insertions(+), 14 deletions(-)
> >
> > Looks good, please add Signed-off-by.
>=20
> Gaa, too trivial to get it right in less than three tries!  There must =
a
> curse of brainlessness on this one...

  `git-format-patch -s` will generate the sign-off-by.

Regards,
chenwj

--=20
Wei-Ren Chen (=E9=99=B3=E9=9F=8B=E4=BB=BB)
Computer Systems Lab, Institute of Information Science,
Academia Sinica, Taiwan (R.O.C.)
Tel:886-2-2788-3799 #1667

