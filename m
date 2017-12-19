Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eRKrG-0004Gc-3E
	for mharc-qemu-trivial@gnu.org; Tue, 19 Dec 2017 11:35:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56390)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1eRKrB-0004Ew-69
	for qemu-trivial@nongnu.org; Tue, 19 Dec 2017 11:35:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1eRKr7-0000xd-5M
	for qemu-trivial@nongnu.org; Tue, 19 Dec 2017 11:35:05 -0500
Received: from mx1.redhat.com ([209.132.183.28]:34046)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1eRKr4-0000w7-JP; Tue, 19 Dec 2017 11:34:58 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B656D61472;
	Tue, 19 Dec 2017 16:34:57 +0000 (UTC)
Received: from [10.33.192.189] (dhcp-192-189.str.redhat.com [10.33.192.189])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 52A0960C80;
	Tue, 19 Dec 2017 16:34:53 +0000 (UTC)
To: "Daniel P. Berrange" <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	qemu-trivial@nongnu.org, sw@weilnetz.de
References: <1513700253-10045-1-git-send-email-thuth@redhat.com>
	<20171219162157.GD3567@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <7d919cca-4dc1-6591-1a01-4143d3fe2b3b@redhat.com>
Date: Tue, 19 Dec 2017 17:34:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <20171219162157.GD3567@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 19 Dec 2017 16:34:57 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] monitor: Remove legacy "-mon default=on"
 parameter
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
X-List-Received-Date: Tue, 19 Dec 2017 16:35:08 -0000

On 19.12.2017 17:21, Daniel P. Berrange wrote:
> On Tue, Dec 19, 2017 at 05:17:33PM +0100, Thomas Huth wrote:
>> The "default" parameter of the "-mon" option is useless since
>> QEMU v2.4.0, and marked as deprecated since QEMU v2.8.0. That
>> should have been long enough to let people update their scripts,
>> so time to remove it now.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>  monitor.c     | 3 ---
>>  qemu-doc.texi | 9 ---------
>>  vl.c          | 4 ----
>>  3 files changed, 16 deletions(-)
>>
>> diff --git a/monitor.c b/monitor.c
>> index e36fb53..e53c6e1 100644
>> --- a/monitor.c
>> +++ b/monitor.c
>> @@ -4141,9 +4141,6 @@ QemuOptsList qemu_mon_opts =3D {
>>              .name =3D "chardev",
>>              .type =3D QEMU_OPT_STRING,
>>          },{
>> -            .name =3D "default",  /* deprecated */
>> -            .type =3D QEMU_OPT_BOOL,
>> -        },{
>>              .name =3D "pretty",
>>              .type =3D QEMU_OPT_BOOL,
>>          },
>> diff --git a/qemu-doc.texi b/qemu-doc.texi
>> index d9861b3..6913b32 100644
>> --- a/qemu-doc.texi
>> +++ b/qemu-doc.texi
>> @@ -2401,15 +2401,6 @@ setting ``-machine kernel_irqchip=3Doff''.
>>  The ``-no-kvm'' argument is now a synonym for setting
>>  ``-machine accel=3Dtcg''.
>> =20
>> -@subsection -mon default=3Don (since 2.4.0)
>> -
>> -The ``default'' option to the ``-mon'' argument is
>> -now ignored. When multiple monitors were enabled, it
>> -indicated which monitor would receive log messages
>> -from the various subsystems. This feature is no longer
>> -required as messages are now only sent to the monitor
>> -in response to explicitly monitor commands.
>> -
>>  @subsection -vnc tls (since 2.5.0)
>=20
> It occurs to me that qemu.org only ever displays the very latest versio=
n
> of the qemu-tech doc.
>=20
> So if someone has deployed QEMU 2.11, and reads the doc online, once yo=
ur
> patches are commited, all the info about deprecated features that affec=
t
> their 2.11 version will have gone, despite 2.12 not yet existing.

No, as far as I know, the online qemu-doc is only updated for release
candidates and releases, so the current information will stay there a
little bit longer.

> So rather than deleting entries from the deprecation appendix, should
> we move them to a separate appendix, or "Formerly deprecated, now
> deleted" features. Or just change the annotation
>=20
>   (since 2.4.0)
>=20
> to
>=20
>   (deprecated since 2.4.0, deleted in 2.12.0)

Please, no. I really don't think that we should carry around the old
cruft forever, even if it's just in the deprecation chapter of the
qemu-doc. At one point in time, we should really just let it go. If
users still want to get information about this afterwards, they can use
Google to dig out older versions of the qemu-doc or the various
ChangeLog pages in our Wiki, where we describe the deprecation of
parameters, too.

 Thomas

