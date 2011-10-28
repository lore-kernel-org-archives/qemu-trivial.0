Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RJhbE-0003qA-A9
	for mharc-qemu-trivial@gnu.org; Fri, 28 Oct 2011 04:15:36 -0400
Received: from eggs.gnu.org ([140.186.70.92]:59053)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ericsunshine@gmail.com>) id 1RJhbB-0003q0-Pt
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2011 04:15:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ericsunshine@gmail.com>) id 1RJhbA-0004Xo-MJ
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2011 04:15:33 -0400
Received: from mail-qw0-f45.google.com ([209.85.216.45]:52913)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ericsunshine@gmail.com>)
	id 1RJhbA-0004Xc-Jt; Fri, 28 Oct 2011 04:15:32 -0400
Received: by qadc12 with SMTP id c12so4215752qad.4
	for <multiple recipients>; Fri, 28 Oct 2011 01:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:in-reply-to:subject:references:message-id
	:content-type:content-transfer-encoding:mime-version:date:cc
	:x-mailer; bh=O+AsaQFSxsqT7W8OyNi9scQsxunB2gT0El8rQiCB2+w=;
	b=KN1F4BKaOeYid5HN8MG5gVSrT9wdvMEy84znckuNoKFZbATcV5nHqUOM3TLq4/rfMb
	3IlPtW+OH9hC+XNad4oB1xdjRAI1N5sC11ZcHhxVZUnSeXnR8kxDH+8F7oMyxUnwGplh
	Abs+YCqrEOf86F/7omGSh0SQ7xU+hkUsQZ6QI=
Received: by 10.224.17.136 with SMTP id s8mr1452105qaa.75.1319789731701;
	Fri, 28 Oct 2011 01:15:31 -0700 (PDT)
Received: from [192.168.1.2] (user-0c936tj.cable.mindspring.com.
	[24.145.155.179])
	by mx.google.com with ESMTPS id gg6sm13035688qab.3.2011.10.28.01.15.29
	(version=SSLv3 cipher=OTHER); Fri, 28 Oct 2011 01:15:30 -0700 (PDT)
Sender: Eric Sunshine <ericsunshine@gmail.com>
From: Eric Sunshine <sunshine@sunshineco.com>
To: Kevin Wolf <kwolf@redhat.com>
In-Reply-To: <4EAA6116.3050308@redhat.com>
References: <1319658678-18355-1-git-send-email-sunshine@sunshineco.com>
	<4EA91C16.6050908@redhat.com> <4EA982D0.10902@weilnetz.de>
	<4EAA6116.3050308@redhat.com>
Message-Id: <8399BFA7-3D21-444E-BB1B-C9E9821B7922@sunshineco.com>
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0 (Apple Message framework v936)
Date: Fri, 28 Oct 2011 04:15:28 -0400
X-Mailer: Apple Mail (2.936)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.216.45
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Teach block/vdi about
	"discarded" (no longer allocated) blocks
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
X-List-Received-Date: Fri, 28 Oct 2011 08:15:35 -0000


On Oct 28, 2011, at 4:00 AM, Kevin Wolf wrote:

> Am 27.10.2011 18:12, schrieb Stefan Weil:
>> Am 27.10.2011 10:53, schrieb Kevin Wolf:
>>> Am 26.10.2011 21:51, schrieb Eric Sunshine:
>>>> An entry in the VDI block map will hold an offset to the actual  
>>>> block if
>>>> the block is allocated, or one of two specially-interpreted  
>>>> values if
>>>> not allocated. Using VirtualBox terminology, value  
>>>> VDI_IMAGE_BLOCK_FREE
>>>> (0xffffffff) represents a never-allocated block (semantically  
>>>> arbitrary
>>>> content). VDI_IMAGE_BLOCK_ZERO (0xfffffffe) represents a  
>>>> "discarded"
>>>> block (semantically zero-filled). block/vdi knows only about
>>>> VDI_IMAGE_BLOCK_FREE. Teach it about VDI_IMAGE_BLOCK_ZERO.
>>>>
>>>> Signed-off-by: Eric Sunshine <sunshine@sunshineco.com>
>>>
>>> Thanks, applied to the block branch.
>>>
>>> Kevin
>>
>>
>> Kevin, I don't want to block improvements. Nevertheless
>> I'd like to see a small modification in this patch:
>> both #defines should be implemented without a type cast.
>> Please change them or wait until Eric sends an update.
>>
>> My favorite is this:
>>
>> #define VDI_UNALLOCATED UINT32_MAX
>> #define VDI_DISCARD     (VDI_UNALLOCATED - 1)
>>
>> This would also be ok:
>>
>> #define VDI_UNALLOCATED 0xffffffffU
>> #define VDI_DISCARD     0xfffffffeU
>>
>> Using the macro names and the definitions (with type cast)
>> from the original VirtualBox code would also be ok.
>
> I did see your comments, and I waited for the endianness thing to be
> answered. However, how the definition of these constants is written is
> really not a functional defect, but simply a matter of taste. It's an
> old rule that whoever does the work also decides on the details.
>
> I really think it's wasting our time if we need to discuss if a type
> cast in the constant definition is only allowed after typedefing
> uint32_t to something else like in VBox.
>
> So my preferred way is to leave the patch as it is. The code is simple
> and clear and objectively seen it won't get any better with your taste
> applied. If Eric prefers, I can update it to use 0xffffffffU, though.

The 0xffffffffU notation has the benefit of being explicit, whereas  
the ((uint32_t)~0) notation, taken from the VirtualBox source, is  
somewhat magical for a reader who does not perform an automatic  
((uint32_t)~0) == 0xffffffffU conversion in his head. Consequently,  
the 0xffffffffU notation might a better choice, if it's not too much  
bother for you to amend the patch.

-- ES


