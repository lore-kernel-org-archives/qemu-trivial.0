Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YTKLm-0006ab-6Q
	for mharc-qemu-trivial@gnu.org; Wed, 04 Mar 2015 20:13:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40458)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1YTKLj-0006Z4-Ix
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 20:13:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1YTKLg-0002Gg-AU
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 20:13:15 -0500
Received: from mx1.redhat.com ([209.132.183.28]:32835)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>)
	id 1YTKLg-0002Fn-2v; Wed, 04 Mar 2015 20:13:12 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t251D8J4001231
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Wed, 4 Mar 2015 20:13:08 -0500
Received: from localhost (dhcp-14-137.nay.redhat.com [10.66.14.137])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t251D5MZ001428; Wed, 4 Mar 2015 20:13:07 -0500
Date: Thu, 5 Mar 2015 09:13:05 +0800
From: Fam Zheng <famz@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <20150305011305.GA12182@ad.nay.redhat.com>
References: <1425503036-23707-1-git-send-email-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1425503036-23707-1-git-send-email-mjt@msgid.tls.msk.ru>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org,
	"Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] 9pfs-local:
 simplify/optimize local_mapped_attr_path()
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
X-List-Received-Date: Thu, 05 Mar 2015 01:13:16 -0000

On Thu, 03/05 00:03, Michael Tokarev wrote:
> +    const char *name = basename((char*)path);

checkpatch.pl complained this, s/char*/char */


