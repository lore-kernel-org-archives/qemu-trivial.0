Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WzT9h-0005Wm-1A
	for mharc-qemu-trivial@gnu.org; Tue, 24 Jun 2014 12:01:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49112)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WzT9X-0005Kd-Ug
	for qemu-trivial@nongnu.org; Tue, 24 Jun 2014 12:01:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WzT9Q-0001OG-G0
	for qemu-trivial@nongnu.org; Tue, 24 Jun 2014 12:00:59 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:47169)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WzT99-0001En-9t; Tue, 24 Jun 2014 12:00:35 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 884A04405B;
	Tue, 24 Jun 2014 20:00:34 +0400 (MSK)
Message-ID: <53A9A0A2.9010904@msgid.tls.msk.ru>
Date: Tue, 24 Jun 2014 20:00:34 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.6.0
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>
References: <53A84797.9040304@gmail.com>	<20140624104614.GD3458@noname.redhat.com>
	<87d2dywoyn.fsf@blackfin.pond.sub.org>
In-Reply-To: <87d2dywoyn.fsf@blackfin.pond.sub.org>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: famz@redhat.com, Chen Gang <gang.chen.5i5j@gmail.com>,
	qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	mreitz@redhat.com, stefanha@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH trivial v2] block.c: Add
 return value for bdrv_append_temp_snapshot() to avoid incorrect failure
 processing issue
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
X-List-Received-Date: Tue, 24 Jun 2014 16:01:07 -0000

24.06.2014 15:01, Markus Armbruster wrote:
> Kevin Wolf <kwolf@redhat.com> writes:
> 
>> Am 23.06.2014 um 17:28 hat Chen Gang geschrieben:
>>> When failure occurs, 'ret' need be set, or may return 0 to indicate success.
>>> And error_propagate() also need be called only one time within a function.
>>>
>>> It is abnormal to prevent bdrv_append_temp_snapshot() return value but still
>>> set errp when error occurs -- although it contents return value internally.
>>>
>>> So let bdrv_append_temp_snapshot() internal return value outside, and let
>>> all things normal, then fix the issue too.
>>>
>>> Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
>>
>> What does this fix?
> 
> It fixes the return value of bdrv_open() when
> bdrv_append_temp_snapshot() fails.  Before this patch, it returns a
> positive value, which is wrong.  After the patch, it returns the
> negative error code bdrv_append_temp_snapshot() now returns.

So, what should be done there?   Kevin, maybe you should pick this up
instead of going -trivial route?

>> Having both a return value and an Error* object is duplication and
>> only a sign that a function hasn't been fully converted to the Error
>> framework yet. We shouldn't introduce new instances of this without a
>> very good reason.
> 
> Maybe.  But I very much prefer
> 
>         ret = foo(arg, errp);
>         if (ret < 0) {
>             return ret;
>         }
> 
> over
> 
>         Error *local_err = NULL;
> 
>         foo(arg, &local_err);
>         if (local_err) {
>             error_propagate(errp, local_err);
>             return;
>         }

Yes, this new error propagation is a bit ugly, I dislike it too.

Thanks,

/mjt


