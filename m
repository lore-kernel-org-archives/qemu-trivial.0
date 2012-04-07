Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SGWZz-0008JE-On
	for mharc-qemu-trivial@gnu.org; Sat, 07 Apr 2012 10:25:27 -0400
Received: from eggs.gnu.org ([208.118.235.92]:44667)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1SGWZx-0008Af-AI
	for qemu-trivial@nongnu.org; Sat, 07 Apr 2012 10:25:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1SGWZv-0006om-LO
	for qemu-trivial@nongnu.org; Sat, 07 Apr 2012 10:25:24 -0400
Received: from mail-iy0-f173.google.com ([209.85.210.173]:48271)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>)
	id 1SGWZr-0006nb-Jn; Sat, 07 Apr 2012 10:25:19 -0400
Received: by iafj26 with SMTP id j26so4968850iaf.4
	for <multiple recipients>; Sat, 07 Apr 2012 07:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=6GqBHyRpXuDZnT4FLMUcf6SsCa3Cc5lJ1Xf0g+IaQtY=;
	b=GAxWkJyafe1osIiMbHC8N+gg0vIdzBjSqJ1XhjhSirfkBUdtW9dZ9v0DBxbo+7PWmN
	z5apHbf0bhviwvUuinLslzBIjUyBOVLTWiqzuQ7EGUBqS3qFC7aFIULDO3Q2NaXYIAIE
	irZJY6d45/QSUOcID7P5zENEDRaFrIOHP2j4jyWWGblbzEaO86SQkEpsUzUazbFrMHjG
	X6tSk+7GlwlA6LB1U8k72i9zwkRwvfrVa8wTnYBB06JjvketmC6ID2549r+PAFRQiHnJ
	OJqcJhx0OwpBqfFOQqvtIwnvluqCBAowj6XhjA5wNGIzONi9d2tIs3M5qZLmEQ8Ejcto
	qEWA==
Received: by 10.50.47.162 with SMTP id e2mr1057734ign.0.1333808717393; Sat, 07
	Apr 2012 07:25:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.197.194 with HTTP; Sat, 7 Apr 2012 07:24:57 -0700 (PDT)
In-Reply-To: <1333783419-7982-1-git-send-email-sw@weilnetz.de>
References: <1333783419-7982-1-git-send-email-sw@weilnetz.de>
From: Blue Swirl <blauwirbel@gmail.com>
Date: Sat, 7 Apr 2012 14:24:57 +0000
Message-ID: <CAAu8pHu4u9t18hFDW1wDPx11CbLActQHRb_K3K527eLzP9PdwQ@mail.gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.210.173
Cc: qemu-trivial@nongnu.org, Alexander Graf <agraf@suse.de>,
	Anthony Liguori <aliguori@us.ibm.com>, qemu-devel@nongnu.org,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-trivial] [PATCH 0/4] Replace Qemu by QEMU
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
X-List-Received-Date: Sat, 07 Apr 2012 14:25:26 -0000

On Sat, Apr 7, 2012 at 07:23, Stefan Weil <sw@weilnetz.de> wrote:
> These patches try to establish the official spelling "QEMU".
> There remain some old spellings "Qemu" in BIOS code
> (use "grep -rw Qemu pc-bios" to see them).
>
> Patch 4 also fixes a spelling bug and debug messages
> which I did not mention in the commit message.
>
> Regards,
> Stefan W.
>
> [PATCH 1/4] Replace Qemu by QEMU in user visible documentation
> [PATCH 2/4] Replace Qemu by QEMU in internal documentation
> [PATCH 3/4] Replace Qemu by QEMU in w32 installation path (prefix)
> [PATCH 4/4] Replace Qemu by QEMU in comments

Thanks, applied all.

