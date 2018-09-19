Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1g2buE-0001su-Au
	for mharc-qemu-trivial@gnu.org; Wed, 19 Sep 2018 08:48:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56357)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1g2bu9-0001rb-V9
	for qemu-trivial@nongnu.org; Wed, 19 Sep 2018 08:48:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1g2bu6-0001Hw-LH
	for qemu-trivial@nongnu.org; Wed, 19 Sep 2018 08:48:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47116)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1g2btp-00015j-Cq; Wed, 19 Sep 2018 08:48:10 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5E41B7F3F1;
	Wed, 19 Sep 2018 12:48:08 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-77.ams2.redhat.com
	[10.36.116.77])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1FB61226FE;
	Wed, 19 Sep 2018 12:48:07 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 8855D11385CB; Wed, 19 Sep 2018 14:48:05 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org,  qemu-trivial@nongnu.org,  Andreas =?utf-8?Q?F?=
	=?utf-8?Q?=C3=A4rber?= <afaerber@suse.de>
References: <1536566979-6868-1-git-send-email-thuth@redhat.com>
Date: Wed, 19 Sep 2018 14:48:05 +0200
In-Reply-To: <1536566979-6868-1-git-send-email-thuth@redhat.com> (Thomas
	Huth's message of "Mon, 10 Sep 2018 10:09:39 +0200")
Message-ID: <87in31odq2.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Wed, 19 Sep 2018 12:48:08 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/qdev-core: Fix
 description of instance_init
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
X-List-Received-Date: Wed, 19 Sep 2018 12:48:30 -0000

Thomas Huth <thuth@redhat.com> writes:

> The part of the documentation of DeviceClass that talks about instance_init
> is partly wrong: instance_init() functions must not abort or exit, since
> the function is also called during introspection of the device already.

I figure it was correct back when the comment was written.  It's
definitely wrong now.

> So if a device calls exit() during its instance_init() function, QEMU
> terminates unexpectedly if somebody tries to just have a look at the
> interfaces from the device with "device_add xyz,help" or with the
> "device-list-properties" QOM command. This should never happen.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Markus Armbruster <armbru@redhat.com>

