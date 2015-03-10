Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YVDSP-0005sL-A8
	for mharc-qemu-trivial@gnu.org; Tue, 10 Mar 2015 02:15:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51970)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YVDSM-0005lt-QC
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 02:15:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YVDSL-0003AW-PR
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 02:15:54 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:33406)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YVDSG-00038b-KM; Tue, 10 Mar 2015 02:15:48 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id B044341302;
	Tue, 10 Mar 2015 09:15:47 +0300 (MSK)
Message-ID: <54FE8C13.5000201@msgid.tls.msk.ru>
Date: Tue, 10 Mar 2015 09:15:47 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.4.0
MIME-Version: 1.0
To: Fam Zheng <famz@redhat.com>
References: <1425503036-23707-1-git-send-email-mjt@msgid.tls.msk.ru>
	<20150305011305.GA12182@ad.nay.redhat.com>
In-Reply-To: <20150305011305.GA12182@ad.nay.redhat.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org,
	"Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] 9pfs-local: simplify/optimize
	local_mapped_attr_path()
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
X-List-Received-Date: Tue, 10 Mar 2015 06:15:56 -0000

05.03.2015 04:13, Fam Zheng wrote:
> On Thu, 03/05 00:03, Michael Tokarev wrote:
>> +    const char *name = basename((char*)path);
> 
> checkpatch.pl complained this, s/char*/char */

I've fixed it in git.  Thank you for spotting this.

/mjt


