Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XlTjo-0005FJ-2b
	for mharc-qemu-trivial@gnu.org; Mon, 03 Nov 2014 21:20:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56837)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XlTjh-00058O-VZ
	for qemu-trivial@nongnu.org; Mon, 03 Nov 2014 21:20:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XlTjd-0000PX-Q0
	for qemu-trivial@nongnu.org; Mon, 03 Nov 2014 21:20:45 -0500
Received: from szxga02-in.huawei.com ([119.145.14.65]:18342)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1XlTjT-0000O6-O2; Mon, 03 Nov 2014 21:20:33 -0500
Received: from 172.24.2.119 (EHLO szxeml462-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CBU84458; Tue, 04 Nov 2014 10:20:28 +0800 (CST)
Received: from [10.177.22.69] (10.177.22.69) by szxeml462-hub.china.huawei.com
	(10.82.67.205) with Microsoft SMTP Server id 14.3.158.1;
	Tue, 4 Nov 2014 10:20:19 +0800
Message-ID: <54583723.4010403@huawei.com>
Date: Tue, 4 Nov 2014 10:17:07 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.1
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>, <qemu-trivial@nongnu.org>
References: <1415007872-8228-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<545752D6.5020605@msgid.tls.msk.ru> <54576972.2030506@huawei.com>
	<54578CBB.9040306@msgid.tls.msk.ru>
In-Reply-To: <54578CBB.9040306@msgid.tls.msk.ru>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: pbonzini@redhat.com, Gerd Hoffmann <kraxel@redhat.com>, eblake@redhat.com,
	qemu-devel@nongnu.org, peter.huangpeng@huawei.com
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
X-List-Received-Date: Tue, 04 Nov 2014 02:20:50 -0000

On 2014/11/3 22:10, Michael Tokarev wrote:
> 03.11.2014 14:39, zhanghailiang wrote:
>> On 2014/11/3 18:03, Michael Tokarev wrote:
>>> 03.11.2014 12:44, zhanghailiang wrote:
>>>> Patch 1~3 fix wrong check about in-parameter.
>>>> The last two patches convert some open functions to use Error API.
>>>>
>>>> v2:
>>>> - don't use error_setg when followed by exit(), it does not report an error (Eric Blake)
>>>> - check the parameter in qemu_chr_parse_* functions and remove the check in qemu_chr_open_* functions. (Michael Tokarev)
>>>>
>>>> Thanks very much for their reviews and suggestions;)
>>>
>>> Thank you for doing all this.  I think I can apply this but with folding
>>> patches 1 and 2 into one, -- it is better to see them both in the same
>>> context, just like you did in patch 3.  If that's okay with you, I'll
>>> just apply it like this.
>>
>> Sure, I'm Ok with it;)
>
> I myself also prefer to use construct like !str[0] in place of strlen(str) != 0,
> to mean we check for its emptiness, we don't really need its lenght.  But it is

Hmm, Sounds good, will fix like that in V3.

> not a probem at all, just a matter of persona preference.
>
> I suggest mergeing the two commits into one, and also fix grammar erros
> in the commit message, something like this (fell free to use this
> commit message to the combined commit):
>

OK;)

