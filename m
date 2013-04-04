Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UNtXC-0002Hj-LZ
	for mharc-qemu-trivial@gnu.org; Thu, 04 Apr 2013 19:25:34 -0400
Received: from eggs.gnu.org ([208.118.235.92]:53711)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcmvbkbc@gmail.com>) id 1UNtX9-0002D9-O9
	for qemu-trivial@nongnu.org; Thu, 04 Apr 2013 19:25:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jcmvbkbc@gmail.com>) id 1UNtX8-00020U-IY
	for qemu-trivial@nongnu.org; Thu, 04 Apr 2013 19:25:31 -0400
Received: from mail-oa0-f44.google.com ([209.85.219.44]:51738)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcmvbkbc@gmail.com>)
	id 1UNtWx-0001yT-P2; Thu, 04 Apr 2013 19:25:19 -0400
Received: by mail-oa0-f44.google.com with SMTP id h1so3465788oag.3
	for <multiple recipients>; Thu, 04 Apr 2013 16:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=v8IRINBlzyRfOop/Gomp6eSY40gANNBUF/A5UssUdtk=;
	b=MtrRFbgpd/rrOtfijxTozlCKdRFKEBO6nBCrpYH2cHAcoVEUoIRnUFdWOkckGsifuc
	kmaYPMh6PDoGSaSnn0c76/4gvbWr97fKpZ2WVvEHRBNqYvQkAAXUQpUXXPxv0AbfyHpy
	8kHQ+R0ip10TD8eChqnOykE7XDYIvE3WQJCat5ftzZoncEz9x3iRUz6LJjFvXJmYJuz+
	bVU2TCTUXV6LqmeSrzAHya0SO8Y/3z2IDUIZN6SOri55SPR0XnjvxaRRgouVNak7wfUo
	gHBYVZMi8DDZ6uLqYVwZig8SsKzVuUtn0xAZ3g1pFvXGVca9NpORuyNJIkMBBjqFJy2r
	fjdA==
MIME-Version: 1.0
X-Received: by 10.60.135.131 with SMTP id ps3mr4793831oeb.131.1365117918781;
	Thu, 04 Apr 2013 16:25:18 -0700 (PDT)
Received: by 10.76.79.4 with HTTP; Thu, 4 Apr 2013 16:25:18 -0700 (PDT)
In-Reply-To: <1365117183-23730-1-git-send-email-brendandg@gatech.edu>
References: <1365117183-23730-1-git-send-email-brendandg@gatech.edu>
Date: Fri, 5 Apr 2013 03:25:18 +0400
Message-ID: <CAMo8BfL7BvuB2o0xXXv16P8mQVoBQ2F0rWoEWR+p6bOcKJi+wQ@mail.gmail.com>
From: Max Filippov <jcmvbkbc@gmail.com>
To: Brendan Dolan-Gavitt <brendandg@gatech.edu>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.219.44
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] target-i386: fix order of
	checks in cpu_get_phys_page_debug
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
X-List-Received-Date: Thu, 04 Apr 2013 23:25:33 -0000

On Fri, Apr 5, 2013 at 3:13 AM, Brendan Dolan-Gavitt
<brendandg@gatech.edu> wrote:
> In target-i386 cpu_get_phys_page_debug, the CR4_PAE bit is checked
> before CR0_PG. This means that if paging is disabled but the PAE bit has
> been set in CR4, cpu_get_phys_page_debug will return the wrong result
> (it will try to translate the address as virtual rather than using it as
> a physical address). This patch fixes that by moving the CR0_PG check to
> the beginning of the function.
>
> This shows up when booting the Linux kernel on amd64 with "-d in_asm".
> The kernel turns on the PAE bit in CR4 before turning on paging, and so
> QEMU's disassembler will fail because it will try to walk the page
> tables to fetch code even though paging is disabled. The symptom is
> incorrect disassembly and some "Disassembler disagrees with translator
> over instruction decoding" messages.
>
> This was also reported as bug #1163065.

Hi,

a while ago I sent similar patch:
http://comments.gmane.org/gmane.comp.emulators.qemu/180776
and a suggestion for me was to unify cpu_get_phys_page_debug and
cpu_x86_handle_mmu_fault implementations.

-- 
Thanks.
-- Max

