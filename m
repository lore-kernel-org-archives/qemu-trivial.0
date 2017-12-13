Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eP6wd-00015d-8r
	for mharc-qemu-trivial@gnu.org; Wed, 13 Dec 2017 08:19:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46469)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <darren.kenny@oracle.com>) id 1eP308-0003ok-QC
	for qemu-trivial@nongnu.org; Wed, 13 Dec 2017 04:06:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <darren.kenny@oracle.com>) id 1eP303-0003dT-4z
	for qemu-trivial@nongnu.org; Wed, 13 Dec 2017 04:06:52 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:52268)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <darren.kenny@oracle.com>)
	id 1eP302-0003ch-Tk; Wed, 13 Dec 2017 04:06:47 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
	by aserp2130.oracle.com (8.16.0.21/8.16.0.21) with SMTP id
	vBD91S89140212; Wed, 13 Dec 2017 09:06:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
	h=date : from : to : cc
	: subject : message-id : references : mime-version : content-type :
	content-transfer-encoding : in-reply-to; s=corp-2017-10-26;
	bh=LuhmxrmDAasgmUn4nXBQh82efRHR+CH5LzO1EyuaaAE=;
	b=tSwdK+fbccw5oqd10pljhKc6vOMUYm/NmedekQmY/i6WdvVRFXkTVdSTxbFIMflYEqx4
	0N+XqXUMwoQgDKXh4PPn/PIQoQRza6/dkH8sZyBNJ8LF1ffqU4XICsLD/zPWuoPXD+6L
	gCM0jCcm53Y+swpgJZyEot2y/m1pD0pTHysWwCUUs7RwoFGfExuPUIxer5IIA3sPCpam
	gLBNqV38k0VGHystTnOIj8/NMfWLqBKTN3pSs4NbHRtJnE/5L+XXWNJ93A4xqAG6pCxG
	ARz64GR8mdt9S/Ld/BmKagGNiw+eH+ZHKaNpZkeS6iHnckNtsHAd3yF6evqexAf9Nkus
	cQ== 
Received: from userv0021.oracle.com (userv0021.oracle.com [156.151.31.71])
	by aserp2130.oracle.com with ESMTP id 2eu0ya05k6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 13 Dec 2017 09:06:41 +0000
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
	by userv0021.oracle.com (8.14.4/8.14.4) with ESMTP id vBD96dpK031252
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Wed, 13 Dec 2017 09:06:39 GMT
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
	by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id vBD96YoT026827;
	Wed, 13 Dec 2017 09:06:35 GMT
Received: from starbug-vm.ie.oracle.com (/10.175.171.71)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Wed, 13 Dec 2017 01:06:34 -0800
Date: Wed, 13 Dec 2017 09:06:30 +0000
From: Darren Kenny <darren.kenny@oracle.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: Alistair Francis <alistair.francis@xilinx.com>,
	"Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Eric Blake <eblake@redhat.com>, qemu-trivial@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org
Message-ID: <20171213090630.fht4xlnvqhnxb7wj@starbug-vm.ie.oracle.com>
Mail-Followup-To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	"Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Eric Blake <eblake@redhat.com>, qemu-trivial@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
References: <20171213051736.17755-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20171213051736.17755-1-f4bug@amsat.org>
User-Agent: NeoMutt/20171027
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=8743
	signatures=668646
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
	malwarescore=0
	phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=804
	adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.0.1-1711220000 definitions=main-1712130130
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by aserp2130.oracle.com id
	vBD91S89140212
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 141.146.126.79
X-Mailman-Approved-At: Wed, 13 Dec 2017 08:19:30 -0500
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 0/4] Trivial changes in
 "registerfields.h"
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
X-List-Received-Date: Wed, 13 Dec 2017 09:06:54 -0000

Looks good to me, for all patches:

Reviewed-by: Darren Kenny <darren.kenny@oracle.com>

Thanks,

Darren.

On Wed, Dec 13, 2017 at 02:17:32AM -0300, Philippe Mathieu-Daud=C3=A9 wro=
te:
>Philippe Mathieu-Daud=C3=A9 (4):
>  MAINTAINERS: add "hw/registerfields.h" in Register API entry
>  hw/registerfields: fix a typo in the FIELD() documentation
>  hw/registerfields: add 64-bit extract/deposit macros
>  hw/registerfields: add missing include
>
> include/hw/registerfields.h | 15 ++++++++++++++-
> MAINTAINERS                 |  1 +
> 2 files changed, 15 insertions(+), 1 deletion(-)
>
>--=20
>2.15.1
>
>

