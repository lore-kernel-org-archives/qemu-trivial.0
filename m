Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZkZTw-00045Y-MB
	for mharc-qemu-trivial@gnu.org; Fri, 09 Oct 2015 11:21:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41852)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1ZkSjM-0000Sj-MI
	for qemu-trivial@nongnu.org; Fri, 09 Oct 2015 04:08:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1ZkSjL-0008UC-H7
	for qemu-trivial@nongnu.org; Fri, 09 Oct 2015 04:08:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34575)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>)
	id 1ZkSjG-0008SB-Tg; Fri, 09 Oct 2015 04:08:39 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id 680792F90CF;
	Fri,  9 Oct 2015 08:08:38 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-113-67.phx2.redhat.com
	[10.3.113.67])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t9988ade013313; Fri, 9 Oct 2015 04:08:37 -0400
To: Markus Armbruster <armbru@redhat.com>
References: <1444332916-16476-1-git-send-email-thuth@redhat.com>
	<1444332916-16476-5-git-send-email-thuth@redhat.com>
	<5616D0FF.5030909@redhat.com> <87fv1k1qu8.fsf@blackfin.pond.sub.org>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <56177603.40307@redhat.com>
Date: Fri, 9 Oct 2015 10:08:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <87fv1k1qu8.fsf@blackfin.pond.sub.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Thomas Huth <thuth@redhat.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 4/5] tests/i44fx-test: No
 need for zeroing memory before memset
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
X-List-Received-Date: Fri, 09 Oct 2015 08:08:45 -0000

On 10/09/15 08:46, Markus Armbruster wrote:
> Laszlo Ersek <lersek@redhat.com> writes:
> 
>> On 10/08/15 21:35, Thomas Huth wrote:
>>> Change a g_malloc0 into g_malloc since the following
>>> memset fills the whole buffer anyway.
>>>
>>> Cc: Laszlo Ersek <lersek@redhat.com>
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>>  tests/i440fx-test.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/tests/i440fx-test.c b/tests/i440fx-test.c
>>> index d0bc8de..7fa1709 100644
>>> --- a/tests/i440fx-test.c
>>> +++ b/tests/i440fx-test.c
>>> @@ -191,7 +191,7 @@ static void write_area(uint32_t start, uint32_t end, uint8_t value)
>>>      uint32_t size = end - start + 1;
>>>      uint8_t *data;
>>>  
>>> -    data = g_malloc0(size);
>>> +    data = g_malloc(size);
>>>      memset(data, value, size);
>>>      memwrite(start, data, size);
>>>  
>>>
>>
>> Technically you are right of course, but I remember some historical mess
>> around this, in this file.
>>
>> Plus I vaguely recall g_new[0]() being the most recent preference.
>>
>> https://developer.gnome.org/glib/stable/glib-Memory-Allocation.html#g-new
>>
>> See e.g. commit 97f3ad3551. Markus?
> 
> TL;DR: the patch is fine.
> 
> The argument of g_malloc() isn't always the size of a type.  But when it
> is, you should be using g_new() instead.  The commit message explains:
> 
>     g_new(T, n) is neater than g_malloc(sizeof(T) * n).  It's also safer,
>     for two reasons.  One, it catches multiplication overflowing size_t.
>     Two, it returns T * rather than void *, which lets the compiler catch
>     more type errors.
>     
> The multiplication argument applies only when n != 1.
> 
> The type checking argument applies regardless of n.  That's why the
> commit also transfroms patterns like g_malloc(sizeof(T)).
> 
> When the argument isn't written as sizeof a type, but could be, we enter
> "matter of taste" territory.  For instance, some may perefer the
> idiomatic T *p = g_malloc(sizeof(*p)) to the more tightly typed
> p = g_new(T, 1).  I therefore leave them alone.  Commit messsage again:
> 
>     This commit only touches allocations with size arguments of the form
>     sizeof(T).
> 
> A separate issue is a zeroing memset() after allocation.  Please use a
> zeroing allocator instead, because that's more concise.  Precedence:
> commit 0bd0adb.
> 
> Now let's apply this to the patch.
> 
> The memset() isn't zeroing, so "use a zeroing allocator instead" doesn't
> apply.  Before the patch, the code uses one additionally, which is
> wasteful.  The patch stops the waste.
> 
> The size argument is not the size of any type.  You could still write
> 
>     data = g_new(uint8_t, size);
> 
> but the extra verbosity pretty clearly outweighs what we could gain from
> type checking here.
> 

Okay, thanks!

Reviewed-by: Laszlo Ersek <lersek@redhat.com>

Cheers
Laszlo

