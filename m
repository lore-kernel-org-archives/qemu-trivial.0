Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YFVOp-0007ev-8y
	for mharc-qemu-trivial@gnu.org; Sun, 25 Jan 2015 17:11:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54463)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YFVOk-0007Yo-Hy
	for qemu-trivial@nongnu.org; Sun, 25 Jan 2015 17:11:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YFVOb-00057A-UB
	for qemu-trivial@nongnu.org; Sun, 25 Jan 2015 17:11:14 -0500
Received: from mail-lb0-f171.google.com ([209.85.217.171]:36799)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YFVOb-00056w-Ml
	for qemu-trivial@nongnu.org; Sun, 25 Jan 2015 17:11:05 -0500
Received: by mail-lb0-f171.google.com with SMTP id u14so4991772lbd.2
	for <qemu-trivial@nongnu.org>; Sun, 25 Jan 2015 14:11:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=8R5rDeGNYbjSOIir5eEMwigV5VZIIyf+Zg/J6ZQGMWM=;
	b=iE45d9O8m8YUqxET7a1FnkP9S5EOhZv9UfiHaiDd5sGU4yKEmSw1vcitOPhzNtHs0s
	pFqT5ddaB/V/LwNXs44gBB9zBGqKw22/vs3cwhTnyq5dP7wm67cyr02s5TqG2g80brp4
	58riOAthzs5s03oRS4gZKjf5wEiwKHGSaEqZqm83/wly7zXhrt47c+0rCQixRPj1/eyp
	HsO67QASn3AwNh3OhH+Zj1qt2D7PWabSgkOdrjZlkRtu3OxxdoYEh1AJos0FIGItUTK1
	msi51wmmAf6dHayQ5fsmBQ9craBPKV1WBbJG/2bUIJHCw4+pZznvYGggn8ab6oxhnMJc
	6SpQ==
X-Gm-Message-State: ALoCoQnF2FcTtM7zHrsFbHI6VOD+9odK7Abwz1ZR6MEiN2ataDWd0pQC0MhqM30VtChZVaG96A4s
X-Received: by 10.112.161.34 with SMTP id xp2mr17964796lbb.73.1422223864118;
	Sun, 25 Jan 2015 14:11:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.112.21.34 with HTTP; Sun, 25 Jan 2015 14:10:43 -0800 (PST)
In-Reply-To: <54C5672D.4080800@sunrus.com.cn>
References: <54C4DC4E.3080306@sunrus.com.cn>
	<CAFEAcA_hGO-R85yYXDU7eoC7FHF_v96y7Oh54SX9HXBAss6Vpg@mail.gmail.com>
	<54C5672D.4080800@sunrus.com.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 25 Jan 2015 22:10:43 +0000
Message-ID: <CAFEAcA9mqzpHsWcyDdzBYDWdxsR1AoDy3akgHCaMUbjZ0zh=0Q@mail.gmail.com>
To: Chen Gang S <gang.chen@sunrus.com.cn>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.171
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
X-List-Received-Date: Sun, 25 Jan 2015 22:11:18 -0000

On 25 January 2015 at 21:59, Chen Gang S <gang.chen@sunrus.com.cn> wrote:
> On 1/25/15 20:49, Peter Maydell wrote:
>> Are you claiming that you've reviewed *all* the code in this
>> file for mismatched lock/unlock calls? If so, it would be nice
>> to say so explicitly in the commit message. If not, it would be
>> nice if the commit message was clearer about what areas of the
>> code it applied to. The code changes are correct, though.
>>
>
> At present, I finished all lock_user_struct() and unlock_user_struct()
> in "linux-user/syscall.c". For me, after this patch, they are all OK.
>
> But for all lock/unlock in "linux-user/syscall.c", for me, I am doubting
> several areas, but I did not send patch for them:
>
>  - I need check them carefully again to be sure they are really issue:
>
>    Read the related code again and again, if I really treat it as an
>    issue, I shall make related patch (and pass compiling, at least).
>
>  - I have no enough time resources on it:

That's fine. I'm definitely not asking you to do this work.
I would just like the commit message to be clear about the
scope of the work the patch covers. If the patch is just "Fix
mismatched lock/unlock calls in IPC struct conversion functions"
then that's fine, but the commit message should say that. At the
moment the commit message is very vague.

thanks
-- PMM

