Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h0hrv-0008E5-QN
	for mharc-qemu-trivial@gnu.org; Mon, 04 Mar 2019 02:18:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45852)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1h0hrt-0008By-Aa
	for qemu-trivial@nongnu.org; Mon, 04 Mar 2019 02:18:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1h0hrs-0001WE-Lz
	for qemu-trivial@nongnu.org; Mon, 04 Mar 2019 02:18:33 -0500
Received: from mx1.redhat.com ([209.132.183.28]:58710)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1h0hrr-0001Q2-6u; Mon, 04 Mar 2019 02:18:31 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 21A3C81F07;
	Mon,  4 Mar 2019 07:18:30 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-92.ams2.redhat.com
	[10.36.116.92])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E5BC95D71A;
	Mon,  4 Mar 2019 07:18:26 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 68A7E1138660; Mon,  4 Mar 2019 08:18:25 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Juan Quintela <quintela@redhat.com>, qemu-trivial@nongnu.org,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <1551457277-884-1-git-send-email-thuth@redhat.com>
Date: Mon, 04 Mar 2019 08:18:25 +0100
In-Reply-To: <1551457277-884-1-git-send-email-thuth@redhat.com> (Thomas Huth's
	message of "Fri, 1 Mar 2019 17:21:17 +0100")
Message-ID: <87r2bncdku.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Mon, 04 Mar 2019 07:18:30 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] tests: Do not use "\n" in
 g_test_message() strings
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
X-List-Received-Date: Mon, 04 Mar 2019 07:18:34 -0000

Thomas Huth <thuth@redhat.com> writes:

> g_test_message() takes care of the newline on its own, so we
> should not use \n in the strings here.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Without "[PATCH] tests: Remove (mostly) useless architecture checks",
the patch misses four instances of '\n', so:

Based-on: <1551456970-463-1-git-send-email-thuth@redhat.com>

