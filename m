Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZZNMP-00019Q-Ha
	for mharc-qemu-trivial@gnu.org; Tue, 08 Sep 2015 14:11:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50673)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZZNMM-000182-OP
	for qemu-trivial@nongnu.org; Tue, 08 Sep 2015 14:11:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZZNMI-0005cH-Kf
	for qemu-trivial@nongnu.org; Tue, 08 Sep 2015 14:11:10 -0400
Received: from mail-yk0-f177.google.com ([209.85.160.177]:35936)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZZNMI-0005c8-F7
	for qemu-trivial@nongnu.org; Tue, 08 Sep 2015 14:11:06 -0400
Received: by ykcf206 with SMTP id f206so131704215ykc.3
	for <qemu-trivial@nongnu.org>; Tue, 08 Sep 2015 11:11:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=SKXEvGjsaZtZ1ci5SQdz5O3hmm0w4jfXMnxYmDd2MaI=;
	b=QuiI5MzsrjYIjUwwbmXH7fPfHx09HwnqAAsdJ6nJOEMalDAFIQH33NrWXXSnrtb1iw
	OSMEcvIHCK3kCrYT/xTJgJER29EZ+9Qvhs7OFwWlIo1SAtUaKerxsW82y1M39wUEA8h+
	gVsOwKYm9/eHA7E96AYphVYj3yhJRo7KPnUmddGvnhy1STxKB1rO2W1tXRrk+nHWTnGn
	/AYMBkw5DlU+ZOZFB42GW84P8aP/5FcKzdyvJKumcHQNi7CQRrCPg7PwE5dgDZ24S4Ta
	YWui4cyoF+gc6q5ZrGgU1rqZMuZd1PzttHiBKCfJFNNa5Vv4/lgWBfluNo1npQyxgsO9
	onuA==
X-Gm-Message-State: ALoCoQl4kJhBmW0k1ckzL/9RTpSNLHhnxA2KpU5TujyiuIcPRefhlk1SG34Bh7QutLz2Cb9rvJdN
X-Received: by 10.170.133.144 with SMTP id z138mr30602582ykb.111.1441735865812;
	Tue, 08 Sep 2015 11:11:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.153.135 with HTTP; Tue, 8 Sep 2015 11:10:45 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.02.1509081856120.7825@citymarket.hu>
References: <alpine.DEB.2.02.1508092307540.14941@citymarket.hu>
	<alpine.DEB.2.02.1509072243451.7825@citymarket.hu>
	<CAFEAcA8e8zXxZj09NdJ30CGEYbvsuVvdOy823DiTuaqAuwvR5g@mail.gmail.com>
	<alpine.DEB.2.02.1509081856120.7825@citymarket.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Sep 2015 19:10:45 +0100
Message-ID: <CAFEAcA99zphfeH+DeBfNFQ3=_NRDMxCkmRtuQ=asWLjMdGY6Zg@mail.gmail.com>
To: Veres Lajos <vlajos@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.160.177
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] typofixes
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
X-List-Received-Date: Tue, 08 Sep 2015 18:11:11 -0000

On 8 September 2015 at 19:01, Veres Lajos <vlajos@gmail.com> wrote:
> On Tue, 8 Sep 2015, Peter Maydell wrote:
>
>> Veres: can you drop the libvixl and linux-headers changes,
>> and at least split the remainder into docs/comments vs
>> code changes, and resend the patches to qemu-devel, please?
>
> I have removed the linux-headers/ and disas/libvixl/ changes.
> And I think the only non-comment/non-doc change is this:
> tests/qemu-iotests/041
> -    def test_unexistant_replaces(self):
> +    def test_unexistent_replaces(self):
>
> If you want I can move this to another patch.

OK, if there's just the one that's fine.

You forgot your signed-off-by line; we can't take the patch
without one. Also, please can you send it inline rather
than as an attachment? There are several places here which
want a better phrasing rather than just a typo fix, but
it's hard to comment on a patch provided as an attachment.

(For instance, that should be 'nonexistent', not
'unexistent' in that functionname; 'be deferring'
should be 'by deferring' in pl181.c, 'notable' should be
'notably' in various bits of decNumber.c, ...)

thanks
-- PMM

