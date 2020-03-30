Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jIv9C-0006co-M4
	for mharc-qemu-trivial@gnu.org; Mon, 30 Mar 2020 10:12:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54479)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jIv9A-0006Zx-6c
 for qemu-trivial@nongnu.org; Mon, 30 Mar 2020 10:12:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1jIv99-0002D8-0P
 for qemu-trivial@nongnu.org; Mon, 30 Mar 2020 10:12:12 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:45600)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1jIv98-0002CS-TA
 for qemu-trivial@nongnu.org; Mon, 30 Mar 2020 10:12:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585577530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pF1F6NpNuBSwTTOg2T/k/CDpYiduV/eJ2TCcoScwUnE=;
 b=VtVqziosPXsrp7pLZmBbzDcoienikU7np8/F/iMNRKYhQPhfcQ16j7zNa14Ad/H/yPbDtN
 rk0nT8PK3d/I7/o6862zylEO0CJzpt3Oc/J8NfCg0qfGNfxsqjPRslM7u5mt8dYszFeC+p
 PFZEMhSowS0suFovtLiFaAZpxrjSSGk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-JfULx0OPM6eT8XoXc--NDA-1; Mon, 30 Mar 2020 10:12:04 -0400
X-MC-Unique: JfULx0OPM6eT8XoXc--NDA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 166E6800D5F;
 Mon, 30 Mar 2020 14:12:03 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-69.ams2.redhat.com
 [10.36.112.69])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B1A521036D00;
 Mon, 30 Mar 2020 14:11:59 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 412BB11385E2; Mon, 30 Mar 2020 16:11:58 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: Dietmar Maurer <dietmar@proxmox.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org, Sameeh Jubran <sjubran@redhat.com>,
 qemu-stable@nongnu.org, Fakhri Zulkifli <mohdfakhrizulkifli@gmail.com>,
 Basil Salman <basil@daynix.com>
Subject: Re: [PATCH-for-5.0] qga-posix: Avoid crashing process when failing to
 allocate memory
References: <20200324194836.21539-1-philmd@redhat.com>
 <1242083041.1.1585117162620@webmail.proxmox.com>
 <6be54d1f-e5fc-5b34-ba4d-fa050029f26b@redhat.com>
Date: Mon, 30 Mar 2020 16:11:58 +0200
In-Reply-To: <6be54d1f-e5fc-5b34-ba4d-fa050029f26b@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Wed, 25 Mar 2020 13:10:11
 +0100")
Message-ID: <87mu7yue35.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
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
X-List-Received-Date: Mon, 30 Mar 2020 14:12:13 -0000

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> On 3/25/20 7:19 AM, Dietmar Maurer wrote:
>> but error_setg() also calls malloc, so this does not help at all?
>
> IIUC the problem, you can send a QMP command to ask to read let's say
> 3GB of a file, and QEMU crashes. But this doesn't mean there the .heap
> is empty, there is probably few bytes still available, enough to
> respond with an error message.

We've discussed how to handle out-of-memory conditions many times.
Here's one instance:

    Subject: When it's okay to treat OOM as fatal?
    Message-ID: <87efcqniza.fsf@dusky.pond.sub.org>
    https://lists.nongnu.org/archive/html/qemu-devel/2018-10/msg03212.html

No improvement since then; there's no guidance on when to check for OOM.
Actual code tends to check only "large" allocations (for subjective
values of "large").

I reiterate my opinion that whatever OOM handling we have is too
unreliable to be worth much, since it can only help when (1) allocations
actually fail (they generally don't[*]), and (2) the allocation that
fails is actually handled (they generally aren't), and (3) the handling
actually works (we don't test OOM, so it generally doesn't).


[*] Linux overcommits memory, which means malloc() pretty much always
succeeds, but when you try to use "too much" of the memory you
supposedly allocated, a lethal signal is coming your way.  Reasd the
thread I quoted for examples.


