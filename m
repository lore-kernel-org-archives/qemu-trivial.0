Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RJhJY-0001lm-LH
	for mharc-qemu-trivial@gnu.org; Fri, 28 Oct 2011 03:57:20 -0400
Received: from eggs.gnu.org ([140.186.70.92]:32914)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1RJhJW-0001lb-Pv
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2011 03:57:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1RJhJV-0001HL-S5
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2011 03:57:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58664)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>)
	id 1RJhJV-0001HG-GZ; Fri, 28 Oct 2011 03:57:17 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p9S7vGr3017553
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 28 Oct 2011 03:57:16 -0400
Received: from dhcp-5-188.str.redhat.com (vpn1-7-188.ams2.redhat.com
	[10.36.7.188])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p9S7vDln014762
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256 verify=NO);
	Fri, 28 Oct 2011 03:57:15 -0400
Message-ID: <4EAA6116.3050308@redhat.com>
Date: Fri, 28 Oct 2011 10:00:22 +0200
From: Kevin Wolf <kwolf@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1319658678-18355-1-git-send-email-sunshine@sunshineco.com>
	<4EA91C16.6050908@redhat.com> <4EA982D0.10902@weilnetz.de>
In-Reply-To: <4EA982D0.10902@weilnetz.de>
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
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
X-List-Received-Date: Fri, 28 Oct 2011 07:57:19 -0000

Am 27.10.2011 18:12, schrieb Stefan Weil:
> Am 27.10.2011 10:53, schrieb Kevin Wolf:
>> Am 26.10.2011 21:51, schrieb Eric Sunshine:
>>> An entry in the VDI block map will hold an offset to the actual block if
>>> the block is allocated, or one of two specially-interpreted values if
>>> not allocated. Using VirtualBox terminology, value VDI_IMAGE_BLOCK_FREE
>>> (0xffffffff) represents a never-allocated block (semantically arbitrary
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

I did see your comments, and I waited for the endianness thing to be
answered. However, how the definition of these constants is written is
really not a functional defect, but simply a matter of taste. It's an
old rule that whoever does the work also decides on the details.

I really think it's wasting our time if we need to discuss if a type
cast in the constant definition is only allowed after typedefing
uint32_t to something else like in VBox.

So my preferred way is to leave the patch as it is. The code is simple
and clear and objectively seen it won't get any better with your taste
applied. If Eric prefers, I can update it to use 0xffffffffU, though.

Kevin

