Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iWdHc-00033M-L4
	for mharc-qemu-trivial@gnu.org; Mon, 18 Nov 2019 04:25:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57354)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1iWdHZ-0002xu-OY
 for qemu-trivial@nongnu.org; Mon, 18 Nov 2019 04:25:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1iWdHY-0000un-5u
 for qemu-trivial@nongnu.org; Mon, 18 Nov 2019 04:25:17 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:33474
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1iWdHY-0000tm-2x
 for qemu-trivial@nongnu.org; Mon, 18 Nov 2019 04:25:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574069115;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2S8PxAlPdaJuCiTLvcJTV307qqZutNNoEs5FrMeBMdI=;
 b=gznwn0A/TNuaDOlM+fOXRZBHH+T/tgbqBC0V5W/V8hhoqpUsfrSmne2v7XfduGTESI1Iym
 GCd0bEwjjfjy76kwKKrbtyBWkGD7IV3f29AeK9wNm2+8ixfV/37s5OYUJir7raXSrhR0t7
 ZQVN23VsAorjpSafAg3tYfVmSXj1doQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430-0cRZqkQTPA6YbEwA7nrIrA-1; Mon, 18 Nov 2019 04:25:12 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 84C73107ACC4;
 Mon, 18 Nov 2019 09:25:11 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-97.ams2.redhat.com
 [10.36.116.97])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AC98160856;
 Mon, 18 Nov 2019 09:25:01 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3CE9B1138648; Mon, 18 Nov 2019 10:25:00 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>,  Peter Maydell
 <peter.maydell@linaro.org>,  Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,  QEMU Trivial
 <qemu-trivial@nongnu.org>,  QEMU Developers <qemu-devel@nongnu.org>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,  Paolo
 Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH for-4.2] hw/i386: Fix compiler warning when CONFIG_IDE_ISA
 is disabled
References: <20191115145049.26868-1-thuth@redhat.com>
 <CAFEAcA-EuQVBtr=BCE5sdHo+LMv8XchHUSPM=CgSYxPVryWKZg@mail.gmail.com>
 <273a3123-9eef-c78e-5b83-833a21e3988c@redhat.com>
 <CAFEAcA9N+T=M=5-xb3ahRMqD6oxhm5Lx55-1Mtk1vXsRJEomwA@mail.gmail.com>
 <85b5fbcc-e06b-7ce2-0a97-7fdc156915cd@redhat.com>
 <21520139-af31-6ca7-c505-9252ca2bacde@redhat.com>
Date: Mon, 18 Nov 2019 10:25:00 +0100
In-Reply-To: <21520139-af31-6ca7-c505-9252ca2bacde@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Fri, 15 Nov 2019 21:31:43
 +0100")
Message-ID: <874kz1y1sj.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: 0cRZqkQTPA6YbEwA7nrIrA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Mon, 18 Nov 2019 09:25:18 -0000

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

[...]
> The related question is, is it OK to use size_t to iterate over an array?
>
>   for (size_t i =3D 0; i < ARRAY_SIZE(array); i++) {
>     ...
>   }

My rule of thumb on integer types is "whatever lets me avoid
not-obviously-safe conversions (implicit ones in particular) with the
least type cast clutter.

Quite often, int fits the bill.  But not always.

To reply to your example: depends on what's hiding in the ... :)

> Asking in this thread so we can modify CODING_STYLE accordingly :)


