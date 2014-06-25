Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WzjCV-0005so-3c
	for mharc-qemu-trivial@gnu.org; Wed, 25 Jun 2014 05:09:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58267)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1WzjCL-0005gN-1y
	for qemu-trivial@nongnu.org; Wed, 25 Jun 2014 05:09:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1WzjCC-0006U0-Jn
	for qemu-trivial@nongnu.org; Wed, 25 Jun 2014 05:08:56 -0400
Received: from oxygen.pond.sub.org ([144.76.244.19]:40510)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>)
	id 1WzjBw-0006St-IW; Wed, 25 Jun 2014 05:08:32 -0400
Received: from blackfin.pond.sub.org (p5B329579.dip0.t-ipconnect.de
	[91.50.149.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by oxygen.pond.sub.org (Postfix) with ESMTPSA id BF38024DC3;
	Wed, 25 Jun 2014 11:08:30 +0200 (CEST)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 556D330403AF; Wed, 25 Jun 2014 11:08:29 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
References: <1403683241-20678-1-git-send-email-imammedo@redhat.com>
Date: Wed, 25 Jun 2014 11:08:29 +0200
In-Reply-To: <1403683241-20678-1-git-send-email-imammedo@redhat.com> (Igor
	Mammedov's message of "Wed, 25 Jun 2014 10:00:41 +0200")
Message-ID: <87vbrpe4qa.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 144.76.244.19
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org, qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-char: fix warning
	'res' may be used uninitialized
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 25 Jun 2014 09:09:05 -0000

Igor Mammedov <imammedo@redhat.com> writes:

> Signed-off-by: Igor Mammedov <imammedo@redhat.com>

Broken in commit 9005b2a (author cc'ed).  Bites only when passed zero
len, which seems unlikely.

Reviewed-by: Markus Armbruster <armbru@redhat.com>

