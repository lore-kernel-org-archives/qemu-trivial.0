Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZmkQd-0005Bk-Nz
	for mharc-qemu-trivial@gnu.org; Thu, 15 Oct 2015 11:26:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45801)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1ZmkP8-0003wV-Qq
	for qemu-trivial@nongnu.org; Thu, 15 Oct 2015 11:25:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1ZmkP3-00082c-Bp
	for qemu-trivial@nongnu.org; Thu, 15 Oct 2015 11:25:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42804)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1ZmkOu-0007uV-7H; Thu, 15 Oct 2015 11:25:04 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id 6A8542653;
	Thu, 15 Oct 2015 15:25:03 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-32.ams2.redhat.com
	[10.36.116.32])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t9FFP1MO024893
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 15 Oct 2015 11:25:02 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id D5179300110B; Thu, 15 Oct 2015 17:25:00 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
References: <1444899255-16300-1-git-send-email-thuth@redhat.com>
Date: Thu, 15 Oct 2015 17:25:00 +0200
In-Reply-To: <1444899255-16300-1-git-send-email-thuth@redhat.com> (Thomas
	Huth's message of "Thu, 15 Oct 2015 10:54:15 +0200")
Message-ID: <87zizk6to3.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, blauwirbel@gmail.com,
	mark.cave-ayland@ilande.co.uk, qemu-devel@nongnu.org, pbonzini@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/display/tcx: Remove
	superfluous OBJECT() typecasts
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
X-List-Received-Date: Thu, 15 Oct 2015 15:25:24 -0000

Thomas Huth <thuth@redhat.com> writes:

> The tcx_initfn() function is already supplied with an
> Object *obj pointer, so there is no need to cast the
> state pointer back to an Object pointer all over the
> place. And while we're at it, also remove the superfluous
> "return;" statement in this function.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Markus Armbruster <armbru@redhat.com>

