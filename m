Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YSMpc-0004Hk-Er
	for mharc-qemu-trivial@gnu.org; Mon, 02 Mar 2015 04:40:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54675)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YSMpY-0004D5-Fz
	for qemu-trivial@nongnu.org; Mon, 02 Mar 2015 04:40:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YSMpX-0006pS-GT
	for qemu-trivial@nongnu.org; Mon, 02 Mar 2015 04:40:04 -0500
Received: from mx1.redhat.com ([209.132.183.28]:50372)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1YSMpR-0006lY-E9; Mon, 02 Mar 2015 04:39:57 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t229dETv014960
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Mon, 2 Mar 2015 04:39:15 -0500
Received: from blackfin.pond.sub.org (ovpn-116-68.ams2.redhat.com
	[10.36.116.68])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t229dBYt015334
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 2 Mar 2015 04:39:12 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 92BCD3042B60; Mon,  2 Mar 2015 10:39:10 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1424437103-17523-1-git-send-email-berto@igalia.com>
	<54F18484.6050801@msgid.tls.msk.ru>
Date: Mon, 02 Mar 2015 10:39:10 +0100
In-Reply-To: <54F18484.6050801@msgid.tls.msk.ru> (Michael Tokarev's message of
	"Sat, 28 Feb 2015 12:04:04 +0300")
Message-ID: <87d24rivr5.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Alberto Garcia <berto@igalia.com>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qerror.h: Swap definitions
	that were not in alphabetical order
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
X-List-Received-Date: Mon, 02 Mar 2015 09:40:05 -0000

Michael Tokarev <mjt@tls.msk.ru> writes:

> Applied to -trivial, thank you!
>
> Markus, should I add your Reviewed-By (or Acked-By)?

I'm working towards getting rid of the whole thing.  But until then,
keeping it sorted is good.

Reviewed-by: Markus Armbruster <armbru@redhat.com>

