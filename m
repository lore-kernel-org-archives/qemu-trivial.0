Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fSrfy-000134-SR
	for mharc-qemu-trivial@gnu.org; Tue, 12 Jun 2018 18:22:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41503)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdroth@linux.vnet.ibm.com>) id 1fSrfw-00012X-Dd
	for qemu-trivial@nongnu.org; Tue, 12 Jun 2018 18:22:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mdroth@linux.vnet.ibm.com>) id 1fSrft-000127-MG
	for qemu-trivial@nongnu.org; Tue, 12 Jun 2018 18:22:04 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:47354)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mdroth@linux.vnet.ibm.com>)
	id 1fSrft-00010x-Di
	for qemu-trivial@nongnu.org; Tue, 12 Jun 2018 18:22:01 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	w5CMIwJN072707
	for <qemu-trivial@nongnu.org>; Tue, 12 Jun 2018 18:22:00 -0400
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
	by mx0a-001b2d01.pphosted.com with ESMTP id 2jjpca10r7-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <qemu-trivial@nongnu.org>; Tue, 12 Jun 2018 18:22:00 -0400
Received: from localhost
	by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <mdroth@linux.vnet.ibm.com>;
	Tue, 12 Jun 2018 16:21:59 -0600
Received: from b03cxnp07029.gho.boulder.ibm.com (9.17.130.16)
	by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Tue, 12 Jun 2018 16:21:55 -0600
Received: from b03ledav004.gho.boulder.ibm.com
	(b03ledav004.gho.boulder.ibm.com [9.17.130.235])
	by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id w5CMLsNh11141482
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Tue, 12 Jun 2018 15:21:54 -0700
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3D9D97805F;
	Tue, 12 Jun 2018 16:21:54 -0600 (MDT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2B7AF78060;
	Tue, 12 Jun 2018 16:21:54 -0600 (MDT)
Received: from localhost (unknown [9.53.92.156])
	by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
	Tue, 12 Jun 2018 16:21:54 -0600 (MDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To: Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>
From: Michael Roth <mdroth@linux.vnet.ibm.com>
In-Reply-To: <20180515100949.248bc43b.cohuck@redhat.com>
Cc: Olaf Hering <olaf@aepfle.de>, qemu-trivial@nongnu.org,
	"open list:All patches   CC here" <qemu-devel@nongnu.org>,
	qemu-stable@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>
References: <20180515063128.7040-1-olaf@aepfle.de>
	<d17ae62a-03a5-61fa-934a-4cb917d14222@redhat.com>
	<20180515100949.248bc43b.cohuck@redhat.com>
User-Agent: alot/0.6
Date: Tue, 12 Jun 2018 17:21:43 -0500
X-TM-AS-GCONF: 00
x-cbid: 18061222-0036-0000-0000-000009FB1849
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00009178; HX=3.00000241; KW=3.00000007;
	PH=3.00000004; SC=3.00000265; SDB=6.01046072; UDB=6.00535710;
	IPR=6.00825049; 
	MB=3.00021612; MTD=3.00000008; XFM=3.00000015; UTC=2018-06-12 22:21:57
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18061222-0037-0000-0000-000047B695D7
Message-Id: <152884210382.21982.6157008274157617034@sif>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2018-06-12_14:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1805220000 definitions=main-1806120247
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.156.1
Subject: Re: [Qemu-trivial] [Qemu-stable] [Qemu-devel] [PATCH v2] replace
 functions which are only available in glib-2.24
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
X-List-Received-Date: Tue, 12 Jun 2018 22:22:05 -0000

Quoting Cornelia Huck (2018-05-15 03:09:49)
> On Tue, 15 May 2018 09:18:52 +0200
> Thomas Huth <thuth@redhat.com> wrote:
> =

> > On 15.05.2018 08:31, Olaf Hering wrote:
> > > Currently the minimal supported version of glib is 2.22.
> > > Since testing is done with a glib that claims to be 2.22, but in fact
> > > has APIs from newer version of glib, this bug was not caught during
> > > submit of the patch referenced below.
> > > =

> > > Replace g_realloc_n, which is available only since 2.24, with g_renew.
> > > =

> > > Fixes commit 418026ca43 ("util: Introduce vfio helpers")
> > > =

> > > Signed-off-by: Olaf Hering <olaf@aepfle.de>
> > > ---
> > >  This must go into stable-2.12.  =

> > =

> > In that case please CC: qemu-stable@nongnu.org (done now).
> > =

> > Reviewed-by: Thomas Huth <thuth@redhat.com>
> > =

> > >  util/vfio-helpers.c | 6 ++----
> > >  1 file changed, 2 insertions(+), 4 deletions(-)
> > > =

> > > diff --git a/util/vfio-helpers.c b/util/vfio-helpers.c
> > > index 006674c916..1d9272efa4 100644
> > > --- a/util/vfio-helpers.c
> > > +++ b/util/vfio-helpers.c
> > > @@ -522,8 +522,7 @@ static IOVAMapping *qemu_vfio_add_mapping(QEMUVFI=
OState *s,
> > >  =

> > >      assert(index >=3D 0);
> > >      s->nr_mappings++;
> > > -    s->mappings =3D g_realloc_n(s->mappings, sizeof(s->mappings[0]),
> > > -                              s->nr_mappings);
> > > +    s->mappings =3D g_renew(IOVAMapping, s->mappings, s->nr_mappings=
);
> > >      insert =3D &s->mappings[index];
> > >      shift =3D s->nr_mappings - index - 1;
> > >      if (shift) {
> > > @@ -577,8 +576,7 @@ static void qemu_vfio_undo_mapping(QEMUVFIOState =
*s, IOVAMapping *mapping,
> > >      memmove(mapping, &s->mappings[index + 1],
> > >              sizeof(s->mappings[0]) * (s->nr_mappings - index - 1));
> > >      s->nr_mappings--;
> > > -    s->mappings =3D g_realloc_n(s->mappings, sizeof(s->mappings[0]),
> > > -                              s->nr_mappings);
> > > +    s->mappings =3D g_renew(IOVAMapping, s->mappings, s->nr_mappings=
);
> > >  }
> > >  =

> > >  /* Check if the mapping list is (ascending) ordered. */
> > >   =

> =

> This looks fine to me, so
> =

> Reviewed-by: Cornelia Huck <cohuck@redhat.com>
> =

> But this leads to another question: What do we do if we want a fix only
> in stable? Hypothetical scenario: Same parameters as for this patch
> (glib version bump, newer function sneaked in), but the older function
> that could be used in stable is clearly worse (IOW, we don't want it in
> the new version). Do we have a process to get a change only into stable?
> =


I've answered in the form of a patch :)

  "docs: add details regarding submitting stable-specific patches"

but here's a recent example:

  https://lists.gnu.org/archive/html/qemu-devel/2018-05/msg04999.html


