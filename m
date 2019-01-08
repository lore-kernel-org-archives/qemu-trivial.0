Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ggwHO-0006ER-SU
	for mharc-qemu-trivial@gnu.org; Tue, 08 Jan 2019 13:39:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54461)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1ggwHM-0006D3-W0
	for qemu-trivial@nongnu.org; Tue, 08 Jan 2019 13:39:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1ggwHM-0000y6-7q
	for qemu-trivial@nongnu.org; Tue, 08 Jan 2019 13:39:08 -0500
Received: from mx1.redhat.com ([209.132.183.28]:33293)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1ggwHF-0000Wr-Q0; Tue, 08 Jan 2019 13:39:03 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 15E3380F6B;
	Tue,  8 Jan 2019 18:38:52 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-32.ams2.redhat.com
	[10.36.116.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A208B2CFA1;
	Tue,  8 Jan 2019 18:38:51 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 1EA4D1138648; Tue,  8 Jan 2019 19:38:50 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Wainer dos Santos Moschetta <wainersm@redhat.com>
Cc: qemu-devel@nongnu.org,  qemu-trivial@nongnu.org
References: <20181228194442.3506-1-wainersm@redhat.com>
Date: Tue, 08 Jan 2019 19:38:50 +0100
In-Reply-To: <20181228194442.3506-1-wainersm@redhat.com> (Wainer dos Santos
	Moschetta's message of "Fri, 28 Dec 2018 14:44:42 -0500")
Message-ID: <87va2z9epx.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 08 Jan 2019 18:38:52 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qmp: Add examples to qom
 list, get, and set commands
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
X-List-Received-Date: Tue, 08 Jan 2019 18:39:09 -0000

Wainer dos Santos Moschetta <wainersm@redhat.com> writes:

> Added examples for the qom-list, qom-get, and qom-set
> commands in qapi misc JSON file.
>
> Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>

Queued, thanks!

