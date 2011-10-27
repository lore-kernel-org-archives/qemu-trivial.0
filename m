Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RJSgw-0004Ms-Ob
	for mharc-qemu-trivial@gnu.org; Thu, 27 Oct 2011 12:20:30 -0400
Received: from eggs.gnu.org ([140.186.70.92]:60999)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ericsunshine@gmail.com>) id 1RJSgu-0004MJ-6z
	for qemu-trivial@nongnu.org; Thu, 27 Oct 2011 12:20:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ericsunshine@gmail.com>) id 1RJSgl-0005Cm-Sk
	for qemu-trivial@nongnu.org; Thu, 27 Oct 2011 12:20:28 -0400
Received: from mail-qw0-f45.google.com ([209.85.216.45]:37791)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ericsunshine@gmail.com>)
	id 1RJSgl-0005Cc-QY; Thu, 27 Oct 2011 12:20:19 -0400
Received: by qadc12 with SMTP id c12so3389923qad.4
	for <multiple recipients>; Thu, 27 Oct 2011 09:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:in-reply-to:subject:references:message-id
	:content-type:content-transfer-encoding:mime-version:date:cc
	:x-mailer; bh=oabbiKLdtksFyecRXfPsjHtM0JPJcMcjkw/Na+VMHfI=;
	b=Sc0WOtzTSyE88qzmDcdePJbUyt8Lcq5rTqC9wycGuUSbCYFNkt9sAg1BnSDN03bhpN
	anFGz4nzxXgs8UMCNarAPMs/D5B3RmCSKqHuxlx7zLzWSIJLFvsdx8qeOHQXxo432772
	C6ZzuKCwkWiezOlBbayD4QWZfshrhEnlAjl/o=
Received: by 10.224.189.200 with SMTP id df8mr2381664qab.31.1319732419317;
	Thu, 27 Oct 2011 09:20:19 -0700 (PDT)
Received: from [192.168.1.2] (user-0c936tj.cable.mindspring.com.
	[24.145.155.179])
	by mx.google.com with ESMTPS id dk9sm8897663qab.0.2011.10.27.09.20.17
	(version=SSLv3 cipher=OTHER); Thu, 27 Oct 2011 09:20:18 -0700 (PDT)
Sender: Eric Sunshine <ericsunshine@gmail.com>
From: Eric Sunshine <sunshine@sunshineco.com>
To: Stefan Weil <sw@weilnetz.de>
In-Reply-To: <4EA982D0.10902@weilnetz.de>
References: <1319658678-18355-1-git-send-email-sunshine@sunshineco.com>
	<4EA91C16.6050908@redhat.com> <4EA982D0.10902@weilnetz.de>
Message-Id: <FA53AC17-C206-400F-A66D-31EDDD2FE405@sunshineco.com>
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0 (Apple Message framework v936)
Date: Thu, 27 Oct 2011 12:20:15 -0400
X-Mailer: Apple Mail (2.936)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.216.45
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-trivial@nongnu.org,
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
X-List-Received-Date: Thu, 27 Oct 2011 16:20:29 -0000

On Oct 27, 2011, at 12:12 PM, Stefan Weil wrote:

> Am 27.10.2011 10:53, schrieb Kevin Wolf:
>> Am 26.10.2011 21:51, schrieb Eric Sunshine:
>>> An entry in the VDI block map will hold an offset to the actual  
>>> block if
>>> the block is allocated, or one of two specially-interpreted values  
>>> if
>>> not allocated. Using VirtualBox terminology, value  
>>> VDI_IMAGE_BLOCK_FREE
>>> (0xffffffff) represents a never-allocated block (semantically  
>>> arbitrary
>>> content). VDI_IMAGE_BLOCK_ZERO (0xfffffffe) represents a "discarded"
>>> block (semantically zero-filled). block/vdi knows only about
>>> VDI_IMAGE_BLOCK_FREE. Teach it about VDI_IMAGE_BLOCK_ZERO.
>>>
>>> Signed-off-by: Eric Sunshine <sunshine@sunshineco.com>
>>
>> Thanks, applied to the block branch.
>>
>> Kevin
>
>
> Kevin, I don't want to block improvements. Nevertheless
> I'd like to see a small modification in this patch:
> both #defines should be implemented without a type cast.
> Please change them or wait until Eric sends an update.
>
> My favorite is this:
>
> #define VDI_UNALLOCATED UINT32_MAX
> #define VDI_DISCARD     (VDI_UNALLOCATED - 1)
>
> This would also be ok:
>
> #define VDI_UNALLOCATED 0xffffffffU
> #define VDI_DISCARD     0xfffffffeU
>
> Using the macro names and the definitions (with type cast)
> from the original VirtualBox code would also be ok.

I originally implemented the change using the macro names, comments,  
and definitions from the VirtualBox code, but found that it made the  
diff so noisy that it obscured the simpler underlying change of  
teaching block/vdi about "discarded" blocks. Sticking with the  
original VDI_UNALLOCATED macro name kept the diff noise level down.

At any rate, if Kevin can amend the commit with one of your above  
suggestions, that would be simplest. Otherwise, I can re-roll. Let me  
know which is preferred.

-- ES


