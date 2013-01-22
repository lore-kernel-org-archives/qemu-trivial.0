Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Txb1D-0000Hu-1Q
	for mharc-qemu-trivial@gnu.org; Tue, 22 Jan 2013 05:23:51 -0500
Received: from eggs.gnu.org ([208.118.235.92]:41076)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Txb1A-0000BP-0s
	for qemu-trivial@nongnu.org; Tue, 22 Jan 2013 05:23:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Txb18-0004ap-Tn
	for qemu-trivial@nongnu.org; Tue, 22 Jan 2013 05:23:47 -0500
Received: from mx1.redhat.com ([209.132.183.28]:12013)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1Txb15-0004Y4-9l; Tue, 22 Jan 2013 05:23:43 -0500
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r0MANesr011722
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 22 Jan 2013 05:23:40 -0500
Received: from blackfin.pond.sub.org (ovpn-116-31.ams2.redhat.com
	[10.36.116.31])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r0MANdmx025878; Tue, 22 Jan 2013 05:23:39 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 6096D200AA; Tue, 22 Jan 2013 11:23:38 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
References: <1358357540-29862-1-git-send-email-armbru@redhat.com>
	<1358357540-29862-4-git-send-email-armbru@redhat.com>
	<20130117111951.GH2586@stefanha-thinkpad.redhat.com>
	<87fw20rllu.fsf@blackfin.pond.sub.org>
Date: Tue, 22 Jan 2013 11:23:38 +0100
In-Reply-To: <87fw20rllu.fsf@blackfin.pond.sub.org> (Markus Armbruster's
	message of "Thu, 17 Jan 2013 14:21:33 +0100")
Message-ID: <87y5fl1pp1.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, fred.konrad@greensocs.com
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
X-List-Received-Date: Tue, 22 Jan 2013 10:23:49 -0000

Markus Armbruster <armbru@redhat.com> writes:

> Stefan Hajnoczi <stefanha@gmail.com> writes:
>
>> On Wed, Jan 16, 2013 at 06:32:12PM +0100, Markus Armbruster wrote:
>>> diff --git a/hw/9pfs/virtio-9p-device.c b/hw/9pfs/virtio-9p-device.c
>>> index 6eab7f7..74155fb 100644
>>> --- a/hw/9pfs/virtio-9p-device.c
>>> +++ b/hw/9pfs/virtio-9p-device.c
>>> @@ -94,7 +94,7 @@ VirtIODevice *virtio_9p_init(DeviceState *dev, V9fsConf *conf)
>>>          exit(1);
>>>      }
>>>  
>>> -    s->tag = strdup(conf->tag);
>>> +    s->tag = g_strdup(conf->tag);
>>>      s->ctx.uid = -1;
>>>  
>>>      s->ops = fse->ops;
>>
>> s->tag is leaked.  Want to send a follow-up patch to g_free() it?
>
> I'll give it a try.

Mind if I wait for Fred Konrad's virtio refactoring to settle?  It
should make the fix easier, and avoid getting into his way with
pointless conflicts.

