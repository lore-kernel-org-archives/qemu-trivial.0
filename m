Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ekGLh-0001vS-QW
	for mharc-qemu-trivial@gnu.org; Fri, 09 Feb 2018 16:36:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51971)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <joserz@linux.vnet.ibm.com>) id 1ekGLe-0001tr-Bs
	for qemu-trivial@nongnu.org; Fri, 09 Feb 2018 16:36:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <joserz@linux.vnet.ibm.com>) id 1ekGLb-0000qH-77
	for qemu-trivial@nongnu.org; Fri, 09 Feb 2018 16:36:46 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:40430
	helo=mx0a-001b2d01.pphosted.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <joserz@linux.vnet.ibm.com>)
	id 1ekGLb-0000po-0Y
	for qemu-trivial@nongnu.org; Fri, 09 Feb 2018 16:36:43 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	w19LY6Gx045056
	for <qemu-trivial@nongnu.org>; Fri, 9 Feb 2018 16:36:41 -0500
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203])
	by mx0a-001b2d01.pphosted.com with ESMTP id 2g1fqx94du-1
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
	for <qemu-trivial@nongnu.org>; Fri, 09 Feb 2018 16:36:40 -0500
Received: from localhost
	by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <joserz@linux.vnet.ibm.com>;
	Fri, 9 Feb 2018 16:36:40 -0500
Received: from b01cxnp23034.gho.pok.ibm.com (9.57.198.29)
	by e13.ny.us.ibm.com (146.89.104.200) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Fri, 9 Feb 2018 16:36:39 -0500
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
	[9.57.199.109])
	by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
	w19LaciS47710260; Fri, 9 Feb 2018 21:36:38 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 15FC0112040;
	Fri,  9 Feb 2018 16:34:41 -0500 (EST)
Received: from pacoca (unknown [9.80.226.196])
	by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTPS id 886BA112034;
	Fri,  9 Feb 2018 16:34:39 -0500 (EST)
Date: Fri, 9 Feb 2018 19:36:31 -0200
From: joserz@linux.vnet.ibm.com
To: Eric Blake <eblake@redhat.com>
Cc: Yasmin Beatriz <yasmins@linux.vnet.ibm.com>, qemu-devel@nongnu.org,
	=?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
	qemu-trivial@nongnu.org
References: <20180209202621.97852-1-yasmins@linux.vnet.ibm.com>
	<baf09d46-934f-1f82-1f68-21ae22ffd2f9@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <baf09d46-934f-1f82-1f68-21ae22ffd2f9@redhat.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-TM-AS-GCONF: 00
x-cbid: 18020921-0008-0000-0000-000002CF5FEA
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008506; HX=3.00000241; KW=3.00000007;
	PH=3.00000004; SC=3.00000251; SDB=6.00987373; UDB=6.00501170;
	IPR=6.00766730; 
	BA=6.00005821; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009;
	ZB=6.00000000; 
	ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00019468;
	XFM=3.00000015; UTC=2018-02-09 21:36:40
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18020921-0009-0000-0000-00003834D8FC
Message-Id: <20180209213631.GA23661@pacoca>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2018-02-09_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
	classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
	definitions=main-1802090273
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.158.5
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] dump: Show custom
 message for ENOSPC
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
X-List-Received-Date: Fri, 09 Feb 2018 21:36:47 -0000

On Fri, Feb 09, 2018 at 02:57:33PM -0600, Eric Blake wrote:
> On 02/09/2018 02:26 PM, Yasmin Beatriz wrote:
> > This patch intends to make a more specific message for when
> > the system has not enough space to save guest memory.
> > 
> > Reported-by: yilzhang@redhat.com
> > Cc: Jose Ricardo Ziviani <joserz@linux.vnet.ibm.com>
> > Signed-off-by: Yasmin Beatriz <yasmins@linux.vnet.ibm.com>
> > ---
> 
> > @@ -364,7 +364,11 @@ static void write_data(DumpState *s, void *buf, int length, Error **errp)
> >       ret = fd_write_vmcore(buf, length, s);
> >       if (ret < 0) {
> > -        error_setg(errp, "dump: failed to save memory");
> > +        if (ret == -ENOSPC) {
> > +            error_setg(errp, "dump: not enough space to save memory");
> > +        } else {
> > +            error_setg(errp, "dump: failed to save memory");
> > +        }
> 
> Why is this caller the only one in the file that gets distinguished error
> messages?  And why not use error_setg_errno() instead of open-coding just
> one special errno value?  If you're changing the return value of
> fd_write_vmcore() anyways, I'd suggest that ALL callers in the file be
> updated to use error_setg_errno().

Hello Eric, thanks for reviewing it! :)

Yes, only this part has this distiguished error handling because
the whole big amount of data is managed in here, as far as we can tell
it.

It's triggered when you have one of those huge memory guests that
crashes and want to dump its memory into a host that can't offer all
these requirements. AFAIK, other callers doesn't handle so much data,
so we decided to handle only in this part to be the less intrusive
possible.

Your suggestions will be applied then!

> 
> -- 
> Eric Blake, Principal Software Engineer
> Red Hat, Inc.           +1-919-301-3266
> Virtualization:  qemu.org | libvirt.org
> 


