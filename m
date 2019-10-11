Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iIt3p-0005Lt-Jf
	for mharc-qemu-trivial@gnu.org; Fri, 11 Oct 2019 07:26:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44316)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1iIt3l-0005Jz-CG
 for qemu-trivial@nongnu.org; Fri, 11 Oct 2019 07:26:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1iIt3k-0005UL-6h
 for qemu-trivial@nongnu.org; Fri, 11 Oct 2019 07:26:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60938)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>)
 id 1iIt3e-0005Ph-Sa; Fri, 11 Oct 2019 07:26:06 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 05C0A3018ECB;
 Fri, 11 Oct 2019 11:26:06 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.36.118.111])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 42AD05D9C3;
 Fri, 11 Oct 2019 11:26:04 +0000 (UTC)
Date: Fri, 11 Oct 2019 13:26:02 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Cleber Rosa <crosa@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v2 3/4] qemu-iotests: 044: pass is actually a noop, so
 remove it
Message-ID: <20191011112602.GF5158@localhost.localdomain>
References: <20191009194740.8079-1-crosa@redhat.com>
 <20191009194740.8079-4-crosa@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191009194740.8079-4-crosa@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Fri, 11 Oct 2019 11:26:06 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 11 Oct 2019 11:26:15 -0000

Am 09.10.2019 um 21:47 hat Cleber Rosa geschrieben:
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>

Reviewed-by: Kevin Wolf <kwolf@redhat.com>

