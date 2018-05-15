Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fIaAc-0004nk-RJ
	for mharc-qemu-trivial@gnu.org; Tue, 15 May 2018 09:39:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59447)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fIaAZ-0004lV-5f
	for qemu-trivial@nongnu.org; Tue, 15 May 2018 09:39:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fIaAX-0001kp-VL
	for qemu-trivial@nongnu.org; Tue, 15 May 2018 09:39:11 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:38180 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1fIaAQ-0001iW-7W; Tue, 15 May 2018 09:39:02 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C41F47D843;
	Tue, 15 May 2018 13:39:00 +0000 (UTC)
Received: from [10.36.116.96] (ovpn-116-96.ams2.redhat.com [10.36.116.96])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CB8781C551;
	Tue, 15 May 2018 13:38:54 +0000 (UTC)
To: Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster
	<armbru@redhat.com>, Olaf Hering <olaf@aepfle.de>
Cc: qemu-trivial@nongnu.org, Fam Zheng <famz@redhat.com>,
	"open list:All patches CC here" <qemu-devel@nongnu.org>,
	Stefan Hajnoczi <stefanha@redhat.com>
References: <20180515055949.6446-1-olaf@aepfle.de>
	<87mux1jrf7.fsf@dusky.pond.sub.org>
	<7c3cb275-1568-ee34-314e-c3400b8148c2@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <27f1e01f-4f06-4cd7-d546-f9654c706be4@redhat.com>
Date: Tue, 15 May 2018 15:38:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <7c3cb275-1568-ee34-314e-c3400b8148c2@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Tue, 15 May 2018 13:39:00 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Tue, 15 May 2018 13:39:00 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] replace functions which are
 only available in glib-2.24
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
X-List-Received-Date: Tue, 15 May 2018 13:39:12 -0000

On 15.05.2018 10:41, Paolo Bonzini wrote:
> On 15/05/2018 09:42, Markus Armbruster wrote:
>> Olaf Hering <olaf@aepfle.de> writes:
>>
>>> Currently the minimal supported version of glib is 2.22.
>>> Since testing is done with a glib that claims to be 2.22, but in fact
>>> has APIs from newer version of glib, this bug was not caught during
>>> submit of the patch referenced below.
>>>
>>> Replace g_realloc_n, which is available only since 2.24, with g_renew.
>>
>> We're about to bump our required GLib version to 2.34.  See
>> https://lists.gnu.org/archive/html/qemu-devel/2018-05/msg02562.html
>> Message-ID: <751a3b4f-55ef-dec0-aec9-6b48922b7843@redhat.com>
>>
>> However, the patch may make sense for stable anyway.
> 
> It's a good idea even for non-stable.  In the end, g_*alloc*_n are
> rarely needed, and almost always g_*new* is better as it provides better
> type safety.  I'm queuing the patch, and we should consider adding a
> checkpatch rule to suggest not using these functions.

Please do not queue this version of the patch - Olaf sent a v2 where he
fixed the obvious bug with "IOVAMapping *" vs. "IOVAMapping".

> Paolo
> 
>>> Fixes commit 418026ca43 ("util: Introduce vfio helpers")
>>>
>>> Signed-off-by: Olaf Hering <olaf@aepfle.de>
>>> ---
>>>
>>> This must go into stable-2.12.
>>
>> Please see docs/devel/stable-process.rst for how to get a patch into a
>> stable release.
>>
>>>  util/vfio-helpers.c | 6 ++----
>>>  1 file changed, 2 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/util/vfio-helpers.c b/util/vfio-helpers.c
>>> index 006674c916..5fd4f5f212 100644
>>> --- a/util/vfio-helpers.c
>>> +++ b/util/vfio-helpers.c
>>> @@ -522,8 +522,7 @@ static IOVAMapping *qemu_vfio_add_mapping(QEMUVFIOState *s,
>>>  
>>>      assert(index >= 0);
>>>      s->nr_mappings++;
>>> -    s->mappings = g_realloc_n(s->mappings, sizeof(s->mappings[0]),
>>> -                              s->nr_mappings);
>>> +    s->mappings = g_renew(IOVAMapping *, s->mappings, s->nr_mappings);
>>
>> I'm afraid this switches from allocating a bunch of IOVAMapping to a
>> bunch of IOVAMapping *.  My gcc duly warns.

See v2 of the patch where Olaf fixed this already.

 Thomas

