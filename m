Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hGT3w-0000IB-Uf
	for mharc-qemu-trivial@gnu.org; Tue, 16 Apr 2019 14:44:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52286)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hGT3u-0000HA-Rx
	for qemu-trivial@nongnu.org; Tue, 16 Apr 2019 14:44:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hGT3u-0005qX-1c
	for qemu-trivial@nongnu.org; Tue, 16 Apr 2019 14:44:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39274)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1hGT3s-0005ih-0C; Tue, 16 Apr 2019 14:44:04 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7A38685A03;
	Tue, 16 Apr 2019 18:44:02 +0000 (UTC)
Received: from localhost (ovpn-116-9.gru2.redhat.com [10.97.116.9])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D92736013D;
	Tue, 16 Apr 2019 18:44:01 +0000 (UTC)
Date: Tue, 16 Apr 2019 15:43:59 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Stanislav Lanci <pixo@polepetko.eu>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Message-ID: <20190416184359.GA30937@habkost.net>
References: <20190416123833.60649-1-pixo@polepetko.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190416123833.60649-1-pixo@polepetko.eu>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Tue, 16 Apr 2019 18:44:02 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Pass through cache
 information for TOPOEXT CPUs
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
X-List-Received-Date: Tue, 16 Apr 2019 18:44:07 -0000

On Tue, Apr 16, 2019 at 02:38:33PM +0200, Stanislav Lanci wrote:
> Signed-off-by: Stanislav Lanci <pixo@polepetko.eu>

Thanks.  Queued for 4.1.

-- 
Eduardo

