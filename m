Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iT5zZ-0002L7-Pq
	for mharc-qemu-trivial@gnu.org; Fri, 08 Nov 2019 10:16:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48759)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1iT5zV-0002Hh-Rs
 for qemu-trivial@nongnu.org; Fri, 08 Nov 2019 10:16:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1iT5zT-0001hR-9h
 for qemu-trivial@nongnu.org; Fri, 08 Nov 2019 10:16:01 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:31141
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1iT5zT-0001fx-5O
 for qemu-trivial@nongnu.org; Fri, 08 Nov 2019 10:15:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573226157;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9uGkM2ScxKkd527ZctXcwbbvuzGfdXH3Rau2IM2RRUk=;
 b=aUxhLplXgb8ZYPWdrAduh3dhiwWYv4vWkR15fnpROZZ+rfaaIHnqgVK/EtIJ5UiFrRlooM
 wd58gxqJ1b3z0z2ZfiOKqDB5GHLmsNpJrLVy3VkiHOFFxAN8Jq4nm8k2fHQgMlW9iaiMWh
 ayj49PXh5PZ7B6sW7y3OjOtmXEziwZc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-yKCHPV2QNDSCXZagHpSY1A-1; Fri, 08 Nov 2019 10:15:53 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 979B48017DD;
 Fri,  8 Nov 2019 15:15:52 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.118.123])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 65C405DA81;
 Fri,  8 Nov 2019 15:15:52 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D940F11385C9; Fri,  8 Nov 2019 16:15:50 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Claudio Fontana <cfontana@suse.de>,
 qemu-trivial@nongnu.org
Subject: Re: [PATCH v2] ivshmem-server: Terminate also on SIGINT
References: <99c1a7bd-1876-66a2-4b8e-d5bc86116fe7@web.de>
 <fed41c57-c433-9723-e5db-5eb3a10c4f8b@siemens.com>
Date: Fri, 08 Nov 2019 16:15:50 +0100
In-Reply-To: <fed41c57-c433-9723-e5db-5eb3a10c4f8b@siemens.com> (Jan Kiszka's
 message of "Fri, 8 Nov 2019 10:08:31 +0100")
Message-ID: <87a7968km1.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: yKCHPV2QNDSCXZagHpSY1A-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
X-List-Received-Date: Fri, 08 Nov 2019 15:16:04 -0000

Jan Kiszka <jan.kiszka@siemens.com> writes:

> On 03.08.19 15:22, Jan Kiszka wrote:
>> From: Jan Kiszka <jan.kiszka@siemens.com>
>>
>> Allows to shutdown a foreground session via ctrl-c.
>>
>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>> ---
>>
>> Changes in v2:
>>   - adjust error message
>>
>>   contrib/ivshmem-server/main.c | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/contrib/ivshmem-server/main.c b/contrib/ivshmem-server/main=
.c
>> index 197c79c57e..e4cd35f74c 100644
>> --- a/contrib/ivshmem-server/main.c
>> +++ b/contrib/ivshmem-server/main.c
>> @@ -223,8 +223,9 @@ main(int argc, char *argv[])
>>       sa_quit.sa_handler =3D ivshmem_server_quit_cb;
>>       sa_quit.sa_flags =3D 0;
>>       if (sigemptyset(&sa_quit.sa_mask) =3D=3D -1 ||
>> -        sigaction(SIGTERM, &sa_quit, 0) =3D=3D -1) {
>> -        perror("failed to add SIGTERM handler; sigaction");
>> +        sigaction(SIGTERM, &sa_quit, 0) =3D=3D -1 ||
>> +        sigaction(SIGINT, &sa_quit, 0) =3D=3D -1) {
>> +        perror("failed to add signal handler; sigaction");
>>           goto err;
>>       }
>>
>> --
>> 2.16.4
>>
>>
>
> ...and this one for you as well, Markus?

Cc: qemu-trivial


