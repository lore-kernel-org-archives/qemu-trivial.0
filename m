Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YxyRa-00050d-11
	for mharc-qemu-trivial@gnu.org; Thu, 28 May 2015 10:05:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36444)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YxyRR-0004tb-0S
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 10:05:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YxyRK-0003hi-Vz
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 10:05:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45389)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1YxyRA-0003fd-6p; Thu, 28 May 2015 10:05:32 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 7440A35C813;
	Thu, 28 May 2015 14:05:31 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-60.ams2.redhat.com
	[10.36.116.60])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t4SE5SRZ027415
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 28 May 2015 10:05:30 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id E3AC53008AAF; Thu, 28 May 2015 16:05:27 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1432632341-5201-1-git-send-email-chenhanxiao@cn.fujitsu.com>
	<5566FCBA.2000500@msgid.tls.msk.ru>
	<87twuwaoju.fsf@blackfin.pond.sub.org>
	<55670998.1030505@msgid.tls.msk.ru>
Date: Thu, 28 May 2015 16:05:27 +0200
In-Reply-To: <55670998.1030505@msgid.tls.msk.ru> (Michael Tokarev's message of
	"Thu, 28 May 2015 15:27:04 +0300")
Message-ID: <87iobckdaw.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] docs/writing-qmp-commands:
	fix a typo
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
X-List-Received-Date: Thu, 28 May 2015 14:05:56 -0000

Michael Tokarev <mjt@tls.msk.ru> writes:

> 28.05.2015 15:12, Markus Armbruster wrote:
>> Michael Tokarev <mjt@tls.msk.ru> writes:
> []
>>> Marcus: I don't think such obvious and trivial changes needs to be re-sent
>>> to -devel. Ofcourse it is better to send things to -devel rigth away, but
>>> requiring to resent is a bit over the top.  I think anyway :)
>> 
>> Patches must be posted to -devel for review.
>> 
>> If you accept patches sent just to -trivial, then the only post to
>> -devel will be your pull request, where it most probably won't get
>> review.
>
> Obvious typo fix in comment or doc don't really need a big review.
> That's where the "too trivial" border can be drawn.

I don't want us to get into the "is this trivial enough to go in without
review" business.

[...]

