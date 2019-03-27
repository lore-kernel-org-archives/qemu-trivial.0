Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h982D-0008An-5t
	for mharc-qemu-trivial@gnu.org; Wed, 27 Mar 2019 08:52:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48319)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1h912s-0007am-NC
	for qemu-trivial@nongnu.org; Wed, 27 Mar 2019 01:24:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1h912r-000610-SR
	for qemu-trivial@nongnu.org; Wed, 27 Mar 2019 01:24:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44236)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peterx@redhat.com>)
	id 1h912o-0005yT-MQ; Wed, 27 Mar 2019 01:24:10 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 426F066983;
	Wed, 27 Mar 2019 05:14:38 +0000 (UTC)
Received: from xz-x1 (dhcp-14-116.nay.redhat.com [10.66.14.116])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4523D3DAB;
	Wed, 27 Mar 2019 05:14:31 +0000 (UTC)
Date: Wed, 27 Mar 2019 13:14:28 +0800
From: Peter Xu <peterx@redhat.com>
To: Alex Williamson <alex.williamson@redhat.com>
Cc: qemu-devel@nongnu.org, mst@redhat.com, marcel.apfelbaum@gmail.com,
	pbonzini@redhat.com, rth@twiddle.net, ehabkost@redhat.com,
	qemu-trivial@nongnu.org
Message-ID: <20190327051428.GN9149@xz-x1>
References: <155364147432.16467.15898335025013220939.stgit@gimli.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <155364147432.16467.15898335025013220939.stgit@gimli.home>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Wed, 27 Mar 2019 05:14:38 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
X-Mailman-Approved-At: Wed, 27 Mar 2019 08:51:59 -0400
Subject: Re: [Qemu-trivial] [PATCH] intel_iommu: Correct caching-mode error
 message
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
X-List-Received-Date: Wed, 27 Mar 2019 05:24:15 -0000

On Tue, Mar 26, 2019 at 05:05:38PM -0600, Alex Williamson wrote:
> If we try to use the intel-iommu device with vfio-pci devices without
> caching mode enabled, we're told:
> 
>   qemu-system-x86_64: We need to set caching-mode=1 for intel-iommu to enable
>   device assignment with IOMMU protection.
> 
> But to enable caching mode, the option is actually "caching-mode=on".
> 
> Signed-off-by: Alex Williamson <alex.williamson@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu

