Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TxeGL-0006O3-5P
	for mharc-qemu-trivial@gnu.org; Tue, 22 Jan 2013 08:51:41 -0500
Received: from eggs.gnu.org ([208.118.235.92]:41567)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <fred.konrad@greensocs.com>) id 1TxeGH-0006EV-Jx
	for qemu-trivial@nongnu.org; Tue, 22 Jan 2013 08:51:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <fred.konrad@greensocs.com>) id 1TxeGF-0006Lx-Pq
	for qemu-trivial@nongnu.org; Tue, 22 Jan 2013 08:51:37 -0500
Received: from greensocs.com ([87.106.252.221]:55619
	helo=s15328186.onlinehome-server.info)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <fred.konrad@greensocs.com>)
	id 1TxeGB-0006KE-Bv; Tue, 22 Jan 2013 08:51:31 -0500
Received: from localhost (unknown [127.0.0.1])
	by s15328186.onlinehome-server.info (Postfix) with ESMTP id 8730443EE2A;
	Tue, 22 Jan 2013 13:51:28 +0000 (UTC)
Received: from s15328186.onlinehome-server.info ([127.0.0.1])
	by localhost (s15328186.onlinehome-server.info [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id 00CS+00g63zS; Tue, 22 Jan 2013 14:51:26 +0100 (CET)
Received: by s15328186.onlinehome-server.info (Postfix, from userid 491)
	id 128AB43EE2B; Tue, 22 Jan 2013 14:51:26 +0100 (CET)
Received: from compaq.katmai.xl.cx (lan31-11-83-155-143-136.fbx.proxad.net
	[83.155.143.136])
	by s15328186.onlinehome-server.info (Postfix) with ESMTPSA id
	7709D43EE2A; Tue, 22 Jan 2013 14:51:25 +0100 (CET)
Message-ID: <50FE995C.3080504@greensocs.com>
Date: Tue, 22 Jan 2013 14:51:24 +0100
From: =?ISO-8859-1?Q?KONRAD_Fr=E9d=E9ric?= <fred.konrad@greensocs.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130110 Thunderbird/17.0.2
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>
References: <1358357540-29862-1-git-send-email-armbru@redhat.com>
	<1358357540-29862-4-git-send-email-armbru@redhat.com>
	<20130117111951.GH2586@stefanha-thinkpad.redhat.com>
	<87fw20rllu.fsf@blackfin.pond.sub.org>
	<87y5fl1pp1.fsf@blackfin.pond.sub.org>
In-Reply-To: <87y5fl1pp1.fsf@blackfin.pond.sub.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 87.106.252.221
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 03/11] hw/9pfs: Fix
 unchecked strdup() by converting to g_strdup()
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
X-List-Received-Date: Tue, 22 Jan 2013 13:51:39 -0000

On 22/01/2013 11:23, Markus Armbruster wrote:
> Markus Armbruster <armbru@redhat.com> writes:
>
>> Stefan Hajnoczi <stefanha@gmail.com> writes:
>>
>>> On Wed, Jan 16, 2013 at 06:32:12PM +0100, Markus Armbruster wrote:
>>>> diff --git a/hw/9pfs/virtio-9p-device.c b/hw/9pfs/virtio-9p-device.c
>>>> index 6eab7f7..74155fb 100644
>>>> --- a/hw/9pfs/virtio-9p-device.c
>>>> +++ b/hw/9pfs/virtio-9p-device.c
>>>> @@ -94,7 +94,7 @@ VirtIODevice *virtio_9p_init(DeviceState *dev, V9fsConf *conf)
>>>>           exit(1);
>>>>       }
>>>>   
>>>> -    s->tag = strdup(conf->tag);
>>>> +    s->tag = g_strdup(conf->tag);
>>>>       s->ctx.uid = -1;
>>>>   
>>>>       s->ops = fse->ops;
>>> s->tag is leaked.  Want to send a follow-up patch to g_free() it?
>> I'll give it a try.
> Mind if I wait for Fred Konrad's virtio refactoring to settle?  It
> should make the fix easier, and avoid getting into his way with
> pointless conflicts.
Hi,

Maybe it's due to missing exit function?

Do you want me to add an exit function to g_free this conf->tag?

Fred

