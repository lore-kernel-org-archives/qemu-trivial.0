Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T7cmx-0004gx-TB
	for mharc-qemu-trivial@gnu.org; Fri, 31 Aug 2012 21:46:19 -0400
Received: from eggs.gnu.org ([208.118.235.92]:37145)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1T7cmv-0004ga-JZ
	for qemu-trivial@nongnu.org; Fri, 31 Aug 2012 21:46:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1T7cmu-0001yk-87
	for qemu-trivial@nongnu.org; Fri, 31 Aug 2012 21:46:17 -0400
Received: from mail-ie0-f173.google.com ([209.85.223.173]:43474)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1T7cmu-0001yG-3g
	for qemu-trivial@nongnu.org; Fri, 31 Aug 2012 21:46:16 -0400
Received: by iebc10 with SMTP id c10so2093066ieb.4
	for <qemu-trivial@nongnu.org>; Fri, 31 Aug 2012 18:46:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=hMZoj1VPiTQMf65mSm4+0G+/S5HDFFDMymZeYED4A5w=;
	b=hnFzC8F3AQzxqCyRTHauSLNhO4Tfx5HTW+Vkoqv6m40vVnzGWhutXQACanw2k77Q2J
	MAtw7azI2JwiTX7mfGbPrAbEbQRd+4088j7Xpz/PwYxBb9EPt7abdgS5j2bEtyBwy+LC
	kO/aU/e3SeROXyraMb6NO7tTKcXVXzZYyXdARTTvn93KOb1b6cUbFnxa3JQtr/D21nvG
	tGjy3PHrbpmz42gijZkc6tYTOcw/JnVCFk3eYvBBWDkHiEBJCFRSUyhKBzQch488uLaT
	NdfyvoP0ry3pt68ACV4WLzTwvLsJSKiWkLVghQxPtwn/pZbxRKK95GIWBMF8Etggk9LV
	Da3g==
MIME-Version: 1.0
Received: by 10.50.40.225 with SMTP id a1mr4867479igl.51.1346463975099; Fri,
	31 Aug 2012 18:46:15 -0700 (PDT)
Received: by 10.50.160.161 with HTTP; Fri, 31 Aug 2012 18:46:15 -0700 (PDT)
In-Reply-To: <201209010028.59501.yann.morin.1998@free.fr>
References: <1346108494-31787-1-git-send-email-yann.morin.1998@free.fr>
	<20120831064931.GA6425@stefanha-thinkpad.localdomain>
	<CAFEAcA8ahSGNEWvLpY+HrQsA6cxBjw+NjBTb7-R3RyOpi5-O7g@mail.gmail.com>
	<201209010028.59501.yann.morin.1998@free.fr>
Date: Sat, 1 Sep 2012 02:46:15 +0100
Message-ID: <CAFEAcA-PuFomtJeYJCJDBojsrXaCzu6UOWRKyb=y9F=vyy=hBw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQkEvCEIzy3AYdjh3zo9V/ykwLYwuPWVMoWGUiU9O7GUw+E/we7Mb8RY2GUCTQWbBZU2enk3
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.223.173
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>
Subject: Re: [Qemu-trivial] [PATCH 0/2 v2] Fix static linking for cURL and
	SDL
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
X-List-Received-Date: Sat, 01 Sep 2012 01:46:18 -0000

On 31 August 2012 23:28, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Peter, All,
> On Friday 31 August 2012 10:18:49 Peter Maydell wrote:
>> ...this patch doesn't seem to have been sent to qemu-devel?
>
> I can send them to -devel if it's better. Should I then keep -trivial in CC?

The rules (as I understand them) are that you can cc -trivial
as a hint that a patch is trivial, but you must always send
patches to -devel. Most people do not subscribe to the
-trivial list, so you only get proper patch review by
sending to -devel.

In particular I haven't seen any of this patch series
(except this cover letter and that only because stefan
happened to cc me on his reply to it).

-- PMM

