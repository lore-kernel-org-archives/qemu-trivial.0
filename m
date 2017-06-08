Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dIyYo-0003BQ-VD
	for mharc-qemu-trivial@gnu.org; Thu, 08 Jun 2017 10:37:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36971)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <quintela@redhat.com>) id 1dIyYm-00033H-FF
	for qemu-trivial@nongnu.org; Thu, 08 Jun 2017 10:37:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <quintela@redhat.com>) id 1dIyYl-0002yf-OD
	for qemu-trivial@nongnu.org; Thu, 08 Jun 2017 10:37:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47706)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <quintela@redhat.com>)
	id 1dIyYf-0002vI-MN; Thu, 08 Jun 2017 10:37:09 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5099D3680A;
	Thu,  8 Jun 2017 14:37:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 5099D3680A
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=quintela@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 5099D3680A
Received: from localhost (ovpn-117-154.ams2.redhat.com [10.36.117.154])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C35E283846;
	Thu,  8 Jun 2017 14:37:07 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Andrew Jones <drjones@redhat.com>
In-Reply-To: <1496931482-29914-1-git-send-email-thuth@redhat.com> (Thomas
	Huth's message of "Thu, 8 Jun 2017 16:18:02 +0200")
References: <1496931482-29914-1-git-send-email-thuth@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.2 (gnu/linux)
Reply-To: quintela@redhat.com
Date: Thu, 08 Jun 2017 16:37:06 +0200
Message-ID: <87tw3qa6lp.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Thu, 08 Jun 2017 14:37:08 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] Makefile: Move balloon.o,
 numa.o and bootdevice.o to common-obj-y
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
X-List-Received-Date: Thu, 08 Jun 2017 14:37:17 -0000

Thomas Huth <thuth@redhat.com> wrote:
> There does not seem to be any target specific code in these files, so
> we can put them into "common-obj" instead of "obj" to compile them only
> once for all targets.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

Again, nothing strange on that files that looks target specific.

