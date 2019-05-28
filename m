Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hVXLu-0005QY-OB
	for mharc-qemu-trivial@gnu.org; Tue, 28 May 2019 04:20:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52996)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <quintela@redhat.com>) id 1hVXLt-0005LV-1P
	for qemu-trivial@nongnu.org; Tue, 28 May 2019 04:20:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <quintela@redhat.com>) id 1hVXLr-00011h-1d
	for qemu-trivial@nongnu.org; Tue, 28 May 2019 04:20:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57688)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <quintela@redhat.com>)
	id 1hVXLf-0000eU-BZ; Tue, 28 May 2019 04:20:43 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 745E93099FC5;
	Tue, 28 May 2019 08:20:40 +0000 (UTC)
Received: from redhat.com (unknown [10.36.118.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DE55C6C35B;
	Tue, 28 May 2019 08:20:39 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: Li Qiang <liq3ea@163.com>
Cc: dgilbert@redhat.com,  qemu-devel@nongnu.org,  qemu-trivial@nongnu.org
In-Reply-To: <20190525062832.18009-1-liq3ea@163.com> (Li Qiang's message of
	"Fri, 24 May 2019 23:28:32 -0700")
References: <20190525062832.18009-1-liq3ea@163.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
Reply-To: quintela@redhat.com
Date: Tue, 28 May 2019 10:20:37 +0200
Message-ID: <8736kz7zxm.fsf@trasno.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Tue, 28 May 2019 08:20:40 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] migration: fix a typo
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
X-List-Received-Date: Tue, 28 May 2019 08:20:58 -0000

Li Qiang <liq3ea@163.com> wrote:
> 'postocpy' should be 'postcopy'.
>
> CC: qemu-trivial@nongnu.org
> Signed-off-by: Li Qiang <liq3ea@163.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

Already in through trivial patches.


