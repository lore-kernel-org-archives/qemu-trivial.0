Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZkZTC-00038i-TL
	for mharc-qemu-trivial@gnu.org; Fri, 09 Oct 2015 11:20:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51054)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ZkRIT-0003Pj-0X
	for qemu-trivial@nongnu.org; Fri, 09 Oct 2015 02:36:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ZkRIS-0004cx-1a
	for qemu-trivial@nongnu.org; Fri, 09 Oct 2015 02:36:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56161)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1ZkRIM-0004aU-2K; Fri, 09 Oct 2015 02:36:46 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id D64AAC0A1488;
	Fri,  9 Oct 2015 06:36:44 +0000 (UTC)
Received: from [10.36.4.95] (vpn1-4-95.ams2.redhat.com [10.36.4.95])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t996agrP005401
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 9 Oct 2015 02:36:43 -0400
To: Laszlo Ersek <lersek@redhat.com>, qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
References: <1444332916-16476-1-git-send-email-thuth@redhat.com>
	<1444332916-16476-5-git-send-email-thuth@redhat.com>
	<5616D0FF.5030909@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <56176079.3000900@redhat.com>
Date: Fri, 9 Oct 2015 08:36:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <5616D0FF.5030909@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 4/5] tests/i44fx-test: No need for
 zeroing memory before memset
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
X-List-Received-Date: Fri, 09 Oct 2015 06:36:54 -0000

On 08/10/15 22:24, Laszlo Ersek wrote:
> On 10/08/15 21:35, Thomas Huth wrote:
>> Change a g_malloc0 into g_malloc since the following
>> memset fills the whole buffer anyway.
>>
>> Cc: Laszlo Ersek <lersek@redhat.com>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>  tests/i440fx-test.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tests/i440fx-test.c b/tests/i440fx-test.c
>> index d0bc8de..7fa1709 100644
>> --- a/tests/i440fx-test.c
>> +++ b/tests/i440fx-test.c
>> @@ -191,7 +191,7 @@ static void write_area(uint32_t start, uint32_t end, uint8_t value)
>>      uint32_t size = end - start + 1;
>>      uint8_t *data;
>>  
>> -    data = g_malloc0(size);
>> +    data = g_malloc(size);
>>      memset(data, value, size);
>>      memwrite(start, data, size);
>>  
>>
> 
> Technically you are right of course, but I remember some historical mess
> around this, in this file.
> 
> Plus I vaguely recall g_new[0]() being the most recent preference.
> 
> https://developer.gnome.org/glib/stable/glib-Memory-Allocation.html#g-new
> 
> See e.g. commit 97f3ad3551. Markus?

g_new IMHO only makes sense when you try to allocate the memory for a
struct or something similar - for allocating byte arrays, g_malloc is
the better choice. So I think this patch should be fine.

 Thomas


