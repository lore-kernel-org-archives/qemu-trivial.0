Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e1x3P-0001tV-9p
	for mharc-qemu-trivial@gnu.org; Tue, 10 Oct 2017 12:06:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55935)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1e1x3N-0001rr-1S
	for qemu-trivial@nongnu.org; Tue, 10 Oct 2017 12:06:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1e1x3J-0006hF-BK
	for qemu-trivial@nongnu.org; Tue, 10 Oct 2017 12:06:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49636)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1e1x3D-0006eK-Bi; Tue, 10 Oct 2017 12:06:35 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 691C8CD18C;
	Tue, 10 Oct 2017 16:06:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 691C8CD18C
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=ehabkost@redhat.com
Received: from localhost (ovpn-116-24.gru2.redhat.com [10.97.116.24])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C69C168B00;
	Tue, 10 Oct 2017 16:06:27 +0000 (UTC)
Date: Tue, 10 Oct 2017 13:00:15 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>, "Michael S . Tsirkin" <mst@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>
Message-ID: <20171010160015.GF3246@localhost.localdomain>
References: <20171010133241.11330-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171010133241.11330-1-lvivier@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.9.0 (2017-09-02)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Tue, 10 Oct 2017 16:06:34 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] pc: remove useless hot_add_cpu
 initialisation
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
X-List-Received-Date: Tue, 10 Oct 2017 16:06:46 -0000

On Tue, Oct 10, 2017 at 03:32:41PM +0200, Laurent Vivier wrote:
> Since 4458fb3a79 (pc: Eliminate pc_default_machine_options()),
> hot_add_cpu is set in pc_machine_class_init(), so we don't
> need to set it in pc_q35_machine_options(), pc_i440fx_machine_options()
> and xenfv_machine_options(), except to clear it in
> pc_i440fx_1_4_machine_opt().
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

-- 
Eduardo

