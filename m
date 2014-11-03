Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XlFzg-0006sB-8e
	for mharc-qemu-trivial@gnu.org; Mon, 03 Nov 2014 06:40:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35019)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XlFzZ-0006cp-0m
	for qemu-trivial@nongnu.org; Mon, 03 Nov 2014 06:40:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XlFzS-0005DH-Be
	for qemu-trivial@nongnu.org; Mon, 03 Nov 2014 06:40:12 -0500
Received: from szxga02-in.huawei.com ([119.145.14.65]:48202)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1XlFzE-00050m-5a; Mon, 03 Nov 2014 06:39:53 -0500
Received: from 172.24.2.119 (EHLO szxeml463-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CBU21726; Mon, 03 Nov 2014 19:39:45 +0800 (CST)
Received: from [10.177.22.69] (10.177.22.69) by szxeml463-hub.china.huawei.com
	(10.82.67.206) with Microsoft SMTP Server id 14.3.158.1;
	Mon, 3 Nov 2014 19:39:34 +0800
Message-ID: <54576972.2030506@huawei.com>
Date: Mon, 3 Nov 2014 19:39:30 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.1
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>, <qemu-trivial@nongnu.org>
References: <1415007872-8228-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<545752D6.5020605@msgid.tls.msk.ru>
In-Reply-To: <545752D6.5020605@msgid.tls.msk.ru>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: pbonzini@redhat.com, eblake@redhat.com, qemu-devel@nongnu.org,
	peter.huangpeng@huawei.com
Subject: Re: [Qemu-trivial] [PATCH v2 0/5] Trivial patch about qemu-char
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
X-List-Received-Date: Mon, 03 Nov 2014 11:40:19 -0000

On 2014/11/3 18:03, Michael Tokarev wrote:
> 03.11.2014 12:44, zhanghailiang wrote:
>> Patch 1~3 fix wrong check about in-parameter.
>> The last two patches convert some open functions to use Error API.
>>
>> v2:
>> - don't use error_setg when followed by exit(), it does not report an error (Eric Blake)
>> - check the parameter in qemu_chr_parse_* functions and remove the check in qemu_chr_open_* functions. (Michael Tokarev)
>>
>> Thanks very much for their reviews and suggestions;)
>
> Thank you for doing all this.  I think I can apply this but with folding
> patches 1 and 2 into one, -- it is better to see them both in the same
> context, just like you did in patch 3.  If that's okay with you, I'll
> just apply it like this.
>

Sure, I'm Ok with it;)

> Speaking of Error API -- what is the general consensus of this?  We have
> TONS of various way to report errors now, and we had several incarnations
> of various error APIs too, are we going to use some common API finally,
> or is the conversion endless, expecting new APIs to arrive?
>

Yes, this confused me, besides, error_setg will add a '\n' in the end, but
for example, print_allowed_subtypes where use fprintf(stderr,..) without '\n' in the middle places,
IMHO, maybe it makes sense to return this to the higher caller.

> And one more thing.  Patch 4 does this:
>
> @@ -1388,8 +1388,8 @@ static CharDriverState *qemu_chr_open_pty(const char *id,
>       ret->pty = g_strdup(pty_name);
>       ret->has_pty = true;
>
> -    fprintf(stderr, "char device redirected to %s (label %s)\n",
> -            pty_name, id);
> +    error_report("char device redirected to %s (label %s)",
> +                 pty_name, id);
>
>       s = g_malloc0(sizeof(PtyCharDriver));
>       chr->opaque = s;
>
> This is not really correct.  First it is not really an error, it is
> an informational message.  But also, there are many scripts out there
> who expects this very format of this message to find the entry to
> that char device.  Converting this message to error_report() changes
> its format, so scrips will be unable to find the device anymore.
>
> Take a look at history of this place, -- I remember there was a rather
> hot discussion when the last part, "(label %)", has been added (initial
> message was without this label).  Initial suggestion was to change
> wordin to 'char device $LABEL redirected to $DEVICE', but even if it
> is much more readable and correct, we agreed to add that "label" part
> to the end - not that it preserves original message, but at least it
> makes less scripts to fail...
>

I got it, thanks very much for your explanation, and your patience;)

> So at least this hunk should not be applied.  I think this place
> deserves a comment.
>
> I'm sorry for being so picky, but I think I give enough reasons
> explaining why, and these reasons are serious enough.

It's okay, So what's your opinion about this series?
Should i merge patch 1 and 2 into one patch in V3?
Keep the other modifies except the incorrect modify in qemu_chr_open_pty for patch 4?
If yes, i will send V3;)

Thanks,
zhanghailiang






