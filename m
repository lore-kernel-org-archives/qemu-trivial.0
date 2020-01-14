Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1irH36-0005DC-5U
	for mharc-qemu-trivial@gnu.org; Tue, 14 Jan 2020 02:55:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44740)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1irH33-0005Bi-CO
 for qemu-trivial@nongnu.org; Tue, 14 Jan 2020 02:55:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1irH31-0006Iv-3b
 for qemu-trivial@nongnu.org; Tue, 14 Jan 2020 02:55:36 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:25059
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1irH30-0006IE-N3
 for qemu-trivial@nongnu.org; Tue, 14 Jan 2020 02:55:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578988533;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4q90mFfpgBnql4cHvswY3fLuXnuX6PeM9otqNKL0iXQ=;
 b=MU2TSBy7QsItJflIhANrT3oQ+V9DWNg/8uINnA+WlViOQbpCvWdlmGFhSPC+Y+PacXReu6
 j1yk2vNRUeEupqDTM7oh8HEBCUC6hej1w1NaYwgKGkCqBPfajPpiHOKJDfQW6niWV1PYJi
 1PZ1AxCliwnE6Y/Pialuwo9ZFs5xIxQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-EzU2WDySP7OehJaLvCVKpQ-1; Tue, 14 Jan 2020 02:55:30 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 85CAF800D55;
 Tue, 14 Jan 2020 07:55:29 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-131.ams2.redhat.com
 [10.36.116.131])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 391CA80F63;
 Tue, 14 Jan 2020 07:55:29 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C2E261138600; Tue, 14 Jan 2020 08:55:27 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Laurent Vivier <laurent@vivier.eu>
Cc: Greg Kurz <groug@kaod.org>, qemu-trivial@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v1 12/59] virtfs-proxy-helper.c: remove 'err_out' label in
 setugid()
References: <20200106182425.20312-1-danielhb413@gmail.com>
 <20200106182425.20312-13-danielhb413@gmail.com>
 <20200107105113.7a443d51@bahia.lan>
 <87wo9vxu9n.fsf@dusky.pond.sub.org>
 <c0bb2a92-7361-9ff3-42c2-022906b6dcad@vivier.eu>
Date: Tue, 14 Jan 2020 08:55:27 +0100
In-Reply-To: <c0bb2a92-7361-9ff3-42c2-022906b6dcad@vivier.eu> (Laurent
 Vivier's message of "Mon, 13 Jan 2020 17:32:31 +0100")
Message-ID: <87pnfmlbf4.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: EzU2WDySP7OehJaLvCVKpQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
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
X-List-Received-Date: Tue, 14 Jan 2020 07:55:39 -0000

Laurent Vivier <laurent@vivier.eu> writes:

> Le 13/01/2020 =C3=A0 16:15, Markus Armbruster a =C3=A9crit=C2=A0:
>> Greg Kurz <groug@kaod.org> writes:
>>=20
>>> On Mon,  6 Jan 2020 15:23:38 -0300
>>> Daniel Henrique Barboza <danielhb413@gmail.com> wrote:
>>>
>>>> 'err_out' can be removed and be replaced by 'return -errno'
>>>> in its only instance in the function.
>>>>
>>>> CC: Greg Kurz <groug@kaod.org>
>>>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>>>> ---
>>>
>>> I don't really mind, but I confirm this doesn't change behavior.
>>>
>>> Acked-by: Greg Kurz <groug@kaod.org>
>>>
>>> What's the plan to get this and the other 9p related patches merged ?
>>> Through the trivial tree or each subsystem tree ?
>>=20
>> I guess qemu-trivial will eventually pick up whatever hasn't been merged
>> by maintainers.
>>=20
>> [...]
>>=20
>
> Yes, but the difficulty will be to sort which ones of the 59 patches
> series to collect...

Collect them all and let git figure out which ones have been applied
already?


