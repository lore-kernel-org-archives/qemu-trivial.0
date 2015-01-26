Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YFlBK-0005O4-FD
	for mharc-qemu-trivial@gnu.org; Mon, 26 Jan 2015 10:02:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60852)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YFlBD-00059o-DW
	for qemu-trivial@nongnu.org; Mon, 26 Jan 2015 10:02:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YFlB7-0007of-Kz
	for qemu-trivial@nongnu.org; Mon, 26 Jan 2015 10:02:19 -0500
Received: from mail-la0-f44.google.com ([209.85.215.44]:57673)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YFlB7-0007oS-Eh
	for qemu-trivial@nongnu.org; Mon, 26 Jan 2015 10:02:13 -0500
Received: by mail-la0-f44.google.com with SMTP id s18so8123719lam.3
	for <qemu-trivial@nongnu.org>; Mon, 26 Jan 2015 07:02:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=jOSGeR0wo8Jji48SEL03qkasFLGslTAUHOo0PFZyOpY=;
	b=HlwO9bkvdvUHlbqrZVhduam/TFqhfo/8Zc/fqSNYVZn/fA1MqBjSmX3FclwnXxkS30
	Si5dZVjhVvtdCUkXDCFAcquOvyhvDUq2TQEsmpCKt/TSMUdtSqHoqusDwH/BDlESJ9FX
	zuJpywtKzgrHYn52SgZJs3W6gN9aMOK/2w7Kkd/fKJ2+PLermn902fcNctiQlnQvA7Im
	obQUe03VBFtUj2hN5L/pthNJQb7EblnoQidb4Nd01BuQrwbfpZM3Y6N6GED2m7VIWb9B
	E6ou/1pF2TUpydvXK5sU/T6qcEEYApkpCTKoOYGB8EeM3C2z92Ub6XM7TYZh78Y1ViZC
	KwEw==
X-Gm-Message-State: ALoCoQnS2qgaHV4T68nb2DqpwGchuYMFwWEzj+gn5jORq9UpU5RqBcxMp+8Cs/FDzzR9UPbAvSYo
X-Received: by 10.152.18.135 with SMTP id w7mr20890683lad.47.1422284532702;
	Mon, 26 Jan 2015 07:02:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.112.21.34 with HTTP; Mon, 26 Jan 2015 07:01:52 -0800 (PST)
In-Reply-To: <54C6566B.6050205@sunrus.com.cn>
References: <54C4DC4E.3080306@sunrus.com.cn>
	<CAFEAcA_hGO-R85yYXDU7eoC7FHF_v96y7Oh54SX9HXBAss6Vpg@mail.gmail.com>
	<54C5672D.4080800@sunrus.com.cn>
	<CAFEAcA9mqzpHsWcyDdzBYDWdxsR1AoDy3akgHCaMUbjZ0zh=0Q@mail.gmail.com>
	<54C6566B.6050205@sunrus.com.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Jan 2015 15:01:52 +0000
Message-ID: <CAFEAcA8q7jNqL8DFygnHaiiv=2pGKXBQ_Gi1icOn9H=diOXK5Q@mail.gmail.com>
To: Chen Gang S <gang.chen@sunrus.com.cn>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.44
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Riku Voipio <riku.voipio@iki.fi>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] linux-user/syscall.c: Let all
 lock_user_struct() and unlock_user_struct() paired with each other
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
X-List-Received-Date: Mon, 26 Jan 2015 15:02:24 -0000

On 26 January 2015 at 14:59, Chen Gang S <gang.chen@sunrus.com.cn> wrote:
> On 1/26/15 06:10, Peter Maydell wrote:
>> I would just like the commit message to be clear about the
>> scope of the work the patch covers. If the patch is just "Fix
>> mismatched lock/unlock calls in IPC struct conversion functions"
>> then that's fine, but the commit message should say that. At the
>> moment the commit message is very vague.
>>
>
> OK, thanks.
>
> I am not quite familiar with this file, so I describe the modification
> by function name, e.g. lock_user_struct() and unlick_user_struct() in
> the patch subject.

In a big file I think it's often more useful to describe the
functions which are being changed. My suggested subject would be:

"Fix mismatched lock/unlock calls in IPC struct conversion functions"

Riku can decide if he wants a v2 or will just fix it up as he
applies it to his linux-user tree.

-- PMM