>      qemu-char: fix parameter check in some qemu_chr_parse_* functions
>
>      For some qemu_chr_parse_* functions, we just check whether the parameter
>      is NULL or not, but do not check if it is empty.
>
>      For example:
>       qemu-system-x86_64 -chardev pipe,id=id,path=
>      It will pass the check of NULL but will not find the error until
>      trying to open it, while essentially missing and empty parameter
>      is the same thing.
>
>      So we should find the error by checking parameter length, just like
>      what qemu_chr_parse_udp does, it will help to find what exactly is
>      wrong.
>
>      So check the parameters for emptiness too, and avoid emptiness
>      check at open time.
>
>      Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
>      Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
>
>
> [error API]
>>
>> Yes, this confused me, besides, error_setg will add a '\n' in the end, but
>> for example, print_allowed_subtypes where use fprintf(stderr,..) without '\n' in the middle places,
>> IMHO, maybe it makes sense to return this to the higher caller.
>
> Oh.  I overlooked this one.  Indeed, this should not be done this way,
> you can't print_allowed_subtypes() in there _before_ reporting actual
> error, that'd be wrong.  Oh well :)
>
> In this context, print_allowed_subtypes() should return a single string
> with all subtypes in it.  I don't think it is interesting to print this
> allowed_subtypes list in case no subtype is specified to start with,
> but for invalid subtype it can be handled by adding the list to the
> original error message (note we already have the list handy in this
> function).  Something like this (on top of the original code, untested):
>
> diff --git a/spice-qemu-char.c b/spice-qemu-char.c
> index 8106e06..0acc9e5 100644
> --- a/spice-qemu-char.c
> +++ b/spice-qemu-char.c
> @@ -244,23 +244,6 @@ static void spice_chr_fe_event(struct CharDriverState *chr, int event)
>   #endif
>   }
>
> -static void print_allowed_subtypes(void)
> -{
> -    const char** psubtype;
> -    int i;
> -
> -    fprintf(stderr, "allowed names: ");
> -    for(i=0, psubtype = spice_server_char_device_recognized_subtypes();
> -        *psubtype != NULL; ++psubtype, ++i) {
> -        if (i == 0) {
> -            fprintf(stderr, "%s", *psubtype);
> -        } else {
> -            fprintf(stderr, ", %s", *psubtype);
> -        }
> -    }
> -    fprintf(stderr, "\n");
> -}
> -
>   static CharDriverState *chr_open(const char *subtype,
>       void (*set_fe_open)(struct CharDriverState *, int))
>
> @@ -288,21 +271,31 @@ static CharDriverState *chr_open(const char *subtype,
>
>   CharDriverState *qemu_chr_open_spice_vmc(const char *type)
>   {
> -    const char **psubtype = spice_server_char_device_recognized_subtypes();
> +    const char **subtype_list = spice_server_char_device_recognized_subtypes();
> +    const char **psubtype;
>
>       if (type == NULL) {
>           fprintf(stderr, "spice-qemu-char: missing name parameter\n");
> -        print_allowed_subtypes();
>           return NULL;
>       }
> -    for (; *psubtype != NULL; ++psubtype) {
> +    for (psubtype = subtype_list; *psubtype != NULL; ++psubtype) {
>           if (strcmp(type, *psubtype) == 0) {
>               break;
>           }
>       }
>       if (*psubtype == NULL) {
> -        fprintf(stderr, "spice-qemu-char: unsupported type: %s\n", type);
> -        print_allowed_subtypes();
> +        char *subtypes;
> +        int len;
> +        for(len = 1, psubtype = subtype_list; *psubtype; ++psubtype) {
> +            len += strlen(*psubtype) + (psubtypes <> psubtype);
> +        }
> +        subtypes = g_alloc(len);
> +        for(len = 0, psubtype = subtype_list; *psubtype; ++psubtype) {
> +            len += sprintf(subtypes + len, "%s%s",
> +                           psubtypes <> psubtype ? "," : "", *psubtype);
> +        }
> +        fprintf(stderr, "spice-qemu-char: unsupported type: %s, allowed types: %s\n", type, subtypes);
> +        g_free(subtypes);
>           return NULL;
>       }
> []
> In another reply, to patch 5:
>
>>> Now this is funny.  Why we have two functions nearby using different
>>> error reporting APIs?  Maybe qemu_chr_open_spice_port() should be
>>> converted to Error API too, at the same time (maybe in the same
>>> patch or in a subsequent patch in the same series)?
>>
>> Actually, after patch 3, there will be no error case for this function, it can not
>> fail, so i just leave it. What's your opinion? Thanks.
>
> Okay, I haven't realized it.  Yes, that makes sense.
>
> []
>> It's okay, So what's your opinion about this series?
>> Should i merge patch 1 and 2 into one patch in V3?
>> Keep the other modifies except the incorrect modify in qemu_chr_open_pty for patch 4?
>> If yes, i will send V3;)
>
> I was ready to merge these but realized I shouldn't because that'll be
> too much on my part, only adding to your confusion - which part is
> applied and which is not, etc.
>
> So please do a V3, to have common base for all this.
>

OK;)

> I'm not sure if the print_allowed_subtypes() thing is a good idea actually --
> it is a bit too large, but without it we can't just convert things as you
> tried to do, for hopefully obvious reasons.  Maybe asking spice maintainer
> for the opinion is a good idea? (Cc'ing Gerd).  The context is, for example,
> here: http://lists.nongnu.org/archive/html/qemu-devel/2014-11/msg00187.html .
>

print_allowed_subtypes() will be used where there is a check error type given(as you said above),
I'd better keep it, but use error_printf (suggested by Markus Armbruster in another email:))
instead of fprintf. I think in this way it is more clean;)

> This patch also has somewhat large list of conversions of other errors in
> windows part of the code, and these all really look terrible, this is not
> correct english really, as far as I know -- it is either "Failed _to_ do
> something", or "something failed", but not "failed something".. ;)  I'm

Yep, needs some little fix for that. Will do in V3.

> not, again, sure that's a good idea to leave it as it is, maybe at least
> some context in the error message will help... ;)
>

Thanks,
zhanghailiang


