Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iXoOK-0000Vw-5b
	for mharc-qemu-trivial@gnu.org; Thu, 21 Nov 2019 10:29:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50481)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1iXoOH-0000TB-LJ
 for qemu-trivial@nongnu.org; Thu, 21 Nov 2019 10:29:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1iXoOG-00027L-Nm
 for qemu-trivial@nongnu.org; Thu, 21 Nov 2019 10:29:05 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:35317
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1iXoOG-00025j-Ju
 for qemu-trivial@nongnu.org; Thu, 21 Nov 2019 10:29:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574350144;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/vYemnfj1Rjz2Qld4Qv8bu0bPVa8xx1HazNR6ywNCLs=;
 b=LoKNpKugDU3auAqzRDIwbOUK+0nRxfzgSr7dNlNUOcSi78I1kTK7b6lMdQWangEdeIxrU7
 1bxyET/VyylFsFuVV4rvz0nJQrvq5/doNsUvgrsrTzeTVnRLzY44ocEdCQAD5QO7MC+O0O
 X+F9hK7WvWrZnO4TWcFvQ8v73om/UiU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-XASaK5ZHPXuSZyDhYPZKKw-1; Thu, 21 Nov 2019 10:29:02 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4885B107ACC9;
 Thu, 21 Nov 2019 15:29:01 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-134.ams2.redhat.com
 [10.36.116.134])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 46F3E44F94;
 Thu, 21 Nov 2019 15:28:58 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BECC61138606; Thu, 21 Nov 2019 16:28:56 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: qemu-trivial@nongnu.org,  qemu-devel@nongnu.org,  =?utf-8?Q?Herv=C3=A9?=
 Poussineau <hpoussin@reactos.org>,  qemu-ppc@nongnu.org
Subject: Re: [Qemu-devel] [PATCH 0/2] hw/timer/m48t59: Convert to trace events
References: <20190626122042.7656-1-philmd@redhat.com>
 <dfa56995-6a66-1aeb-4461-fb2919e8b699@redhat.com>
Date: Thu, 21 Nov 2019 16:28:56 +0100
In-Reply-To: <dfa56995-6a66-1aeb-4461-fb2919e8b699@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Thu, 4 Jul 2019 12:33:53
 +0200")
Message-ID: <87r2219rk7.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: XASaK5ZHPXuSZyDhYPZKKw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Nov 2019 15:29:06 -0000

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> ping?

Did this fall through the cracks?

> On 6/26/19 2:20 PM, Philippe Mathieu-Daud=C3=A9 wrote:
>> Another trivial cleanup series.
>>=20
>> Philippe Mathieu-Daud=C3=A9 (2):
>>   MAINTAINERS: Add missing m48t59 files to the PReP section
>>   hw/timer/m48t59: Convert debug printf()s to trace events
>>=20
>>  MAINTAINERS                |  2 ++
>>  hw/timer/m48t59-internal.h |  5 -----
>>  hw/timer/m48t59.c          | 11 +++++------
>>  hw/timer/trace-events      |  6 ++++++
>>  4 files changed, 13 insertions(+), 11 deletions(-)
>>=20


