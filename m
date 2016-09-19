Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1blvs3-0007pw-98
	for mharc-qemu-trivial@gnu.org; Mon, 19 Sep 2016 06:32:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55026)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cornelia.huck@de.ibm.com>) id 1blvs0-0007pP-Ot
	for qemu-trivial@nongnu.org; Mon, 19 Sep 2016 06:32:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cornelia.huck@de.ibm.com>) id 1blvrv-00050c-M3
	for qemu-trivial@nongnu.org; Mon, 19 Sep 2016 06:32:15 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:60776)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cornelia.huck@de.ibm.com>) id 1blvrv-0004zx-Eu
	for qemu-trivial@nongnu.org; Mon, 19 Sep 2016 06:32:11 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
	u8JATG0W087576
	for <qemu-trivial@nongnu.org>; Mon, 19 Sep 2016 06:32:09 -0400
Received: from e06smtp12.uk.ibm.com (e06smtp12.uk.ibm.com [195.75.94.108])
	by mx0a-001b2d01.pphosted.com with ESMTP id 25jam9askm-1
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
	for <qemu-trivial@nongnu.org>; Mon, 19 Sep 2016 06:32:09 -0400
Received: from localhost
	by e06smtp12.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <cornelia.huck@de.ibm.com>;
	Mon, 19 Sep 2016 11:32:07 +0100
Received: from d06dlp03.portsmouth.uk.ibm.com (9.149.20.15)
	by e06smtp12.uk.ibm.com (192.168.101.142) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Mon, 19 Sep 2016 11:32:04 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com
	(d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by d06dlp03.portsmouth.uk.ibm.com (Postfix) with ESMTP id EDD151B0806E; 
	Mon, 19 Sep 2016 11:33:54 +0100 (BST)
Received: from d06av09.portsmouth.uk.ibm.com (d06av09.portsmouth.uk.ibm.com
	[9.149.37.250])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id u8JAW4MM12255646; Mon, 19 Sep 2016 10:32:04 GMT
Received: from d06av09.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av09.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with
	ESMTP id u8JAW3XG002300; Mon, 19 Sep 2016 04:32:04 -0600
Received: from gondolin (dyn-9-152-224-137.boeblingen.de.ibm.com
	[9.152.224.137])
	by d06av09.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with
	ESMTP id u8JAW3ms002272; Mon, 19 Sep 2016 04:32:03 -0600
Date: Mon, 19 Sep 2016 12:32:00 +0200
From: Cornelia Huck <cornelia.huck@de.ibm.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: "Daniel P. Berrange" <berrange@redhat.com>, Laurent Vivier
	<lvivier@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>, QEMU
	Developers <qemu-devel@nongnu.org>
In-Reply-To: <CAFEAcA-syR4mDW9JRD6NcJkeQd0Ue9ymf3CKcF6W1Shi-1VZmA@mail.gmail.com>
References: <1474034177-17663-1-git-send-email-lvivier@redhat.com>
	<CAFEAcA9kTe0geCwguRbRSn8ozhnfarz4eTd5+Ra5kTZeR-fJkA@mail.gmail.com>
	<20160916153951.GE9654@redhat.com>
	<CAFEAcA-syR4mDW9JRD6NcJkeQd0Ue9ymf3CKcF6W1Shi-1VZmA@mail.gmail.com>
Organization: IBM Deutschland Research & Development GmbH Vorsitzende des
	Aufsichtsrats: Martina Koederitz
	=?UTF-8?B?R2VzY2jDpGZ0c2bDvGhydW5nOg==?=
	Dirk Wittkopp Sitz der Gesellschaft: =?UTF-8?B?QsO2Ymxpbmdlbg==?=
	Registergericht: Amtsgericht Stuttgart, HRB 243294
X-Mailer: Claws Mail 3.11.1 (GTK+ 2.24.23; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16091910-0008-0000-0000-000002CDA56C
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16091910-0009-0000-0000-00001A025E0A
Message-Id: <20160919123200.7bfecc1f.cornelia.huck@de.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-09-19_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	spamscore=0 suspectscore=0
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1609020000
	definitions=main-1609190147
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.156.1
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 00/26] trivial: use
 exit(EXIT_SUCCESS) and exit(EXIT_FAILURE)
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
X-List-Received-Date: Mon, 19 Sep 2016 10:32:18 -0000

On Fri, 16 Sep 2016 16:45:06 +0100
Peter Maydell <peter.maydell@linaro.org> wrote:

> On 16 September 2016 at 16:39, Daniel P. Berrange <berrange@redhat.com> wrote:
> > On Fri, Sep 16, 2016 at 03:47:37PM +0100, Peter Maydell wrote:
> >> On 16 September 2016 at 14:55, Laurent Vivier <lvivier@redhat.com> wrote:
> >> > This series is the result of coccinelle patch
> >> > scripts/coccinelle/exit.cocci
> >> > provided by the first patch of the series.
> >> >
> >> > It replaces exit(0) by exit(EXIT_SUCCESS)
> >> > and exit(1) by exit(EXIT_FAILURE).
> >> >
> >> > All other exit() are not modified as we don't want
> >> > to change the behavior.
> >> >
> >> > In some cases, I've added manually a line break to comply
> >> > with the maximum line length.
> >>
> >> >  182 files changed, 734 insertions(+), 715 deletions(-)
> >>
> >> You don't say why this is a useful change to make, and it's an
> >> awful lot of churn for a stylistic issue...
> >
> > Currently QEMU uses a mix of at least
> >
> >   exit(EXIT_SUCCESS)
> >   exit(EXIT_FAILURE)
> >   exit(1)
> >   exit(-1)
> >   _exit(1)
> >   _exit(0);
> >
> > so this series has the potential giving us more consistency style
> > and behaviour, across our code. By not fixing the up the usage of -1,
> > or fixing the _exit() usage, the series feels incomplete to me though.
> 
> -1 is just a bug which we should fix (as Eric says). I don't
> see the point in converting all our 0s and 1s to EXIT_SUCCESS
> and EXIT_FAILURE though. (It would be less churn to convert the
> uses of EXIT_* to 0 and 1...)

Agreed.

If we want to make our exit handling more consistent, the first step
would be to examine whether doing an exit() is the right thing to do in
that code path at all. I'm currently aware at least of some exit()s in
the virtio code that need to be converted to real error handling, and
I'd not be surprised if similar things were true for other parts of the
code.


