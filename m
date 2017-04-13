Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cyYuf-0003J4-UL
	for mharc-qemu-trivial@gnu.org; Thu, 13 Apr 2017 03:11:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35137)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1cyYue-0003IA-Ad
	for qemu-trivial@nongnu.org; Thu, 13 Apr 2017 03:11:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1cyYud-0005Is-Mk
	for qemu-trivial@nongnu.org; Thu, 13 Apr 2017 03:11:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46278)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1cyYuZ-0005Gy-Ca; Thu, 13 Apr 2017 03:11:23 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5DB4BC01B7FC;
	Thu, 13 Apr 2017 07:11:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 5DB4BC01B7FC
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=armbru@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 5DB4BC01B7FC
Received: from blackfin.pond.sub.org (ovpn-116-81.ams2.redhat.com
	[10.36.116.81])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 267A87DED4;
	Thu, 13 Apr 2017 07:11:22 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 9C4D41138646; Thu, 13 Apr 2017 09:11:20 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Craig Jellick <craig@rancher.com>
Cc: "qemu-trivial\@nongnu.org" <qemu-trivial@nongnu.org>,
	"qemu-devel\@nongnu.org" <qemu-devel@nongnu.org>
References: <1489765795-32398-1-git-send-email-craig@rancher.com>
	<871ssz9j8p.fsf@dusky.pond.sub.org>
	<CY4PR11MB162370BEAB5D22F1E647CCE8AA030@CY4PR11MB1623.namprd11.prod.outlook.com>
Date: Thu, 13 Apr 2017 09:11:20 +0200
In-Reply-To: <CY4PR11MB162370BEAB5D22F1E647CCE8AA030@CY4PR11MB1623.namprd11.prod.outlook.com>
	(Craig Jellick's message of "Wed, 12 Apr 2017 16:02:46 +0000")
Message-ID: <87a87krdd3.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Thu, 13 Apr 2017 07:11:22 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Add 'none' as type for
 drive's if option
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
X-List-Received-Date: Thu, 13 Apr 2017 07:11:29 -0000

Craig Jellick <craig@rancher.com> writes:

> Is there an action I need to take for that?

Fair question.

Expect e-mail from a qemu-trivial maintainer that your patch has been
merged.  If you don't get one within a reasonable time frame, we failed
you.  Send a reminder as a reply to this message then.

I figure one week after 2.10 opens would be reasonable.  It's expected
to open in a week.

Thanks!

