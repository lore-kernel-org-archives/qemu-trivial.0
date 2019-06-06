Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hYidy-0006tH-JW
	for mharc-qemu-trivial@gnu.org; Wed, 05 Jun 2019 23:00:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54590)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hYidv-0006r9-QP
	for qemu-trivial@nongnu.org; Wed, 05 Jun 2019 23:00:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hYidu-00043V-MT
	for qemu-trivial@nongnu.org; Wed, 05 Jun 2019 23:00:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60204)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1hYids-000408-J1; Wed, 05 Jun 2019 23:00:40 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BF5DC3082B5A;
	Thu,  6 Jun 2019 03:00:39 +0000 (UTC)
Received: from localhost (ovpn-116-9.gru2.redhat.com [10.97.116.9])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4FC4468386;
	Thu,  6 Jun 2019 03:00:39 +0000 (UTC)
Date: Thu, 6 Jun 2019 00:00:37 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Like Xu <like.xu@linux.intel.com>
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	Alistair Francis <alistair23@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>
Message-ID: <20190606030037.GS22416@habkost.net>
References: <20190518205428.90532-1-like.xu@linux.intel.com>
	<20190518205428.90532-11-like.xu@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190518205428.90532-11-like.xu@linux.intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Thu, 06 Jun 2019 03:00:39 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3 10/10] vl.c: Replace smp
 global variables with smp machine properties
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
X-List-Received-Date: Thu, 06 Jun 2019 03:00:44 -0000

On Sun, May 19, 2019 at 04:54:28AM +0800, Like Xu wrote:
> The global smp variables in vl.c are completely replaced with machine properties.
> 
> Form this commit, the smp_cpus/smp_cores/smp_threads/max_cpus are deprecated
> and only machine properties within MachineState are fully applied and enabled.
> 
> Signed-off-by: Like Xu <like.xu@linux.intel.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

-- 
Eduardo

