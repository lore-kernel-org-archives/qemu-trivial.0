Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bQNFp-0008GL-Ho
	for mharc-qemu-trivial@gnu.org; Thu, 21 Jul 2016 19:19:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57918)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdroth@linux.vnet.ibm.com>) id 1bQNFn-0008Fa-2B
	for qemu-trivial@nongnu.org; Thu, 21 Jul 2016 19:19:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mdroth@linux.vnet.ibm.com>) id 1bQNFj-0007Ua-0x
	for qemu-trivial@nongnu.org; Thu, 21 Jul 2016 19:19:42 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:64043
	helo=mx0a-001b2d01.pphosted.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdroth@linux.vnet.ibm.com>) id 1bQNFi-0007UH-SQ
	for qemu-trivial@nongnu.org; Thu, 21 Jul 2016 19:19:38 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id
	u6LNJ9iI063102
	for <qemu-trivial@nongnu.org>; Thu, 21 Jul 2016 19:19:36 -0400
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209])
	by mx0b-001b2d01.pphosted.com with ESMTP id 24b7nbgfv4-1
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
	for <qemu-trivial@nongnu.org>; Thu, 21 Jul 2016 19:19:36 -0400
Received: from localhost
	by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <mdroth@linux.vnet.ibm.com>;
	Thu, 21 Jul 2016 19:19:35 -0400
Received: from d01dlp03.pok.ibm.com (9.56.250.168)
	by e19.ny.us.ibm.com (146.89.104.206) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Thu, 21 Jul 2016 19:19:33 -0400
X-IBM-Helo: d01dlp03.pok.ibm.com
X-IBM-MailFrom: mdroth@linux.vnet.ibm.com
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
	[9.57.198.29])
	by d01dlp03.pok.ibm.com (Postfix) with ESMTP id D9179C90041;
	Thu, 21 Jul 2016 19:19:22 -0400 (EDT)
Received: from b01ledav03.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
	[9.57.199.108])
	by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
	u6LNJaH511076052; Thu, 21 Jul 2016 23:19:36 GMT
Received: from b01ledav03.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0902DB2052;
	Thu, 21 Jul 2016 19:19:33 -0400 (EDT)
Received: from localhost (unknown [9.53.92.253])
	by b01ledav03.gho.pok.ibm.com (Postfix) with ESMTP id E222CB2046;
	Thu, 21 Jul 2016 19:19:32 -0400 (EDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
From: Michael Roth <mdroth@linux.vnet.ibm.com>
In-Reply-To: <20160630190415.6192.5429@loki>
Cc: qemu-trivial@nongnu.org
References: <1465572354-3083-1-git-send-email-thuth@redhat.com>
	<20160630190415.6192.5429@loki>
User-Agent: alot/0.3.6
Date: Thu, 21 Jul 2016 18:19:28 -0500
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16072123-0056-0000-0000-000000D9A1BA
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16072123-0057-0000-0000-000004F3C473
Message-Id: <20160721231928.496.84486@loki>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-07-21_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	spamscore=0 suspectscore=0
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1604210000
	definitions=main-1607210252
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.158.5
Subject: Re: [Qemu-trivial] [PATCH] configure: Rename CONFIG_QGA_NTDDDISK
 into CONFIG_QGA_NTDDSCSI
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
X-List-Received-Date: Thu, 21 Jul 2016 23:19:44 -0000

Quoting Michael Roth (2016-06-30 14:04:15)
> Quoting Thomas Huth (2016-06-10 10:25:54)
> > There is no CONFIG_QGA_NTDDDISK define used anywhere in the QEMU
> > sources. Looking at the changelog and qga/commands-win32.c, it
> > seems like this should be called CONFIG_QGA_NTDDSCSI instead.
> > =

> > Signed-off-by: Thomas Huth <thuth@redhat.com>
> =

> Thanks, applied to qga tree:
>   https://github.com/mdroth/qemu/commits/qga
> =

> Although this did indeed uncover a bug in guest-get-fsinfo.
> Should have a fix soon, but will want that in place before
> I send a pull.

So, that fix turned into a fairly heavy rework of how we map
PCI devices to filesystems in the current w32 implementation
of guest-get-fsinfo and I still don't quite have it working.
It probably won't make 2.7 at this point.

Unfortunately, as things stand, enabling the disk info
support on w32 via your patch causes the entire command to
fail, which would be a regression from the current support
level.

So for now I think the most expedient thing to do would be
to hold off on this patch till 2.8, at which point we can
apply it along with the disk info fixes I'm working on.

> =

> > ---
> >  configure | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > =

> > diff --git a/configure b/configure
> > index 8c2f90b..55019d6 100755
> > --- a/configure
> > +++ b/configure
> > @@ -4965,7 +4965,7 @@ if test "$mingw32" =3D "yes" ; then
> >      echo "WIN_SDK=3D\"$win_sdk\"" >> $config_host_mak
> >    fi
> >    if test "$guest_agent_ntddscsi" =3D "yes" ; then
> > -    echo "CONFIG_QGA_NTDDDISK=3Dy" >> $config_host_mak
> > +    echo "CONFIG_QGA_NTDDSCSI=3Dy" >> $config_host_mak
> >    fi
> >    if test "$guest_agent_msi" =3D "yes"; then
> >      echo "QEMU_GA_MSI_ENABLED=3Dyes" >> $config_host_mak  =

> > -- =

> > 1.8.3.1
> > =

> =

>=20


