Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YXrGH-0006JC-Al
	for mharc-qemu-trivial@gnu.org; Tue, 17 Mar 2015 09:10:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43632)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <quintela@redhat.com>) id 1YXrGC-0006Dp-QD
	for qemu-trivial@nongnu.org; Tue, 17 Mar 2015 09:10:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <quintela@redhat.com>) id 1YXrGB-0002wf-Tl
	for qemu-trivial@nongnu.org; Tue, 17 Mar 2015 09:10:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46200)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <quintela@redhat.com>)
	id 1YXrG3-0002le-Sj; Tue, 17 Mar 2015 09:10:08 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t2HDA6GU010979
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Tue, 17 Mar 2015 09:10:06 -0400
Received: from localhost (ovpn-116-56.ams2.redhat.com [10.36.116.56])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t2HDA3VE030013; Tue, 17 Mar 2015 09:10:05 -0400
From: Juan Quintela <quintela@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <1424073025-13262-1-git-send-email-mjt@msgid.tls.msk.ru> (Michael
	Tokarev's message of "Mon, 16 Feb 2015 10:50:25 +0300")
References: <1424073025-13262-1-git-send-email-mjt@msgid.tls.msk.ru>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.4 (gnu/linux)
Date: Tue, 17 Mar 2015 14:10:02 +0100
Message-ID: <87619zkbx1.fsf@neno.neno>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Amit Shah <amit.shah@redhat.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] migration/rdma: clean up
	qemu_rdma_dest_init a bit
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
Reply-To: quintela@redhat.com
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Mar 2015 13:10:20 -0000

Michael Tokarev <mjt@tls.msk.ru> wrote:
> Do not check for rdma->host being empty twice.  This removes a large
> "if" block, so code indentation is changed.  While at it, remove an
> ugly goto from the loop, replacing it with a cleaner if logic.  And
> finally, there's no need to initialize `ret' variable since is always
> has a value.
>
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>

Applied, thanks.

