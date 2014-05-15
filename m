Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WkuuH-0002fx-Hf
	for mharc-qemu-trivial@gnu.org; Thu, 15 May 2014 08:37:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50305)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcmvbkbc@gmail.com>) id 1WkuuF-0002bt-LP
	for qemu-trivial@nongnu.org; Thu, 15 May 2014 08:37:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jcmvbkbc@gmail.com>) id 1WkuuE-0006eL-Pl
	for qemu-trivial@nongnu.org; Thu, 15 May 2014 08:37:03 -0400
Received: from mail-ob0-x231.google.com ([2607:f8b0:4003:c01::231]:64163)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcmvbkbc@gmail.com>)
	id 1WkuuB-0006dF-9w; Thu, 15 May 2014 08:36:59 -0400
Received: by mail-ob0-f177.google.com with SMTP id wp4so1097878obc.22
	for <multiple recipients>; Thu, 15 May 2014 05:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=h8bzsYaW/ZwUHGVgNmQJ4MvCwNVfsTcIm/ata3gmkBo=;
	b=SSq6aHj/2nDtv/ZPGtVY3+wPXJz3xSLm9gyvuiOY/8aV23xk9RAdXBIDkZbAI/bNzD
	wmbtAeYRdplme1/fm1teIaJy04wvmrLKFEtR6Xe1zjk38DoebuErIEJ7GG6rn5UBcVw6
	FQnpZuLcp11mbSrqwnI3jJgOu4D6MSGHvJHTW2Ogs3G/IeNDO2S42FrZHdDVscUOb92a
	XHHbNkmB9yC29CGOjhKdi7s7Zs3+JqqmNQafVDAE80k76Oxyn2ytARmQP6l3fDhRDkP5
	UTlgZ3bW2dipGp1V7t4S1VuusyX4sHS7ZcQ4ENPQhuRHQQYz7FaWYKLoB26tiDPGXLrt
	SgCg==
MIME-Version: 1.0
X-Received: by 10.182.236.229 with SMTP id ux5mr9905578obc.12.1400157418369;
	Thu, 15 May 2014 05:36:58 -0700 (PDT)
Received: by 10.76.166.164 with HTTP; Thu, 15 May 2014 05:36:58 -0700 (PDT)
In-Reply-To: <537469DD.7010503@hp.com>
References: <1399964954-10842-1-git-send-email-zhen-hual@hp.com>
	<1399964954-10842-5-git-send-email-zhen-hual@hp.com>
	<CAMo8Bf+nF1CXjs2VVomD0u2eNs_P6hRgUxbESHDiDb8ANriyCg@mail.gmail.com>
	<537469DD.7010503@hp.com>
Date: Thu, 15 May 2014 16:36:58 +0400
Message-ID: <CAMo8BfLfvYUq6BFr6_3tcdNK=hU4qm1bd3gz8BrwWTvO_c0J2g@mail.gmail.com>
From: Max Filippov <jcmvbkbc@gmail.com>
To: "Li, ZhenHua" <zhen-hual@hp.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4003:c01::231
Cc: qemu-trivial@nongnu.org, qemu-devel <qemu-devel@nongnu.org>,
	qemu-stable <qemu-stable@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 4/4] Support more than 255
	cpus: runtime check
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
X-List-Received-Date: Thu, 15 May 2014 12:37:04 -0000

On Thu, May 15, 2014 at 11:16 AM, Li, ZhenHua <zhen-hual@hp.com> wrote:
> Maybe it should be 4 bytes for 4096 (0x1000).

I'd say that 2 bytes should be enough, but actually I don't see
why anybody would care in that function how many bytes it is.

> On 05/13/2014 04:19 PM, Max Filippov wrote:
>>
>> On Tue, May 13, 2014 at 11:09 AM, Li, Zhen-Hua <zhen-hual@hp.com> wrote:
>>>
>>> From: "Li, ZhenHua" <zhen-hual@hp.com>
>>>
>>> There is some runtime check for max cpu count. Make them support 4096
>>> cpus.
>>>
>>> Signed-off-by: Li, ZhenHua <zhen-hual@hp.com>
>>> ---
>>>   hw/i386/acpi-build.c | 8 ++++----
>>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
>>> index c98df88..5c3bf10 100644
>>> --- a/hw/i386/acpi-build.c
>>> +++ b/hw/i386/acpi-build.c
>>
>> [...]
>>
>>> @@ -680,7 +680,7 @@ build_append_notify_method(GArray *device, const char
>>> *name,
>>>       for (i = 0; i < count; i++) {
>>>           GArray *target = build_alloc_array();
>>>           build_append_nameseg(target, format, i);

BTW, build_append_nameseg also expects format string that makes a string of
4 characters, otherwise it asserts.

>>> -        assert(i < 256); /* Fits in 1 byte */
>>> +        assert(i < 4096); /* Fits in 1 byte */
>>
>> The comment is no longer true.
>> Also the function build_append_notify_method is called with format
>> argument
>> set to "CP%0.02X", looks like this should be changed to "CP%0.03X".

-- 
Thanks.
-- Max

