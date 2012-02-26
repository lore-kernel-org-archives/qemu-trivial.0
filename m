Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S1jTx-0001CZ-Lx
	for mharc-qemu-trivial@gnu.org; Sun, 26 Feb 2012 14:10:05 -0500
Received: from eggs.gnu.org ([208.118.235.92]:56454)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1S1jTu-0001Ax-Do
	for qemu-trivial@nongnu.org; Sun, 26 Feb 2012 14:10:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1S1jTt-0000UX-0g
	for qemu-trivial@nongnu.org; Sun, 26 Feb 2012 14:10:01 -0500
Received: from mail-qy0-f173.google.com ([209.85.216.173]:54480)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1S1jTs-0000UG-T0
	for qemu-trivial@nongnu.org; Sun, 26 Feb 2012 14:10:00 -0500
Received: by qcsc20 with SMTP id c20so1484975qcs.4
	for <qemu-trivial@nongnu.org>; Sun, 26 Feb 2012 11:10:00 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates
	10.224.210.129 as permitted sender) client-ip=10.224.210.129; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	peter.maydell@linaro.org designates 10.224.210.129 as permitted
	sender) smtp.mail=peter.maydell@linaro.org
Received: from mr.google.com ([10.224.210.129])
	by 10.224.210.129 with SMTP id gk1mr7992853qab.85.1330283400070
	(num_hops = 1); Sun, 26 Feb 2012 11:10:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.224.210.129 with SMTP id gk1mr6759608qab.85.1330283399871;
	Sun, 26 Feb 2012 11:09:59 -0800 (PST)
Received: by 10.229.50.85 with HTTP; Sun, 26 Feb 2012 11:09:59 -0800 (PST)
In-Reply-To: <4F4A80DC.6000106@weilnetz.de>
References: <1330263596-4988-1-git-send-email-sw@weilnetz.de>
	<4F4A6041.5060102@codemonkey.ws> <4F4A80DC.6000106@weilnetz.de>
Date: Sun, 26 Feb 2012 19:09:59 +0000
Message-ID: <CAFEAcA8JswbTJWNJMy90E0oVgxwAyZV6GAYZk8jd4WtfcGczow@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQnxVew7RrGK+/hRYIFSA1EKFOkXnbOQ0CgpCsCfEmBjweHDxR/gMgzv5cEpPjjhAIAMjJr0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.216.173
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org,
	Anthony Liguori <anthony@codemonkey.ws>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Fix spelling in comments
	(iff -> if)
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
X-List-Received-Date: Sun, 26 Feb 2012 19:10:04 -0000

On 26 February 2012 18:58, Stefan Weil <sw@weilnetz.de> wrote:
> Many authors regard "iff" as unsuitable in formal writing
> (citation from Wikipedia).Personally, I'd also prefer to see
> 'if and only if' in full length or in symbolic notation (<==>)
> when this is the intention, not an abbreviation like 'iff'.

Yes, I used to use 'iff' (a hangover from having studied
maths...) but I now think that outside those fields it's
too easy for a reader to confuse it with a typo for 'if'
and so it's better avoided (by using "if" when that's OK
and expanding to "if and only if" in the odd cases where
the distinction actually matters.)

-- PMM

