Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SAfhm-0007kk-HX
	for mharc-qemu-trivial@gnu.org; Thu, 22 Mar 2012 06:57:18 -0400
Received: from eggs.gnu.org ([208.118.235.92]:37135)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1SAfhg-0007Xw-IT
	for qemu-trivial@nongnu.org; Thu, 22 Mar 2012 06:57:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1SAfha-0008Vv-Cq
	for qemu-trivial@nongnu.org; Thu, 22 Mar 2012 06:57:12 -0400
Received: from mail-iy0-f173.google.com ([209.85.210.173]:34851)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1SAfha-0008VV-6W
	for qemu-trivial@nongnu.org; Thu, 22 Mar 2012 06:57:06 -0400
Received: by iafj26 with SMTP id j26so3352706iaf.4
	for <qemu-trivial@nongnu.org>; Thu, 22 Mar 2012 03:57:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=xvOP54jV9xfOzpZi0d68wZxMYnRrIFqNYpMbkmNTe0Y=;
	b=LKviHSf/GGRl3N4cCZo4Hm4gUd4iTzboo0qbNEigZY+hbBylnkLW+rZauTEpTva+ei
	c3K6TCd8TPf700bKBTHc6GEJHVqWLYlincjrY4sTDti8pWmLZgi/GNj1oh2+jenoMAqK
	AvQk08EVdIO1T99Afae2miE9hjLYX58kn5XZRWChisBOtynWR6Nb5SsEca8tZhVXSsJZ
	RVshyhoZ0Fzu50QzYdam4Y94H80fNXAleIG8AKa6LTxLuzkDMKdH6JOMbhRnQuZUt9oR
	+N4fieEyVvm7ZfjkprG0Xz0+8MZUrPBMfUMmL34hLl7iKxQXVYL9W64Nn6RKk7U3MyBy
	Z6jQ==
MIME-Version: 1.0
Received: by 10.50.153.169 with SMTP id vh9mr1049709igb.41.1332413823525; Thu,
	22 Mar 2012 03:57:03 -0700 (PDT)
Received: by 10.50.100.198 with HTTP; Thu, 22 Mar 2012 03:57:03 -0700 (PDT)
In-Reply-To: <1332363767-21327-1-git-send-email-peter.portante@redhat.com>
References: <1332363767-21327-1-git-send-email-peter.portante@redhat.com>
Date: Thu, 22 Mar 2012 10:57:03 +0000
Message-ID: <CAFEAcA-S_vooBfKeAFB0aOrgwoaR+JB60YoRtOJC0MhaKx4v_Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: Peter Portante <peter.portante@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQlW7E8uPfcVjP56aggqT0K6jvYePe9/zKX6FbcxwrmoUmrFSUso57IhasJB1ncTh+9v+QZ1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.210.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 0/4] More whitespace and
 coding style clean ups ahead of future changes
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
X-List-Received-Date: Thu, 22 Mar 2012 10:57:17 -0000

On 21 March 2012 21:02, Peter Portante <peter.portante@redhat.com> wrote:
> Please forgive me if you find these changes are annoying, as I am trying to
> learn the ropes of patch submission with git ahead of making a real patch.

I'd recommend using git format-patch's --cover-letter option to create your
'cover letter' patch, as this will include a diffstat and summary of
all the patches in the patchset.

> While working on the code, I found that scripts/checkpatch.pl will flag lines
> that I am changing as not adhereing to the codeing standard due to
> pre-existing coding violations. So I figured I could learn a bit about how to
> submit patches by fixing these files I will be touching before submitting the
> code changes.

Whitespace-fixes and other coding-style-only changes are a bit of
a touchy issue here; they've caused long mailing list arguments in
the past. Mostly the line we seem to take is "fix issues in new
code submitted; when patching old code you can fix problems complained
about in the immediately surrounding few lines". The idea is that
gradually the codebase moves into line with the style guide without
having massive style-only changes that break tools like 'git blame'.
Small changes (like the qemu-timers one) are more likely to be
accepted than massive ones (like the slirp patches).

Also, it would be helpful if you could split your patches more
logically into smaller ones which touch the different subsystems:
any patch which touches all of block_int.h, qemu-timer.c and slirp
is going to struggle to be reviewed and committed because it is
trying to modify three different bits of the codebase and so it
needs agreement from more people. Sometimes a patch really does have
to touch several different areas, but in this case you're only
putting roadblocks in your own path...

-- PMM

