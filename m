Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d5uPj-0003f1-4Q
	for mharc-qemu-trivial@gnu.org; Wed, 03 May 2017 09:33:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53404)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1d5uPh-0003d7-0O
	for qemu-trivial@nongnu.org; Wed, 03 May 2017 09:33:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1d5uPg-0005Ut-9O
	for qemu-trivial@nongnu.org; Wed, 03 May 2017 09:33:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40330)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1d5uPa-0005Rc-MM; Wed, 03 May 2017 09:33:46 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B1A7AC04B328;
	Wed,  3 May 2017 13:33:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com B1A7AC04B328
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=armbru@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com B1A7AC04B328
Received: from blackfin.pond.sub.org (ovpn-116-149.ams2.redhat.com
	[10.36.116.149])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 78A3F1BD862;
	Wed,  3 May 2017 13:33:43 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id D3B4E1138646; Wed,  3 May 2017 15:33:41 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-trivial@nongnu.org,  leon.alrae@imgtec.com,  qemu-devel@nongnu.org
References: <20170503104441.1349-1-pbonzini@redhat.com>
	<874lx21880.fsf@dusky.pond.sub.org>
	<8e6b18bc-eb3e-c77f-2b9a-c797c3c15680@redhat.com>
	<87pofqxfna.fsf@dusky.pond.sub.org>
	<cba7fc39-0b43-7514-7bf1-8375f3f7cc38@redhat.com>
Date: Wed, 03 May 2017 15:33:41 +0200
In-Reply-To: <cba7fc39-0b43-7514-7bf1-8375f3f7cc38@redhat.com> (Paolo
	Bonzini's message of "Wed, 3 May 2017 15:10:24 +0200")
Message-ID: <87inlivzd6.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Wed, 03 May 2017 13:33:43 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] jazz_led: fix bad snprintf
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
X-List-Received-Date: Wed, 03 May 2017 13:33:54 -0000

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 03/05/2017 14:56, Markus Armbruster wrote:
>>> snprintf writes at most 2 bytes here including the terminating NUL, so
>>> the result is truncated".
>>
>> You're right; I forgot that snprintf() always adds a NUL.  So this *is*
>> broken: we write NUL instead of the second digit.  Mentioning this in
>> the commit message wouldn't hurt.
>
> Well, it does, see the quote. :)

Yes, snprintf() truncates, but that's *internal* to
jazz_led_text_update().  The *external* effect isn't quite truncation,
it's writing NUL to the console instead of the second digit.  That's
truncation only if the console ignores NUL.  It might; I don't know.
Anyway, no big deal.

