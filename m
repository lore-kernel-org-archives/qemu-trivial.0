Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dD81I-0005tg-Ap
	for mharc-qemu-trivial@gnu.org; Tue, 23 May 2017 07:30:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48541)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1dD81F-0005rK-UW
	for qemu-trivial@nongnu.org; Tue, 23 May 2017 07:30:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1dD81F-0003KS-7h
	for qemu-trivial@nongnu.org; Tue, 23 May 2017 07:30:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55770)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1dD81A-0003IO-5S; Tue, 23 May 2017 07:30:24 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E61C420B1C;
	Tue, 23 May 2017 11:30:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com E61C420B1C
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=armbru@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com E61C420B1C
Received: from blackfin.pond.sub.org (ovpn-116-98.ams2.redhat.com
	[10.36.116.98])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F19E75C541;
	Tue, 23 May 2017 11:30:18 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 683B11138648; Tue, 23 May 2017 13:30:17 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Thomas Huth <thuth@redhat.com>
References: <1494322876-28843-1-git-send-email-armbru@redhat.com>
	<ea74cfd3-9009-e99d-8f18-8edc9c0441c2@redhat.com>
Date: Tue, 23 May 2017 13:30:17 +0200
In-Reply-To: <ea74cfd3-9009-e99d-8f18-8edc9c0441c2@redhat.com> (John Snow's
	message of "Tue, 9 May 2017 10:14:00 -0400")
Message-ID: <87zie3byk6.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Tue, 23 May 2017 11:30:23 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 0/2] docs: Minor updates
 around ide-drive
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
X-List-Received-Date: Tue, 23 May 2017 11:30:30 -0000

John Snow <jsnow@redhat.com> writes:

> On 05/09/2017 05:41 AM, Markus Armbruster wrote:
>> Markus Armbruster (2):
>>   docs qemu-doc: Avoid ide-drive, it's deprecated
>>   docs/qdev-device-use.txt: update section Default Devices
>> 
>>  docs/bootindex.txt       |  2 +-
>>  docs/qdev-device-use.txt | 13 +++++++------
>>  qemu-options.hx          |  2 +-
>>  3 files changed, 9 insertions(+), 8 deletions(-)
>> 
>
> Shame on me for not noticing, but thank you.
>
> Acked-by: John Snow <jsnow@redhat.com>

Thanks!

The canonical path is through your tree, but I could stick it into a
miscellaneous pull request if you like.

