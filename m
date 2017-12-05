Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eM4wc-0005BF-E0
	for mharc-qemu-trivial@gnu.org; Mon, 04 Dec 2017 23:34:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43847)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eM4wZ-0005Au-4C
	for qemu-trivial@nongnu.org; Mon, 04 Dec 2017 23:34:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eM4wV-0002nD-4q
	for qemu-trivial@nongnu.org; Mon, 04 Dec 2017 23:34:55 -0500
Received: from mail-qt0-x229.google.com ([2607:f8b0:400d:c0d::229]:36762)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eM4wV-0002lz-0P; Mon, 04 Dec 2017 23:34:51 -0500
Received: by mail-qt0-x229.google.com with SMTP id a16so26318732qtj.3;
	Mon, 04 Dec 2017 20:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=yFq0fxwopJxOFZmLNGoIw7u8zJn2wfe/01yA2ABTK2U=;
	b=p9dhLycVtXkaE1BEIDbZz8gPLY4cvDPmSSDVWuCnukEbfXJmYJTht32HHFYE7CcvRb
	7nswKvMx/uTV+0myIu268q/gcWmCoOIW/SJB9jxdGHrAxGR6BT6uUumwLOx4UKC/mqHK
	CxI8Ksg1/lp7O94F1OHqyxzCdm5Y9FuiM0Mg0uqiBNy8ZSCZYNx6rT8mB7WzsyHsTrQq
	KMgIWpqLIXn8DprjnMG83fMm+0SJ7naPA2Qqu/ZjqPV3NgCjQOgg78Sw5/YbgIS9N5D0
	ivruFmCdHooUjpEMTLpqAJqhOC8mCQOj4zjUDqnUoAHHJ6XICUi64yY3RG8Upoy7wd8L
	GiEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=yFq0fxwopJxOFZmLNGoIw7u8zJn2wfe/01yA2ABTK2U=;
	b=BT97gyI1PsyKPVByo+NdEaxhXhtdnfpoSZK0U+qyq37oWtlAAz3/30sa6AJLMqM5vv
	aBeAQw/D1yH+HnDdhWgNmFZyMCTtm2S30IzfEwfIGsoQ00Qr7nR45e6Sh/03N7xb2n78
	wwnaXOAcXLg78lZ8cD5Xl6XYdIpHSepH3JVEO4c8O/+geU94FlyM1upq+7mOwptVfXmb
	8vl+3bKJKKENCrBNEzVIUJFGfcSn8pyITFnLp+UMTw3+lpwmA8RmTosdPX375ysDb9Iv
	GxSqE2gnF6UliYUOahoH2ddbLOuBVn09XY8m1TWkzdwVHxVgbxwFPSZSeS44/4I/Lp5s
	Sc0g==
X-Gm-Message-State: AKGB3mI3IBucE4tV8pSNL704C7ysJ6nksIyjsimAt8S90HihzCpGR93L
	eE6pAJmJ95Mf2lrTdlr/jkPy8c5M
X-Google-Smtp-Source: AGs4zMbpahsR4Yn/RLKf0ycQFN27C+g3UHQYf9IJXGyZilGyhJnin3cQ1fkcQvWWAh1aiZPeCzdohA==
X-Received: by 10.55.5.149 with SMTP id 143mr21317165qkf.298.1512448490130;
	Mon, 04 Dec 2017 20:34:50 -0800 (PST)
Received: from [192.168.1.11] ([138.117.48.211])
	by smtp.gmail.com with ESMTPSA id
	o145sm9699823qke.76.2017.12.04.20.34.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Dec 2017 20:34:49 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: "Emilio G. Cota" <cota@braap.org>, QEMU Developers
	<qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
References: <1510087611-1851-1-git-send-email-cota@braap.org>
	<49151b79-7ec4-b728-1ea9-d5c393a5bada@amsat.org>
	<CAFEAcA-pwxfR-+XSu+q117Po=Lh2aRDGtW9jNAEZuPZNjbFC_Q@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <26366f15-b8a2-9e87-30f4-56253ec6ca9b@amsat.org>
Date: Tue, 5 Dec 2017 01:34:46 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-pwxfR-+XSu+q117Po=Lh2aRDGtW9jNAEZuPZNjbFC_Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::229
Subject: Re: [Qemu-trivial] [Qemu-arm] [PATCH] arm/translate-a64: mark path
 as unreachable to eliminate warning
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Dec 2017 04:34:56 -0000

Hi Peter,

On 11/13/2017 08:26 AM, Peter Maydell wrote:
> On 8 November 2017 at 12:37, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>> On 11/07/2017 05:46 PM, Emilio G. Cota wrote:
>>> Fixes the following warning when compiling with gcc 5.4.0 with -O1
>>> optimizations and --enable-debug:
>>>
>>> target/arm/translate-a64.c: In function ‘aarch64_tr_translate_insn’:
>>> target/arm/translate-a64.c:2361:8: error: ‘post_index’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
>>>      if (!post_index) {
>>>         ^
>>> target/arm/translate-a64.c:2307:10: note: ‘post_index’ was declared here
>>>      bool post_index;
>>>           ^
>>> target/arm/translate-a64.c:2386:8: error: ‘writeback’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
>>>      if (writeback) {
>>>         ^
>>> target/arm/translate-a64.c:2308:10: note: ‘writeback’ was declared here
>>>      bool writeback;
>>>           ^
>>>
>>> Note that idx comes from selecting 2 bits, and therefore its value
>>> can be at most 3.
>>>
>>> Signed-off-by: Emilio G. Cota <cota@braap.org>
> 
> Applied to target-arm.next, thanks. (It's a bit sad that
> gcc can't figure out that the result of x & 3 is constrained
> to [0,3], but there you go.)
> 
>> Acked-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> By the way, Philippe, what are you intending to convey with
> an acked-by tag? Usually "acked-by" means "I'm the maintainer
> for this area and I haven't actually reviewed this but I don't
> object to it"...

I still feel new into the FOSS community and am happy to learn and
understand from such comments :)
Reading thru the list I wondered what means this tag, asked to some
maintainers on IRC and read the Linux kernel "Submitting patches guide"
[1] bullet 12) "When to use Acked-by":

'''
Acked-by: is often used by the maintainer of the affected code when that
maintainer neither contributed to nor forwarded the patch.

Acked-by: is not as formal as Signed-off-by:. It is a record that the
acker has at least reviewed the patch and has indicated acceptance.
Hence patch mergers will sometimes manually convert an acker’s “yep,
looks good to me” into an Acked-by: (but note that it is usually better
to ask for an explicit ack).

Acked-by: does not necessarily indicate acknowledgement of the entire
patch. For example, if a patch affects multiple subsystems and has an
Acked-by: from one subsystem maintainer then this usually indicates
acknowledgement of just the part which affects that maintainer’s code. [...]
'''

It is not obvious that the 2nd case is restricted to maintainer, but now
than you explain it I understand.

I intended to express "I don't think this is the best way to solve this
problem, however this is probably the best fix when freezed for a
Release, and since I did have reviewed this in details (and tested it)
but I don't object to it, instead of signing with my Reviewed-by tag I
lower it to an Acked-by".

Next time I'll keep it simple and use a R-b :)

Thanks to take time to correct me!

Regards,

Phil.

[1]
https://www.kernel.org/doc/html/v4.12/process/submitting-patches.html#when-to-use-acked-by-and-cc

