Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XTWMX-0006Nf-Hd
	for mharc-qemu-trivial@gnu.org; Mon, 15 Sep 2014 09:30:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57031)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1XTWMC-0006M6-4l
	for qemu-trivial@nongnu.org; Mon, 15 Sep 2014 09:30:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1XTWLz-0001fa-MO
	for qemu-trivial@nongnu.org; Mon, 15 Sep 2014 09:30:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34552)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1XTWLz-0001dx-Fq; Mon, 15 Sep 2014 09:30:03 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s8FDTgvn014010
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Mon, 15 Sep 2014 09:29:42 -0400
Received: from [10.36.116.48] (ovpn-116-48.ams2.redhat.com [10.36.116.48])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s8FDTcUM008266; Mon, 15 Sep 2014 09:29:39 -0400
Message-ID: <1410787775.30598.11.camel@nilsson.home.kraxel.org>
From: Gerd Hoffmann <kraxel@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Date: Mon, 15 Sep 2014 15:29:35 +0200
In-Reply-To: <5416E22B.9060002@msgid.tls.msk.ru>
References: <1410261588-8360-1-git-send-email-john.liuli@huawei.com>
	<5416E094.9070500@msgid.tls.msk.ru> <5416E22B.9060002@msgid.tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx1.redhat.com id
	s8FDTgvn014010
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, "john.liuli" <john.liuli@huawei.com>,
	peter.huangpeng@huawei.com, armbru@redhat.com, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH v2] qemu-char: fix terminal crash when
 using "-monitor stdio -nographic"
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
X-List-Received-Date: Mon, 15 Sep 2014 13:30:35 -0000

On Mo, 2014-09-15 at 16:57 +0400, Michael Tokarev wrote:
> 15.09.2014 16:50, Michael Tokarev =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > 09.09.2014 15:19, john.liuli wrote:
> >> From: Li Liu <john.liuli@huawei.com>
> >>
> >> Eeay to reproduce, just try "qemu -monitor stdio -nographic"
> >> and type "quit", then the terminal will be crashed.
> >>
> >> There are two pathes try to call tcgetattr of stdio in vl.c:
> >=20
> > This looks reasonable.  Except of one thing -- how about renaming
> > stdio_is_ready to stdio_in_use?  (I can do that when applying, no
> > need to resend anythnig).  Because, well, stdio_is_ready is not
> > obvious at all, at least to me... :)
>=20
> And oh, the commit comment -- it is not 'terminal crash', it is
> 'terminal misbehavor' or something like that.  Terminal does not
> crash, it just does not have proper settings after qemu exits.

For the record:  The 'reset' utility does a full terminal reset and
restores sane settings.  So usually you can recover from any terminal
f*ckup like this by first hitting Ctrl-C [1], then type "reset" [2],
then hit Enter.

HTH,
  Gerd

[1] To cancel anything which might be at your shell prompt.
[2] Possibly blindly in case echo happens to be turned off.


