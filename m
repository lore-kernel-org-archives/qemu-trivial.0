Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WQGzB-000891-Mh
	for mharc-qemu-trivial@gnu.org; Wed, 19 Mar 2014 09:56:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51772)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1WQGz1-00088H-RD
	for qemu-trivial@nongnu.org; Wed, 19 Mar 2014 09:56:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1WQGyt-0003Bj-DV
	for qemu-trivial@nongnu.org; Wed, 19 Mar 2014 09:56:39 -0400
Received: from mail-ee0-x22f.google.com ([2a00:1450:4013:c00::22f]:47266)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1WQGyt-0003Bc-5v; Wed, 19 Mar 2014 09:56:31 -0400
Received: by mail-ee0-f47.google.com with SMTP id b15so6672368eek.34
	for <multiple recipients>; Wed, 19 Mar 2014 06:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=mCclcbbfsb93p2P/GdFc1sI4LZmoS+YVtDso3TkLZew=;
	b=tydbq2Q5l4H9gekBFv5a0TOw/v0GRQxUqvUTfe1+uKVshyWVRiApt6KlSttEsvvoZ1
	iWlVXXNURa0XLqm3sORixy1juqQ30o3onWSswyFQWGgeoDFkixiWyAjeiYimZ4gqobl0
	mDchuy8GZkg8p3FG2DOKGBthh9ekHZzPYJJcw1j4Gzh526XJN/8usHACHwUS3zDtxgzR
	jdp0ukhEW/bh/glSQ/oxbOjgwXJiixyIHrQNb2fhtdhF1EQxOLlCuB5hixkysLN59Alb
	amryd/mMpkhBS4Tj92yGzuyl0m5k1fUDboKVLSIJOCl0zbt35XfhOCv7KlXmS0QS2YSu
	TOdA==
X-Received: by 10.14.22.69 with SMTP id s45mr36205318ees.56.1395237389893;
	Wed, 19 Mar 2014 06:56:29 -0700 (PDT)
Received: from yakj.usersys.redhat.com
	(net-37-117-154-249.cust.vodafonedsl.it. [37.117.154.249])
	by mx.google.com with ESMTPSA id
	j41sm54860879eeg.10.2014.03.19.06.56.26 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 19 Mar 2014 06:56:27 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <5329A209.5000308@redhat.com>
Date: Wed, 19 Mar 2014 14:56:25 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>
References: <1395162223-28733-1-git-send-email-pbonzini@redhat.com>	<874n2vcpu9.fsf@blackfin.pond.sub.org>	<53294155.8040403@redhat.com>	<87d2hi4ktz.fsf@blackfin.pond.sub.org>
	<5329918C.8090403@redhat.com>
In-Reply-To: <5329918C.8090403@redhat.com>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4013:c00::22f
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] scripts: add sample model file for
	Coverity Scan
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
X-List-Received-Date: Wed, 19 Mar 2014 13:56:48 -0000

Il 19/03/2014 13:46, Paolo Bonzini ha scritto:
> Il 19/03/2014 10:08, Markus Armbruster ha scritto:
>>> It probably would make static analysis a bit less powerful or will
>>> return more false positives.  The NULL return for realloc (in the
>>> "free" case) already causes some.  So I'm undecided between a more
>>> correct model and a more selective one (with a fat comment).
>>
>> I can't see how lying to the analyzer could make it more powerful :)
>> It can, however, suppress false positives.  Scan and find out how many?
>
> Full model (g_malloc returns NULL for 0 argument) => 750 defects
>
> Posted model (g_malloc never returns NULL)        => 702 defects
>         -59 NULL_RETURNS defects
>          -1 REVERSE_INULL defects
>         +12 TAINTED_SCALAR defects
>
> Reduced model (g_realloc never frees)             => 690 defects
>         -12 NULL_RETURNS defects
>
> Of course, silly me, I threw away the results of the analysis for the
> full model.  I'll now rerun it and look for false negatives caused by
> the reduced model.

For the REVERSE_INULL and TAINTED_SCALAR defects, I don't see why the 
model should make any difference.  The missing REVERSE_INULL becomes a 
false-negative.  The new TAINTED_SCALAR were false negatives.

I checked ~10 of the NULL_RETURNS and they are all false positives. 
Either the argument really cannot be zero, or it is asserted that it is 
not zero before accessing the array, or the array access is within a for 
loop that will never roll if the size was zero.

Examples:

1) gencb_alloc (and a few others have the same idiom) gets a length, 
allocates a block of the given length, and fills in the beginning of 
that block.  It's arguably missing an assertion that the length is 
good-enough.  No reason for this to be tied to NULL_RETURNS, but in 
practice it is.


2) This only gets zero if there is an overflow, since dma->memmap_size 
is initialized to zero.  But Coverity flags it as a possible NULL return:

316  	    dma->memmap = g_realloc(dma->memmap, sizeof(*entry) *
317  	                    (dma->memmap_size + 1));


3) vnc_dpy_cursor_define calls g_malloc0(vd->cursor_msize), which 
returns NULL if the array has size 0.  Coverity complains because 
cursor_get_mono_mask calls memset on the result, but we already rely 
elsewhere on that not happening for len == 0.


I think we're well into diminishing returns, which justifies using the 
less-precise model.

I'm now adding new models for memset/memcpy/memmove/memcmp that check 
for non-zero argument, and see what that improves with respect to the 
full and reduced models.

Paolo

