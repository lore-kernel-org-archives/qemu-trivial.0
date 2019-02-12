Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gtZKw-0005YQ-Vg
	for mharc-qemu-trivial@gnu.org; Tue, 12 Feb 2019 09:47:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35621)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1gtZKv-0005F3-4S
	for qemu-trivial@nongnu.org; Tue, 12 Feb 2019 09:47:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1gtZG2-0003Sp-3k
	for qemu-trivial@nongnu.org; Tue, 12 Feb 2019 09:41:59 -0500
Received: from mx1.redhat.com ([209.132.183.28]:60430)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cohuck@redhat.com>)
	id 1gtZG1-000333-6m; Tue, 12 Feb 2019 09:41:57 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E7BADC01DE05;
	Tue, 12 Feb 2019 14:41:40 +0000 (UTC)
Received: from gondolin (dhcp-192-213.str.redhat.com [10.33.192.213])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CD53C5D962;
	Tue, 12 Feb 2019 14:41:23 +0000 (UTC)
Date: Tue, 12 Feb 2019 15:41:21 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, kraxel@redhat.com,
	mst@redhat.com, qemu-trivial@nongnu.org
Message-ID: <20190212154121.43c8e279.cohuck@redhat.com>
In-Reply-To: <20190212134758.10514-4-dgilbert@redhat.com>
References: <20190212134758.10514-1-dgilbert@redhat.com>
	<20190212134758.10514-4-dgilbert@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Tue, 12 Feb 2019 14:41:41 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 3/4] kvm: Add
 kvm_set_ioeventfd* traces
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
X-List-Received-Date: Tue, 12 Feb 2019 14:47:02 -0000

On Tue, 12 Feb 2019 13:47:57 +0000
"Dr. David Alan Gilbert (git)" <dgilbert@redhat.com> wrote:

> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> Add a couple of traces around the kvm_set_ioeventfd* calls.
> 
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  accel/kvm/kvm-all.c    | 3 +++
>  accel/kvm/trace-events | 2 ++
>  2 files changed, 5 insertions(+)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>

Maybe I'll add a tracepoint for the s390 subchannel ioeventfd as well...

