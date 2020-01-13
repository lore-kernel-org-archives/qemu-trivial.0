Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ir1c1-0001BL-MC
	for mharc-qemu-trivial@gnu.org; Mon, 13 Jan 2020 10:26:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57995)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1ir1bz-00016S-Iy
 for qemu-trivial@nongnu.org; Mon, 13 Jan 2020 10:26:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1ir1by-0003oF-Hu
 for qemu-trivial@nongnu.org; Mon, 13 Jan 2020 10:26:39 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:39330
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1ir1by-0003na-EN
 for qemu-trivial@nongnu.org; Mon, 13 Jan 2020 10:26:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578929197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qcDFBLZo+Jb8xGOew4Wd3dTD2HMwSN35pi1u7LgD7js=;
 b=XrRz2zPk3Fp9zuZ/Omg6/X8OyEKG9bPT8GsP2QMAewFf3/w1lZMVv9vrVQF/6uax0VodFT
 2aqmahTAlaTysNNkbv3jT1RY4K41v1s0gDKYX+ytIIAcQOWGbp6fC7KQ6gUzcXNsj4/NMV
 XRH4Ru/ALvrIuAm6nyPPHX1m7or/tss=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-116-tUrUOBjlNeOyHiewkFDeoA-1; Mon, 13 Jan 2020 10:26:33 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 785D710054E3;
 Mon, 13 Jan 2020 15:26:32 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-131.ams2.redhat.com
 [10.36.116.131])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 491CA87EEC;
 Mon, 13 Jan 2020 15:26:32 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D0C6F1138600; Mon, 13 Jan 2020 16:26:30 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Corey Minyard <minyard@acm.org>
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-trivial@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v1 00/59] trivial unneeded labels cleanup
References: <20200106182425.20312-1-danielhb413@gmail.com>
 <20200106195457.GE2886@minyard.net>
Date: Mon, 13 Jan 2020 16:26:30 +0100
In-Reply-To: <20200106195457.GE2886@minyard.net> (Corey Minyard's message of
 "Mon, 6 Jan 2020 13:54:57 -0600")
Message-ID: <87a76rxtqx.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: tUrUOBjlNeOyHiewkFDeoA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
X-List-Received-Date: Mon, 13 Jan 2020 15:26:40 -0000

Corey Minyard <minyard@acm.org> writes:

> On Mon, Jan 06, 2020 at 03:23:26PM -0300, Daniel Henrique Barboza wrote:
>> Hello,
>>=20
>> This is the type of cleanup I've contributed to Libvirt
>> during the last year. Figured QEMU also deserves the same
>> care.
>>=20
>> The idea here is remove unneeded labels. By 'unneeded' I
>> mean labels that does nothing but a 'return' call. One
>> common case is something like this:
>>=20
>> if ()
>>     goto cleanup;
>> [...]
>>  cleanup:
>>     return 0;
>>=20
>> This code can be simplified to:
>>=20
>> if ()
>>     return 0;
>>=20
>>=20
>> Which is cleaner and requires less brain cycles to wonder
>> whether the 'cleanup' label does anything special, such
>> as a heap memory cleanup.
>
> I would disagree with this analysis.  To me, I often wonder
> when I have to add cleanup code to a routine whether there is
> some hidden return in the middle of the function.  That's a lot
> harder to spot than just looking for the cleanup label at the
> end of the function to see what it does.

A cleanup label does not preclude existence of return.  You have to
check for return anyway.

>                                           For non-trivial
> functions I prefer to have one point of return at the end
> (and maybe some minor checks with returns right at the beginning).
> I'm not adamant about this, just my opinion.

I'm in Daniel's camp: if there's no need for cleanup, return without
ado.

> But if we are going to fix things like this, it might be best to add
> them to the coding style document and checkpatch script.  Otherwise
> these sorts of things will just continue.

Maybe.


