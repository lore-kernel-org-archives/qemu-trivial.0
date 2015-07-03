Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZB1nU-000543-Ki
	for mharc-qemu-trivial@gnu.org; Fri, 03 Jul 2015 10:18:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52961)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1ZB1nS-00050D-7T
	for qemu-trivial@nongnu.org; Fri, 03 Jul 2015 10:18:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1ZB1nR-0002WY-2g
	for qemu-trivial@nongnu.org; Fri, 03 Jul 2015 10:18:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56947)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1ZB1nJ-0002So-3s; Fri, 03 Jul 2015 10:18:21 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 81B41C2304;
	Fri,  3 Jul 2015 14:18:20 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-44.ams2.redhat.com
	[10.36.116.44])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t63EIIlr031321
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Fri, 3 Jul 2015 10:18:20 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 2CA2C303FEAE; Fri,  3 Jul 2015 16:18:18 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: =?utf-8?B?S8WRdsOhZ8OzIFpvbHTDoW4=?= <dirty.ice.hu@gmail.com>
References: <c7aaec779e13932db2c7dd4cce2700b41f162092.1435923273.git.DirtY.iCE.hu@gmail.com>
	<87616175u3.fsf@blackfin.pond.sub.org> <5596927F.5000407@gmail.com>
Date: Fri, 03 Jul 2015 16:18:18 +0200
In-Reply-To: <5596927F.5000407@gmail.com> (=?utf-8?B?IkvFkXbDoWfDsyBab2x0?=
	=?utf-8?B?w6FuIidz?= message of "Fri, 3 Jul 2015 15:47:43 +0200")
Message-ID: <87y4ix1g0l.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	qemu-devel@nongnu.org, "open list:Block layer core" <qemu-block@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] opts: produce valid command
	line in qemu_opts_print
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
X-List-Received-Date: Fri, 03 Jul 2015 14:18:31 -0000

"K=C5=91v=C3=A1g=C3=B3 Zolt=C3=A1n" <dirty.ice.hu@gmail.com> writes:

> 2015-07-03 15:01 keltez=C3=A9ssel, Markus Armbruster =C3=ADrta:
>> "K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n" <dirty.ice.hu@gmail.com> writes:
>>
>>> This will let us print options in a format that the user would actually
>>> write it on the command line (foo=3Dbar,baz=3Dasd,etc=3Ddef), without
>>> prepending a spurious comma at the beginning of the list, or quoting
>>> values unnecessarily.  This patch provides the following changes:
>>> * write and id=3D, if the option has an id
>>> * do not print separator before the first element
>>> * do not quote string arguments
>>> * properly escape commas (,) for QEMU
>>>
>>> Signed-off-by: K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n <DirtY.iCE.hu@gmail.c=
om>
>>> ---
>>>
>>> Changes from patch submitted as part of `qapi flattening':
>>> * no longer tries to do proper escaping for the shell
>>>
>>>   block.c            |  2 +-
>>>   util/qemu-option.c | 30 +++++++++++++++++++++++++++---
>>>   2 files changed, 28 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/block.c b/block.c
>>> index 7e130cc..78a5304 100644
>>> --- a/block.c
>>> +++ b/block.c
>>> @@ -3813,7 +3813,7 @@ void bdrv_img_create(const char *filename, const =
char *fmt,
>>>       }
>>>
>>>       if (!quiet) {
>>> -        printf("Formatting '%s', fmt=3D%s", filename, fmt);
>>> +        printf("Formatting '%s', fmt=3D%s ", filename, fmt);
>>>           qemu_opts_print(opts, " ");
>>>           puts("");
>>>       }
>>> diff --git a/util/qemu-option.c b/util/qemu-option.c
>>> index efe9d27..55ef172 100644
>>> --- a/util/qemu-option.c
>>> +++ b/util/qemu-option.c
>>> @@ -730,14 +730,36 @@ void qemu_opts_del(QemuOpts *opts)
>>>       g_free(opts);
>>>   }
>>>
>>> -void qemu_opts_print(QemuOpts *opts, const char *sep)
>>> +/* print value, escaping any commas in value */
>>> +static void escaped_print(const char *value)
>>
>> Have you searched the tree for existing code doing this?
>
> I didn't found any function like that.

Okay.

>>> +{
>>> +    const char *ptr;
>>> +
>>> +    for (ptr =3D value; *ptr; ++ptr) {
>>> +        if (*ptr =3D=3D ',') {
>>> +            printf(",,");
>>> +        } else {
>>> +            putchar(*ptr);
>>> +        }
>>> +    }
>>
>> Slightly simpler:
>>
>>          if (*ptr =3D=3D ',') {
>>              putchar(',');
>>          }
>>          putchar(*ptr);
>>
>> Matter of taste.
>
> I also like it better that way. Should I send a v2 patch?

If it's not too much trouble...  Feel free to keep my R-by then.

