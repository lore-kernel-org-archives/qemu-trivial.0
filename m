Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bIhGH-0003zj-LP
	for mharc-qemu-trivial@gnu.org; Thu, 30 Jun 2016 15:04:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53517)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdroth@linux.vnet.ibm.com>) id 1bIhGF-0003xH-DF
	for qemu-trivial@nongnu.org; Thu, 30 Jun 2016 15:04:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mdroth@linux.vnet.ibm.com>) id 1bIhGB-0008Ti-6y
	for qemu-trivial@nongnu.org; Thu, 30 Jun 2016 15:04:26 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:16803)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdroth@linux.vnet.ibm.com>) id 1bIhGA-0008TZ-Tn
	for qemu-trivial@nongnu.org; Thu, 30 Jun 2016 15:04:23 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id
	u5UJ3bEt080427
	for <qemu-trivial@nongnu.org>; Thu, 30 Jun 2016 15:04:22 -0400
Received: from e37.co.us.ibm.com (e37.co.us.ibm.com [32.97.110.158])
	by mx0a-001b2d01.pphosted.com with ESMTP id 23v09r39ga-1
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
	for <qemu-trivial@nongnu.org>; Thu, 30 Jun 2016 15:04:22 -0400
Received: from localhost
	by e37.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <mdroth@linux.vnet.ibm.com>;
	Thu, 30 Jun 2016 13:04:21 -0600
Received: from d03dlp01.boulder.ibm.com (9.17.202.177)
	by e37.co.us.ibm.com (192.168.1.137) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Thu, 30 Jun 2016 13:04:18 -0600
X-IBM-Helo: d03dlp01.boulder.ibm.com
X-IBM-MailFrom: mdroth@linux.vnet.ibm.com
Received: from b03cxnp08026.gho.boulder.ibm.com
	(b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
	by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id 5FFB21FF005A;
	Thu, 30 Jun 2016 13:04:01 -0600 (MDT)
Received: from b03ledav002.gho.boulder.ibm.com
	(b03ledav002.gho.boulder.ibm.com [9.17.130.233])
	by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id u5UJ4Hr441615424; Thu, 30 Jun 2016 12:04:17 -0700
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AF437136040;
	Thu, 30 Jun 2016 13:04:17 -0600 (MDT)
Received: from localhost (unknown [9.53.92.253])
	by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP id 99741136043; 
	Thu, 30 Jun 2016 13:04:17 -0600 (MDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
From: Michael Roth <mdroth@linux.vnet.ibm.com>
In-Reply-To: <1465572354-3083-1-git-send-email-thuth@redhat.com>
Cc: qemu-trivial@nongnu.org
References: <1465572354-3083-1-git-send-email-thuth@redhat.com>
User-Agent: alot/0.3.6
Date: Thu, 30 Jun 2016 14:04:15 -0500
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16063019-0024-0000-0000-00001403631E
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16063019-0025-0000-0000-0000424C3C6C
Message-Id: <20160630190415.6192.5429@loki>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-06-30_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	spamscore=0 suspectscore=0
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1604210000
	definitions=main-1606300179
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.156.1
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
X-List-Received-Date: Thu, 30 Jun 2016 19:04:28 -0000

Quoting Thomas Huth (2016-06-10 10:25:54)
> There is no CONFIG_QGA_NTDDDISK define used anywhere in the QEMU
> sources. Looking at the changelog and qga/commands-win32.c, it
> seems like this should be called CONFIG_QGA_NTDDSCSI instead.
> =

> Signed-off-by: Thomas Huth <thuth@redhat.com>

Thanks, applied to qga tree:
  https://github.com/mdroth/qemu/commits/qga

Although this did indeed uncover a bug in guest-get-fsinfo.
Should have a fix soon, but will want that in place before
I send a pull.

> ---
>  configure | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/configure b/configure
> index 8c2f90b..55019d6 100755
> --- a/configure
> +++ b/configure
> @@ -4965,7 +4965,7 @@ if test "$mingw32" =3D "yes" ; then
>      echo "WIN_SDK=3D\"$win_sdk\"" >> $config_host_mak
>    fi
>    if test "$guest_agent_ntddscsi" =3D "yes" ; then
> -    echo "CONFIG_QGA_NTDDDISK=3Dy" >> $config_host_mak
> +    echo "CONFIG_QGA_NTDDSCSI=3Dy" >> $config_host_mak
>    fi
>    if test "$guest_agent_msi" =3D "yes"; then
>      echo "QEMU_GA_MSI_ENABLED=3Dyes" >> $config_host_mak  =

> -- =

> 1.8.3.1
>=20


