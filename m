Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hYibI-0004s6-F1
	for mharc-qemu-trivial@gnu.org; Wed, 05 Jun 2019 22:58:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53863)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hYibG-0004pr-0c
	for qemu-trivial@nongnu.org; Wed, 05 Jun 2019 22:57:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hYibF-0005lN-7Q
	for qemu-trivial@nongnu.org; Wed, 05 Jun 2019 22:57:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59660)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1hYib6-0005SS-R8; Wed, 05 Jun 2019 22:57:49 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A21AD3082B44;
	Thu,  6 Jun 2019 02:57:44 +0000 (UTC)
Received: from localhost (ovpn-116-9.gru2.redhat.com [10.97.116.9])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 31948104B4EC;
	Thu,  6 Jun 2019 02:57:43 +0000 (UTC)
Date: Wed, 5 Jun 2019 23:57:42 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Like Xu <like.xu@linux.intel.com>
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	Alistair Francis <alistair23@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>
Message-ID: <20190606025742.GP22416@habkost.net>
References: <20190518205428.90532-1-like.xu@linux.intel.com>
	<20190518205428.90532-8-like.xu@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190518205428.90532-8-like.xu@linux.intel.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Thu, 06 Jun 2019 02:57:44 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3 07/10] hw/i386: Replace
 global smp variables with machine smp properties
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
X-List-Received-Date: Thu, 06 Jun 2019 02:57:59 -0000

On Sun, May 19, 2019 at 04:54:25AM +0800, Like Xu wrote:
> The global smp variables in i386 are replaced with smp machine properties.
> To avoid calling qdev_get_machine() as much as possible, some related funtions
> for acpi data generations are refactored. No semantic changes.
> 
> A local variable of the same name would be introduced in the declaration
> phase if it's used widely in the context OR replace it on the spot if it's
> only used once. No semantic changes.
> 
> Signed-off-by: Like Xu <like.xu@linux.intel.com>

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

-- 
Eduardo

