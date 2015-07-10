Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZDXpD-00049b-Ry
	for mharc-qemu-trivial@gnu.org; Fri, 10 Jul 2015 08:54:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47479)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1ZDXpA-00047L-QE
	for qemu-trivial@nongnu.org; Fri, 10 Jul 2015 08:54:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1ZDXpA-0001Sk-1v
	for qemu-trivial@nongnu.org; Fri, 10 Jul 2015 08:54:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37430)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1ZDXp2-0001GU-2L; Fri, 10 Jul 2015 08:54:32 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id 843BE388B85;
	Fri, 10 Jul 2015 12:54:30 +0000 (UTC)
Received: from [10.36.112.60] (ovpn-112-60.ams2.redhat.com [10.36.112.60])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t6ACsQJX027875
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 10 Jul 2015 08:54:29 -0400
To: arei.gonglei@huawei.com, qemu-devel@nongnu.org
References: <1436489490-236-1-git-send-email-arei.gonglei@huawei.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <559FC082.9010605@redhat.com>
Date: Fri, 10 Jul 2015 14:54:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.0.1
MIME-Version: 1.0
In-Reply-To: <1436489490-236-1-git-send-email-arei.gonglei@huawei.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 0/4] fix memory leak
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
X-List-Received-Date: Fri, 10 Jul 2015 12:54:41 -0000



On 10/07/2015 02:51, arei.gonglei@huawei.com wrote:
> From: Gonglei <arei.gonglei@huawei.com>
> 
> Spotted by Coverity.
> 
> Gonglei (4):
>   cpu: fix memory leak
>   ppc/spapr_drc: fix memory leak
>   arm/xlnx-zynqmp: fix memory leak
>   vl.c: fix memory leak
> 
>  hw/arm/xlnx-zynqmp.c | 4 ++--
>  hw/ppc/spapr_drc.c   | 1 +
>  target-i386/cpu.c    | 2 +-
>  vl.c                 | 5 ++++-
>  4 files changed, 8 insertions(+), 4 deletions(-)
> 

Eduardo posted a patch for 1, too.

Paolo

