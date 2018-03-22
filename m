Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eywl7-0008Js-4O
	for mharc-qemu-trivial@gnu.org; Thu, 22 Mar 2018 05:43:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37263)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <yuval.shaia@oracle.com>) id 1eywl4-0008Jb-6x
	for qemu-trivial@nongnu.org; Thu, 22 Mar 2018 05:43:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <yuval.shaia@oracle.com>) id 1eywl1-0002yk-2o
	for qemu-trivial@nongnu.org; Thu, 22 Mar 2018 05:43:42 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:39012)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <yuval.shaia@oracle.com>)
	id 1eywl0-0002xk-Nc; Thu, 22 Mar 2018 05:43:38 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
	by userp2120.oracle.com (8.16.0.22/8.16.0.22) with SMTP id
	w2M9ghPM164513; Thu, 22 Mar 2018 09:43:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
	h=date : from : to : cc
	: subject : message-id : references : mime-version : content-type :
	content-transfer-encoding : in-reply-to; s=corp-2017-10-26;
	bh=8GygfNpauFS/+3QESd9uWUuZmBLH0MVwjJY4Vp3TSk4=;
	b=VVJj5xh+JLB+4LPph4tWhAgdsRDsrvYt1cFzdNM2JsOYqT42wan2qGQGyZJwJZ09TxEt
	sFndnrbWQ40lRJpYjIwAdFnDrmWviWe/Iz0oMow/qgc6tXiWlHfiDoqKK+FsM6Zu7SkV
	TGVy4/Iq0ZQwt+9J2nrMsYp7Dd0TjA+CYm42roeK7aH3l3py4qaQrifzFTpmiFCxV8Wi
	5DNJiqo0baH0dovMLzND2Fvw9WlSuFeJGfz9cYt8IsjjW7E2yUdMiK9HprmN7SbRoKzb
	Sm/ESnWmVQbGukxmjhLPeOkJ1xLiMa4nlFuJ5pKy5YucKv9mLKXzFk/4MYw/i1jBtvJQ
	hw== 
Received: from userv0022.oracle.com (userv0022.oracle.com [156.151.31.74])
	by userp2120.oracle.com with ESMTP id 2gva3hg046-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 22 Mar 2018 09:43:35 +0000
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
	by userv0022.oracle.com (8.14.4/8.14.4) with ESMTP id w2M9hYTN003236
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Thu, 22 Mar 2018 09:43:34 GMT
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
	by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id w2M9hYkI003819;
	Thu, 22 Mar 2018 09:43:34 GMT
Received: from yuvallap (/77.138.186.148)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Thu, 22 Mar 2018 02:43:33 -0700
Date: Thu, 22 Mar 2018 11:43:28 +0200
From: Yuval Shaia <yuval.shaia@oracle.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Cc: marcel@redhat.com, eblake@redhat.com, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org, yuval.shaia@oracle.com
Message-ID: <20180322094327.GB2577@yuvallap>
References: <20180321211056.3339-1-yuval.shaia@oracle.com>
	<20180321211056.3339-4-yuval.shaia@oracle.com>
	<5b55758d-124b-b569-8000-421cc2e880f7@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <5b55758d-124b-b569-8000-421cc2e880f7@amsat.org>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=8839
	signatures=668695
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
	malwarescore=0
	phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=673
	adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.0.1-1711220000 definitions=main-1803200127
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by userp2120.oracle.com id
	w2M9ghPM164513
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 156.151.31.85
Subject: Re: [Qemu-trivial] [PATCH 3/3] hw/rdma: Fix 32-bit compilation
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
X-List-Received-Date: Thu, 22 Mar 2018 09:43:43 -0000

> >=20
>=20
> So many pr_err/pr_dbg() changes, you could have take the opportunity to
> replace with updated error reporting API and tracepoint.

Let's leave something for next time :)

>=20
> With %zu:
> Reviewed-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>

Thanks.

