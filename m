Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XlzZD-0005hM-Od
	for mharc-qemu-trivial@gnu.org; Wed, 05 Nov 2014 07:20:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37950)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XlzZ6-0005f4-I7
	for qemu-trivial@nongnu.org; Wed, 05 Nov 2014 07:20:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XlzYv-0002Wf-Kt
	for qemu-trivial@nongnu.org; Wed, 05 Nov 2014 07:19:56 -0500
Received: from szxga03-in.huawei.com ([119.145.14.66]:17465)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1XlzYu-0002Vn-U6; Wed, 05 Nov 2014 07:19:45 -0500
Received: from 172.24.2.119 (EHLO SZXEML455-HUB.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id AWQ91237; Wed, 05 Nov 2014 20:19:30 +0800 (CST)
Received: from [10.177.22.69] (10.177.22.69) by SZXEML455-HUB.china.huawei.com
	(10.82.67.198) with Microsoft SMTP Server id 14.3.158.1;
	Wed, 5 Nov 2014 20:19:20 +0800
Message-ID: <545A15C8.6090501@huawei.com>
Date: Wed, 5 Nov 2014 20:19:20 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.1
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>, =?UTF-8?B?QWxleCBCZW5uw6ll?=
	<alex.bennee@linaro.org>
References: <1415098223-32404-1-git-send-email-zhang.zhanghailiang@huawei.com>	<1415098223-32404-2-git-send-email-zhang.zhanghailiang@huawei.com>
	<874mufumgk.fsf@linaro.org> <5459CC56.1030109@msgid.tls.msk.ru>
In-Reply-To: <5459CC56.1030109@msgid.tls.msk.ru>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020204.545A15D2.01A0, ss=1, re=0.001, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: ab938ecef8a44a97c49c2c9cc294b8af
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: qemu-trivial@nongnu.org, armbru@redhat.com, kraxel@redhat.com,
	qemu-devel@nongnu.org, peter.huangpeng@huawei.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3 1/5] qemu-char: fix
 parameter check in some qemu_chr_parse_* functions
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
X-List-Received-Date: Wed, 05 Nov 2014 12:20:01 -0000

On 2014/11/5 15:05, Michael Tokarev wrote:
> 04.11.2014 16:25, Alex Bennée wrote:
>> zhanghailiang <zhang.zhanghailiang@huawei.com> writes:
>>
>>> For some qemu_chr_parse_* functions, we just check whether the parameter
>>> is NULL or not, but do not check if it is empty.
>>>
>>> For example:
>>> qemu-system-x86_64 -chardev pipe,id=id,path=
>>> It will pass the check of NULL but will not find the error until
>>> trying to open it, while essentially missing and empty parameter
>>> is the same thing.
>>>
>>> So check the parameters for emptiness too, and avoid emptiness
>>> check at open time.
>>>
>>> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
>>> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
>>> ---
>>>   qemu-char.c | 15 +++++----------
>>>   1 file changed, 5 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/qemu-char.c b/qemu-char.c
>>> index bd0709b..a09bbf6 100644
>>> --- a/qemu-char.c
>>> +++ b/qemu-char.c
>>> @@ -1084,11 +1084,6 @@ static CharDriverState *qemu_chr_open_pipe(ChardevHostdev *opts)
>>>       char filename_out[CHR_MAX_FILENAME_SIZE];
>>>       const char *filename = opts->device;
>>>
>>> -    if (filename == NULL) {
>>> -        fprintf(stderr, "chardev: pipe: no filename given\n");
>>> -        return NULL;
>>> -    }
>>> -
>>
>> You seem to have dropped a check here, are you sure all avenues into
>> this code have validated filename? What if a new function gets added?
>

Hi Michael,

> Yes, the code first calls parse_pipe() and only after it is
> successfully completed, it calls open_pipe().  I don't see

Unfortunately :( , That's right for hmp command 'chardev-add' and
startUp configure, but not true for qmp command 'chardev-add'.
It is my fault, i didn't test qmp command before :(

The call process is different from hmp command,
Its route not include parse_* function.
process:
   qmp_call_cmd
       --->qmp_marshal_input_chardev_add
           --->qmp_chardev_add
             --->qemu_chr_open_pipe

test & result:
{ "execute" : "chardev-add","arguments" : { "id" : "bar1","backend" : \
{ "type" : "pipe","data" : {"device" :"" } } } }

{"id":"libvirt-12","error":{"class":"GenericError",\
"desc":"Failed to create chardev"}}

As you see, we still need check if filename is empty or not in open_pipe.
(Actually, filename will still never to be NULL,
it is assured by the 'qmp_marshal ' layer, but better to keep it there)

So what's your suggestion? Keep two checks both in open_* and parse_*?
Or move check into open_*? (It should be OK to g_strdup(NULL)). Thanks.

> a good reason for having assert here.
>

Agreed, assert here is still not unnecessary,
filename will never to be NULL in these two cases.

>> At a minimum I'd replace it with a g_assert(filename) to make the
>> calling contract clear.
>
> This is an internal set of APIs for a chr device, each kind is
> having a pair of functions which are called in order (first parse,
> next open), -- _that_ is the contract.
>
> []
>> All this boilerplate checking makes me think that either the qemu_opt
>> machinery should be ensuring we get a valid option string?
>
> Might be a good idea, yes, but that'd be a huge change, since that
> should be done in a lot of places, and in many cases we can't
> express our rules easily (eg, only one of two parameters should
> be present).  I think at this stage adding simple checks to
> _parse functions is the way to go, and it is easy to read too.
>
> Thanks,
>
> /mjt
>
> .
>


