Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WXAUl-0007JI-Aw
	for mharc-qemu-trivial@gnu.org; Mon, 07 Apr 2014 10:25:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38420)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1WXAUa-0007Fs-5g
	for qemu-trivial@nongnu.org; Mon, 07 Apr 2014 10:25:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1WXAUQ-0003Zo-5Z
	for qemu-trivial@nongnu.org; Mon, 07 Apr 2014 10:25:44 -0400
Received: from mail-qc0-x22a.google.com ([2607:f8b0:400d:c01::22a]:44287)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1WXAUP-0003Za-PN; Mon, 07 Apr 2014 10:25:33 -0400
Received: by mail-qc0-f170.google.com with SMTP id x13so6594088qcv.1
	for <multiple recipients>; Mon, 07 Apr 2014 07:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=Eyv0k2CuYPoZ12+7E/f3KNZ9pzk3Ae7R3F6mbuKTBjQ=;
	b=hKp/GeN3K6uCyUx5BLyDse65QzWcDn9I8G8h+pj9hFosb41rQxnG2IvQBjo90KA8U0
	otHY8ivC0cqaZtK9VU5YQrEdtrZWnjD++ka1i5x6vQu8orXO9MUlEG1TlH+eeg0y4MgO
	0xNwffGPoDt0Z5xQ+1qkTH/1kIF8AhGZrJiWIBPYE9T+zlHXLbra7fCTquFKmnHbWJ9M
	zcj4Yay1MrjjWkdMNd6IDrG3jLxuZA6GBrPV66HniAXheXIIKcleDsXCPHit97t3EKNE
	4M1QFesIV7SsLbi4DQhF5dwlwQjmbGjnKUITIryOI5aZA5GAKFWWdusAEa5JPkv5cx/g
	912A==
X-Received: by 10.140.29.131 with SMTP id b3mr32262146qgb.5.1396880728603;
	Mon, 07 Apr 2014 07:25:28 -0700 (PDT)
Received: from pike.twiddle.home
	(50-194-63-110-static.hfc.comcastbusiness.net. [50.194.63.110])
	by mx.google.com with ESMTPSA id w2sm34573412qar.21.2014.04.07.07.25.26
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 07 Apr 2014 07:25:27 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Message-ID: <5342B540.4050005@twiddle.net>
Date: Mon, 07 Apr 2014 07:25:04 -0700
From: Richard Henderson <rth@twiddle.net>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>, Michael Tokarev <mjt@tls.msk.ru>
References: <1396019577-2013-1-git-send-email-peter.maydell@linaro.org>
	<1396019577-2013-3-git-send-email-peter.maydell@linaro.org>
	<5340FDA3.1080902@msgid.tls.msk.ru>
	<CAFEAcA_uN=+R6UZ6FiRshH2XvSCYBKwcHZu5ugd_02rKeM=yDQ@mail.gmail.com>
	<53416107.1080709@msgid.tls.msk.ru>
	<CAFEAcA8sr69XWzFjvBg8VN_ih2O=S78jWrXLrshmQAoWXhTQWw@mail.gmail.com>
In-Reply-To: <CAFEAcA8sr69XWzFjvBg8VN_ih2O=S78jWrXLrshmQAoWXhTQWw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c01::22a
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Subject: Re: [Qemu-trivial] [PATCH 2/3] int128.h: Avoid undefined behaviours
 involving signed arithmetic
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
X-List-Received-Date: Mon, 07 Apr 2014 14:25:53 -0000

On 04/06/2014 08:27 AM, Peter Maydell wrote:
> (if C compilers had a "behave
> like a sane 2s complement system for signed arithmetic"
> option I'd be advocating for us using it...)

-fwrapv.


r~

