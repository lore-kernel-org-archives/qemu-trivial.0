Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bZCHx-0002b1-EH
	for mharc-qemu-trivial@gnu.org; Mon, 15 Aug 2016 03:26:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41888)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1bZCHu-0002Ys-Sf
	for qemu-trivial@nongnu.org; Mon, 15 Aug 2016 03:26:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1bZCHs-0003An-Vg
	for qemu-trivial@nongnu.org; Mon, 15 Aug 2016 03:26:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48806)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1bZCHn-00039y-MD; Mon, 15 Aug 2016 03:26:15 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B9952C057FAD;
	Mon, 15 Aug 2016 07:26:14 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-29.ams2.redhat.com
	[10.36.116.29])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u7F7QCJq027466
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 15 Aug 2016 03:26:14 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 60DEB11386A2; Mon, 15 Aug 2016 09:26:12 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Colin Lord <clord@redhat.com>, qemu-trivial@nongnu.org,
	peter.maydell@linaro.org, qemu-devel@nongnu.org
References: <1470420195-32551-1-git-send-email-clord@redhat.com>
	<87zioniw9x.fsf@dusky.pond.sub.org>
	<04b7f702-5ac1-fcc2-7968-5bcb8767b2d2@redhat.com>
Date: Mon, 15 Aug 2016 09:26:12 +0200
In-Reply-To: <04b7f702-5ac1-fcc2-7968-5bcb8767b2d2@redhat.com> (Paolo
	Bonzini's message of "Fri, 12 Aug 2016 10:42:16 +0200")
Message-ID: <87r39qijcb.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Mon, 15 Aug 2016 07:26:14 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] help: Update help to
 reflect that GTK is the default
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
X-List-Received-Date: Mon, 15 Aug 2016 07:26:23 -0000

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 08/08/2016 08:56, Markus Armbruster wrote:
>> Aside: -nographic is hard to understand because it does too many things.
>
> -nographic is "just" -serial mon:stdio -machine graphics=false -display
> none. :)

Assuming default_parallel is off, default_monitor is on, and either
default_serial or default_virtcon or default_sclp is on: I think so (but
I could be wrong).

Depending on what it actually does, it can also conflict with
-daemonize.

