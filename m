Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T017z-0005Hu-M0
	for mharc-qemu-trivial@gnu.org; Fri, 10 Aug 2012 22:08:35 -0400
Received: from eggs.gnu.org ([208.118.235.92]:50620)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1T017w-00059e-KN
	for qemu-trivial@nongnu.org; Fri, 10 Aug 2012 22:08:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1T017u-0005BB-Ob
	for qemu-trivial@nongnu.org; Fri, 10 Aug 2012 22:08:32 -0400
Received: from mail-yw0-f45.google.com ([209.85.213.45]:55510)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1T017u-0005B1-L4
	for qemu-trivial@nongnu.org; Fri, 10 Aug 2012 22:08:30 -0400
Received: by yhpp34 with SMTP id p34so2097955yhp.4
	for <qemu-trivial@nongnu.org>; Fri, 10 Aug 2012 19:08:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=UZ8DMPyrFJ16m4xmpehs9Xvu7AmrRsjv90GUtmBRpdk=;
	b=CK2au4QSW5oAV3/z3SjthuMU0ynpyU29zEHct81xBuQNoRgrq27Mtb0Rek3Dzgj0iB
	4FYxRhueiBIym6Tsed6r5GWlvZFy/6seNmLGyhdK8IQcH5WCG3GP8qCMUiRL6yef+FXA
	2d6mCBp+yUONwvINq3Z76NlkfK24cDtp7MtAyuw3zuIaXzuP6oL/4Ql8zFWHnN+pqMXh
	l0lZEbIIHlCKeHMzO8SnDe8Yj5HPHJINYpTC4BndswI4t3crG6XnlDXVhiIVWJEi5sG3
	hBepCRI5aj3t8Bwpi6fRM0pL0lvD8iKQw+w0inuyjK+nLTSOvNc+TZq7eeLzzYOpA9f5
	fKZQ==
MIME-Version: 1.0
Received: by 10.50.236.4 with SMTP id uq4mr153200igc.18.1344650910092; Fri, 10
	Aug 2012 19:08:30 -0700 (PDT)
Received: by 10.50.3.9 with HTTP; Fri, 10 Aug 2012 19:08:30 -0700 (PDT)
In-Reply-To: <1344628087-22672-1-git-send-email-sw@weilnetz.de>
References: <1344628087-22672-1-git-send-email-sw@weilnetz.de>
Date: Sat, 11 Aug 2012 03:08:30 +0100
Message-ID: <CAFEAcA84v2CLay-zMg=p2Z-xwk4fCX4J_mqv5L6iedd9M_Y2QQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQn5mjH7QP8QtS6CSWVGq/IcJ2uVkNgrkSHZRmSBwbfDrBRNMkAzIFopWWqnunJWmlJyAzdC
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.213.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Fix QEMU
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
X-List-Received-Date: Sat, 11 Aug 2012 02:08:33 -0000

On 10 August 2012 20:48, Stefan Weil <sw@weilnetz.de> wrote:
> One more...

No problem with the patch but your commit message summary
implies a rather wider effect than the patch actually has :-)

-- PMM

