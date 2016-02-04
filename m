Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aRGzS-0006wX-3G
	for mharc-qemu-trivial@gnu.org; Thu, 04 Feb 2016 05:18:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59252)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gkurz@linux.vnet.ibm.com>) id 1aRGzP-0006qS-99
	for qemu-trivial@nongnu.org; Thu, 04 Feb 2016 05:18:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gkurz@linux.vnet.ibm.com>) id 1aRGzL-0006aY-MR
	for qemu-trivial@nongnu.org; Thu, 04 Feb 2016 05:18:15 -0500
Received: from e06smtp13.uk.ibm.com ([195.75.94.109]:44116)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gkurz@linux.vnet.ibm.com>) id 1aRGzL-0006Zv-D3
	for qemu-trivial@nongnu.org; Thu, 04 Feb 2016 05:18:11 -0500
Received: from localhost
	by e06smtp13.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <gkurz@linux.vnet.ibm.com>;
	Thu, 4 Feb 2016 10:18:09 -0000
Received: from d06dlp01.portsmouth.uk.ibm.com (9.149.20.13)
	by e06smtp13.uk.ibm.com (192.168.101.143) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Thu, 4 Feb 2016 10:18:07 -0000
X-IBM-Helo: d06dlp01.portsmouth.uk.ibm.com
X-IBM-MailFrom: gkurz@linux.vnet.ibm.com
X-IBM-RcptTo: qemu-devel@nongnu.org; qemu-stable@nongnu.org;
	qemu-trivial@nongnu.org
Received: from b06cxnps4074.portsmouth.uk.ibm.com
	(d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by d06dlp01.portsmouth.uk.ibm.com (Postfix) with ESMTP id 68B2217D8059; 
	Thu,  4 Feb 2016 10:18:19 +0000 (GMT)
Received: from d06av10.portsmouth.uk.ibm.com (d06av10.portsmouth.uk.ibm.com
	[9.149.37.251])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id u14AI79F60424256; Thu, 4 Feb 2016 10:18:07 GMT
Received: from d06av10.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av10.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with
	ESMTP id u149I8L2017164; Thu, 4 Feb 2016 02:18:08 -0700
Received: from smtp.lab.toulouse-stg.fr.ibm.com
	(srv01.lab.toulouse-stg.fr.ibm.com [9.101.4.1])
	by d06av10.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with
	ESMTP id u149I8wm017153; Thu, 4 Feb 2016 02:18:08 -0700
Received: from bahia.huguette.org (sig-9-83-78-101.evts.uk.ibm.com
	[9.83.78.101])
	by smtp.lab.toulouse-stg.fr.ibm.com (Postfix) with ESMTP id C95A2220465;
	Thu,  4 Feb 2016 11:18:05 +0100 (CET)
Date: Thu, 4 Feb 2016 11:18:03 +0100
From: Greg Kurz <gkurz@linux.vnet.ibm.com>
To: Amit Shah <amit.shah@redhat.com>
Message-ID: <20160204111803.0ee3ebb0@bahia.huguette.org>
In-Reply-To: <20160204100011.GC20527@grmbl.mre>
References: <20160204092007.31588.66396.stgit@bahia.huguette.org>
	<20160204100011.GC20527@grmbl.mre>
Organization: IBM
X-Mailer: Claws Mail 3.13.1 (GTK+ 2.24.29; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16020410-0013-0000-0000-000008838BFC
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.75.94.109
Cc: qemu-trivial@nongnu.org, qemu-stable@nongnu.org, qemu-devel@nongnu.org,
	Juan Quintela <quintela@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] migration: fix bad string passed to
	error_report()
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
X-List-Received-Date: Thu, 04 Feb 2016 10:18:16 -0000

On Thu, 4 Feb 2016 15:30:11 +0530
Amit Shah <amit.shah@redhat.com> wrote:

> On (Thu) 04 Feb 2016 [10:20:07], Greg Kurz wrote:
> > state->name does not contain a terminating '\0' and you may get:
> >=20
> > Machine type received is 'pseries-2.3y=EF=BF=BD?' and local is 'pseries=
-2.4'
> > load of migration failed: Invalid argument
> >=20
> > Let's add a precision modifier to fix this.
> >=20
> > Signed-off-by: Greg Kurz <gkurz@linux.vnet.ibm.com> =20
>=20
> Reviewed-by: Amit Shah <amit.shah@redhat.com>
>=20
> 		Amit
>=20

I forgot to mention that this patch fixes:

61964c23e5ddd5a33f15699e45ce126f879e3e33 "migration: Add configuration sect=
ion"

Cc'ing stable since this is a 2.4.0 commit and it may *theorically* lead to
a crash (even if that is very unlikely to occur).

Also Cc'ing trivial.

Thanks !

--
Greg


