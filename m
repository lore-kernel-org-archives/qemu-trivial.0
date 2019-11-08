Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iT5yW-0001Yd-VK
	for mharc-qemu-trivial@gnu.org; Fri, 08 Nov 2019 10:15:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48561)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1iT5yR-0001TV-Fg
 for qemu-trivial@nongnu.org; Fri, 08 Nov 2019 10:14:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1iT5yO-0000ja-TW
 for qemu-trivial@nongnu.org; Fri, 08 Nov 2019 10:14:54 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:37740)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1iT5yO-0000aQ-PD
 for qemu-trivial@nongnu.org; Fri, 08 Nov 2019 10:14:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573226086;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZwvPziloipJB6P0uwRN104nHi68kFEr9g6YUZh8HzW4=;
 b=DfvxS+rnBA1xSU+OIpb5N7H6FCUTf0HzZpi8D+Q8tjTQfCQFS/DXKI4Bje4cJMfFbQLyzD
 YCzhfU7Da1/9MhXJD/reUoVlwPPl2WRfNubkKqY1ow/8j4r9yb0uBSNuzr3bAPeu9QGJaj
 a+7xYKNAwPHvCHE+Ntnq6t77VA/62LM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-21-3w-hHovjNHmjlMOoP7CfBg-1; Fri, 08 Nov 2019 10:14:44 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6228D180496F;
 Fri,  8 Nov 2019 15:14:43 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.118.123])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F4E75D6B7;
 Fri,  8 Nov 2019 15:14:43 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9CB051136447; Fri,  8 Nov 2019 16:14:41 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Claudio Fontana <claudio.fontana@suse.com>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-trivial@nongnu.org
Subject: Re: [PATCH v2] ivshmem-server: Clean up shmem on shutdown
References: <d938a62c-7538-9d2b-cc0a-13b240ab9141@web.de>
 <2587815f-e4eb-1f44-0b2d-5b77e3337553@suse.de>
 <7c4cb51d-ce45-4324-811b-4674ab9aa691@siemens.com>
Date: Fri, 08 Nov 2019 16:14:41 +0100
In-Reply-To: <7c4cb51d-ce45-4324-811b-4674ab9aa691@siemens.com> (Jan Kiszka's
 message of "Fri, 8 Nov 2019 10:08:19 +0100")
Message-ID: <87eeyi8kny.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: 3w-hHovjNHmjlMOoP7CfBg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
X-List-Received-Date: Fri, 08 Nov 2019 15:14:57 -0000

Jan Kiszka <jan.kiszka@siemens.com> writes:

> On 06.08.19 15:01, Claudio Fontana wrote:
>> On 8/5/19 7:54 AM, Jan Kiszka wrote:
>>> From: Jan Kiszka <jan.kiszka@siemens.com>
>>>
>>> So far, the server leaves the posix shared memory object behind when
>>> terminating, requiring the user to explicitly remove it in order to
>>> start a new instance.
>>>
>>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>>> ---
>>>
>>> Changes in v2:
>>>   - respect use_shm_open
>>>   - also clean up in ivshmem_server_start error path
>>>
>>>   contrib/ivshmem-server/ivshmem-server.c | 6 ++++++
>>>   1 file changed, 6 insertions(+)
>>>
>>> diff --git a/contrib/ivshmem-server/ivshmem-server.c b/contrib/ivshmem-=
server/ivshmem-server.c
>>> index 77f97b209c..88daee812d 100644
>>> --- a/contrib/ivshmem-server/ivshmem-server.c
>>> +++ b/contrib/ivshmem-server/ivshmem-server.c
>>> @@ -353,6 +353,9 @@ ivshmem_server_start(IvshmemServer *server)
>>>   err_close_sock:
>>>       close(sock_fd);
>>>   err_close_shm:
>>> +    if (server->use_shm_open) {
>>> +        shm_unlink(server->shm_path);
>>> +    }
>>>       close(shm_fd);
>>>       return -1;
>>>   }
>>> @@ -370,6 +373,9 @@ ivshmem_server_close(IvshmemServer *server)
>>>       }
>>>
>>>       unlink(server->unix_sock_path);
>>> +    if (server->use_shm_open) {
>>> +        shm_unlink(server->shm_path);
>>> +    }
>>>       close(server->sock_fd);
>>>       close(server->shm_fd);
>>>       server->sock_fd =3D -1;
>>> --
>>> 2.16.4
>>>
>>>
>>
>> Reviewed-by: Claudio Fontana <claudio.fontana@suse.com>
>
> Markus, would you take this?

ivshmem has no maintainer.  I you need me to serve as a pull request
monkey of last resort, I can do that.  However, for this one,
qemu-trivial (cc'ed) should do.


